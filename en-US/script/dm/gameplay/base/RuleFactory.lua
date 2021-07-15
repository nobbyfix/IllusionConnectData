RuleFactory = RuleFactory or {}

function RuleFactory:showRules(outSelf, rule, introduceKey)
	local count = ConfigReader:getDataByNameIdAndKey("PicGuide", introduceKey, "ChangeInfo")
	local curCount = self:getCount(outSelf, introduceKey)

	if curCount < count then
		local view = outSelf:getInjector():getInstance("GameIntroduceView")

		outSelf:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
			transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
		}, {
			key = introduceKey
		}))
	else
		local Rule = ConfigReader:getDataByNameIdAndKey("ConfigValue", "Dream_Challenge_Rule", "content")
		local view = outSelf:getInjector():getInstance("ExplorePointRule")

		outSelf:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
			transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
		}, rule))
	end

	self:saveIntroduceAmount(outSelf, introduceKey)
end

function RuleFactory:getCount(outself, key)
	local cjson = require("cjson.safe")
	local customDataSystem = outself:getInjector():getInstance(CustomDataSystem)
	local data = cjson.decode(customDataSystem:getValue(PrefixType.kGlobal, "GameIntroduce", "{}"))

	if data[key] == nil then
		return 0
	end

	return data[key]
end

function RuleFactory:saveIntroduceAmount(outSelf, introduceKey)
	local cjson = require("cjson.safe")
	local customDataSystem = outSelf:getInjector():getInstance(CustomDataSystem)
	local data = cjson.decode(customDataSystem:getValue(PrefixType.kGlobal, "GameIntroduce", "{}"))

	if data[introduceKey] == nil then
		data[introduceKey] = 0
	end

	data[introduceKey] = data[introduceKey] + 1
	local dataStr = cjson.encode(data)

	customDataSystem:setValue(PrefixType.kGlobal, "GameIntroduce", dataStr)
end
