WeightedStrategy = class("WeightedStrategy", BaseStrategy, _M)

WeightedStrategy:has("_calcCDConfig", {
	is = "rw"
})
WeightedStrategy:has("_defaultInitWaitingCD", {
	is = "rw"
})

local defaultCalcCD = 1000

local function deepCopy(desc, src)
	local d = desc or {}

	for k, v in ipairs(src) do
		if type(v) == "table" then
			d[k] = deepCopy({}, v)
		else
			d[k] = v
		end
	end

	return d
end

local function shuffle(rand, arr, start, ending)
	local m = start or 1
	local n = ending or #arr

	for i = m, n - 1 do
		local k = rand:random(i, n)

		if k ~= i then
			arr[k] = arr[i]
			arr[i] = arr[k]
		end
	end

	return arr
end

function WeightedStrategy:initialize(team, random)
	super.initialize(self, team)

	self._random = random or Random:new()
	self._ignoreWaiting = true
end

function WeightedStrategy:start(battleContext)
	local eventCenter = battleContext:getObject("EventCenter")

	eventCenter:addListener("GainEnergy", bind1(self.onEnergyIncreased, self), 0)

	self._context = battleContext
	self._battleLogic = battleContext:getObject("BattleLogic")
	self._willCheckEnergy = true
	self._cardIndex = nil
	self._nextCard = nil
	self._waitCD = 0
	self._calcCD = 0
end

function WeightedStrategy:reset()
	self._willCheckEnergy = true
	self._cardIndex = nil
	self._nextCard = nil
	self._waitCD = 0
	self._calcCD = 0
end

function WeightedStrategy:update(interval)
	if self._battleLogic and not self._battleLogic:isReadyForAI() then
		return
	end

	if self._battleLogic:isWaiting() and not self._ignoreWaiting then
		self._initWaitingCD = self._defaultInitWaitingCD

		return
	end

	if self._initWaitingCD and self._initWaitingCD > 0 then
		self._initWaitingCD = self._initWaitingCD - interval

		return
	end

	self._skillCD = self._skillCD or 1000

	if self._skillCD > 0 then
		self._skillCD = self._skillCD - interval
	else
		self._skillCD = 1000
		local avails = self:getAvailableSkill()

		if avails and #avails > 0 then
			local skillType = avails[1]

			if skillType == kBattleMasterSkill1 then
				self:doSkill(skillType)
			end
		end
	end

	self._calcCD = self._calcCD - interval

	if self._waitCD > 0 then
		self._waitCD = self._waitCD - interval

		return
	end

	local player = self._team:getCurPlayer()

	if self._nextCard == nil or self._calcCD <= 0 then
		self._calcCD = self._calcCDConfig or defaultCalcCD
		self._cardIndex, self._nextCard = self:determineNextCard(player)
		self._willCheckEnergy = true
	end

	if self._willCheckEnergy and self._nextCard then
		local cost = self._nextCard:getActualCost()
		self._willCheckEnergy = false

		if player:energyIsEnough(cost) then
			if player:getCardState() == "hero" then
				local battleField = self._context:getObject("BattleField")
				local cellNo = self:determineTargetCell(battleField, player:getSide())

				if cellNo ~= nil then
					self:spawnCard(self._cardIndex, cellNo, function (success, detail)
						self._waitCD = 1000

						if success then
							self._nextCard = nil
							self._waitCD = 0
						end
					end)
				end
			elseif player:getCardState() == "skill" then
				self:spawnSkillCard(self._cardIndex, function (success, detail)
					self._waitCD = 1000

					if success then
						self._nextCard = nil
						self._waitCD = 0
					end
				end)
			end
		end
	end
end

function WeightedStrategy:calcWeight(card, side)
	local statusNames = {
		"FriendMasterHP",
		"FriendMinHP",
		"FriendAVRHP",
		"FriendCount",
		"EnemyMasterHP",
		"EnemyMinHP",
		"EnemyAVRHP",
		"EnemyCount",
		"Time",
		"ForcedWeight"
	}
	local cardAI = card:getCardAI() or {}
	self._status = self._status or self:calcStatus(side)
	local weight = 0

	for index, name in ipairs(statusNames) do
		weight = weight + (tonumber(cardAI[name]) or 0) * (self._status[index] or 1)
	end

	return weight
