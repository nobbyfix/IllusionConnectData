module("story", package.seeall)

LoopNode = class("LoopNode", StageNode)

register_stage_node("LoopNode", LoopNode)

local acitons = {
	play = LoopNodePlay,
	stop = LoopNodeStop,
	pause = LoopNodePause,
	resume = LoopNodeResume,
	reverse = LoopNodeReverse
}

LoopNode:extendActionsForClass(acitons)

function LoopNode:initialize(config)
	super.initialize(self, config)
end

function LoopNode:createRenderNode(config)
	self._loopGroupWidget = LoopGroupWidget:new(config)
	local renderNode = self._loopGroupWidget:getView()

	return renderNode
end

function LoopNode:dispose()
	if self._loopGroupWidget then
		self._loopGroupWidget:dispose()

		self._loopGroupWidget = nil
	end

	super.dispose(self)
end

function LoopNode:reverse()
	self._loopGroupWidget:reverse()
end

function LoopNode:play()
	self._loopGroupWidget:play()
end

function LoopNode:pause()
	self._loopGroupWidget:pause()
end

function LoopNode:resume()
	self._loopGroupWidget:resume()
end

function LoopNode:stop()
	self._loopGroupWidget:stop()
end
