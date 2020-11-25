local PageView = ccui.PageView

function PageView:onEvent(callback)
	self:addEventListener(function (sender, eventType)
		local event = {}

		if eventType == 0 then
			event.name = "TURNING"
		end

		event.target = sender

		callback(event)
	end)

	return self
end
