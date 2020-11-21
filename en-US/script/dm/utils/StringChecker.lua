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

function StringChecker.initForbiiddenWords()
end

StringChecker.initForbiiddenWords()
