MazeMaster = class("MazeMaster", Master, _M)

function MazeMaster:initialize(masterId, player)
	super.initialize(self, masterId, player)
end

function MazeMaster:synchronize(data)
	super:synchronize(data)
end

function MazeMaster:initAttr()
end
