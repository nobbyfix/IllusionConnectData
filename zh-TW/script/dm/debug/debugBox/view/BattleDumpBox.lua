local fileExt = ".txt"
local filePre = "dump@"
local fileIndex = filePre .. "Index" .. fileExt

local function converToNumTable(data)
	local result = {}
	slot2, slot3, slot4 = pairs(data)

	for key, value in slot2, slot3, slot4 do
		result[tonumber(key) or key] = value
	end

	return result
end

function _env:startDumpReplay(battleDump)
	local battleData = battleDump.battleData
	local battleConfig = battleDump.battleConfig
	local viewConfig = battleDump.viewConfig
	local opData = battleDump.opData
	local outSelf = self
	local battleDelegate = {}
	local isReplay = true

	if battleData.playerData["1"] then
		battleData.playerData = converToNumTable(battleData.playerData)
	end

	if battleData.enemyData["1"] then
		battleData.enemyData = converToNumTable(battleData.enemyData)
	end

	slot12.battleData = battleData
	slot12.battleConfig = battleConfig
	slot12.battleType = battleDump.battleType
	local battleSession = DumpBattleSession:new({})

	battleSession:buildAll()

	local battleData = battleSession:getPlayersData()
	local battleConfig = battleSession:getBattleConfig()
	local battleSimulator = battleSession:getBattleSimulator()
	local battleLogic = battleSimulator:getBattleLogic()
	local battleInterpreter = BattleInterpreter:new()

	battleInterpreter:setRecordsProvider(battleSession:getBattleRecordsProvider())

	local battleDirector = LocalBattleDirector:new()

	battleDirector:setBattleSimulator(battleSimulator)
	battleDirector:setBattleInterpreter(battleInterpreter)
	battleDirector:setOpData(opData)

	local logicInfo = {
		director = battleDirector,
		interpreter = battleInterpreter,
		mainPlayerId = battleDump.mainPlayerId
	}

	function battleDelegate:onLeavingBattle()
		BattleLoader:popBattleView(outSelf)
	end

	function battleDelegate:onPauseBattle(continueCallback, leaveCallback)
		local popupDelegate = {
			willClose = function (self, sender, data)
				if data.opt == BattlePauseResponse.kLeave then
					leaveCallback()
				else
					continueCallback(data.hpShow, data.effectShow)
				end
			end
		}
		local pauseView = outSelf:getInjector():getInstance("battlePauseView")

		outSelf:dispatch(ViewEvent:new(EVT_SHOW_POPUP, pauseView, nil, {}, popupDelegate))
	end

	function battleDelegate:tryLeaving(callback)
		callback(true)
	end

	function battleDelegate:onSkipBattle()
		BattleLoader:popBattleView(outSelf)
	end

	function battleDelegate:onBattleFinish(result)
		local summary = battleSession:getResultSummary()

		Bdump("dumpStatist:{}", summary)
		BattleLoader:popBattleView(outSelf)
	end

	function battleDelegate:onDevWin()
		BattleLoader:popBattleView(outSelf)
	end

	slot17.speed = {
		visible = false
	}
	slot17.skip = {
		visible = false
	}
	slot17.auto = {
		visible = false
	}
	slot17.pause = {
		visible = true
	}
	slot17.restraint = {
		visible = false
	}
	viewConfig.btnsShow = {}
	local data = {
		battleType = battleSession:getBattleType(),
		battleData = battleData,
		battleConfig = battleConfig,
		isReplay = isReplay,
		logicInfo = logicInfo,
		delegate = battleDelegate,
		viewConfig = viewConfig,
		loadingType = LoadingType.KArena
	}
	viewConfig.refreshCost = ConfigReader:getRecordById("ConfigValue", "TacticsCard_Reload").content
	viewConfig.battleSuppress = BattleDataHelper:getBattleSuppress()

	BattleLoader:pushBattleView(self, data)
end

