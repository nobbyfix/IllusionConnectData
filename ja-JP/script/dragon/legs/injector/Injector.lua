local _G = _G
local class = _G.class
local assert = assert
local type = type
local unpack = unpack
local __FILE__ = select(1, ...) or ""
local __PACKAGE__ = string.gsub(__FILE__, "[^.]+$", "")

require(__PACKAGE__ .. "ObjectLuaPatchesForInjector")
require(__PACKAGE__ .. "InjectionResult")
require(__PACKAGE__ .. "InjectionConfig")
module("legs")

local function GenRequestKey(clazz, named)
	local clazzName = nil

	if _G.type(clazz) == "string" then
		clazzName = clazz
	elseif clazz and clazz.name ~= nil then
		clazzName = clazz:name()
	else
		clazzName = ""
	end

	if not named then
		return clazzName
	else
		return clazzName .. "#" .. _G.tostring(named)
	end
end

Injector = class("Injector", _G.DisposableObject, _M)

function Injector:initialize(parentInjector)
	super.initialize(self)

	self._parentInjector = parentInjector
	self._mappings = {}
end

function Injector:dispose()
	for k, cfg in _G.pairs(self._mappings) do
		cfg:dispose()
	end

	self._mappings = {}

	super.dispose(self)
end

function Injector:createChild()
	return Injector:new(self)
end

function Injector:getInstance(clazz, named)
	local cfg = self:_findInjectionConfigForRequest(clazz, named, true)

	if cfg == nil then
		return nil
	end

	return cfg:getResponse(self)
end

function Injector:hasMapping(clazz, named)
	local cfg = self:_findInjectionConfigForRequest(clazz, named, true)

	return cfg ~= nil and cfg:willRespond()
end

function Injector:injectInto(target)
	if target.sysInject ~= nil then
		target:sysInject(self)
	end

	if target.userInject ~= nil then
		target:userInject(self)
	end

	return target
end

function Injector:instantiate(clazz, ...)
	local obj = self:_instantiate(clazz, ...)

	return obj and self:injectInto(obj)
end

function Injector:_instantiate(clazz, ...)
	if type(clazz) == "string" then
		local name = clazz
		local nameParts = _G.string.split(name, "%.", 2)
		local clazzOrPackage = _G[nameParts[1]]

		if clazzOrPackage == nil then
			-- Nothing
		end

		clazz = _G.objectlua.Object:find(name)

		assert(clazz ~= nil, "Can't find class by name '" .. name .. "'")
	end

	assert(clazz.new ~= nil, "Parameter clazz is invalid")

	return clazz:new(...)
end

function Injector:mapClass(whenAskedFor, instantiateClass, named)
	local cfg = self:_getOrCreateMyownConfigForRequest(whenAskedFor, named)

	assert(cfg ~= nil)
	cfg:setResult(InjectClassResult:new(instantiateClass))

	return cfg
end

function Injector:mapRule(whenAskedFor, useRule, named)
	local requestKey = GenRequestKey(whenAskedFor, named)

	if requestKey == nil then
		return nil
	end

	local oldRule = self._mappings[requestKey]

	if oldRule == useRule then
		return oldRule
	end

	if oldRule ~= nil then
		oldRule:dispose()
	end

	self._mappings[requestKey] = useRule

	return useRule
end

function Injector:mapSingleton(whenAskedFor, named)
	return self:mapSingletonOf(whenAskedFor, whenAskedFor, named)
end

function Injector:mapSingletonOf(whenAskedFor, useSingletonOf, named)
	local cfg = self:_getOrCreateMyownConfigForRequest(whenAskedFor, named)

	assert(cfg ~= nil)
	cfg:setResult(InjectSingletonResult:new(useSingletonOf))

	return cfg
end

function Injector:mapValue(whenAskedFor, useValue, named)
	local cfg = self:_getOrCreateMyownConfigForRequest(whenAskedFor, named)

	assert(cfg ~= nil)
	cfg:setResult(InjectValueResult:new(useValue))

	return cfg
end

function Injector:unmap(clazz, named)
	local requestKey = GenRequestKey(clazz, named)
	local cfg = self._mappings[requestKey]

	if cfg ~= nil then
		self._mappings[requestKey] = nil

		cfg:dispose()
	end
end

function Injector:_findInjectionConfigForRequest(clazz, named, searchParent)
	local requestKey = GenRequestKey(clazz, named)

	if requestKey == nil then
		return nil
	end

	return self:_findInjectionConfigByKey(requestKey, searchParent)
end

function Injector:_findInjectionConfigByKey(key, searchParent)
	local cfg = self._mappings[key]

	if cfg ~= nil then
		return cfg
	end

	if self._parentInjector ~= nil and searchParent then
		return self._parentInjector:_findInjectionConfigByKey(key, true)
	end

	return nil
end

function Injector:_getOrCreateMyownConfigForRequest(clazz, named)
	local requestKey = GenRequestKey(clazz, named)

	if requestKey == nil then
		return nil
	end

	local cfg = self._mappings[requestKey]

	if cfg == nil then
		cfg = InjectionConfig:new()
		self._mappings[requestKey] = cfg
	end

	return cfg
end
