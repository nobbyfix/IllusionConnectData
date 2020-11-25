local __FILE__ = select(1, ...) or ""
local __PACKAGE__ = string.gsub(__FILE__, "[^.]+$", "")

require(__PACKAGE__ .. "Heap")
require(__PACKAGE__ .. "Queue")
require(__PACKAGE__ .. "Set")
