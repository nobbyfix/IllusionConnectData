require("objectlua.bootstrap")

local _G = _G
local interfaces = {}

module(...)

local function register(self, name)
	_G.assert(_G.type(name) == "string")

	interfaces[name] = self

	_G.rawset(self, "_M", self)
	_G.rawset(self, "_NAME", name)
	_G.rawset(self, "_PACKAGE", name:gsub("[^\\/%.]+$", ""))
	_G.rawset(self:package(), self:shortName(), self)
end

local function all(self)
	local t = {}

	for k, v in _G.pairs(interfaces) do
		t[k] = v
	end

	return t
end

local function find(self, name)
	return interfaces[name]
end

local function new(self, interfaceName, superInterface)
	local instance = self:basicNew()

	if superInterface ~= nil then
		_G.rawset(instance, "superinterf", superInterface)
	end

	_G.rawset(instance, "__prototype__", {})

	if _G.type(interfaceName) == "string" then
		_G.assert(find(self, interfaceName) == nil, _G.string.format("Interface redefinition. Interface named '%s' already exists.", _G.tostring(interfaceName)))
		register(instance, interfaceName)
	end

	return instance
end

class.new = new
class.all = all
class.find = find

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

function _env:inheritsFrom(interface)
	if self == nil or interface == nil then
		return nil
	end

	local rawget = _G.rawget
	local interf = self

	while interf ~= nil do
		interf = rawget(interf, "superinterf")

		if interf == interface then
			return true
		end
	end

	return false
end

function _env:unregister()
	if not self._NAME then
		return
	end

	_G.rawset(self:package(), self:shortName(), nil)

	if _G.package.loaded[self._NAME] == self then
		_G.package.loaded[self._NAME] = nil
	end

	interfaces[self._NAME] = nil
end

function _env:hasMethod(name)
	return self.__prototype__[name] ~= nil or self.superinterf ~= nil and self.superinterf:hasMethod(name)
end

function _env:allMethods()
	local methods = {}
	local rawget = _G.rawget
	local interf = self

	while interf ~= nil do
		for k, v in _G.pairs(interf.__prototype__) do
			if methods[k] == nil then
				methods[k] = v
			end
		end

		interf = rawget(interf, "superinterf")
	end

	return methods
end

function _env:isImplementedBy(instance)
	for k, v in _G.pairs(self.__prototype__) do
		if _G.type(instance[k]) ~= "function" then
			return false, k
		end
	end

	if self.superinterf == nil then
		return true
	end

	return self.superinterf:isImplementedBy(instance)
end
