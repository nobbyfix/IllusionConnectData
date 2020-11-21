module("story", package.seeall)

PlayAudio = class("PlayAudio", BaseAction)

function PlayAudio:start(args)
	local actor = self:getActor()

	if actor then
		actor:play(args.isLoop)
	end

	return BehaviorResult.Success
end

function PlayAudio:abort(result)
	local actor = self:getActor()

	if actor then
		actor:stop(true)
	end

	super.abort(self, result)
end

StopAudio = class("StopAudio", BaseAction)

function StopAudio:start(args)
	local actor = self:getActor()

	if actor then
		actor:stop(args.isRelease)
	end

	return BehaviorResult.Success
end

PauseAudio = class("PauseAudio", BaseAction)

function PauseAudio:start(args)
	local actor = self:getActor()

	if actor then
		actor:pause()
	end

	return BehaviorResult.Success
end

ResumeAudio = class("ResumeAudio", BaseAction)

function ResumeAudio:start(args)
	local actor = self:getActor()

	if actor then
		actor:resume()
	end

	return BehaviorResult.Success
end

ElideAudio = class("ElideAudio", BaseAction)

function ElideAudio:start(args)
	local actor = self:getActor()

	if actor then
		actor:elide()
	end

	return BehaviorResult.Success
end

function ElideAudio:abort(result)
	local actor = self:getActor()

	if actor then
		actor:notElide()
	end

	super.abort(self, result)
end

NotElideAudio = class("NotElideAudio", BaseAction)

function NotElideAudio:start(args)
	local actor = self:getActor()

	if actor then
		actor:notElide()
	end

	return BehaviorResult.Success
end

BlockAudio = class("BlockAudio", BaseAction)

function BlockAudio:start(args)
	local actor = self:getActor()

	if actor then
		if args and args.blockId then
			actor:setBlock(args.blockId)
		else
			actor:setBlock()
		end
	end

	return BehaviorResult.Success
end