SaveBattleDumpBox = class("SaveBattleDumpBox", DebugViewTemplate, _M)

function SaveBattleDumpBox:initialize()
	function slot2.selectHandler(selectStr)
		local ret = {}

		table.insert(ret, {
			"1",
			"保存至默认路径"
		})
		table.insert(ret, {
			"2",
			"复制dump至剪贴板"
		})

		return ret
	end

	slot1[1] = {
		name = "result",
		_selectBoxShow = true,
		type = "SelectBox",
		title = "",
		_selectBoxAutoHide = false
	}
	self._viewConfig = {}
end

function SaveBattleDumpBox:onClick(data)
	local function defaultCallback(result, data)
		if result then
			local cjson = require("cjson.safe")
			local dumpString = cjson.encode(data)
			local fileName = filePre .. os.date("%Y_%m_%d@%H_%M_%S") .. fileExt

			if not GameConfigs.recordSavedPath then
				local path = device.writablePath
			end

			local filePath = path .. fileName
			local file = io.open(filePath, "w")

			if file == nil then
				cclogf("打开/创建文件失败。可能目录不存在，或者没有写入权限。文件路径：%s", filePath)

				if path == device.writablePath then
					return
				end

				path = device.writablePath
				filePath = path .. fileName

				cclogf("尝试写入到默认路径：%s", filePath)

				file = io.open(filePath, "w")

				if file == nil then
					cclogf("打开/创建文件失败！")
					self:dispatch(ShowTipEvent({
						tip = "打开/创建文件失败！"
					}))

					return
				end
			end

			file:write(dumpString)
			file:close()

			local indexPath = path .. fileIndex

			if not io.exists(indexPath) then
				file = io.open(indexPath, "w")

				file:close()
			end

			file = io.open(indexPath, "a+")

			file:write(filePath .. "\n")
			file:close()
			cclog("战斗DUMP已保存到文件: " .. filePath)

			slot14.tip = "战斗DUMP已保存到文件: " .. filePath

			self:dispatch(ShowTipEvent({}))
		else
			slot7.tip = data

			self:dispatch(ShowTipEvent({}))
		end
	end

	local mText = self._viewConfig[1].mtext
	slot6[1] = mText

	dump({}, "asdfasdfasdfa")

	if tostring(mText) == "2" then
		local function callback(result, data)
			dump({}, "callback1111111")

			if result then
				local cjson = require("cjson.safe")
				slot5[1] = data

				dump({}, "SaveBattleDumpBox:onClick")

				local dumpString = cjson.encode(data)

				if app.getDevice and app.getDevice() then
					app.getDevice():copyStringToClipboard(dumpString)
					self:dispatch(ShowTipEvent({
						tip = "dump已复制至剪贴板"
					}))
				else
					self:dispatch(ShowTipEvent({
						tip = "设备不支持复制至剪贴板"
					}))
				end
			end
		end

		dump({}, "callback2222222")
		self:dispatch(Event:new("DEBUG_EVT_SAVE_BATTLE_DUMP", callback))
	else
		self:dispatch(Event:new("DEBUG_EVT_SAVE_BATTLE_DUMP", defaultCallback))
	end
end

ClearBattleDumpBox = class("ClearBattleDumpBox", DebugViewTemplate, _M)

function ClearBattleDumpBox:initialize()
	slot1[1] = {
		title = "",
		name = "result",
		type = "Label"
	}
	self._viewConfig = {}
end

function ClearBattleDumpBox:onClick(data)
	if not GameConfigs.recordSavedPath then
		local path = device.writablePath
	end

	local indexPath = path .. fileIndex

	if not io.exists(indexPath) then
		return
	end

	local f = io.open(indexPath, "r")
	slot5, slot6, slot7 = f:lines()

	for i in slot5, slot6, slot7 do
		if io.exists(i) then
			os.remove(i)
		end
	end

	os.remove(indexPath)
	cclog("成功清除战斗DUMP缓存")
	self:dispatch(ShowTipEvent({
		tip = "成功清除战斗DUMP缓存"
	}))
