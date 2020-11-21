local _G = _G
local class = _G.class
local assert = assert
local type = type
local unpack = unpack

module("legs")

ViewFactoryAdapter = class("ViewFactoryAdapter", _G.objectlua.Object, _M)

function ViewFactoryAdapter:createViewByResourceId(resId)
	assert(false, "Implement me!")
end
