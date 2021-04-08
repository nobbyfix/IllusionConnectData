local kBtnHandlers = {}
MasterCutInMediator = class("MasterCutInMediator", PopupViewMediator, _M)

function MasterCutInMediator:initialize()
	super.initialize(self)
end

function MasterCutInMediator:dispose()
	super.dispose(self)
end

function MasterCutInMediator:onRegister()
	super.onRegister(self)
end

function MasterCutInMediator:onTouchMaskLayer()
end

function MasterCutInMediator:enterWithData(data)
	local master1 = self:getView():getChildByName("master1")
	local master2 = self:getView():getChildByName("master2")
	local anim = cc.MovieClip:create("cutin_zhujuezhandou")
	local leftAnim = anim:getChildByFullName("left")
	local rightAnim = anim:getChildByFullName("right")

	leftAnim:setPosition(cc.p(leftAnim:getPosition(), anim:getContentSize().height / 2))
	rightAnim:setPosition(cc.p(rightAnim:getPosition(), anim:getContentSize().height / 2))

	local function playUp(sender)
		local x, y = sender:getPosition()
		local moveTo1 = cc.MoveTo:create(0.05, cc.p(x, y + 60))
		local moveTo2 = cc.MoveTo:create(0.15, cc.p(x, y + 50))
		local action = cc.Sequence:create(moveTo1, moveTo2)
		local easeIn = cc.EaseIn:create(action, 1)

		sender:runAction(action)
	end

	local function playDown(sender)
		local x, y = sender:getPosition()
		local moveTo1 = cc.MoveTo:create(0.05, cc.p(x, y - 60))
		local moveTo2 = cc.MoveTo:create(0.15, cc.p(x, y - 50))
		local action = cc.Sequence:create(moveTo1, moveTo2)
		local easeIn = cc.EaseIn:create(action, 1)

		sender:runAction(action)
	end

	local vsAnim = anim:getChildByFullName("vs")

	anim:addEndCallback(function (cid, mc)
		leftAnim:stop()
		rightAnim:stop()
		vsAnim:stop()
		anim:stop()
	end)

	local finishFrame = 80

	if data.friend.leadStageLevel == data.enemy.leadStageLevel then
		finishFrame = 50
	end

	anim:addCallbackAtFrame(15, function ()
		if data.enemy.leadStageLevel < data.friend.leadStageLevel then
			playUp(leftAnim)
			playDown(rightAnim)
		elseif data.friend.leadStageLevel < data.enemy.leadStageLevel then
			playDown(leftAnim)
			playUp(rightAnim)
		end
	end)
	anim:addCallbackAtFrame(finishFrame, function ()
		self:close()
	end)
	anim:addTo(self:getView()):center(self:getView():getContentSize())

	local modelId_l = data.friend.waves[1].master.modelId
	local modelId_r = data.enemy.waves[1].master.modelId

	self:autoManageObject(self:getInjector():injectInto(MasterLeadStageKuang:new(master1, {
		stageId = data.friend.leadStageId,
		stageLevel = data.friend.leadStageLevel,
		modelId = modelId_l
	})))
	self:autoManageObject(self:getInjector():injectInto(MasterLeadStageKuang:new(master2, {
		stageId = data.enemy.leadStageId,
		stageLevel = data.enemy.leadStageLevel,
		modelId = modelId_r
	})))
	self:getView():getChildByName("mask"):addClickEventListener(function ()
		self:close()
	end)
	master1:changeParent(anim:getChildByFullName("left.card")):center(anim:getChildByFullName("left.card"):getContentSize())
	master2:changeParent(anim:getChildByFullName("right.card")):center(anim:getChildByFullName("right.card"):getContentSize())
	master1:offset(-25, 0)
	master2:offset(0, 0)
end