end

ReplayBattleDumpFileBox = class("ReplayBattleDumpFileBox", DebugViewTemplate, _M)

function ReplayBattleDumpFileBox:initialize()
	self._dynamic = true
	slot1[1] = {
		default = "1",
		name = "FileIndex",
		title = "输入文件名",
		type = "Input"
	}
	self._viewConfig = {}

	if not GameConfigs.recordSavedPath then
		local path = device.writablePath
	end

	local indexPath = path .. fileIndex

	if not io.exists(indexPath) then
		return
	end

	local f = io.open(indexPath, "r")
	local count = 0
	slot5, slot6, slot7 = f:lines()

	for i in slot5, slot6, slot7 do
		if io.exists(i) then
			count = count + 1
			local pos, posend = string.find(i, filePre, nil, , 1)
			local fileName = string.sub(i, posend + 1)
			slot14.name = i
			slot14.title = count .. " " .. fileName
			self._viewConfig[#self._viewConfig + 1] = {
				type = "Label"
			}
		end
	end
end

function ReplayBattleDumpFileBox:onClick(data)
	local index = tonumber(data.FileIndex)

	if not GameConfigs.recordSavedPath then
		local path = device.writablePath
	end

	local fileName = nil

	if index then
		local indexPath = path .. fileIndex

		if not io.exists(indexPath) then
			self:dispatch(ShowTipEvent({
				tip = "索引文件不存在"
			}))

			return
		end

		local f = io.open(indexPath, "r")
		local count = 0
		slot8, slot9, slot10 = f:lines()

		for i in slot8, slot9, slot10 do
			if io.exists(i) then
				count = count + 1

				if index == count then
					fileName = i

					break
				end
			end
		end
	else
		fileName = path .. data.FileIndex .. fileExt
	end

	if io.exists(fileName) then
		local file = io.open(fileName, "r")
		local content = file:read("*a")
		local cjson = require("cjson.safe")
		local battleDump = cjson.decode(content)

		startDumpReplay(self, battleDump)
	else
		self:dispatch(ShowTipEvent({
			tip = "文件不存在"
		}))
	end
end

UploadBattleDumpBox = class("UploadBattleDumpBox", DebugViewTemplate, _M)

function UploadBattleDumpBox:initialize()
	slot1[1] = {
		title = "",
		name = "result",
		type = "Label"
	}
	self._viewConfig = {}
end

function UploadBattleDumpBox:onClick(data)
	local function callback(result, data)
		if result then
			local cjson = require("cjson.safe")
			local dumpString = cjson.encode(data)
			local shortName = os.date("%Y_%m_%d@%H_%M_%S") .. fileExt

			StatisticSystem:uploadBattleDump("uploadBattleDump", dumpString, function (response)
				slot6.tip = response

				self:dispatch(ShowTipEvent({}))
			end)
		else
			slot7.tip = data

			self:dispatch(ShowTipEvent({}))
		end
	end

	self:dispatch(Event:new("DEBUG_EVT_SAVE_BATTLE_DUMP", callback))
end

UploadBattleDumpFileBox = class("UploadBattleDumpFileBox", DebugViewTemplate, _M)

function UploadBattleDumpFileBox:initialize()
	self._dynamic = true
	slot1[1] = {
		default = "1",
		name = "FileIndex",
		title = "输入文件名",
		type = "Input"
	}
	self._viewConfig = {}

	if not GameConfigs.recordSavedPath then
		local path = device.writablePath
	end

	local indexPath = path .. fileIndex

	if not io.exists(indexPath) then
		return
	end

	local f = io.open(indexPath, "r")
	local count = 0
	slot5, slot6, slot7 = f:lines()

	for i in slot5, slot6, slot7 do
		if io.exists(i) then
			count = count + 1
			local pos, posend = string.find(i, filePre, nil, , 1)
			local fileName = string.sub(i, posend + 1)
			slot14.name = i
			slot14.title = count .. " " .. fileName
			self._viewConfig[#self._viewConfig + 1] = {
				type = "Label"
			}
		end
	end
