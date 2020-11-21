require("dm.gameplay.stagePractice.model.StagePracticeEnemyHero")

StagePracticeEnemyHeroList = class("StagePracticeEnemyHeroList", objectlua.Object, _M)

StagePracticeEnemyHeroList:has("_id", {
	is = "r"
})
StagePracticeEnemyHeroList:has("_config", {
	is = "r"
})

function StagePracticeEnemyHeroList:initialize(devsys)
	super.initialize(self)

	self._developSystem = devsys
	self._enemyHeroList = {}
end

function StagePracticeEnemyHeroList:getEnemyHeroById(id)
	local rolemodelid = ConfigReader:getDataByNameIdAndKey("EnemyHero", id, "RoleModel")

	if self:hasHero(id) then
		return self._enemyHeroList[id]
	else
		local player = self._developSystem:getPlayer()
		local enemyid = string.split(rolemodelid, "_")[2]
		self._enemyHeroList[id] = StagePracticeEnemyHero:new(enemyid, player)

		self._enemyHeroList[id]:setEnemyId(id)

		return self._enemyHeroList[id]
	end
end

function StagePracticeEnemyHeroList:hasHero(heroId)
	return self._enemyHeroList[heroId] ~= nil
end

local SortFunc = {}

SortFunc[1] = function (a, b)
	if a:getCost() == b:getCost() then
		if a:getRarity() == b:getRarity() then
			if a:getStar() == b:getStar() then
				if a:getQuality() == b:getQuality() then
					if a:getLevel() == b:getLevel() then
						if a:getCombat() == b:getCombat() then
							return b:getId() < a:getId()
						end

						return b:getCombat() < a:getCombat()
					end

					return b:getLevel() < a:getLevel()
				end

				return b:getQuality() < a:getQuality()
			end

			return b:getStar() < a:getStar()
		end

		return b:getRarity() < a:getRarity()
	end

	return b:getCost() < a:getCost()
end

SortFunc[2] = function (a, b)
	if a:getRarity() == b:getRarity() then
		if a:getCost() == b:getCost() then
			if a:getStar() == b:getStar() then
				if a:getQuality() == b:getQuality() then
					if a:getLevel() == b:getLevel() then
						if a:getCombat() == b:getCombat() then
							return b:getId() < a:getId()
						end

						return b:getCombat() < a:getCombat()
					end

					return b:getLevel() < a:getLevel()
				end

				return b:getQuality() < a:getQuality()
			end

			return b:getStar() < a:getStar()
		end

		return b:getCost() < a:getCost()
	end

	return b:getRarity() < a:getRarity()
end

SortFunc[3] = function (a, b)
	if a:getStar() == b:getStar() then
		if a:getCost() == b:getCost() then
			if a:getRarity() == b:getRarity() then
				if a:getQuality() == b:getQuality() then
					if a:getLevel() == b:getLevel() then
						if a:getCombat() == b:getCombat() then
							return b:getId() < a:getId()
						end

						return b:getCombat() < a:getCombat()
					end

					return b:getLevel() < a:getLevel()
				end

				return b:getQuality() < a:getQuality()
			end

			return b:getRarity() < a:getRarity()
		end

		return b:getCost() < a:getCost()
	end

	return b:getStar() < a:getStar()
end

SortFunc[4] = function (a, b)
	if a:getQuality() == b:getQuality() then
		if a:getCost() == b:getCost() then
			if a:getRarity() == b:getRarity() then
				if a:getStar() == b:getStar() then
					if a:getLevel() == b:getLevel() then
						if a:getCombat() == b:getCombat() then
							return b:getId() < a:getId()
						end

						return b:getCombat() < a:getCombat()
					end

					return b:getLevel() < a:getLevel()
				end

				return b:getStar() < a:getStar()
			end

			return b:getRarity() < a:getRarity()
		end

		return b:getCost() < a:getCost()
	end

	return b:getQuality() < a:getQuality()
end

SortFunc[5] = function (a, b)
	if a:getLevel() == b:getLevel() then
		if a:getCost() == b:getCost() then
			if a:getRarity() == b:getRarity() then
				if a:getStar() == b:getStar() then
					if a:getQuality() == b:getQuality() then
						if a:getCombat() == b:getCombat() then
							return b:getId() < a:getId()
						end

						return b:getCombat() < a:getCombat()
					end

					return b:getQuality() < a:getQuality()
				end

				return b:getStar() < a:getStar()
			end

			return b:getRarity() < a:getRarity()
		end

		return b:getCost() < a:getCost()
	end

	return b:getLevel() < a:getLevel()
