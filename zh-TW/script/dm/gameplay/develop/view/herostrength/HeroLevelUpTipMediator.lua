HeroLevelUpTipMediator = class("HeroLevelUpTipMediator", DmPopupViewMediator, _M)

HeroLevelUpTipMediator:has("_developSystem", {
	is = "r"
}):injectWith("DevelopSystem")

function HeroLevelUpTipMediator:initialize()
	super.initialize(self)
end

function HeroLevelUpTipMediator:dispose()
	super.dispose(self)
end

function HeroLevelUpTipMediator:onRegister()
	super.onRegister(self)
end

function HeroLevelUpTipMediator:mapEventListeners()
end

function HeroLevelUpTipMediator:onRemove()
	super.onRemove(self)
end

function HeroLevelUpTipMediator:enterWithData(data)
	AudioEngine:getInstance():playRoleEffect("Se_Effect_Levelup", false)

	self._heroSystem = self._developSystem:getHeroSystem()

	self:createUI(data)
end

function HeroLevelUpTipMediator:createUI(data)
	local hero = self._heroSystem:getHeroById(data.heroId)
	local level = hero:getLevel()
	self._touchLayer = self:getView():getChildByName("touchLayer")

	self._touchLayer:setVisible(false)

	self._mainpanel = self:getView():getChildByName("mainpanel")

	self._mainpanel:setLocalZOrder(2)

	local attrPanel = self._mainpanel:getChildByName("attrPanel")

	attrPanel:setOpacity(0)

	local levelPanel = self._mainpanel:getChildByName("levelPanel")

	levelPanel:setVisible(false)
	levelPanel:setOpacity(0)

	local anim = cc.MovieClip:create("huodetishi_huodetishi")

	anim:addTo(self._mainpanel:getChildByName("animNode")):offset(0, -15)
	anim:addCallbackAtFrame(39, function ()
		anim:stop()
	end)

	local cnText = anim:getChildByFullName("cnText")
	local enText = anim:getChildByFullName("enText")
	local title1 = cc.Label:createWithTTF(Strings:get("Heros_LvUp"), CUSTOM_TTF_FONT_1, 50)

	title1:enableOutline(cc.c4b(0, 0, 0, 255), 1)
	title1:addTo(cnText):offset(0, -3)

	local title2 = cc.Label:createWithTTF(Strings:get("UITitle_EN_Dengjitisheng"), TTF_FONT_FZYH_M, 18)

	title2:setColor(cc.c3b(150, 160, 255))
	title2:addTo(enText)
	anim:addCallbackAtFrame(14, function ()
		levelPanel:setVisible(true)
		levelPanel:fadeIn({
			time = 0.2
		})
		attrPanel:fadeIn({
			time = 0.2
		})
	end)

	local level1 = levelPanel:getChildByFullName("level_1")
	local level2 = levelPanel:getChildByFullName("level_2")

	level1:setString(data.level)
	level2:setString(level)
	attrPanel:getChildByFullName("des_4"):setVisible(false)
	attrPanel:setPositionX(637)
	attrPanel:getChildByFullName("des_1.text"):setString(data.attr.attack[1])
	attrPanel:getChildByFullName("des_2.text"):setString(data.attr.hp[1])
	attrPanel:getChildByFullName("des_3.text"):setString(data.attr.defense[1])

	local attack = hero:getAttack()
	local hp = hero:getHp()
	local defense = hero:getDefense()
	local addAtk = attack - data.attr.attack[1] > 0 and attack - data.attr.attack[1] or 0
	local addHp = hp - data.attr.hp[1] > 0 and hp - data.attr.hp[1] or 0
	local addDef = defense - data.attr.defense[1] > 0 and defense - data.attr.defense[1] or 0

	attrPanel:getChildByFullName("des_1.extandText"):setString("+" .. addAtk)
	attrPanel:getChildByFullName("des_2.extandText"):setString("+" .. addHp)
	attrPanel:getChildByFullName("des_3.extandText"):setString("+" .. addDef)
end

function HeroLevelUpTipMediator:onTouchMaskLayer()
	self:getEventDispatcher():dispatchEvent(Event:new(EVT_HEROLEVELUP_FINISH))
	AudioEngine:getInstance():playEffect("Se_Click_Close_2", false)
	self:close()
end
