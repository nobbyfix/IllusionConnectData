BattleShowQueue = class("BattleShowQueue", objectlua.Object, _M)
local battleShowType = {
	bossShow = "bossShow",
	heroShow = "heroShow"
}

function BattleShowQueue:initialize()
	super.initialize(self)

	self._queue = {}
end

function BattleShowQueue:dispose()
	self._queue = nil
end

function BattleShowQueue:addHeroShow(heroShow)
	self._queue[#self._queue + 1] = {
		id = heroShow,
		showType = battleShowType.heroShow
	}

	self:show()
end

function BattleShowQueue:addFirstBossShow()
	local queue = {
		{
			paseSta = true,
			showType = battleShowType.bossShow
		}
	}

	for _, v in ipairs(self._queue) do
		queue[#queue + 1] = v
	end

	self._queue = queue

	self:show()
end

function BattleShowQueue:addEndBossShow()
	self._queue[#self._queue + 1] = {
		showType = battleShowType.bossShow
	}

	self:show()
end

function BattleShowQueue:setViewContext(context)
	self._viewContext = context
	self._mainMediator = context:getValue("BattleMainMediator")
	self._battleUIMediator = context:getValue("BattleUIMediator")
end

function BattleShowQueue:show()
	if not self._battleUIMediator.getReadyStartSta or not self._battleUIMediator:getReadyStartSta() then
		return
	end

	if #self._queue > 0 then
		local infoFirst = table.remove(self._queue, 1)

		if infoFirst then
			if infoFirst.showType == battleShowType.heroShow and infoFirst.id then
				self._mainMediator:showHero(infoFirst.id)
			elseif infoFirst.showType == battleShowType.bossShow then
				self._mainMediator:showBossCome(infoFirst.paseSta)
			end
		end
	end
end