end

local SortFunc1 = {}

SortFunc1[1] = function (a, b)
	if a:getCost() == b:getCost() then
		if a:getRarity() == b:getRarity() then
			if a:getStar() == b:getStar() then
				if a:getQuality() == b:getQuality() then
					if a:getLevel() == b:getLevel() then
						if a:getCombat() == b:getCombat() then
							return a:getId() < b:getId()
						end

						return a:getCombat() < b:getCombat()
					end

					return a:getLevel() < b:getLevel()
				end

				return a:getQuality() < b:getQuality()
			end

			return a:getStar() < b:getStar()
		end

		return a:getRarity() < b:getRarity()
	end

	return a:getCost() < b:getCost()
end

SortFunc1[2] = function (a, b)
	if a:getRarity() == b:getRarity() then
		if a:getCost() == b:getCost() then
			if a:getStar() == b:getStar() then
				if a:getQuality() == b:getQuality() then
					if a:getLevel() == b:getLevel() then
						if a:getCombat() == b:getCombat() then
							return a:getId() < b:getId()
						end

						return a:getCombat() < b:getCombat()
					end

					return a:getLevel() < b:getLevel()
				end

				return a:getQuality() < b:getQuality()
			end

			return a:getStar() < b:getStar()
		end

		return a:getCost() < b:getCost()
	end

	return a:getRarity() < b:getRarity()
end

SortFunc1[3] = function (a, b)
	if a:getStar() == b:getStar() then
		if a:getCost() == b:getCost() then
			if a:getRarity() == b:getRarity() then
				if a:getQuality() == b:getQuality() then
					if a:getLevel() == b:getLevel() then
						if a:getCombat() == b:getCombat() then
							return a:getId() < b:getId()
						end

						return a:getCombat() < b:getCombat()
					end

					return a:getLevel() < b:getLevel()
				end

				return a:getQuality() < b:getQuality()
			end

			return a:getRarity() < b:getRarity()
		end

		return a:getCost() < b:getCost()
	end

	return a:getStar() < b:getStar()
end

SortFunc1[4] = function (a, b)
	if a:getQuality() == b:getQuality() then
		if a:getCost() == b:getCost() then
			if a:getRarity() == b:getRarity() then
				if a:getStar() == b:getStar() then
					if a:getLevel() == b:getLevel() then
						if a:getCombat() == b:getCombat() then
							return a:getId() < b:getId()
						end

						return a:getCombat() < b:getCombat()
					end

					return a:getLevel() < b:getLevel()
				end

				return a:getStar() < b:getStar()
			end

			return a:getRarity() < b:getRarity()
		end

		return a:getCost() < b:getCost()
	end

	return a:getQuality() < b:getQuality()
end

SortFunc1[5] = function (a, b)
	if a:getLevel() == b:getLevel() then
		if a:getCost() == b:getCost() then
			if a:getRarity() == b:getRarity() then
				if a:getStar() == b:getStar() then
					if a:getQuality() == b:getQuality() then
						if a:getCombat() == b:getCombat() then
							return a:getId() < b:getId()
						end

						return a:getCombat() < b:getCombat()
					end

					return a:getQuality() < b:getQuality()
				end

				return a:getStar() < b:getStar()
			end

			return a:getRarity() < b:getRarity()
		end

		return a:getCost() < b:getCost()
	end

	return a:getLevel() < b:getLevel()
end

function StagePracticeEnemyHeroList:sortHeroes(list, type, order)
	local func = order == 1 and SortFunc[type] or SortFunc1[type]

	table.sort(list, function (a, b)
		local aInfo = self:getEnemyHeroById(a.id or a)
		local bInfo = self:getEnemyHeroById(b.id or b)

		return func(aInfo, bInfo)
	end)
end

function StagePracticeEnemyHeroList:sortOnTeamPets(idList)
	local heroList = {}
	local ids = {}

	for i = 1, #idList do
		heroList[#heroList + 1] = self:getEnemyHeroById(idList[i])
	end

	table.sort(heroList, function (a, b)
		if a:getCost() == b:getCost() then
			if a:getRarity() == b:getRarity() then
				return a:getId() < b:getId()
			end

			return a:getRarity() < b:getRarity()
		end

		return a:getCost() < b:getCost()
	end)

	for i = 1, #heroList do
		ids[#ids + 1] = heroList[i]:getId()
	end

	return ids
end
