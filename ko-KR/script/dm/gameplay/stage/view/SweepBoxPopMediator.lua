SweepBoxPopMediator = class("SweepBoxPopMediator", DmPopupViewMediator, _M)
local btnHandlers = {}

function SweepBoxPopMediator:initialize()
	super.initialize(self)
end

function SweepBoxPopMediator:dispose()
	super.dispose(self)
end

function SweepBoxPopMediator:onRegister()
	super:onRegister(self)

	self._return = 0

	self:mapButtonHandlersClick(btnHandlers)
	self:bindWidget("sweepBox", PopupNormalWidget, {
		bg = "paihangbang_bg_di_4.png",
		btnHandler = {
			clickAudio = "Se_Click_Close_1",
			func = bind1(self.onClickClose, self)
		},
		title = Strings:get("Stage_Sweep_BoxTitle"),
		title1 = Strings:get("UITitle_EN_Xuanzezhandoumoshi")
	})
	self:bindWidget("fight", OneLevelViceButton, {
		ignoreAddKerning = true,
		handler = {
			ignoreClickAudio = true,
			func = bind1(self.onChallenge, self)
		}
	})
	self:bindWidget("wipeTen", OneLevelViceButton, {
		ignoreAddKerning = true,
		handler = {
			ignoreClickAudio = true,
			func = bind1(self.onClickWipeTimes, self)
		}
	})
	self:bindWidget("wipeOne", OneLevelViceButton, {
		ignoreAddKerning = true,
		handler = {
			ignoreClickAudio = true,
			func = bind1(self.onClickWipeOnce, self)
		}
	})

	local text = self:getView():getChildByName("Text_1")

	text:enableOutline(cc.c4b(0, 0, 0, 219.29999999999998), 1)
end

local buttonPosXTable = {
	327,
	575,
	824
}
local buttonPosXTable2 = {
	447,
	704
}

function SweepBoxPopMediator:enterWithData(data)
	if data.stageType == StageType.kElite then
		local btnText = self:getView():getChildByFullName("wipeTen.name")
		local changeTimes = data.challengeTimes

		btnText:setString(Strings:get("Sweep_Set_Amount", {
			num = changeTimes
		}))

		btnText = self:getView():getChildByFullName("wipeOne.name")

		btnText:setString(Strings:get("Stage_Wipe_Title"))
	elseif data.stageType == kHeroStroy then
		local tenBtn = self:getView():getChildByFullName("wipeTen")
		local oneBtn = self:getView():getChildByFullName("wipeOne")
		local fightBtn = self:getView():getChildByFullName("fight")

		tenBtn:setVisible(false)
		oneBtn:setPositionX(buttonPosXTable2[1])
		fightBtn:setPositionX(buttonPosXTable2[2])
	else
		local bottomText = self:getView():getChildByFullName("wipeTen.name1")

		bottomText:setString(Strings:get("Ten"))
	end
end

function SweepBoxPopMediator:onRemove()
	super.onRemove(self)
end

function SweepBoxPopMediator:onChallenge()
	self._return = 1

	self:onClickClose()
end

function SweepBoxPopMediator:onClickWipeTimes()
	self._return = 2

	self:onClickClose()
end

function SweepBoxPopMediator:onClickWipeOnce()
	self._return = 3

	self:onClickClose()
end

function SweepBoxPopMediator:onClickClose()
	self:close({
		returnValue = self._return
	})
end
