ActivitySagaBatchUseSellMediator = class("ActivitySagaBatchUseSellMediator", BagBatchUseSellMediator, _M)

function ActivitySagaBatchUseSellMediator:initialize()
	super.initialize(self)
end

function ActivitySagaBatchUseSellMediator:dispose()
	super.dispose(self)
end

function ActivitySagaBatchUseSellMediator:onRegister()
	super.onRegister(self)
end

function ActivitySagaBatchUseSellMediator:onClickUse(sender, eventType)
	if self._minCount <= self._curCount and self._curCount <= self._maxCount and self._data.callBackFuncx then
		self._data:callBackFuncx(self._curCount)
		self:close()
	end
end
