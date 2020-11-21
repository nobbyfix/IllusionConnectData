require("dm.battle.view.BattlePauseMediator")
require("dm.battle.view.BattleBossComeMediator")
require("dm.battle.view.BattlerofessionalRestraintMediator")

BattleSceneMediator = class("BattleSceneMediator", DmSceneMediator, _M)

function BattleSceneMediator:initialize()
	super.initialize(self)
end

function BattleSceneMediator:dispose()
	super.dispose(self)
end

function BattleSceneMediator:onRegister()
	super.onRegister(self)
end

function BattleSceneMediator:onRemove()
	local injector = self:getInjector()
	local gameContext = injector:getInstance("GameContext")
	local viewMap = gameContext:getViewMap()
	local mediatorMap = gameContext:getMediatorMap()

	viewMap:unmapView("battleUILayer")
	mediatorMap:unmapView("battleUILayer")
	super.onRemove(self)
end

function BattleSceneMediator:enterWithData(data)
	local view = self:getView()

	cclog("info", "Did enter battle scene!!!")

	local loadFunc = data.loadFunc
	local enterFunc = data.enterFunc

	loadFunc(self:getEventDispatcher(), self:getInjector(), data, enterFunc)
end
