local __FILE__ = select(1, ...) or ""
local __PACKAGE__ = string.gsub(__FILE__, "[^.]+$", "")

require(__PACKAGE__ .. "BuffEffect")
require(__PACKAGE__ .. "effects.NumericEffect")
require(__PACKAGE__ .. "effects.SpecialNumericEffect")
require(__PACKAGE__ .. "effects.StatusEffect")
require(__PACKAGE__ .. "effects.ShieldEffect")
require(__PACKAGE__ .. "effects.ImmuneEffect")
require(__PACKAGE__ .. "effects.CurseEffect")
require(__PACKAGE__ .. "effects.MaxHpEffect")
require(__PACKAGE__ .. "effects.DeathImmuneEffect")
require(__PACKAGE__ .. "effects.ImmuneBuffEffect")
require(__PACKAGE__ .. "effects.ProvokeEffect")
require(__PACKAGE__ .. "effects.EnergyEffect")
require(__PACKAGE__ .. "effects.RageGainEffect")
require(__PACKAGE__ .. "effects.HolyHideEffect")
require(__PACKAGE__ .. "effects.LimitHpEffect")
require(__PACKAGE__ .. "effects.DamageTransferEffect")
require(__PACKAGE__ .. "effects.PassiveFunEffect")
require(__PACKAGE__ .. "BuffObject")
require(__PACKAGE__ .. "BuffGroup")
require(__PACKAGE__ .. "BuffTargetAgent")
require(__PACKAGE__ .. "TriggerBuff")
