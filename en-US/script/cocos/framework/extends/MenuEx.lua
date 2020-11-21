local Menu = cc.Menu
local MenuItem = cc.MenuItem

function MenuItem:onClicked(callback)
	self:registerScriptTapHandler(callback)

	return self
end
