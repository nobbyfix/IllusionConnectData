local kBtnHandlers = {}
BattleBossComeMediator = class("BattleBossComeMediator", PopupViewMediator, _M)

function BattleBossComeMediator:initialize()
	super.initialize(self)
end

function BattleBossComeMediator:dispose()
	super.dispose(self)
end

function BattleBossComeMediator:onRegister()
	super.onRegister(self)
end

function BattleBossComeMediator:onTouchMaskLayer()
end

function BattleBossComeMediator:enterWithData(data)
	local paseSta = data.paseSta

	AudioEngine:getInstance():playEffect("Se_Alert_Warning", false)

	local animNode = self:getView():getChildByFullName("main.anim")
	local anim = nil
	anim = cc.MovieClip:create("dh_qiangdilaixi")

	anim:addTo(animNode, 1)
	anim:addCallbackAtFrame(60, function (cid, mc)
		mc:stop()
		self:close()
	end)
	anim:addEndCallback(function (cid, mc)
		mc:stop()
		self:close()
	end)
end
