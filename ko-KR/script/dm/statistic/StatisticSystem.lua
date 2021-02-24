require("dm.statistic.StatisticPointConfig")

StatisticSystem = StatisticSystem or {}
StatisticSystem.baseInfo = StatisticSystem.baseInfo or {}

function StatisticSystem:init()
	local deviceInfo = app.getDevice():getDeviceInfo()
	local baseVersion = app.pkgConfig and app.pkgConfig.packJobId
	local baseInfo = {
		game = app.pkgConfig and app.pkgConfig.game or "dm",
		baseVersion = baseVersion or "dev",
		platform = app.pkgConfig and app.pkgConfig.platform or "dev",
		os = deviceInfo.systemName .. " " .. deviceInfo.systemVersion,
		source = "none",
		dtype = deviceInfo.deviceName or "",
		did = PlatformHelper:getSdkDid() or "",
		rid = "",
		server = ""
	}

	self:addInfoValues(baseInfo)

	self._rid = ""
end

function StatisticSystem:addInfoValues(infoValues)
	if infoValues == nil then
		return
	end

	for key, value in pairs(infoValues) do
		self.baseInfo[key] = value
	end
end

function StatisticSystem:setRid(rid)
	self._rid = rid or ""
end

local function genSign(params)
	local appsecret = "ZRIXTOXVPRUBYP3FG5LYRBVHQJYYNF5DDMKDACHM4UOFKTAA"

	table.sort(params, function (a, b)
		return a.key < b.key
	end)

	local sign = ""
	local data = ""

	for index, param in ipairs(params) do
		sign = sign .. param.key .. param.value

		if index > 1 then
			data = data .. "&"
		end

		data = data .. param.key .. "=" .. param.value
	end

	sign = appsecret .. sign .. appsecret
	sign = crypto.md5(sign)
	data = data .. "&sign=" .. sign

	return sign, data
end

function StatisticSystem:send(content)
	if GameConfigs.closeClientStatistic then
		return
	end

	if content.type == "loginpoint" then
		local step = StatisticPointConfig[content.point] or ""

		print("StatisticSystem:send............." .. content.point .. "____" .. step)
	end

	if DmGame then
		if content.type == "loginpoint" then
			local developSystem = DmGame:getInstance()._injector:getInstance("DevelopSystem")

			developSystem:guideLog({
				guideId = tostring(content.point),
				step = tostring(StatisticPointConfig[content.point] or "")
			})
		end

		if content.type == "loginchoose" then
			local developSystem = DmGame:getInstance()._injector:getInstance("DevelopSystem")

			developSystem:guideLog({
				guideId = tostring(content.difficult),
				step = tostring(StatisticPointConfig[content.difficult] or "")
			})
		end
	end

	if content.type == "clickpoint" then
		return
	end

	local stageUrl = app.pkgConfig.stageUrl

	if stageUrl == nil then
		return
	end

	local url = stageUrl .. "/recv.php"
	content = content or {}
	local socket = require("socket")
	local ts = socket.gettime()

	for key, value in pairs(self.baseInfo) do
		content[key] = value
	end

	content.version = app:getAssetsManager():getCurrentVersion()

	if content.type == "loginflow" or content.type == "updateflow" or content.type == "guideflow" or content.type == "otherflow" then
		content.step = StatisticPointConfig[content.point]
	end

	if self._rid then
		content.rid = self._rid
	end

	content._type_ = content.type
	content._time_ = os.date("%Y-%m-%d %H:%M:%S", ts)
	content._date_ = os.date("%Y-%m-%d", ts)
	content.type = nil
	local cjson = require("cjson.safe")
	local xhr = cc.XMLHttpRequest:new()
	xhr.responseType = cc.XMLHTTPREQUEST_RESPONSE_STRING

	xhr:open("POST", url)
	xhr:registerScriptHandler(function ()
	end)

	local runMode = app.pkgConfig and app.pkgConfig.runMode
	local params = {
		[#params + 1] = {
			key = "game",
			value = self.baseInfo.game or "dm"
		},
		[#params + 1] = {
			key = "platform",
			value = self.baseInfo.platform or ""
		},
		[#params + 1] = {
			key = "mode",
			value = runMode or "dev"
		},
		[#params + 1] = {
			value = "197668",
			key = "appid"
		},
		[#params + 1] = {
			key = "timestamp",
			value = ts and math.floor(ts * 1000) or ""
		},
		[#params + 1] = {
			key = "data",
			value = cjson.encode(content) or ""
		}
	}
	local sign, data = genSign(params)

	xhr:send(data)
end

LogType = {
	kBCFail = "bcheckfail",
	kClient = "dmclient",
	kBError = "battleerror"
}

function StatisticSystem:record(type, content)
	if GameConfigs.closeClientStatistic then
		return
	end

	content = content or {}
	content.ts = math.floor(app.getTime())

	for key, value in pairs(self.baseInfo) do
		content[key] = value
	end

	content.version = app:getAssetsManager():getCurrentVersion()

	DpsLogger:info(type, "{}", content)
