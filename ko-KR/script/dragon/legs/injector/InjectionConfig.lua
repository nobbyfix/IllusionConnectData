local _G = _G
local class = _G.class
local assert = assert
local type = type

module("legs")

InjectionConfig = class("InjectionConfig", _G.DisposableObject, _M)

function InjectionConfig:initialize(result)
	super.initialize(self)
	self:setResult(result)
end

function InjectionConfig:dispose()
	if self._result ~= nil then
		self._result:dispose()

		self._result = nil
	end

	super.dispose(self)
end

function InjectionConfig:setResult(result)
	if self._result ~= nil then
		self._result:dispose()
	end

	self._result = result
end

function InjectionConfig:getResponse(injector)
	if self._result ~= nil then
		return self._result:getResponse(injector)
	else
		return nil
	end
end

function InjectionConfig:willRespond()
	return self._result ~= nil
end