end

function UploadBattleDumpFileBox:onClick(data)
	local index = tonumber(data.FileIndex)

	if not GameConfigs.recordSavedPath then
		local path = device.writablePath
	end

	local fileName, shortName = nil

	if index then
		local indexPath = path .. fileIndex

		if not io.exists(indexPath) then
			self:dispatch(ShowTipEvent({
				tip = "索引文件不存在"
			}))

			return
		end

		local f = io.open(indexPath, "r")
		local count = 0
		slot9, slot10, slot11 = f:lines()

		for i in slot9, slot10, slot11 do
			if io.exists(i) then
				count = count + 1

				if index == count then
					fileName = i

					break
				end
			end
		end

		local pos, posend = string.find(fileName, filePre, nil, , 1)
		shortName = string.sub(fileName, posend + 1)
	else
		fileName = path .. data.FileIndex .. fileExt
		shortName = data.FileIndex .. fileExt
	end

	if io.exists(fileName) then
		local file = io.open(fileName, "r")
		local battleDumpString = file:read("*a")
		slot10.content = battleDumpString
		slot10.key = shortName
		slot10.rid = self:getInjector():getInstance("DevelopSystem"):getPlayer():getRid()

		CommonUtils.uploadData({
			type = "battleDump",
			url = "192.168.0.186/saveLog.php"
		}, function (response)
			slot6.tip = response

			self:dispatch(ShowTipEvent({}))
		end)
	else
		self:dispatch(ShowTipEvent({
			tip = "文件不存在"
		}))
	end
end

ReplayBattleDumpPhpBox = class("ReplayBattleDumpPhpBox", DebugViewTemplate, _M)

function ReplayBattleDumpPhpBox:initialize()
	slot1[1] = {
		default = "1",
		name = "FileIndex",
		title = "目前文件名无处获取，待以后完善",
		type = "Input"
	}
	self._viewConfig = {}
end

function ReplayBattleDumpPhpBox:onClick(data)
	local shortName = data.FileIndex .. fileExt
	slot5.key = shortName
	slot5.rid = self:getInjector():getInstance("DevelopSystem"):getPlayer():getRid()

	CommonUtils.getData({
		type = "battleDump",
		url = "http:192.168.1.73/getLog.php"
	}, function (response)
		if response and response ~= "" then
			local cjson = require("cjson.safe")
			local battleDump = cjson.decode(response)

			startDumpReplay(self, battleDump)
		end
	end)
end

ReplayBattleCheckResultBox = class("ReplayBattleCheckResultBox", DebugViewTemplate, _M)

function ReplayBattleCheckResultBox:initialize()
	slot1[1] = {
		default = "fail",
		name = "FileName",
		title = "目前文件名无处获取，待以后完善",
		type = "Input"
	}
	self._viewConfig = {}
end

