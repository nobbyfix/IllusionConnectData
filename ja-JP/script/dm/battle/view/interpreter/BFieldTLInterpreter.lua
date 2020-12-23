BFieldTLInterpreter = class("BFieldTLInterpreter", TLInterpreter, _M)

function BFieldTLInterpreter:initialize(viewContext)
	super.initialize(self)

	self._context = viewContext
	self._battleUIMediator = viewContext:getValue("BattleUIMediator")
	self._battleGround = viewContext:getValue("BattleGroundLayer")
end

function BFieldTLInterpreter:lockCell(action, args)
end

function BFieldTLInterpreter:unLockCell(action, args)
end

function BFieldTLInterpreter:dealWithTrapEft(eft)
	if not eft then
		return
	end

	for _, detail in ipairs(eft) do
		if detail.evt then
			if detail.evt == "LockCell" then
				local cellId = detail.cellId
				local cell = self._battleGround:getCellById(cellId)

				cell:lock()
			elseif detail.evt == "UnLockCell" then
				local cellId = detail.cellId
				local cell = self._battleGround:getCellById(cellId)

				cell:unlock()
			end
		end
	end
end

function BFieldTLInterpreter:act_AddTrap(action, args)
	self:dealWithTrapEft(args.eft)

	local cellId = args.cellId
	local cell = self._battleGround:getCellById(cellId)

	cell:addTrap(args)
end

function BFieldTLInterpreter:act_RmTrap(action, args)
	self:dealWithTrapEft(args.eft)

	local cellId = args.cellId
	local cell = self._battleGround:getCellById(cellId)

	cell:removeTrap(args)
end

function BFieldTLInterpreter:act_BlockCell(action, args)
	self._battleGround:setBlockCells(args.blockCells)
end
