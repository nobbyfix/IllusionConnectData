BaseToast = class("BaseToast", _G.DisposableObject)

function BaseToast:initialize(view)
	super.initialize(self)
	self:setView(view)
end

function BaseToast:dispose()
	if self._view ~= nil then
		self._view:release()

		self._view = nil
	end

	super.dispose(self)
end

function BaseToast:getView()
	return self._view
end

function BaseToast:setView(view)
	if self._view == view then
		return
	end

	if self._view ~= nil then
		self._view:release()
	end

	self._view = view

	if self._view ~= nil then
		self._view:retain()
	end
end

function BaseToast:getGroupName()
	return nil
end

function BaseToast:getFrameRect()
end

function BaseToast:setup(parentLayer, parentFrame, options, activeToasts)
end

function BaseToast:startAnimation(endCallback)
end

function BaseToast:abort()
end
