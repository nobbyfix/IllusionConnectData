local _G = _G
local class = _G.class
local assert = assert
local type = type
local unpack = unpack

module("legs")

MediatorMap = class("MediatorMap", _G.DisposableObject, _M)

function MediatorMap:initialize(viewEventDispatcher, injector)
	super.initialize(self)

	self._injector = injector
	self._viewNameToMediatorMap = {}
	self._registeredMediators = {}
	self._viewEventDispatcher = viewEventDispatcher

	self:retainObject(self._viewEventDispatcher)
	self._viewEventDispatcher:addEventListener(EVT_ENTER_VIEW, self, self._onEnterSomeView)
	self._viewEventDispatcher:addEventListener(EVT_EXIT_VIEW, self, self._onExitSomeView)
end

function MediatorMap:dispose()
	self._viewEventDispatcher:removeEventListener(EVT_ENTER_VIEW, self, self._onEnterSomeView)
	self._viewEventDispatcher:removeEventListener(EVT_EXIT_VIEW, self, self._onExitSomeView)
	super.dispose(self)
end

function MediatorMap:_onEnterSomeView(event)
	local view = event:getTargetView()

	if view == nil or view.getViewName == nil then
		return
	end

	local viewName = view:getViewName()
	local info = self._viewNameToMediatorMap[viewName]

	if info ~= nil and info.autoCreate then
		self:createMediator(view)
	end
end

function MediatorMap:_onExitSomeView(event)
	local view = event:getTargetView()

	if view == nil or view.getViewName == nil then
		return
	end

	local viewName = view:getViewName()
	local info = self._viewNameToMediatorMap[viewName]

	if info ~= nil and info.autoRemove then
		self:removeMediatorByView(view)
	end
end

function MediatorMap:createMediator(viewComponent)
	if viewComponent == nil or viewComponent.getViewName == nil then
		return nil
	end

	local viewName = viewComponent:getViewName()
	local info = self._viewNameToMediatorMap[viewName]

	if info ~= nil then
		local mediator = self._injector:instantiate(info.mediatorClazz)

		if mediator ~= nil then
			local scriptHandler = nil

			function scriptHandler(actionType)
				if actionType == "exit" then
					viewComponent:unregisterScriptHandler(scriptHandler)

					scriptHandler = nil

					self._viewEventDispatcher:dispatchEvent(LegsViewEvent:new(EVT_EXIT_VIEW, viewComponent))
				end
			end

			viewComponent:registerScriptHandler(scriptHandler)
			self:registerMediator(viewComponent, mediator)
		end

		return mediator
	end

	return nil
end

function MediatorMap:hasMapping(viewName)
	local info = self._viewNameToMediatorMap[viewName]

	return info ~= nil and info.mediatorClazz ~= nil
end

function MediatorMap:hasMediator(mediator)
	return self:hasMediatorForView(mediator:getView())
end

function MediatorMap:hasMediatorForView(viewComponent)
	if viewComponent == nil then
		return false
	end

	return self._registeredMediators[viewComponent] ~= nil
end

function MediatorMap:mapView(viewName, mediatorClazz, autoCreate, autoRemove)
	self._viewNameToMediatorMap[viewName] = {
		mediatorClazz = mediatorClazz,
		autoCreate = autoCreate == nil and true or autoCreate,
		autoRemove = autoRemove == nil and true or autoRemove
	}
end

function MediatorMap:unmapView(viewName)
	self._viewNameToMediatorMap[viewName] = nil
end

function MediatorMap:registerMediator(viewComponent, mediator)
	if viewComponent == nil or mediator == nil then
		return
	end

	if self._registeredMediators[viewComponent] ~= nil then
		if self._registeredMediators[viewComponent] == mediator then
			return
		end

		self:removeMediatorByView(viewComponent)
	end

	mediator:setView(viewComponent)

	viewComponent.mediator = mediator
	self._registeredMediators[viewComponent] = mediator

	mediator:onRegister()
end

function MediatorMap:removeMediator(mediator)
	self:removeMediatorByView(mediator:getView())
end

function MediatorMap:removeMediatorByView(viewComponent)
	if viewComponent == nil then
		return
	end

	local mediator = self._registeredMediators[viewComponent]

	if mediator ~= nil then
		self._registeredMediators[viewComponent] = nil
		viewComponent.mediator = nil

		mediator:onRemove()
		mediator:dispose()
	end
end

function MediatorMap:retrieveMediator(viewComponent)
	if viewComponent == nil then
		return nil
	end

	return self._registeredMediators[viewComponent]
end
