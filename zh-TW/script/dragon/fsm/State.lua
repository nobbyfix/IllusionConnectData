State = class("State", objectlua.Object, _M)

function State:initialize(name)
	super.initialize(self)

	if name ~= nil then
		self._name = name
	else
		self._name = self:className()
	end
end

function State:getName()
	return self._name
end

function State:enter(agent, ...)
end

function State:update(agent, ...)
end

function State:exit(agent, ...)
end

function State:onMessage(agent, message)
	return false
end
