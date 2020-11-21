GameLanguageType = {
	TH = "th",
	DE = "de",
	PT = "pt",
	ES = "es",
	FR = "fr",
	CN = "cn",
	EN = "en"
}
GameLanguageTypeForGmPlatform = {
	[GameLanguageType.CN] = "zh-cn",
	[GameLanguageType.EN] = "en",
	[GameLanguageType.FR] = "fr",
	[GameLanguageType.DE] = "de",
	[GameLanguageType.PT] = "pt",
	[GameLanguageType.ES] = "es",
	[GameLanguageType.TH] = "th"
}
GameLanguageTypeForShowText = {
	[GameLanguageType.CN] = "简体中文",
	[GameLanguageType.EN] = "English",
	[GameLanguageType.FR] = "French",
	[GameLanguageType.DE] = "German",
	[GameLanguageType.PT] = "Portuguese",
	[GameLanguageType.ES] = "Spanish",
	[GameLanguageType.TH] = "Thai"
}
GameLanguageTypeForSdk = {
	[GameLanguageType.CN] = "zh-Hans",
	[GameLanguageType.EN] = "en",
	[GameLanguageType.FR] = "fr",
	[GameLanguageType.DE] = "de",
	[GameLanguageType.PT] = "pt",
	[GameLanguageType.ES] = "es",
	[GameLanguageType.TH] = "th"
}
GameLanguageTypeForSdkAndroid = {
	[GameLanguageType.CN] = "zh-CN",
	[GameLanguageType.EN] = "en-US",
	[GameLanguageType.FR] = "fr-FR",
	[GameLanguageType.DE] = "de-DE",
	[GameLanguageType.PT] = "pt-PT",
	[GameLanguageType.ES] = "es-ES",
	[GameLanguageType.TH] = "th-TH"
}
GameLanguageTypeForTransLate = {
	[GameLanguageType.CN] = "Zh_CN",
	[GameLanguageType.EN] = "En_EU",
	[GameLanguageType.FR] = "fr_FR",
	[GameLanguageType.DE] = "de_DE",
	[GameLanguageType.PT] = "pt_PT",
	[GameLanguageType.ES] = "es_ES",
	[GameLanguageType.TH] = "th_TH"
}
GameDefaultLanguage = GameLanguageType.CN
GameDefaultSetLanguage = GameLanguageType.EN
GameSupportLanguage = {
	GameLanguageType.EN,
	GameLanguageType.CN,
	GameLanguageType.FR,
	GameLanguageType.DE,
	GameLanguageType.TH,
	GameLanguageType.ES,
	GameLanguageType.PT
}

local function isSupportLanguage(language)
	local isSupport = false

	for k, v in pairs(GameSupportLanguage) do
		if v == language then
			isSupport = true

			break
		end
	end

	return isSupport
end

function initCurrentLanguage()
	local lang = cc.UserDefault:getInstance():getStringForKey("GAME_LOCAL_SETTING_LANGUAGE")

	if lang == nil or lang == "" or not isSupportLanguage(lang) then
		lang = device.language

		if not isSupportLanguage(lang) then
			lang = GameDefaultSetLanguage
		end
	end

	setCurrentLanguage(lang)
end

function getCurrentLanguage()
	local lang = cc.UserDefault:getInstance():getStringForKey("GAME_LOCAL_SETTING_LANGUAGE")

	return lang
end

function getCurrentLanguageForRes()
	local lang = cc.UserDefault:getInstance():getStringForKey("GAME_SETTING_LANGUAGE")

	return lang
end

function setCurrentLanguage(lang)
	cc.UserDefault:getInstance():setStringForKey("GAME_LOCAL_SETTING_LANGUAGE", lang)
	cc.UserDefault:getInstance():setStringForKey("GAME_SETTING_LANGUAGE", lang)

	if lang == GameDefaultLanguage then
		cc.UserDefault:getInstance():setStringForKey("GAME_SETTING_LANGUAGE", "")
	end
end

initCurrentLanguage()
