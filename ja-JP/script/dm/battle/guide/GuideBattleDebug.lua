local Position = require("dm.battle.guide.GuideBattlePos")
local BattleDebugConfig = require("dm.battle.guide.BattleDebugConfig")
local __id2pos__ = {
	x = {
		1,
		1,
		1,
		2,
		2,
		2,
		3,
		3,
		3
	},
	y = {
		1,
		2,
		3,
		1,
		2,
		3,
		1,
		2,
		3
	}
}

local function cell2Pos(cellId, x, y)
	if cellId > 0 then
		return Position({
			1,
			x or __id2pos__.x[cellId],
			y or __id2pos__.y[cellId]
		})
	else
		return Position({
			-1,
			x or __id2pos__.x[-cellId],
			y or __id2pos__.y[-cellId]
		})
	end
end

local function fixedPos(zone, x, y)
	return Position({
		zone,
		x,
		y
	})
end

local GuideBattleDebug = {}
local skillModelTime = 1000
local player1 = "player1"
local player2 = "player2"
local masterA = "masterA"
local masterB = "masterB"
local unitA1 = "unitA1"
local unitA2 = "unitA2"
local unitA3 = "unitA3"
local unitA4 = "unitA4"
local unitA5 = "unitA5"
local unitA6 = "unitA6"
local unitA7 = "unitA7"
local unitA9 = "unitA9"
local unitB1 = "unitB1"
local unitB2 = "unitB2"
local unitB3 = "unitB3"
local unitB4 = "unitB4"
local unitB5 = "unitB5"
local unitB6 = "unitB6"
local unitB7 = "unitB7"
local unitB9 = "unitB9"
local units = {
	unitB4 = "ADHWShi",
	unitA9 = "YDZZong",
	unitA4 = "WEDe",
	masterB = "First_Battle_Master2",
	unitB7 = "PNCao",
	unitA1 = "ZTXChang",
	unitA2 = "ZTXCun",
	unitB2 = "HLDNan",
	unitB1 = "JDCZhang",
	unitA5 = "YFZZhu",
	unitA6 = "HLMGen",
	unitB3 = "YKDMLai",
	unitA3 = "DFQi",
	unitB6 = "WTXXuan",
	unitB5 = "FEMSi",
	unitA7 = "LYSi",
	unitB9 = "SGHQShou",
	masterA = "First_Battle_Master1"
}

local function loadMasterSkill(skillId, skillType)
	if skillId then
		local skillConfig = ConfigReader:getRecordById("Skill", skillId)

		return {
			level = 1,
			type = skillType,
			icon = skillConfig.Icon,
			id = skillId
		}
	end

	return ""
end

local function loadMasterData(masterId, owner, cellId, anim)
	local unitId = units[masterId]
	local config = ConfigReader:getRecordById("EnemyMaster", unitId)

	assert(config ~= nil, "master:" .. masterId .. " not exists!")

	local skills = {
		"",
		"",
		""
	}

	if config.MasterSkill1 then
		skills[1] = loadMasterSkill(config.MasterSkill1, kBattleMasterSkill1)
	end

	if config.MasterSkill2 then
		skills[2] = loadMasterSkill(config.MasterSkill2, kBattleMasterSkill2)
	end

	if config.MasterSkill3 then
		skills[3] = loadMasterSkill(config.MasterSkill3, kBattleMasterSkill3)
	end

	local masterData = {
		maxAnger = 1000,
		cost = 0,
		infoId = masterId,
		id = unitId,
		model = config.RoleModel,
		cell = cellId,
		owner = owner,
		hp = config.Hp,
		maxHp = config.Hp,
		anger = config.RageBase,
		roleType = BattleUnitType.kMaster,
		anim = {
			dur = 1000,
			name = "init"
		},
		skills = skills
	}

	return masterData
end

local function loadCardData(heroId)
	local unitId = units[heroId]
	local config = unitId and ConfigReader:getRecordById("HeroBase", unitId)

	if config then
		local cardData = {
			uniqueLevel = 1,
			type = "hero",
			unique = config.UniqueSkill,
			cost = config.Cost,
			id = unitId,
			infoId = heroId,
			hero = {
				ratio = 1,
				level = config.Level,
				star = config.Star,
				id = heroId,
				model = config.RoleModel,
				rarity = config.Rarity,
				maxHp = config.BaseHp,
				def = config.Defence,
				atk = config.Attack,
				genre = config.Type
			}
		}

		return cardData
	end
