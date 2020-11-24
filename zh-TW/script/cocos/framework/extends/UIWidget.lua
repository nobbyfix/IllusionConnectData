local Widget = ccui.Widget

function Widget:onTouch(callback)
	self:addTouchEventListener(function (sender, state)
		local event = {
			x = 0,
			y = 0
		}

		if state == 0 then
			event.name = "began"
		elseif state == 1 then
			event.name = "moved"
		elseif state == 2 then
			event.name = "ended"
		else
			event.name = "cancelled"
		end

		event.target = sender

		callback(event)
	end)

	return self
end
