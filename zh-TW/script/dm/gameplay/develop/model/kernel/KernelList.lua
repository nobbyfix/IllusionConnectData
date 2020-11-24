require("dm.gameplay.develop.model.kernel.Kernel")

KernelList = class("KernelList", objectlua.Object, _M)

KernelList:has("_allkKernelList", {
	is = "rw"
})
KernelList:has("_haveUse", {
	is = "rw"
})
KernelList:has("_belongsSuiteid", {
	is = "rw"
})
KernelList:has("_eatExp", {
	is = "rw"
})

local SortType = {
	defense = 4,
	quality = 2,
	defenseUp = 9,
	attackUp = 8,
	crit = 6,
	critDamage = 11,
	speed = 7,
	hp = 5,
	attack = 3,
	skillEffect = 8,
	hpUp = 10,
	level = 1
}

function KernelList:initialize()
	super.initialize(self)
	self:initSuiteList()

	self._allkKernelList = nil
	self._intKernelList = nil
	self._equipList = nil
	self._eatList = {}
	self._eatExp = 0
	self._expConfig = ConfigReader:getDataTable("MasterCoreExp")
	local temptable = {}

	for k, v in pairs(self._expConfig) do
		temptable[tonumber(k)] = v
	end

	self._expConfig = temptable
end

function KernelList:synchronize(data)
	if not data then
		return
	end

	local klist = {}

	for k, v in pairs(data) do
		klist[k] = v
	end

	if self._allkKernelList ~= nil then
		dump(self._allkKernelList, "差异前")

		for k, v in pairs(klist) do
			if self._allkKernelList[k] ~= nil then
				for kk, vv in pairs(v) do
					self._allkKernelList[k][kk] = vv
				end
			else
				self._allkKernelList[k] = v
			end
		end

		dump(self._allkKernelList, "差异后")
	else
		self._allkKernelList = klist
	end

	self._intKernelList = self:getAllKernelIntList()
end

function KernelList:synchronizeDel(data)
	if not data then
		return
	end

	local templist = {}

	for m, n in pairs(data) do
		self._allkKernelList[m] = nil
	end

	for k, v in pairs(self._allkKernelList) do
		if v ~= nil then
			templist[k] = v
		end
	end

	self._allkKernelList = templist
	self._intKernelList = self:getAllKernelIntList()
end

function KernelList:synchronizeDelEquip(data)
	if not data then
		return
	end
end

function KernelList:getAllKernelList()
	return self._allkKernelList
end

function KernelList:getAllKernelIntList()
	local kernelintlist = {}
	local count = 1

	for k, v in pairs(self._allkKernelList) do
		kernelintlist[count] = v
		kernelintlist[count].serverkey = k
		kernelintlist[count].id = count
		kernelintlist[count].Position = ConfigReader:getDataByNameIdAndKey("MasterCoreBase", v.configId, "Position")
		local namekey = ConfigReader:getDataByNameIdAndKey("MasterCoreBase", v.configId, "Name")
		kernelintlist[count].Name = ConfigReader:getDataByNameIdAndKey("Translate", namekey, "Zh_CN")
		kernelintlist[count].isExpCore = ConfigReader:getDataByNameIdAndKey("MasterCoreBase", v.configId, "IsExpCore")
		kernelintlist[count].quality = ConfigReader:getDataByNameIdAndKey("MasterCoreBase", v.configId, "Quality")
		count = count + 1
	end

	self._intKernelList = kernelintlist

	return self._intKernelList
end

function KernelList:getKernelByPos(pos)
	local kernelPosList = {}
	local count = 1

	for k, v in pairs(self._intKernelList) do
		if v.Position == pos then
			kernelPosList[count] = v
			count = count + 1
		end
	end

	return kernelPosList
end

function KernelList:getNameByConfigId(configid)
	local namekey = ConfigReader:getDataByNameIdAndKey("MasterCoreBase", configid, "Name")

	print("namekey::", namekey)

	return ConfigReader:getDataByNameIdAndKey("Translate", namekey, "Zh_CN")
end

function KernelList:getPosByConfigId(configid)
	return ConfigReader:getDataByNameIdAndKey("MasterCoreBase", configid, "Position")
