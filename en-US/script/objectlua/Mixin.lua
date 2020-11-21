local Object = require("objectlua.Object")
local _ = Object:subclass(...)

function _.class:new(...)
	local o = super(self, ...)
	o.__methods__ = {}
	local mt = o.class.__prototype__

	return o
end

return _
