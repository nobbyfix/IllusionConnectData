StringChecker = StringChecker or {}
StringCheckResult = {
	AllOfCharForbidden = "AllOfCharForbidden",
	ForbiddenWords = "ForbiddenWords",
	Success = "Success"
}
local allOfCharForbidden = {
	"\n",
	" ",
	"\r",
	"\t"
}

function StringChecker.isAllofCharForbidden(str)
	if str == "" then
		return false
	end

	for _, v in pairs(allOfCharForbidden) do
		str = string.gsub(str, v, "")
	end

	if str == "" then
		return true
	end

	return false
end

function StringChecker.meaninglessString(str)
	if str == "" then
		return true
	end

	return StringChecker.isAllofCharForbidden(str)
end

local preForbiddenWords = {
	"*",
	"**",
	"***",
	"****",
	"*****",
	"******",
	"*******",
	"********",
	"*********",
	"**********"
}

function StringChecker.hasForbiddenWords(str, maskType)
	local maskWordSystem = DmGame:getInstance()._injector:getInstance(MaskWordSystem)
	StringChecker.forbiiddenWords = maskWordSystem:getMaskWord(maskType)
	local result = false
	local finalString = str
	local replacrStr = ConfigReader:requireDataByNameIdAndKey("ConfigValue", "Forbidden_Rep", "content")

	if StringChecker.forbiiddenWords then
		for k, v in pairs(StringChecker.forbiiddenWords) do
			if v.Name ~= "*" and v.Name ~= "" then
				local len = utf8.len(v.Name)

				local function getReplaceWords()
					if v.Type and v.Type == "1" then
						return replacrStr
					end

					if len > 10 then
						return preForbiddenWords[10]
					else
						return preForbiddenWords[len]
					end
				end

				local start, ended = string.find(finalString, v.Name, 1, true)

				while start do
					local str1 = ""
					local str2 = ""

					if start > 1 then
						str1 = string.sub(finalString, 1, start - 1)
					end

					if ended < string.len(finalString) then
						str2 = string.sub(finalString, ended + 1, string.len(finalString))
					end

					finalString = str1 .. getReplaceWords() .. str2
					start, ended = string.find(finalString, v.Name, 1, true)
					result = true
				end
			end
		end
	end

	return result, finalString
end

function StringChecker.checkString(str, maskType)
	if StringChecker.isAllofCharForbidden(str) then
		return StringCheckResult.AllOfCharForbidden, ""
	end

	local state, ret = StringChecker.hasForbiddenWords(str, maskType)

	if state then
		return StringCheckResult.ForbiddenWords, ret
	end

	return StringCheckResult.Success, str
end

function StringChecker.stringToChars(str)
	local list = {}
	local len = string.len(str)
	local i = 1

	while len >= i do
		local c = string.byte(str, i)
		local shift = 1

		if c > 0 and c <= 127 then
			shift = 1
		elseif c >= 192 and c <= 223 then
			shift = 2
		elseif c >= 224 and c <= 239 then
			shift = 3
		elseif c >= 240 and c <= 247 then
			shift = 4
		end

		local char = string.sub(str, i, i + shift - 1)
		i = i + shift

		table.insert(list, char)
	end

	return list, len
end

function StringChecker.isCJKCode(char)
	local len = string.len(char)
	local chInt = 0

	for i = 1, len do
		local n = string.byte(char, i)
		chInt = chInt * 256 + n
	end

	print("isCJKCode : " .. tostring(chInt))

	return chInt >= 14858880 and chInt <= 14860191 or chInt >= 14860208 and chInt <= 14910399 or chInt >= 14910592 and chInt <= 14911167 or chInt >= 14911360 and chInt <= 14989247 or chInt >= 14989440 and chInt <= 15318719 or chInt >= 15380608 and chInt <= 15572655 or chInt >= 15705216 and chInt <= 15707071 or chInt >= 15710384 and chInt <= 15710607
end

function StringChecker.isNumber(char)
	local len = string.len(char)
	local chInt = 0

	for i = 1, len do
		local n = string.byte(char, i)
		chInt = chInt * 256 + n
	end

	return chInt >= 48 and chInt <= 57
end

function StringChecker.isENChar(char)
	local len = string.len(char)
	local chInt = 0

	for i = 1, len do
		local n = string.byte(char, i)
		chInt = chInt * 256 + n
	end

	return chInt >= 97 and chInt <= 122 or chInt >= 65 and chInt <= 90
end

function StringChecker.isASCIIChar(char)
	local len = string.len(char)
	local chInt = 0

	for i = 1, len do
		local n = string.byte(char, i)
		chInt = chInt * 256 + n
	end

	return chInt <= 127
end

function StringChecker.isKorean(char)
	local len = string.len(char)
	local chInt = 0

	for i = 1, len do
		local n = string.byte(char, i)
		chInt = chInt * 256 + n
	end

	return chInt >= 14910592 and chInt <= 14911167 or chInt >= 15380608 and chInt <= 15572655
end

function StringChecker.checkKoreaName(str)
	local list, len = StringChecker.stringToChars(str)

	for i, v in ipairs(list) do
		if not StringChecker.isKorean(v) and not StringChecker.isNumber(v) then
			if not StringChecker.isENChar(v) then
				return false
			end
		end
	end

	return true
end

function StringChecker.checkKoreaStr(str)
	local list, len = StringChecker.stringToChars(str)

	for i, v in ipairs(list) do
		if not StringChecker.isKorean(v) and not StringChecker.isNumber(v) then
			if not StringChecker.isASCIIChar(v) then
				return false
			end
		end
	end

	return true
end

function StringChecker.initForbiiddenWords()
end

StringChecker.initForbiiddenWords()
