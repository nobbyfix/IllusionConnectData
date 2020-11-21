ArenaRuleMediator = class("ArenaRuleMediator", DmPopupViewMediator, _M)

ArenaRuleMediator:has("_arenaSystem", {
	is = "r"
}):injectWith("ArenaSystem")

local Arena_RuleTranslate = ConfigReader:getDataByNameIdAndKey("ConfigValue", "Arena_RuleTranslate", "content")

function ArenaRuleMediator:initialize()
	super.initialize(self)
end

function ArenaRuleMediator:dispose()
	super.dispose(self)
end

function ArenaRuleMediator:onRegister()
	super.onRegister(self)
end

function ArenaRuleMediator:enterWithData(data)
	data = data or {}
	self._data = data

	self:initWidgetInfo(data)
	self:initContent(data)
end

function ArenaRuleMediator:initWidgetInfo(data)
	local title1 = data.title1 or Strings:get("Arena_UI35")
	local title2 = data.title2 or Strings:get("UITitle_EN_Guizeshuoming")
	self._bgWidget = bindWidget(self, "bg.bgNode", PopupNormalWidget, {
		btnHandler = {
			clickAudio = "Se_Click_Close_2",
			func = bind1(self.onClickClose, self)
		},
		title = title1,
		title1 = title2
	})
	self._mainPanel = self:getView():getChildByFullName("bg")
	self._listView = self._mainPanel:getChildByName("listview")
end

function ArenaRuleMediator:initContent(data)
	self._listView:setScrollBarEnabled(false)

	local rule = data and data.rule or Arena_RuleTranslate

	if data and data.useParam then
		for i = 1, #rule do
			self:addContent(Strings:get(rule[i], {
				param1 = data.param1,
				param2 = data.param2
			}), i)
		end
	else
		for i = 1, #rule do
			if i == 1 then
				self:addContent(Strings:get(rule[i], {
					topic = self._data.topic
				}), i)
			elseif i == 2 then
				self:addContent(Strings:get(rule[i], {
					starttime = self._data.starttime,
					endtime = self._data.endtime
				}), i)
			elseif i == 3 then
				self:addContent(Strings:get(rule[i], {
					buff = self._data.buff
				}), i)
			elseif i == 4 then
				self:addContent(Strings:get(rule[i], {
					level = self._data.level
				}), i)
			else
				self:addContent(Strings:get(rule[i]), i)
			end
		end
	end
end

function ArenaRuleMediator:addContent(content, index)
	local contextPanel = self._mainPanel:getChildByName("context_panal")

	contextPanel:setVisible(false)

	local panel = contextPanel:clone()

	panel:setVisible(true)

	local context = panel:getChildByName("context")

	context:setTextAreaSize(cc.size(panel:getContentSize().width, 0))
	context:setString(content)

	local size = context:getContentSize()

	if index == 1 then
		panel:setContentSize(cc.size(size.width, size.height + 15))
	else
		panel:setContentSize(cc.size(size.width, size.height + 10))
	end

	self._listView:pushBackCustomItem(panel)
end

function ArenaRuleMediator:onClickClose()
	self:close()
end