function ReplayBattleCheckResultBox:onClick(data)
	local name = tostring(data.FileName)

	if not GameConfigs.recordSavedPath then
		local path = device.writablePath
	end

	local fileName = path .. name .. ".log"

	if io.exists(fileName) then
		local file = io.open(fileName, "r")
		local content = file:read("*a")
		local cjson = require("cjson.safe")
		local logs = cjson.decode(content)

		if logs == nil then
			content = string.gsub(content, "\"[^\"]*\":%s*nil,", "")
			content = string.gsub(content, ",\"[^\"]*\":%s*nil}", "}")
			content = string.gsub(content, "\\\\", "\\")
			logs = cjson.decode(content)
			logs = logs.response
		end

		Bdump(logs.battleInput.playerData)
		Bdump(logs.clientResult.opData)
		Bdump(logs.clientResult.statist)

		local args = logs.battleInput
		local pointId = args.pointId
		local playerData = args.playerData
		local randomSeed = args.randomSeed
		local playerId = playerData.rid
		local battleData = StageBattleLauncher:buildBattleData(pointId, playerData, randomSeed)
		local battleConfig = StageBattleLauncher:genBattleConfigAndData(battleData, pointId, randomSeed)
		local pointConfig = ConfigReader:getRecordById("BlockPoint", pointId)
		local bgRes = pointConfig.Background or "battle_scene_1"
		local battleDump = {
			battleData = battleData
		}
		slot19[1] = playerId
		battleDump.mainPlayerId = {}
		battleDump.battleConfig = battleConfig
		slot19.finalHitType = pointConfig.PointType
		slot19.background = bgRes
		slot19.hpShow = self:getInjector():getInstance(SettingSystem):getSettingModel():getHpShowSetting()
		slot20.speed = {
			visible = false
		}
		slot20.skip = {
			visible = false
		}
		slot21.state = isAuto
		slot20.auto = {
			visible = true
		}
		slot20.pause = {
			visible = true
		}
		slot19.btnsShow = {}
		battleDump.viewConfig = {
			opPanelRes = "asset/ui/BattleUILayer.csb",
			canChangeSpeedLevel = true,
			opPanelClazz = "BattleUIMediator",
			mainView = "battlePlayer"
		}
		battleDump.opData = logs.clientResult.opData

		startDumpReplay(self, battleDump)
	else
		self:dispatch(ShowTipEvent({
			tip = "文件不存在"
		}))
	end
end

ReplayBCFailClientDumpBox = class("ReplayBCFailClientDumpBox", DebugViewTemplate, _M)

function ReplayBCFailClientDumpBox:initialize()
	slot1[1] = {
		default = "fail",
		name = "FileName",
		title = "目前文件名无处获取，待以后完善",
		type = "Input"
	}
	self._viewConfig = {}
end

function ReplayBCFailClientDumpBox:onClick(data)
	local name = tostring(data.FileName)

	if not GameConfigs.recordSavedPath then
		local path = device.writablePath
	end

	local fileName = path .. name .. ".log"

	if io.exists(fileName) then
		local file = io.open(fileName, "r")
		local content = file:read("*a")
		local cjson = require("cjson.safe")
		local logs = cjson.decode(content)

		if logs == nil then
			content = string.gsub(content, "\"[^\"]*\":%s*nil,", "")
			content = string.gsub(content, ",\"[^\"]*\":%s*nil}", "}")
			content = string.gsub(content, "\\\\", "\\")
			logs = cjson.decode(content)
		end

		Bdump("clientStatist:", logs.response.clientResult.statist)
		Bdump("serverStatist:", logs.response.serverResult.statist)

		local battleDump = logs.battleDump

		startDumpReplay(self, battleDump)
	else
		self:dispatch(ShowTipEvent({
			tip = "文件不存在"
		}))
	end
end

CompareDataBattleCheckResultBox = class("CompareDataBattleCheckResultBox", DebugViewTemplate, _M)

function CompareDataBattleCheckResultBox:initialize()
	slot1[1] = {
		default = "fail",
		name = "FileName",
		title = "目前文件名无处获取，待以后完善",
		type = "Input"
	}
	self._viewConfig = {}
end

local function Compare(data1, data2, path)
	if type(data1) == "table" then
		if type(data2) ~= "table" then
			if data1 ~= data2 then
				print("Failed! path:", path)
				print("data1", data1)
				print("data2", data2)
			end
		else
			slot3, slot4, slot5 = pairs(data1)

			for k, v in slot3, slot4, slot5 do
				Compare(v, data2[k], path .. "." .. k)
			end
		end
	end
end

