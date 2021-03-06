GameLanguageType = {
	CN = ""
}
GameDefaultLanguage = GameLanguageType.CN
GameSupportLanguage = {
	GameDefaultLanguage
}

local function isSupportLanguage(language)
	local isSupport = false

	for k, v in pairs(GameSupportLanguage) do
		if v == language and v ~= GameDefaultLanguage then
			isSupport = true

			break
		end
	end

	return isSupport
end

function getCurrentLanguage()
	cc.UserDefault:getInstance():setStringForKey("GAME_SETTING_LANGUAGE", "")

	return GameLanguageType.CN
end

local fps = cc.UserDefault:getInstance():getIntegerForKey("GAME_MAX_FPS", GAME_MAX_FPS)
GAME_MAX_FPS = fps or 30
local director = cc.Director:getInstance()

director:setAnimationInterval(1 / fps)

if GAME_SHOW_FPS or app.pkgConfig.showGameFPS == 1 then
	director:setDisplayStats(true)

	if director.getStatsPresenter then
		local stats = director:getStatsPresenter()
		local format = "GL verts:%6(VERTICES)\n" .. "GL calls:%6(DRAW_CALLS)\n" .. "Tex Memory: %.2(TEXTURE_MEMORY)\n" .. "%.1(FPS) / %.3(SPF)\n" .. "Scheduler: %.3(UPDATE_TIME)\n" .. "Spine: %.3(SPINE_UPDATE_TIME) / %(SPINE_UPDATED_COUNT)\n" .. "MovieClip: %.3(MC_UPDATE_TIME) / %(MC_UPDATED_COUNT)\n"

		stats:setDisplayFormat(format)
		stats:setInteger("SPINE_UPDATED_COUNT", 0)
		stats:setFloat("SPINE_UPDATE_TIME", 0)
		stats:setInteger("MC_UPDATED_COUNT", 0)
		stats:setFloat("MC_UPDATE_TIME", 0)
	end
else
	director:setDisplayStats(false)
end

cc.Image:setPVRImagesHavePremultipliedAlpha(true)
cc.Label:setDefaultTTFAAScale(2)
cc.SpriteFrameCache:getInstance():loadIndicesFromJsonFile("asset/ui/index.json")
cc.SpriteFrameCache:getInstance():loadIndicesFromJsonFile("asset/anim/index.json")
cc.MCLibrary:getInstance():loadIndicesFromJsonFile("asset/anim/mclib.index")
require("dm.statistic.StatisticSystem")

if cc.Application:getInstance():getTargetPlatform() ~= 2 then
	StatisticSystem:init()
end
