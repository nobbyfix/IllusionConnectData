TimeUtil = TimeUtil or {}
local __bases = {
	d = 86400,
	H = 3600,
	y = 31536000,
	S = 1,
	M = 60
}
local __baseOrder = {
	"y",
	"d",
	"H",
	"M",
	"S"
}

function TimeUtil:formatTime(fmt, seconds)
	if fmt and seconds then
		local t = TextTemplate:new(fmt)
		local components = {}
		local firstPass = setmetatable({}, {
			__index = function (t, k)
				local c = k:sub(1, 1)

				if __bases[c] == nil then
					return nil
				end

				local m, n = k:find(c .. "*")

				if n == k:len() then
					components[c] = {
						key = k,
						n = n
					}
				end

				return nil
			end
		})

		t:stringify(firstPass)

		local value = {}

		for _, baseName in ipairs(__baseOrder) do
			local comp = components[baseName]

			if comp ~= nil then
				local base = __bases[baseName]
				local x = math.floor(seconds / base)
				seconds = seconds - x * base
				value[comp.key] = string.format("%02d", x)
			end
		end

		return t:stringify(value)
	end
end

function TimeUtil:parseTime(out, timeString)
	local output = out or {}
	local parts = string.split(timeString, "[:-]", nil, true)
	local n = #parts

	if n >= 3 then
		output.hour = tonumber(parts[1])
		output.min = tonumber(parts[2])
		output.sec = tonumber(parts[3])
	elseif n == 2 then
		output.hour = 0
		output.min = tonumber(parts[1])
		output.sec = tonumber(parts[2])
	else
		output.hour = 0
		output.min = 0
		output.sec = tonumber(parts[1])
	end

	return output
end

function TimeUtil:parseDate(out, dateString)
	local output = out or {}
	local parts = string.split(dateString, "[-/]", nil, true)
	local n = #parts

	if n >= 3 then
		output.year = tonumber(parts[1])
		output.month = tonumber(parts[2])
		output.day = tonumber(parts[3])
	else
		output.month = tonumber(parts[1])
		output.day = tonumber(parts[2])
	end

	return output
end

function TimeUtil:parseDateTime(out, dateTimeString)
	local parts = string.split(dateTimeString, "%s+", 2, true)
	out = self:parseDate(out, parts[1])

	return self:parseTime(out, parts[2])
end

function TimeUtil:isSameDay(stampA, stampB, baseTime)
	assert(stampA ~= nil, "error:stampA=nil")
	assert(stampB ~= nil, "error:stampB=nil")

	if baseTime then
		local resetSeconds = (baseTime.hour or 0) * 3600 + (baseTime.min or 0) * 60 + (baseTime.sec or 0)
		stampA = stampA - resetSeconds
		stampB = stampB - resetSeconds
	end

	local dateA = os.date("*t", stampA)
	local dateB = os.date("*t", stampB)

	return dateA.day == dateB.day and dateA.month == dateB.month and dateA.year == dateB.year
end

function TimeUtil:getTimeByDate(t)
	return os.time(t)
end

REMOTE_UTC = 8

function TimeUtil:calcLocalUTC()
	local now = os.time()
	local diffTime = os.difftime(now, os.time(os.date("!*t", now)))

	return diffTime / 3600
end

function TimeUtil:getTimeByDateForTargetTimeInToday(t)
	local localUTC = self:calcLocalUTC()
	local diffTime = (localUTC - REMOTE_UTC) * 3600
	local serverTimeMap = DmGame:getInstance()._injector:getInstance("GameServerAgent"):remoteTimestamp()
	local tb = os.date("*t", serverTimeMap)
	tb.hour = t.hour
	tb.min = t.min
	tb.sec = t.sec

	return os.time(tb) + diffTime
end

function TimeUtil:getTimeByDateForTargetTime(t)
	local localUTC = self:calcLocalUTC()
	local diffTime = (localUTC - REMOTE_UTC) * 3600
	local serverTimeMap = DmGame:getInstance()._injector:getInstance("GameServerAgent"):remoteTimestamp()
	local tb = os.date("*t", serverTimeMap)
	tb.year = t.year or tb.year
	tb.month = t.month or tb.month
	tb.day = t.day or tb.day
	tb.hour = t.hour or tb.hour
	tb.min = t.min or tb.min
	tb.sec = t.sec or tb.sec

	return os.time(tb) + diffTime
end

function TimeUtil:getWeekDayDistance()
	local localUTC = self:calcLocalUTC()
	local diffTime = (localUTC - REMOTE_UTC) * 3600
	local serverTimeMap = DmGame:getInstance()._injector:getInstance("GameServerAgent"):remoteTimestamp()
	local w = tonumber(os.date("%w", serverTimeMap))
	w = w == 0 and 7 or w + 1

	return 7 - w + 1
end

function TimeUtil:getHMSByTimestamp(time)
	local tb = os.date("*t", time)

	return {
		hour = tb.hour,
		min = tb.min,
		sec = tb.sec
	}
end

function TimeUtil:formatStrToTImestamp(str)
	local _, _, y, m, d, hour, min, sec = string.find(str, "(%d+)-(%d+)-(%d+)%s*(%d+):(%d+):(%d+)")
	local timestamp = os.time({
		year = y,
		month = m,
		day = d,
		hour = hour,
		min = min,
		sec = sec
	})

	return timestamp
end