function CompareDataBattleCheckResultBox:onClick(data)
	local name = tostring(data.FileName)

	if not GameConfigs.recordSavedPath then
		local path = device.writablePath
	end

	local fileName = path .. name .. ".log"

	if io.exists(fileName) then
		local file = io.open(fileName, "r")
		local content = file:read("*a")
		local cjson = require("cjson.safe")
		local logs = cjson.decode(content)

		if logs == nil then
			content = string.gsub(content, "\"[^\"]*\":%s*nil,", "")
			content = string.gsub(content, ",\"[^\"]*\":%s*nil}", "}")
			content = string.gsub(content, "\\\\", "\\")
			logs = cjson.decode(content)
		end

		local dumpBattleData = logs.battleDump.battleData
		local dumpBattleConfig = logs.battleDump.battleConfig
		local args = logs.response.battleInput
		local pointId = args.pointId
		local playerData = args.playerData
		local randomSeed = args.randomSeed
		local playerId = playerData.rid
		local battleData = StageBattleLauncher:buildBattleData(pointId, playerData, randomSeed)
		local battleConfig = StageBattleLauncher:genBattleConfigAndData(battleData, pointId, randomSeed)

		Compare(dumpBattleData, battleData, "data")
		Compare(dumpBattleConfig, battleConfig, "battelConfig")
	else
		self:dispatch(ShowTipEvent({
			tip = "文件不存在"
		}))
	end
end

CustomBattle = class("CustomBattle", DebugViewTemplate, _M)

CustomBattle:has("_stageSystem", {
	is = "r"
}):injectWith("StageSystem")

function CustomBattle:initialize()
	slot1[1] = {
		title = "自定义英雄战斗配置",
		name = "FileName",
		type = "Label"
	}
	self._viewConfig = {}
end