end

function WeightedStrategy:calcSkillWeight(card)
	local weight = 0

	if card.getAutoWeight then
		weight = tonumber(card:getAutoWeight() or 0)
	end

	return weight
end

function WeightedStrategy:calcStatus(side)
	local result = self:calcOneSideStatus(side)
	local oppoResult = self:calcOneSideStatus(opposeBattleSide(side))

	for i = 1, 4 do
		result[i + 4] = oppoResult[i]
	end

	local battlelogic = self._context:getObject("BattleLogic")
	result[9] = (120 - battlelogic:getBoutTime() / 1000) * 0.05
	result[10] = 1

	return result
end

function WeightedStrategy:calcOneSideStatus(side)
	local result = {
		1,
		1,
		1,
		1
	}
	local battleField = self._context:getObject("BattleField")
	local units = battleField:collectLivingUnits({}, side)
	local masterHp = nil
	local minHP = 1
	local totalHpPercent = 0
	local heroCounts = 0

	for _, unit in ipairs(units) do
		local hpComp, hpRatio = nil

		if unit:getUnitType() == BattleUnitType.kMaster then
			hpComp = unit:getComponent("Health")
			hpRatio = hpComp:getHpRatio()
			masterHp = hpRatio
		else
			heroCounts = heroCounts + 1
			hpComp = unit:getComponent("Health")
			hpRatio = hpComp:getHpRatio()
		end

		minHP = hpRatio <= minHP and minHP or hpRatio
		totalHpPercent = totalHpPercent + hpRatio
	end

	if minHP <= 0.05 then
		minHP = 0.05
	end

	masterHp = masterHp and masterHp > 0.05 and masterHp or 0.05
	local avrHp = totalHpPercent / #units

	if avrHp <= 0.05 then
		avrHp = 0.05
	end

	result[1] = 1 / masterHp
	result[2] = 1 / minHP
	result[3] = 1 / avrHp
	result[4] = (heroCounts + 1) / 3 * 1.5

	return result
end

function WeightedStrategy:onEnergyIncreased(_, args)
	local player = self._team:getCurPlayer()

	if args.player == player:getId() then
		self._willCheckEnergy = true
	end
end

function WeightedStrategy:determineNextCard(player)
	local cardWindow = player:getCardWindow()
	local indices = {}
	local count = cardWindow:collectNonEmptyIndices(indices)

	if count > 0 then
		if count == 1 then
			local idx = indices[1]
			local card = cardWindow:getCardAtIndex(idx)

			return idx, card
		end

		local result = {}
		self._status = nil
		local side = player:getSide()

		for i, idx in ipairs(indices) do
			local card = cardWindow:getCardAtIndex(idx)
			local weight = 0

			if player:getCardState() == "hero" then
				weight = self:calcWeight(card, side)
			elseif player:getCardState() == "skill" then
				weight = self:calcSkillWeight(card)
			end

			result[i] = {
				idx,
				card,
				weight
			}
		end

		table.sort(result, function (a, b)
			return b[3] < a[3]
		end)

		return result[1][1], result[1][2]
	end

	return nil, 
end

function WeightedStrategy:determineTargetCell(battleField, side)
	local emptyCells = battleField:collectEmtpyCells({}, side)
	local count = #emptyCells

	if count > 0 then
		if CommonUtils and not self._nextCard.getCardAI then
			CommonUtils.uploadDataToBugly("getCardAI Error ", self._nextCard._id or self._nextCard._heroData.blockAI)
		end

		local cardAI = self._nextCard:getCardAI()
		local PosArray = cardAI and cardAI.ForcedPosition

		if PosArray then
			local map = {}

			for _, cell in ipairs(emptyCells) do
				map[math.abs(cell:getNumber())] = cell
			end

			for _, poses in ipairs(PosArray) do
				local _poses = shuffle(self._random, deepCopy({}, poses))

				for _, pos in ipairs(_poses) do
					if map[pos] then
						return map[pos]:getNumber()
					end
				end
			end
		end

		local r = self._random:random(1, count)

		return emptyCells[r]:getNumber()
	end

	return nil
end
