NewBaseTabBtnWidget = class("NewBaseTabBtnWidget", BaseWidget, _M)

function NewBaseTabBtnWidget:initialize(view)
	super.initialize(self, view)
	self:initSubviews(view)
end

function NewBaseTabBtnWidget:dispose()
	self._closeView = true

	super.dispose(self)
end