end

local function loadHeroData(heroId, owner, cellId, anim)
	local unitId = units[heroId]
	local config = unitId and ConfigReader:getRecordById("HeroBase", unitId)

	assert(config ~= nil, "hero:" .. heroId .. " not exists!")

	local heroData = {
		maxAnger = 1000,
		infoId = heroId,
		id = unitId,
		model = GameConfigs.debugModelId or config.RoleModel,
		cell = cellId,
		owner = owner,
		hp = config.BaseHp,
		maxHp = config.BaseHp,
		anger = config.MasterRage,
		cost = config.Cost,
		roleType = BattleUnitType.kHero,
		anim = anim or {
			name = "spawn"
		},
		genre = config.Type,
		unique = config.UniqueSkill
	}

	return heroData
end

local function loadPlayerData(playerId, side, energy, cardArray)
	local cards = {
		0,
		0,
		0,
		0
	}
	local cardPool = {}

	for i = 1, 4 do
		if cardArray[i] then
			cards[i] = loadCardData(cardArray[i])
		end
	end

	for i = #cardArray, 5, -1 do
		cardPool[#cardPool + 1] = loadCardData(cardArray[i])
	end

	local nextCard = cardPool[#cardPool]
	local playerData = {
		energy = energy or 10,
		id = playerId,
		side = side,
		cardPoolSize = #cardPool,
		cards = cards,
		cardPool = cardPool,
		nextCard = nextCard
	}

	return playerData
end

local function popHeroCard(playerInfo, idx)
	local card = playerInfo.nextCard or 0
	playerInfo.cards[idx] = card
	local cardPool = playerInfo.cardPool
	local count = playerInfo.cardPoolSize

	if count > 1 then
		playerInfo.cardPoolSize = count - 1
		playerInfo.nextCard = cardPool[count - 1]
	else
		playerInfo.cardPoolSize = 0
		playerInfo.nextCard = nil
	end

	return {
		type = "hero",
		next = playerInfo.nextCard,
		idx = idx,
		card = card
	}
end

local function genPerform(skillId, actId, dst, dur)
	if dst then
		local dur = dur or 200

		return {
			anim = {
				seq = {
					{
						loop = -1,
						name = "run",
						move = {
							dst = dst,
							dur = dur
						},
						dur = dur
					},
					{
						name = skillId
					}
				}
			},
			act = actId
		}
	else
		return {
			anim = {
				name = skillId
			},
			act = actId
		}
	end
end

local function SplitValue(val, ratios)
	local valIsTable = type(val) == "table"
	local value = valIsTable and val.val or val
	local result = splitNonNegInteger(value, ratios)

	if valIsTable then
		local meta = getmetatable(val)

		for i = 1, #result do
			result[i] = setmetatable({
				val = result[i],
				crit = val.crit,
				block = val.block
			}, meta)
		end
	end

	return result
end

function GuideBattleDebug:main(guideThread, battleContext)
	if GameConfigs.debugSkills then
		BattleDebugConfig.unitsSkills.unitA1 = {}

		for k, v in pairs(GameConfigs.debugSkills) do
			BattleDebugConfig.unitsSkills.unitA1[#BattleDebugConfig.unitsSkills.unitA1 + 1] = {
				target = "masterB",
				skill = v
			}
		end
	end

	BattleDebugConfig.units.unitA1 = GameConfigs.debugHeroId or BattleDebugConfig.units.unitA1
	units = BattleDebugConfig.units
	local battleData = {
		player1 = loadPlayerData(player1, kBattleSideA, 12, {
			"unitA1",
			"unitA2",
			"unitA3",
			"unitA4",
			"unitA5",
			"unitA6",
			"unitA7",
			"unitA9"
		}),
		masterA = loadMasterData("masterA", player1, 8),
		player2 = loadPlayerData(player2, kBattleSideB, 12, {
			"unitB1",
			"unitB2",
			"unitB3",
			"unitB4",
			"unitB5",
			"unitB6",
			"unitB7",
			"unitB9"
		}),
		masterB = loadMasterData("masterB", player2, -8)
	}

	for k, v in pairs(BattleDebugConfig.unitsPos) do
		if math.abs(v) ~= 8 then
			if v > 0 then
				battleData[k] = loadHeroData(k, player1, v)
			else
				battleData[k] = loadHeroData(k, player2, v)
			end
		end
	end

	local handlers = {
		heroCard = function (guideBuilder, playerId, op, args)
			local idx = args.idx
			local cellId = tonumber(args.cellNo)
			local playerInfo = battleData[playerId]

			assert(playerInfo ~= nil, "player: " .. playerId .. " Not Exists")

			local card = playerInfo.cards[idx]

			assert(card ~= nil and card ~= 0, "Card Not Exists")

			local heroId = card.infoId
			playerInfo.energy = playerInfo.energy - card.cost

			guideBuilder:syncEnergy(playerId, {
				playerInfo.energy,
				0,
				0
			})
			guideBuilder:nextCard(playerId, popHeroCard(playerInfo, idx))

			local heroInfo = battleData[heroId]

			if not heroInfo then
				battleData[heroId] = loadHeroData(heroId, playerId, cellId * playerInfo.side)
				heroInfo = battleData[heroId]
			end

			guideBuilder:spawnUnit(heroInfo):sleepForFrames(1):settleUnit(heroInfo)

			return true
		end
	}
	local specialHandlers = {
		heroCard = function (guideBuilder, playerId, op, args)
			local idx = args.idx
			local cellId = tonumber(args.cellNo)
			local playerInfo = battleData[playerId]

			assert(playerInfo ~= nil, "player: " .. playerId .. " Not Exists")

			local card = playerInfo.cards[idx]

			assert(card ~= nil and card ~= 0, "Card Not Exists")

			local heroId = card.infoId
			playerInfo.energy = playerInfo.energy - card.cost

			guideBuilder:syncEnergy(playerId, {
				playerInfo.energy,
				0,
				0
			})

			local heroInfo = battleData[heroId]

			if not heroInfo then
				battleData[heroId] = loadHeroData(heroId, playerId, cellId * playerInfo.side)
				heroInfo = battleData[heroId]
			end

			guideBuilder:spawnUnit(heroInfo):sleepForFrames(1):settleUnit(heroInfo)

			return true
		end
	}

	local function defaultHandler(guideBuilder, playerId, op, args)
		Bdump("defaultHandler", args, op)

		return true
	end

	local function modifyEnergy(playerId, energy)
		local playerInfo = battleData[playerId]
		playerInfo.energy = playerInfo.energy + energy

		return {
			playerInfo.energy,
			0,
			0
		}
	end

	local function modifyRage(playerId, anger)
		local playerInfo = battleData[playerId]
		playerInfo.anger = playerInfo.anger + anger

		return {
			playerInfo.anger,
			0,
			0
		}
	end

	local function getId(unitId)
		return units[unitId]
	end

	local function getInfo(unitId)
		return battleData[unitId]
	end

	local function getPos(unitId, x, y)
		return cell2Pos(battleData[unitId].cell, x, y)
	end

	function genActId(unitId)
		local unitInfo = battleData[unitId]
		self._curAct = self._curAct and self._curAct + 1 or 1
		local actId = "#cg" .. self._curAct
		unitInfo.act = actId

		return actId
	end

	local function getAct(unitId)
		return battleData[unitId].act
	end

	local function genMasterSkillInfo(skillType)
	end

	local function genUniqueSkillInfo(unitId, actId)
		local unitInfo = battleData[unitId]

		return {
			model = "1#" .. unitInfo.unique,
			act = actId
		}
	end

	local function genSkillInfo(unitId, actId)
		return {
			act = actId
		}
	end

	local function doDamage(unitId, damage, crit, block)
		local damage = math.ceil(damage)
		local unitInfo = battleData[unitId]
		local oldhp = unitInfo.hp
		unitInfo.hp = math.max(unitInfo.hp - damage, 0)

		return {
			raw = damage,
			eft = oldhp - unitInfo.hp,
			val = unitInfo.hp,
			crit = crit,
			block = block,
			deadly = oldhp > 0 and unitInfo.hp <= 0
		}
	end

	local function doCure(unitId, cure)
		local cure = math.floor(cure)
		local unitInfo = battleData[unitId]
		local oldhp = unitInfo.hp
		unitInfo.hp = math.min(unitInfo.hp + cure, unitInfo.maxHp)

		return {
			raw = cure,
			eft = unitInfo.hp - oldhp,
			val = unitInfo.hp
		}
	end

	local function doHarmTargetView(unitId, targetIds)
		local unitInfo = battleData[unitId]
		local targets = {}

		for k, v in ipairs(targetIds) do
			local pos = getPos(v)
			targets[k] = {
				zone = pos[1],
				x = pos[2],
				y = pos[3]
			}
		end

		return getId(unitId), {
			act = unitInfo.act,
			targets = targets
		}
	end

	local function doFocus(unitId, destination, scale, duration)
		local unitInfo = battleData[unitId]

		return getId(unitId), {
			act = unitInfo.act,
			dst = destination,
			scale = scale,
			dur = duration
		}
	end

	guideThread:enableInput()

	local guideBuilder = CommonGuideBattleBuilder:new()

	function guideBuilder.processSpawnUnit(guideBuilder)
		local guideBuilder = guideBuilder

		for k, v in pairs(BattleDebugConfig.unitsSpawn) do
			guideBuilder = guideBuilder:spawnUnit(getInfo(v)):settleUnit(getInfo(v))
		end

		return guideBuilder
	end

	function guideBuilder.performSkillExtra(guideBuilder, skills, unit, skillconfig)
		local guideBuilder = guideBuilder

		for k, skill in pairs(skills) do
			guideBuilder = guideBuilder:performSkill(getId(unit), genPerform(skill.skill, getAct(unit), getPos(skillconfig.target) + {
				-1.5,
				0
			}, 200), {
				getId(skillconfig.target)
			}, {
				roles = {
					"target"
				},
				act = getAct(unit)
			})
			guideBuilder = guideBuilder:sleepForFrames(skill.delayFrame or 50)
		end

		return guideBuilder
	end

	function guideBuilder.playSkill(guideBuilder)
		local guideBuilder = guideBuilder

		for unit, skills in pairs(BattleDebugConfig.unitsSkills) do
			for skill, skillconfig in pairs(skills) do
				if skillconfig.skillextra then
					guideBuilder = guideBuilder:startSkill(getId(unit), genSkillInfo(unit, genActId(unit))):performSkillExtra(skillconfig.skillextra, unit, skillconfig):endSkill(getId(unit), getAct(unit)):sleepForFrames(50)
				else
					guideBuilder = guideBuilder:startSkill(getId(unit), genSkillInfo(unit, genActId(unit))):performSkill(getId(unit), genPerform(skillconfig.skill, getAct(unit), getPos(skillconfig.target) + {
						-1.5,
						0
					}, 200), {
						getId(skillconfig.target)
					}, {
						roles = {
							"target"
						},
						act = getAct(unit)
					}):endSkill(getId(unit), getAct(unit)):sleepForFrames(50)
				end
			end
		end

		return guideBuilder
	end

	guideBuilder:startBattle(guideThread, battleContext):sleepForFrames(80):addObjectEvent(kBRGuideLine, "Prologue", true):addObjectEvent(kBRGuideLine, "TouchEnabled", false):addObjectEvent(kBRGuideLine, "HideRightButton"):addObjectEvent(kBRGuideLine, "HideCardArray"):addObjectEvent(kBRGuideLine, "HideEnergyBar"):addObjectEvent(kBRGuideLine, "HideTime"):addObjectEvent(kBRGuideLine, "ResumeTime", {}):addObjectEvent(kBRGuideLine, "HidePauseButton", {}):addPlayer(getInfo(player1)):addPlayer(getInfo(player2)):addObjectEvent(kBRGuideLine, "TimeScale", {
		timeScale = 1
	}):addObjectEvent(kBRGuideLine, "HideSkillButton"):processSpawnUnit():sleepForFrames(30):playSkill():endBattle(function ()
		GameConfigs.debugHeroId = nil
		GameConfigs.debugModelId = nil
		GameConfigs.debugSkills = nil
	end):sleepForFrames(60):addObjectEvent(kBRGuideLine, "StartStory", {
		pause = true,
		leaveBattle = true,
		statisticPoint = "battle_guide_story_3",
		story = "blockstory00_1end"
	})

	return 0
end

function GuideBattleDebug:onExit(exitCode)
	print("onExit", exitCode)
end

return GuideBattleDebug
