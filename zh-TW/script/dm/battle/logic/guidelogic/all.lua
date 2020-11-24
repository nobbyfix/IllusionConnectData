local __FILE__ = select(1, ...) or ""
local __PACKAGE__ = string.gsub(__FILE__, "[^.]+$", "")

require(__PACKAGE__ .. "GuideBattleLogic")
require(__PACKAGE__ .. "GuideBattleBuilder")
require(__PACKAGE__ .. "CommonGuideBattleBuilder")