end

function StatisticSystem:uploadLogs(type)
	if GameConfigs.closeClientStatistic then
		return
	end

	if type == nil then
		return
	end

	local stageUrl = app.pkgConfig.stageUrl

	if stageUrl == nil then
		return
	end

	local url = stageUrl .. "/upload_file.php"
	local time = math.floor(app.getTime())
	local fileUtils = cc.FileUtils:getInstance()
	local logPath = fileUtils:getWritablePath() .. "log"
	local formatStr = logPath .. "/" .. type .. "%s.log"
	local oneDaySec = 86400

	for i = 1, 10 do
		local fileName = string.format(formatStr, os.date("%Y-%m-%d", os.time() - (i - 1) * oneDaySec))
		local fileData = fileUtils:getStringFromFile(fileName)

		if fileData and fileData ~= "" then
			fileUtils:removeFile(fileName)

			local xhr = cc.XMLHttpRequest:new()
			xhr.responseType = cc.XMLHTTPREQUEST_RESPONSE_STRING

			xhr:open("POST", url)
			xhr:registerScriptHandler(function ()
			end)

			local runMode = app.pkgConfig and app.pkgConfig.runMode
			local params = {
				[#params + 1] = {
					key = "game",
					value = self.baseInfo.game or "dm"
				},
				[#params + 1] = {
					key = "platform",
					value = self.baseInfo.platform or ""
				},
				[#params + 1] = {
					key = "mode",
					value = runMode or "dev"
				},
				[#params + 1] = {
					value = "197668",
					key = "appid"
				},
				[#params + 1] = {
					key = "timestamp",
					value = time or ""
				},
				[#params + 1] = {
					key = "type",
					value = type or ""
				},
				[#params + 1] = {
					key = "data",
					value = fileData or ""
				}
			}
			local sign, data = genSign(params)

			xhr:send(data)
		else
			break
		end
	end
end

function StatisticSystem:uploadBattleDump(logType, dumpData, callback)
	if GameConfigs.closeClientStatistic then
		return
	end

	local stageUrl = "http://111.231.218.203"
	local url = stageUrl .. "/upload_file.php"
	local fileData = dumpData

	if type(fileData) ~= "string" then
		local cjson = require("cjson.safe")
		fileData = cjson.encode(dumpData)
	end

	local xhr = cc.XMLHttpRequest:new()
	xhr.responseType = cc.XMLHTTPREQUEST_RESPONSE_STRING

	xhr:open("POST", url)
	xhr:registerScriptHandler(function ()
	end)

	local time = math.floor(app.getTime())
	local runMode = app.pkgConfig and app.pkgConfig.runMode
	local params = {
		[#params + 1] = {
			value = "or_battleDump",
			key = "game"
		},
		[#params + 1] = {
			key = "platform",
			value = (logType == LogType.kBCFail or logType == LogType.kBError) and self.baseInfo.platform or "BattleDump"
		},
		[#params + 1] = {
			key = "mode",
			value = runMode or "DEV"
		},
		[#params + 1] = {
			value = "197668",
			key = "appid"
		},
		[#params + 1] = {
			key = "timestamp",
			value = time or ""
		},
		[#params + 1] = {
			key = "type",
			value = logType or LogType.kBCFail
		},
		[#params + 1] = {
			key = "data",
			value = fileData or ""
		}
	}
	local sign, data = genSign(params)

	local function httpResponse()
		dump(xhr.response, "uploadBattleDump response")

		if callback then
			callback(xhr.response)
		end
	end

	xhr:registerScriptHandler(httpResponse)
	xhr:send(data)
end

function StatisticSystem:uploadProfilerLog(data)
	if GameConfigs.closeClientStatistic then
		return
	end

	local stageUrl = app.pkgConfig.stageUrl or "http://dc.dpstorm.com"

	if stageUrl == nil then
		return
	end

	local url = stageUrl .. "/upload_file.php"
	local fileData = data.fileData
	local logName = data.logName
	local xhr = cc.XMLHttpRequest:new()
	xhr.responseType = cc.XMLHTTPREQUEST_RESPONSE_STRING

	xhr:open("POST", url)
	xhr:registerScriptHandler(function ()
	end)

	local time = math.floor(app.getTime())
	local runMode = app.pkgConfig and app.pkgConfig.runMode
	local params = {
		[#params + 1] = {
			key = "game",
			value = self.baseInfo.game or "dm"
		},
		[#params + 1] = {
			key = "platform",
			value = self.baseInfo.platform or ""
		},
		[#params + 1] = {
			key = "mode",
			value = runMode or "dev"
		},
		[#params + 1] = {
			value = "197668",
			key = "appid"
		},
		[#params + 1] = {
			key = "timestamp",
			value = time or ""
		},
		[#params + 1] = {
			key = "type",
			value = "luaprofiler-" .. logName
		},
		[#params + 1] = {
			key = "data",
			value = fileData or ""
		}
	}
	local sign, data = genSign(params)

	xhr:send(data)
end
