local __FILE__ = select(1, ...) or ""
local __PACKAGE__ = string.gsub(__FILE__, "[^.]+$", "")

require(__PACKAGE__ .. "AutoStrategy")
require(__PACKAGE__ .. "RandomStrategy")
require(__PACKAGE__ .. "WeightedStrategy")
require(__PACKAGE__ .. "SequenceStrategy")
