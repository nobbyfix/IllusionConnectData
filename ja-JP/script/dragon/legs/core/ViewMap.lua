local _G = _G
local class = _G.class
local assert = assert
local type = type
local unpack = unpack
local event = _G.event

module("legs")

InjectViewResult = class("InjectViewResult", InjectionResult, _M)

function InjectViewResult:initialize(viewCreator)
	super.initialize(self)

	self._viewCreator = viewCreator
end

function InjectViewResult:getResponse(injector)
	if self._viewCreator == nil then
		return nil
	else
		local view = self._viewCreator(injector)

		if view ~= nil then
			injector:injectInto(view)
		end

		return view
	end
end

EVT_ENTER_VIEW = "legs.EVT_ENTER_VIEW"
EVT_EXIT_VIEW = "legs.EVT_EXIT_VIEW"
LegsViewEvent = class("LegsViewEvent", event.Event)

function LegsViewEvent:initialize(eventType, targetView)
	super.initialize(self, eventType)

	self._targetView = targetView
end

function LegsViewEvent:getTargetView()
	return self._targetView
end

ViewMap = class("ViewMap", _G.DisposableObject, _M)

function ViewMap:initialize(viewEventDispatcher, injector)
	super.initialize(self)

	self._injector = injector
	self._viewEventDispatcher = viewEventDispatcher
	self._viewFactory = nil
end

function ViewMap:getViewFactory()
	if self._viewFactory == nil and self._injector ~= nil then
		self._viewFactory = self._injector:getInstance("legs.ViewFactoryAdapter")
	end

	return self._viewFactory
end

function ViewMap:_wrappedCreator(name, creator)
	assert(creator ~= nil)

	return function ()
		local result = creator()

		if result ~= nil then
			function result:getViewName()
				return name
			end

			local scriptHandler = nil

			function scriptHandler(actionType)
				if actionType == "enter" then
					result:unregisterScriptHandler(scriptHandler)
					self._viewEventDispatcher:dispatchEvent(LegsViewEvent:new(EVT_ENTER_VIEW, result))
				end
			end

			result:registerScriptHandler(scriptHandler)
		end

		return result
	end
end

function ViewMap:mapViewToCreator(viewName, viewCreator)
	local injectResult = InjectViewResult:new(self:_wrappedCreator(viewName, viewCreator))

	self._injector:mapRule(viewName, InjectionConfig:new(injectResult))
end

function ViewMap:mapViewToClass(viewName, viewClazz)
	self:mapViewToCreator(viewName, function ()
		return viewClazz:new()
	end)
end

function ViewMap:mapViewToRes(viewName, resId)
	self:mapViewToCreator(viewName, function ()
		local viewFactory = self:getViewFactory()

		if viewFactory == nil then
			return nil
		end

		return viewFactory:createViewByResourceId(resId)
	end)
end

function ViewMap:unmapView(viewName)
	self._injector:unmap(viewName)
end

function ViewMap:hasView(viewName)
	return self._injector:hasMapping(viewName)
end