function CustomBattle:onClick(data)
	local keys = {
		"Speed",
		"StarId",
		"Cost",
		"MasterRage",
		"AttackFactor",
		"DefenceFactor",
		"HpFactor",
		"AtkRate",
		"DefRate",
		"DefWeaken",
		"AtkWeaken",
		"CritRate",
		"UncritRate",
		"CritStrg",
		"BlockRate",
		"UnblockRate",
		"BlockStrg",
		"HurtRate",
		"UnhurtRate",
		"Absorption",
		"Reflection",
		"EffectRate",
		"UneffectRate",
		"EffectStrg",
		"BeCuredRate",
		"UndeadRate",
		"DoubleRate",
		"CounterRate",
		"SkillRate",
		"Flags",
		BaseHp = "hp",
		BaseAttack = "atk",
		BaseStar = "star",
		Type = "genre",
		RoleModel = "modelId",
		Rareity = "rarity",
		Anger = "angerRules",
		BaseDefence = "def"
	}

	local function readConfig(configId, tableName, isMaster, index)
		local ret = {}
		local cfg = {}
		local srcCfg = ConfigReader:getRecordById(tableName, configId)

		assert(srcCfg ~= nil, "表" .. tableName .. "没有id为" .. configId .. "的数据")
		table.deepcopy(srcCfg, cfg)

		slot7, slot8, slot9 = pairs(keys)

		for k, v in slot7, slot8, slot9 do
			if type(k) == "string" then
				ret[v] = cfg[k]
			else
				ret[string.lower(v)] = cfg[v]
			end
		end

		ret.id = isMaster and "m-" .. configId .. "-" .. index or "h-" .. configId .. "-" .. index
		ret.surfaceId = cfg.SurfaceList and cfg.SurfaceList[1] or "Surface_ZTXChang_1"
		ret.combat = 1000
		ret.level = 1
		ret.maxHp = cfg.BaseHp

		if not isMaster then
			slot8.skillId = cfg.NormalSkill
			slot7.normal = {
				level = 1
			}
			slot8.skillId = cfg.ProudSkill
			slot7.proud = {
				level = 1
			}
			slot8.skillId = cfg.UniqueSkill
			slot7.unique = {
				level = 1
			}
			slot8.skillId = cfg.BattlePassiveSkill
			slot7.passive = {
				level = 1
			}
			ret.skills = {}
		else
			slot8.skillId = cfg.AttackSkill
			slot7.normal = {
				level = 1
			}
			ret.skills = {}
		end

		return ret
	end

	local function fillCards(cardPool, heroCards)
		slot2, slot3, slot4 = pairs(cardPool)

		for k, v in slot2, slot3, slot4 do
			local heroCfg = readConfig(v.configId, "HeroBase", false, k)
			slot8, slot9, slot10 = pairs(v)

			for subk, subv in slot8, slot9, slot10 do
				heroCfg[subk] = subv
			end

			local cfg = {
				id = heroCfg.id,
				hero = heroCfg,
				cost = heroCfg.cost
			}

			table.insert(heroCards, cfg)
		end
	end

	local function fillHeros(heroPool, heros)
		local idx = 1
		slot3, slot4, slot5 = pairs(heroPool)

		for k, v in slot3, slot4, slot5 do
			local heroCfg = readConfig(v.configId, "HeroBase", false, idx)
			slot9, slot10, slot11 = pairs(v)

			for subk, subv in slot9, slot10, slot11 do
				heroCfg[subk] = subv
			end

			heros[tostring(idx)] = heroCfg
			idx = idx + 1
		end
	end

	local function genMaster(master)
		local cfg = readConfig(master.configId, "MasterBase", true, 1)
		slot2, slot3, slot4 = pairs(master)

		for subk, subv in slot2, slot3, slot4 do
			cfg[subk] = subv
		end

		return cfg
	end

	local fakeData = require(GameConfigs.recordSavedPath .. "/fakeData")
	local master = {}
	local enemyMaster = {}
	local cardsA = {}
	local cardsB = {}
	local herosA = {}
	local herosB = {}
	master = genMaster(fakeData:getMasterData())
	enemyMaster = genMaster(fakeData:getEnemyMasterData())

	fillCards(fakeData:getCardPoolA(), cardsA)
	fillCards(fakeData:getCardPoolB(), cardsB)
	fillHeros(fakeData:getHeroPoolA(), herosA)
	fillHeros(fakeData:getHeroPoolB(), herosB)

	local playerData = {
		initiative = 100,
		headImg = "Head_Master_XueZhan",
		rid = "123411_105",
		nickname = "队长12345",
		combat = 1000,
		energy = {
			capacity = 30,
			base = 20
		},
		master = master,
		heros = herosA,
		cards = cardsA
	}
	local enemyData = {
		initiative = 100,
		headImg = "Head_Master_XueZhan",
		rid = "54321_105",
		nickname = "队长54321",
		combat = 1000,
		energy = {
			capacity = 30,
			base = 20
		},
		master = enemyMaster,
		heros = herosB,
		cards = cardsB
	}
	battleSession[1] = playerData

	dump({}, "fakeData playerData-----------------------")

	battleSession[1] = enemyData

	dump({}, "fakeData enemyData--------------------")

	local logicSeed = fakeData:getLogicSeed()
	local battleType = SettingBattleTypes.kNormalStage
	slot21.playerData = playerData
	slot21.enemyData = enemyData
	slot21.battleType = battleType
	local battleSession = FakeBattleSession:new({
		logicSeed = 23
	})

	battleSession:buildAll({
		noAutoStrategies = true
	})

	local battleData = battleSession:getPlayersData()
	local battleConfig = battleSession:getBattleConfig()
	local battleSimulator = battleSession:getBattleSimulator()
	local battleInterpreter = BattleInterpreter:new()

	battleInterpreter:setRecordsProvider(battleSession:getBattleRecordsProvider())

	local battleDirector = LocalBattleDirector:new()

	battleDirector:setBattleSimulator(battleSimulator)
	battleDirector:setBattleInterpreter(battleInterpreter)

	local logicInfo = {
		director = battleDirector,
		interpreter = battleInterpreter,
		teams = battleSession:genTeamAiInfo()
	}
	outSelf[1] = playerData.rid
	logicInfo.mainPlayerId = {}
	local outSelf = self
	local battleDelegate = {}
	local systemKeeper = self:getInjector():getInstance("SystemKeeper")
	local this = self

	local function battleOver()
		slot4.response = AlertResponse.kClose

		BattleLoader:popBattleView(this, {})
	end

	function battleDelegate:onLeavingBattle()
		battleOver()
	end

	function battleDelegate:onPauseBattle(continueCallback, leaveCallback)
		local popupDelegate = {
			willClose = function (self, sender, data)
				if data.opt == BattlePauseResponse.kLeave then
					leaveCallback()
				else
					continueCallback(data.hpShow, data.effectShow)
				end
			end
		}
		local pauseView = outSelf:getInjector():getInstance("battlePauseView")

		outSelf:dispatch(ViewEvent:new(EVT_SHOW_POPUP, pauseView, nil, {}, popupDelegate))
	end

	function battleDelegate:tryLeaving(callback)
		callback(true)
	end

	function battleDelegate:onSkipBattle()
		battleOver()
	end

	function battleDelegate:onBattleFinish(result)
		battleOver()
	end

	function battleDelegate:onDevWin()
		self:onBattleFinish()
	end

	function battleDelegate:onTimeScaleChanged(timeScale)
		outSelf:getInjector():getInstance(SettingSystem):getSettingModel():setBattleSetting(battleType, nil, timeScale)
	end

	function battleDelegate:onShowRestraint(continueCallback)
		local popupDelegate = {
			willClose = function (self, sender)
				continueCallback()
			end
		}
		local view = outSelf:getInjector():getInstance("battlerofessionalRestraintView")

		outSelf:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, nil, {}, popupDelegate))
	end

	local BGM = ConfigReader:getDataByNameIdAndKey("ConfigValue", "Music_BattleBGM_PetRace", "content")
	local data = {
		isReplay = false,
		battleType = battleSession:getBattleType(),
		battleData = battleData,
		battleConfig = battleConfig,
		logicInfo = logicInfo,
		delegate = battleDelegate
	}
	slot32.bgm = BGM
	slot32.refreshCost = ConfigReader:getRecordById("ConfigValue", "TacticsCard_Reload").content
	slot32.battleSuppress = BattleDataHelper:getBattleSuppress()
	slot32.hpShow = self:getInjector():getInstance(SettingSystem):getSettingModel():getHpShowSetting()
	slot32.effectShow = self:getInjector():getInstance(SettingSystem):getSettingModel():getEffectShowSetting()
	slot32.unlockMasterSkill = self:getInjector():getInstance(SystemKeeper):isUnlock("Master_BattleSkill")
	slot33.speed = {
		visible = false
	}
	slot33.skip = {
		visible = false
	}
	slot34.visible = self:getInjector():getInstance(SystemKeeper):canShow("AutoFight")
	slot34.lock = not systemKeeper:isUnlock("AutoFight")
	slot33.auto = {
		enable = false
	}
	slot33.pause = {
		visible = true
	}
	slot34.visible = self:getInjector():getInstance(SystemKeeper):canShow("Button_CombateDominating")
	slot34.lock = not self:getInjector():getInstance(SystemKeeper):isUnlock("Button_CombateDominating")
	slot33.restraint = {}
	slot32.btnsShow = {}
	data.viewConfig = {
		mainView = "battlePlayer",
		canChangeSpeedLevel = true,
		opPanelRes = "asset/ui/BattleUILayer.csb",
		opPanelClazz = "BattleUIMediator",
		background = "Battle_Scene_27"
	}
	data.loadingType = LoadingType.KArena

	BattleLoader:pushBattleView(self, data)
end