end

function KernelList:isEquip(serverid)
end

function KernelList:getOneKernelbyId(serverid)
end

function KernelList:addEatKernelList(serverid)
	table.insert(self._eatList, serverid)
end

function KernelList:delEatKernelList(serverid)
	local len = #self._eatList

	for i = 1, len do
		if serverid == self._eatList[i] then
			table.remove(self._eatList, i)
		end
	end
end

function KernelList:getEatList()
	return self._eatList
end

function KernelList:calculateEatListExp()
	local expSum = 0

	print("吞噬列表数量--->", #self._eatList)

	for i = 1, #self._eatList do
		local onkernel = self._allkKernelList[self._eatList[i]]
		local zeroExp = ConfigReader:getDataByNameIdAndKey("MasterCoreBase", onkernel.configId, "Exp")
		local levelExp = ConfigReader:getDataByNameIdAndKey("MasterCoreExp", tostring(onkernel.level), "GiveExp")
		local strengthenFactor = ConfigReader:getDataByNameIdAndKey("MasterCoreBase", onkernel.configId, "LevelUpFactor")

		if onkernel.level > 0 then
			expSum = expSum + zeroExp + levelExp * strengthenFactor + onkernel.exp * levelExp
		else
			expSum = expSum + zeroExp + onkernel.exp
		end
	end

	self._eatExp = math.floor(expSum)

	return self._eatExp
end

function KernelList:calculateEquipListAttribute(equipdata)
	local _equipdata = {}

	for k, v in pairs(equipdata) do
		local subtable = {
			[v.mainEffectId] = self:getMainEffectDesc(v)
		}
		local subeffect = self:getSubEffectDesc(v)

		for key, value in pairs(subeffect) do
			subtable[key] = value
		end

		_equipdata[k] = subtable
	end

	local attrSumTable = {}

	for k, v in pairs(_equipdata) do
		for kk, vv in pairs(v) do
			local attrType = ConfigReader:getDataByNameIdAndKey("SkillAttrEffect", kk, "AttrType")
			local namekeylist = ConfigReader:getDataByNameIdAndKey("ConfigValue", "Hero_SkillAttrName", "content")
			local namekey = nil

			for kkk, vvv in pairs(namekeylist) do
				if attrType[1] == kkk then
					namekey = vvv
					local name = ConfigReader:getDataByNameIdAndKey("Translate", namekey, "Zh_CN")
					local temp = attrSumTable[name]

					if temp == nil then
						temp = ""
					end

					local attrvalue = string.split(vv, "+")[2]
					attrSumTable[name] = temp .. "," .. attrvalue

					break
				end
			end
		end
	end

	local attrSum = {}

	for k, v in pairs(attrSumTable) do
		local valueList = string.split(v, ",")
		local tempv = 0
		local needbai = false

		for i = 1, #valueList do
			if valueList[i] ~= "" then
				if string.find(valueList[i], "%%") == nil then
					tempv = tempv + valueList[i]
				else
					tempv = tempv + tonumber(string.split(valueList[i], "%")[1])
					needbai = true
				end
			end
		end

		attrSum[k] = "+" .. tempv

		if needbai then
			attrSum[k] = attrSum[k] .. "%"
		end
	end

	return attrSum
end

function KernelList:resetEatList()
	self._eatList = {}
	self._eatExp = 0
end

function KernelList:initSuiteList()
	local suitetable = ConfigReader:getDataTable("MasterCoreSuite")
	self._suiteList = {}
	local index = 1

	for k, v in pairs(suitetable) do
		local suittemp = {
			key = k,
			Name = v.Name,
			Icon = v.Icon,
			IncludeCore = v.IncludeCore,
			ThreePieceDesc = ConfigReader:getDataByNameIdAndKey("Translate", v.ThreePieceDesc, "Zh_CN"),
			FivePieceDesc = ConfigReader:getDataByNameIdAndKey("Translate", v.FivePieceDesc, "Zh_CN")
		}
		self._suiteList[index] = suittemp
		index = index + 1
	end
end

function KernelList:getOneSuitDescByKernelId(configid)
	local threeDesc = {}
	local fiveDesc = {}
	local suiteid = ConfigReader:getDataByNameIdAndKey("MasterCoreBase", configid, "Belong")
	local belongThreeSuiteDesc = ConfigReader:getDataByNameIdAndKey("MasterCoreSuite", suiteid, "ThreePieceDesc")

	if type(belongThreeSuiteDesc) == "table" then
		for k, v in pairs(belongThreeSuiteDesc) do
			threeDesc[k] = ConfigReader:getDataByNameIdAndKey("Translate", v, "Zh_CN")
		end
	else
		threeDesc = ConfigReader:getDataByNameIdAndKey("Translate", belongThreeSuiteDesc, "Zh_CN")
	end

	local belongFiveSuiteDesc = ConfigReader:getDataByNameIdAndKey("MasterCoreSuite", suiteid, "FivePieceDesc")

	if type(belongFiveSuiteDesc) == "table" then
		for k, v in pairs(belongFiveSuiteDesc) do
			fiveDesc[k] = ConfigReader:getDataByNameIdAndKey("Translate", v, "Zh_CN")
		end
	else
		fiveDesc = ConfigReader:getDataByNameIdAndKey("Translate", belongFiveSuiteDesc, "Zh_CN")
	end

	local desc = {
		threeDesc,
		fiveDesc
	}

	dump(desc, "套装描述")

	return desc
end

function KernelList:getAllSuiteDesc()
	local allSuiteDesc = {}
	local suitedata = ConfigReader:getDataTable("MasterCoreSuite")

	dump(suitedata, "整个套装表")
end

function KernelList:getSuiteList()
	return self._suiteList
end

function KernelList:getOneSuiteHaveNum(suitedata)
	local count = 0

	for k, v in pairs(suitedata.IncludeCore) do
		if self:findOneKernel(v) then
			count = count + 1
		end
	end

	return count
end

function KernelList:findOneKernel(kernelid)
	local have = false

	for k, v in pairs(self._allkKernelList) do
		if v.configId == kernelid then
			have = true

			break
		end
	end

	return have
end

function KernelList:getEquipSuiteDesc(kerneldata)
	local suitedesc = {}
	local suitemap = {}

	for k, v in pairs(kerneldata) do
		local suitekey = ConfigReader:getDataByNameIdAndKey("MasterCoreBase", v.configId, "Belong")
		local pos = ConfigReader:getDataByNameIdAndKey("MasterCoreBase", v.configId, "Position")
		local suitelist = ConfigReader:getDataByNameIdAndKey("MasterCoreSuite", suitekey, "IncludeCore")

		if suitemap[suitekey] == nil then
			suitemap[suitekey] = {}
		end

		for k, v in pairs(suitelist) do
			if k == pos then
				suitemap[suitekey][k] = 1
			end
		end
	end

	for k, v in pairs(suitemap) do
		local td = ConfigReader:getDataByNameIdAndKey("MasterCoreSuite", k, "ThreePieceDesc")
		local fd = ConfigReader:getDataByNameIdAndKey("MasterCoreSuite", k, "FivePieceEffect")

		if #v >= 3 then
			suitedesc.suite_3_info = ConfigReader:getDataByNameIdAndKey("Translate", td, "Zh_CN")
		elseif #v >= 5 then
			suitedesc.suite_5_info = ConfigReader:getDataByNameIdAndKey("Translate", fd, "Zh_CN")
		end
	end

	dump(suitemap, "suitemap")
	dump(suitedesc, "suitedesc")

	return suitedesc
end

function KernelList:findKernelOneKernelInt(serverid)
	local result = nil

	for k, v in pairs(self._intKernelList) do
		if serverid == v.serverkey then
			result = v

			break
		end
	end

	return result
end

function KernelList:getOneKernelByConfigId(configid)
	return ConfigReader:getRecordById("MasterCoreBase", configid)
end

function KernelList:getDescFactorTable(config, effectDesc)
	if not config or not effectDesc then
		return {}
	end

	local baseEvn = {
		effectDesc = config
	}
	effectDesc = string.split(effectDesc, "$")[2]
	local funcStr = string.gsub(effectDesc, "}", "")
	funcStr = string.split(funcStr, "|")[1]
	local funcStr = string.gsub(funcStr, "{", "effectDesc.")

	dump(funcStr, "funcStr_____1")
	dump(baseEvn, "baseEvn_____")

	funcStr = string.gsub(funcStr, ";", ",")
	funcStr = "return {" .. funcStr .. "}"

	dump(funcStr, "funcStr_____2")

	local factorMap = {}
	local condFn, errmsg = loadstring(funcStr)

	if condFn ~= nil then
		setfenv(condFn, baseEvn)

		factorMap = condFn()
	end

	return factorMap
end

function KernelList:getMainEffectDesc(kerneldata)
	local desinfo = self:getEffectDesc(kerneldata.mainEffectId, kerneldata.level)

	return desinfo
end

function KernelList:getSubEffectDesc(kerneldata)
	local subeffect = kerneldata.subEffects
	local result = {}
	local count = 1

	for k, v in pairs(subeffect) do
		if v.additionId then
			result[k] = self:getEffectDesc(v.additionId, v.level)
		end
	end

	return result
end

function KernelList:getEffectDesc(effectId, level)
	local effectConfig = ConfigReader:getRecordById("SkillAttrEffect", effectId)
	local effectDesc = effectConfig.EffectDesc
	local descValue = ConfigReader:getDataByNameIdAndKey("Translate", effectDesc, "Zh_CN")
	local factorMap = ConfigReader:getRecordById("SkillAttrEffect", effectId)
	local t = TextTemplate:new(descValue)
	local funcMap = {
		linear = function (value)
			if type(value) ~= "table" then
				return nil
			end

			return value[1] + (level - 1) * value[2]
		end,
		fixed = function (value)
			if type(value) ~= "table" then
				return nil
			end

			return value[1]
		end,
		custom = function (value)
			if type(value) ~= "table" then
				return nil
			end

			return value[level]
		end
	}

	return t:stringify(factorMap, funcMap)
end

function KernelList:sortKernelListByType(sortType)
	local function _sort(a, b)
		local a_level = tonumber(a.level)
		local b_level = tonumber(b.level)
	end

	table.sort(self._intKernelList, _sort)
end

function KernelList:getOneKernelEffect(kerneldata)
end

function KernelList:getNeedExpToNextLevel(configId, nextlevel)
	local needexp = ConfigReader:getDataByNameIdAndKey("MasterCoreExp", tostring(nextlevel), "NeedExp")
	local factor = ConfigReader:getDataByNameIdAndKey("MasterCoreBase", configId, "LevelUpFactor")

	return needexp * factor
end

function KernelList:getStrengthenLevel(eatexp)
	local level = 0

	for i = 1, #self._expConfig do
		local value = self._expConfig[i]

		if value.NeedExp <= eatexp then
			level = value.Id
		end
	end

	return level
end

function KernelList:sortListByType(list, sorttype)
	local sortMap = {}

	for k, v in pairs(SortType) do
		sortMap[k] = v
	end

	table.sort(list, function (a, b)
		local aInfo = self._intKernelList[a]
		local bInfo = self._intKernelList[b]

		if sorttype == SortType.level then
			return bInfo.level < aInfo.level
		elseif sorttype == SortType.quality then
			return bInfo.quality < aInfo.quality
		elseif sorttype == SortType.attack then
			return bInfo.attack < aInfo.attack
		elseif sorttype == SortType.defense then
			return bInfo.defense < aInfo.defense
		elseif sorttype == SortType.hp then
			return bInfo.hp < aInfo.hp
		elseif sorttype == SortType.crit then
			return bInfo.crit < aInfo.crit
		elseif sorttype == SortType.speed then
			return bInfo.speed < aInfo.speed
		elseif sorttype == SortType.attackUp then
			return bInfo.attackUp < aInfo.attackUp
		elseif sorttype == SortType.defenseUp then
			return bInfo.defenseUp < aInfo.defenseUp
		elseif sorttype == SortType.hpUp then
			return bInfo.hpUp < aInfo.hpUp
		elseif sorttype == SortType.critDamage then
			return bInfo.critDamage < aInfo.critDamage
		end
	end)
end
