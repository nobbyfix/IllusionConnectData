local __FILE__ = select(1, ...) or ""
local __PACKAGE__ = string.gsub(__FILE__, "[^.]+$", "")

require(__PACKAGE__ .. "BattleInputManager")
require(__PACKAGE__ .. "BattlePlayerController")
require(__PACKAGE__ .. "BattleSimulator")
