local CheckBox = ccui.CheckBox

function CheckBox:onEvent(callback)
	self:addEventListener(function (sender, eventType)
		local event = {}

		if eventType == 0 then
			event.name = "selected"
		else
			event.name = "unselected"
		end

		event.target = sender

		callback(event)
	end)

	return self
end
