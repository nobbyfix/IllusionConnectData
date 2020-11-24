require("objectlua.bootstrap")

local Object = objectlua.Object
local Interface = objectlua.Interface
local _G = _G
local classes = {}

module(...)

local function register(self, name)
	_G.assert(_G.type(name) == "string")

	classes[name] = self

	_G.rawset(self, "_M", self)
	_G.rawset(self, "_NAME", name)
	_G.rawset(self, "_PACKAGE", name:gsub("[^.]+$", ""))
	_G.rawset(self:package(), self:shortName(), self)
end

local function checkUncompletedInterface(instance)
	local rawget = _G.rawget
	local ipairs = _G.ipairs
	local class = instance.class

	while class ~= nil and class ~= Object do
		local __interfaces__ = rawget(class, "__interfaces__")

		if __interfaces__ then
			for _, interf in ipairs(__interfaces__) do
				local completed, methodName = interf:isImplementedBy(instance)

				if not completed then
					return interf, methodName
				end
			end
		end

		class = class.superclass
	end

	return nil
end

local function inheritsFromInterface(self, interface)
	local rawget = _G.rawget
	local ipairs = _G.ipairs
	local class = self

	while class ~= nil and class ~= Object do
		local __interfaces__ = rawget(class, "__interfaces__")

		if __interfaces__ then
			for _, interf in ipairs(__interfaces__) do
				if interf == interface or interf:inheritsFrom(interface) then
					return true
				end
			end
		end

		class = class.superclass
	end

	return false
end

local function inheritsFromClass(self, class)
	local cls = self and self.superclass

	while cls ~= nil and cls ~= Object do
		if cls == class then
			return true
		end

		cls = cls.superclass
	end

	return cls == class
end

function _env:new(...)
	local instance = self:basicNew()

	if _G.objectlua.enableInterfaceChecking then
		local interface, methodName = checkUncompletedInterface(instance)

		if interface ~= nil then
			_G.error(_G.string.format("Class '%s' implements '%s' but `%s()` method is not implemented.", _G.tostring(self:name()), _G.tostring(interface:name()), methodName))
		end
	end

	instance:initialize(...)

	return instance
end

function _env:subclass(className)
	local metaclass = _M:new()

	metaclass:setSuperclass(self.class)
	metaclass:setAsMetaclass()

	local class = metaclass:new()

	class:setSuperclass(self)

	if _G.type(className) == "string" then
		_G.assert(self:find(className) == nil, _G.string.format("Class redefinition. Class named '%s' already exists.", _G.tostring(className)))
		register(class, className)
		register(metaclass, className .. " Metaclass")
	end

	return class
end

function _env:isMeta()
	return self.class == _M
end

function _env:name()
	return self._NAME
end

function _env:shortName()
	return self._NAME:gsub(self._PACKAGE, "")
end

function _env:package()
	local name = self:name()
	local package = _G

	for packageName in name:gmatch("([^%.]*)%.") do
		if package[packageName] == nil then
			_G.rawset(package, packageName, {})
		end

		package = package[packageName]
	end

	return package
end

function _env:implements(interface, ...)
	local select = _G.select
	local assert = _G.assert
	local n = select("#", ...)
	local interfaces = {
		interface,
		...
	}
	local __interfaces__ = _G.rawget(self, "__interfaces__")

	if __interfaces__ == nil then
		__interfaces__ = {}

		_G.rawset(self, "__interfaces__", __interfaces__)
	end

	for i = 1, n + 1 do
		local interface = interfaces[i]

		assert(interface ~= nil, "tring to implements `nil` interface")
		assert(interface.class == Interface, "tring to implements non-interface")

		__interfaces__[#__interfaces__ + 1] = interface
	end

	return self
end

function _env:inheritsFrom(class)
	if self == nil or Object == self then
		return false
	end

	if class.class == Interface then
		return inheritsFromInterface(self, class)
	else
		return inheritsFromClass(self, class)
	end
end

local defaultOptions = {
	is = "rw"
}

function _env:has(symbol, options)
	options = options or defaultOptions
	options.is = options.is or defaultOptions.is
	local functionName = symbol:match("[^%w]*(.*)")
	local capitalized = functionName:sub(1, 1):upper() .. functionName:sub(2)
	local geterSymbol = nil
	local isBoolean = options.is:find("b")

	if isBoolean then
		geterSymbol = functionName
	else
		geterSymbol = "get" .. capitalized
	end

	local seterSymbol = "set" .. capitalized

	_G.assert(_G.rawget(self.__prototype__, geterSymbol) == nil)
	_G.assert(_G.rawget(self.__prototype__, seterSymbol) == nil)

	local geterFunction, seterFunction = nil

	if options.is:find("r") then
		local default = options.default

		if default ~= nil then
			function geterFunction(self)
				local v = self[symbol]

				if v ~= nil then
					return v
				end

				return default
			end
		else
			function geterFunction(self)
				return self[symbol]
			end
		end

		_G.rawset(self.__prototype__, geterSymbol, geterFunction)
	end

	if options.is:find("w") then
		function seterFunction(self, value)
			self[symbol] = value
		end

		_G.rawset(self.__prototype__, seterSymbol, seterFunction)
	end

	return {
		class = self,
		memberSymbol = symbol,
		geterSymbol = geterFunction and geterSymbol or nil,
		seterSymbol = seterFunction and seterSymbol or nil
	}
end

function all()
	local t = {}

	for k, v in _G.pairs(classes) do
		t[k] = v
	end

	return t
end

function _env:find(name)
	return classes[name]
end

function _env:unregister()
	if not self._NAME then
		return
	end

	_G.rawset(self:package(), self:shortName(), nil)

	if _G.package.loaded[self._NAME] == self then
		_G.package.loaded[self._NAME] = nil
	end

	classes[self._NAME] = nil
end

function reset()
	for name, class in _G.pairs(classes) do
		if class:package() ~= _G.objectlua then
			class:unregister()
		end
	end

	local interfaces = Interface:all()

	for name, interface in _G.pairs(interfaces) do
		interface:unregister()
	end

	classes = {}

	register(Object, "objectlua.Object")
	register(_G.objectlua["Object Metaclass"], "objectlua.Object Metaclass")
	register(_M, "objectlua.Class")
	register(_G.objectlua["Class Metaclass"], "objectlua.Class Metaclass")
	register(Interface, "objectlua.Interface")
	register(_G.objectlua["Interface Metaclass"], "objectlua.Interface Metaclass")
end

_M.reset()
