require("dm.gameplay.develop.model.effect.AttrAddEffect")

RangeAttrAddEffect = class("RangeAttrAddEffect", AttrAddEffect, _M)

function RangeAttrAddEffect:_realCalculateEffect(target, multiFactor)
	local effectList = self._config.player:getEffectList()
	local effectEvn = self._config.effectEvn
	target = effectList:getAttrUnitByEvn(self._config.target, effectEvn)

	super._realCalculateEffect(self, target, multiFactor)
end
