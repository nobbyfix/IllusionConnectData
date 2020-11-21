local cc = _G.cc or {}
local MaskBeginNode = cc.MaskBeginNode

if MaskBeginNode and MaskBeginNode.STENCIL ~= nil then
	local rawCreate = MaskBeginNode.__rawCreate or MaskBeginNode.create

	function MaskBeginNode:create(arg1, arg2)
		if type(arg1) == "userdata" then
			return rawCreate(self, MaskBeginNode.STENCIL, arg1)
		end

		return rawCreate(self, arg1, arg2)
	end
end
