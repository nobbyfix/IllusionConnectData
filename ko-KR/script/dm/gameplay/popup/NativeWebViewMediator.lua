NativeWebViewMediator = class("NativeWebViewMediator", DmPopupViewMediator, _M)
local kBtnHandlers = {
	["main.btn_close"] = {
		clickAudio = "Se_Click_Close_2",
		func = "onClickBack"
	}
}

function NativeWebViewMediator:initialize()
	super.initialize(self)
end

function NativeWebViewMediator:dispose()
	if self._myWebView then
		self._myWebView:removeFromParent()

		self._myWebView = nil
	end

	super.dispose(self)
end

function NativeWebViewMediator:onRegister()
	super.onRegister(self)
	self:mapButtonHandlersClick(kBtnHandlers)
	self:mapEventListeners()
end

function NativeWebViewMediator:initWidgetInfo()
	self._main = self:getView():getChildByFullName("main")
	self._webView = self._main:getChildByFullName("webView")
	self._btn_close = self._main:getChildByFullName("btn_close")
end

function NativeWebViewMediator:mapEventListeners()
	local outSelf = self

	local function onKeyReleased(keyCode, event)
		if keyCode == cc.KeyCode.KEY_BACK then
			outSelf:onClickBack()
		end
	end

	local listener = cc.EventListenerKeyboard:create()

	listener:registerScriptHandler(onKeyReleased, cc.Handler.EVENT_KEYBOARD_RELEASED)
	cc.Director:getInstance():getEventDispatcher():addEventListenerWithSceneGraphPriority(listener, self:getView())
end

function NativeWebViewMediator:enterWithData(data)
	self:initData(data)
	self:initWidgetInfo()
	self:initView()
end

function NativeWebViewMediator:initData(data)
	self._data = data
	self._url = data and data.url or "https://www.baidu.com"
end

function NativeWebViewMediator:initView()
	local webViewSize = self._webView:getContentSize()
	local myplatform = device.platform

	if myplatform ~= "mac" then
		self._myWebView = ccui.WebView:create()

		if self._myWebView then
			self._myWebView:setPosition(webViewSize.width / 2, webViewSize.height / 2)
			self._myWebView:setContentSize(webViewSize.width, webViewSize.height)
			self._myWebView:setScalesPageToFit(true)
			self._myWebView:loadURL(self._url)
			self._myWebView:setOpacity(0)
			self._myWebView:reload()
			AdjustUtils.adjustLayoutByType(self:getView(), AdjustUtils.kAdjustType.Top)
			self._webView:addChild(self._myWebView)
		end
	else
		cc.Application:getInstance():openURL(self._url)
	end
end

function NativeWebViewMediator:onClickBack()
	self:close()
end
