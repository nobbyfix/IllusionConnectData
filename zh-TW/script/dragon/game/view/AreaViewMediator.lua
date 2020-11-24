AreaViewMediator = class("AreaViewMediator", BaseViewMediator)

function AreaViewMediator:initialize()
	super.initialize(self)
end

function AreaViewMediator:dispose()
	super.dispose(self)
end

function AreaViewMediator:enterWithData(data)
end

function AreaViewMediator:willStartEnterTransition(transition)
end

function AreaViewMediator:didFinishEnterTransition(transition)
end

function AreaViewMediator:willStartExitTransition(transition)
end

function AreaViewMediator:didFinishExitTransition(transition)
end

function AreaViewMediator:willBeCovered()
end

function AreaViewMediator:willStartCoverTransition(transition)
end

function AreaViewMediator:didFinishCoverTransition(transition)
end

function AreaViewMediator:resumeWithData(data)
end

function AreaViewMediator:willStartResumeTransition(transition)
end

function AreaViewMediator:didFinishResumeTransition(transition)
end

function AreaViewMediator:dismiss(data)
	return self:dismissWithOptions(nil, data)
end

function AreaViewMediator:dismissWithOptions(options, data)
	local view = self:getView()

	view:dispatchEvent(ViewEvent:new(EVT_DISMISS_VIEW, view, options, data))
end
