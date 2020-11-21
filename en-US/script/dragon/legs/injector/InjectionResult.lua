local _G = _G
local class = _G.class
local assert = assert
local type = type

module("legs")

InjectionResult = class("InjectionResult", _G.DisposableObject, _M)

function InjectionResult:initialize()
	super.initialize(self)
end

function InjectionResult:getResponse(injector)
	assert(false, "override me!!")
end

InjectClassResult = class("InjectClassResult", InjectionResult, _M)

function InjectClassResult:initialize(responseType)
	super.initialize(self)

	self._responseType = responseType
end

function InjectClassResult:getResponse(injector)
	if self._responseType == nil then
		return nil
	else
		return injector:instantiate(self._responseType)
	end
end

InjectValueResult = class("InjectValueResult", InjectionResult, _M)

function InjectValueResult:initialize(object)
	super.initialize(self)

	self._value = object
	local objType = type(object)
	local shouldRetain = (objType == "userdata" or objType == "table") and object.retain ~= nil and object.release ~= nil

	if autoRetain then
		self:retainObject(object)
	end
end

function InjectValueResult:getResponse(injector)
	return self._value
end

InjectSingletonResult = class("InjectSingletonResult", InjectionResult, _M)

function InjectSingletonResult:initialize(responseType)
	super.initialize(self)

	self._responseType = responseType
end

function InjectSingletonResult:getResponse(injector)
	if self._responseInstance == nil and self._responseType ~= nil then
		local obj = injector:_instantiate(self._responseType)
		self._responseInstance = obj

		if obj ~= nil then
			injector:injectInto(obj)
		end
	end

	return self._responseInstance
end
