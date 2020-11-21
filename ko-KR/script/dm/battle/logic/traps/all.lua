local __FILE__ = select(1, ...) or ""
local __PACKAGE__ = string.gsub(__FILE__, "[^.]+$", "")

require(__PACKAGE__ .. "TrapEffect")
require(__PACKAGE__ .. "traps.BuffTrap")
require(__PACKAGE__ .. "traps.LockCellTrap")
require(__PACKAGE__ .. "TrapObject")
require(__PACKAGE__ .. "CellAgent")
