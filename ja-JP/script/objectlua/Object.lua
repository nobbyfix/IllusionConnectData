require("objectlua.bootstrap")
require("objectlua.Class")

local _G = _G

module(...)

function _env:initialize()
end

function _env:isKindOf(class)
	return self.class == class or self.class:inheritsFrom(class)
end

function _env:clone(object)
	local clone = self.class:basicNew()

	for k, v in _G.pairs(self) do
		clone[k] = v
	end

	return clone
end

function _env:className()
	return self.class:name()
end

function _env:subclassResponsibility()
	_G.error("Error: subclass responsibility.")
end
