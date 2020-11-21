BattleActionState = State
BattleFSMAction = class("BattleFSMAction", BattleAction, _M)

function BattleFSMAction:initialize()
	super.initialize(self)
end

function BattleFSMAction:getFSM()
	return self._fsm
end

function BattleFSMAction:changeState(newState, ...)
	if self._fsm then
		self._fsm:changeState(newState, ...)
	end
end

function BattleFSMAction:doStart(battleContext)
	local initState = self:willStartWithContext(battleContext)

	if initState then
		self._fsm = StateMachine:new(self)

		self._fsm:changeState(initState)
	else
		self:finish()
	end
end

function BattleFSMAction:doUpdate(dt)
	self._fsm:update(dt)
end

function BattleFSMAction:willStartWithContext(battleContext)
	return ActionFinishState:new()
end

ActionFinishState = class("ActionFinishState", BattleActionState, _M)

function ActionFinishState:enter(battleAction)
	battleAction:finish()
end
