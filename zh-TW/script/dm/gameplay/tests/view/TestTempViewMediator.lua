TestTempViewMediator = class("TestTempViewMediator", DmPopupViewMediator)

TestTempViewMediator:has("_developSystem", {
	is = "r"
}):injectWith("DevelopSystem")
TestTempViewMediator:has("_gameServerAgent", {
	is = "r"
}):injectWith("GameServerAgent")

local kBtnHandlers = {}

function TestTempViewMediator:initialize()
	super.initialize(self)
end

function TestTempViewMediator:dispose()
	super.dispose(self)
end

function TestTempViewMediator:onRegister()
	super.onRegister(self)
	self:mapButtonHandlersClick(kBtnHandlers)
	self:mapEventListeners()
end

function TestTempViewMediator:mapEventListeners()
end

function TestTempViewMediator:enterWithData(data)
	self:setupView()
end

function TestTempViewMediator:setupView()
	self._des = self:getChildView("Panel_base.Text_des")

	self._des:setString("这里可以随便做一些临时的功能测试，不上传git")
	self._des:setContentSize(cc.size(600, 400))
	self._des:setAnchorPoint(0.5, 1)

	local fileUtils = cc.FileUtils:getInstance()
	local savePath = fileUtils:getWritablePath() .. "/error.txt"

	if fileUtils:isFileExist(savePath) then
		local file = io.open(savePath, "r")

		if not file then
			self:dispatch(ShowTipEvent({
				tip = "未找到相应的数据",
				duration = 0.35
			}))

			return
		end

		local dataStr = file:read("*a")

		if dataStr then
			self._des:setString(dataStr)
		else
			self:dispatch(ShowTipEvent({
				tip = "读取文件失败",
				duration = 0.35
			}))
		end
	else
		self:dispatch(ShowTipEvent({
			tip = "文件不存在",
			duration = 0.35
		}))
	end
end
