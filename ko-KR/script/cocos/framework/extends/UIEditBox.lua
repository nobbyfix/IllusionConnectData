local EditBox = ccui.EditBox

function EditBox:onEditHandler(callback)
	self:registerScriptEditBoxHandler(function (name, sender)
		local event = {
			name = name,
			target = sender
		}

		callback(event)
	end)

	return self
end

function EditBox:removeEditHandler()
	self:unregisterScriptEditBoxHandler()

	return self
end
