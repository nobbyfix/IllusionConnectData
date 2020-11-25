ASSET_LANG_COMMON = "asset/lang_common/"
ASSET_LANG_SKILL_WORD = "asset/lang_skillWord/"
CUSTOM_TTF_FONT_1 = "asset/font/CustomFont_1.ttf"
CUSTOM_TTF_FONT_2 = "asset/font/CustomFont_2.ttf"
TTF_FONT_FZYH_R = "asset/font/CustomFont_FZYH_R.TTF"
TTF_FONT_FZYH_M = "asset/font/CustomFont_FZYH_M.TTF"
TTF_FONT_FZY3JW = "asset/font/CustomFont_FZY3JW.TTF"
TTF_FONT_STORY = "asset/font/CustomFont_FZYH_M.TTF"
DEFAULT_TTF_FONT_PATH = "asset/font/"
MULITP_LANG_2_FONT = {
	en = {
		["CustomFont_FZYH_M.TTF"] = "asset/lang_font_en/CustomFont_FZYH_M.ttf",
		["CustomFont_1.ttf"] = "asset/lang_font_en/CustomFont_1.ttf",
		["CustomFont_FZYH_R.TTF"] = "asset/lang_font_en/CustomFont_FZYH_M.ttf"
	}
}

function ORGetFont(lang, fontName)
	fontName = string.match(fontName, ".+/([^/]*%.%w+)$")

	if not lang or not MULITP_LANG_2_FONT[lang] then
		return DEFAULT_TTF_FONT_PATH .. fontName
	end

	local toFontName = MULITP_LANG_2_FONT[lang][fontName]

	if not toFontName then
		return DEFAULT_TTF_FONT_PATH .. fontName
	end

	return toFontName
end
