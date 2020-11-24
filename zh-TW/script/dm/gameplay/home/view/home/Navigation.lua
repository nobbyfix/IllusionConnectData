require("dm.gameplay.home.view.home.NavigationItem")

Navigation = class("Navigation", objectlua.Object, _M)
NavigationItemType = {
	kBottom = 1,
	kTop = 3,
	kLeft = 2,
	kRight = 0
}
local NavRightButtonStyle = {}

function Navigation:initialize(bottomLayout, rightLayout, leftLayout, topFunLayout, urlLayout, injector)
	super.initialize(self)

	self._bottomLayout = bottomLayout
	self._rightLayout = rightLayout
	self._leftLayout = leftLayout
	self._topLayout = topFunLayout
	self._urlLayout = urlLayout
	self._injector = injector
	self._initDone = false

	AdjustUtils.ignorSafeAreaRectForNode(self._rightLayout, AdjustUtils.kAdjustType.Right)
	self:init()
end

function Navigation:init()
	self._rightList = {}
	self._bottomList = {}
	self._leftList = {}
	self._topList = {}
	self._navOpen = true
	self._topLayoutFoldBtn = self._topLayout:getChildByFullName("mFoldBtn")
	self._topOpen = false
	self._interval = 55

	self:updataTopNode()
end

function Navigation:updataTopNode()
	self._topNodes = {}
	local unlockSystem = self:getInjector():getInstance(SystemKeeper)
	local settingSystem = self:getInjector():getInstance(SettingSystem)
	local mFriendNode = self._topLayout:getChildByFullName("mFriendNode")

	if unlockSystem:canShow("Friend_Entrance") then
		mFriendNode:setVisible(true)

		self._topNodes[#self._topNodes + 1] = mFriendNode
	else
		mFriendNode:setVisible(false)
	end

	self._topNodes[#self._topNodes + 1] = self._topLayout:getChildByFullName("mMailNode")
	self._topNodes[#self._topNodes + 1] = self._topLayout:getChildByFullName("mBagNode")
	local mRankNode = self._topLayout:getChildByFullName("mRankNode")

	if unlockSystem:canShow("Rank_Main") then
		mRankNode:setVisible(true)

		self._topNodes[#self._topNodes + 1] = mRankNode
	else
		mRankNode:setVisible(false)
	end

	local mDownNode = self._topLayout:getChildByFullName("mDownNode")
	local canDownload = settingSystem:canDownloadPortrait() or settingSystem:canDownloadSoundCV()

	if canDownload then
		mRankNode:setVisible(true)

		self._topNodes[#self._topNodes + 1] = mDownNode
	else
		mRankNode:setVisible(false)
	end
end

function Navigation:openNavigation()
	if self._navOpen then
		return
	end

	self._navOpen = true
end

function Navigation:closeNavigation()
	if not self._navOpen then
		return
	end

	self._navOpen = false
end

function Navigation:isTopOpen()
	return self._topOpen
end

function Navigation:openTop()
	if self._topOpen then
		return
	end

	self:openAction()

	self._topOpen = true
end

function Navigation:openAction()
	local basePosX, basePosY = self._topLayoutFoldBtn:getPosition()
	basePosY = basePosY - 1

	for i = 1, #self._topNodes do
		local node = self._topNodes[i]

		node:setVisible(true)

		local action = nil

		if i == 1 then
			action = cc.Spawn:create(cc.MoveTo:create(0.1, cc.p(self._interval + basePosX, basePosY)), cc.FadeIn:create(0.1))
		else
			action = cc.Spawn:create(cc.MoveTo:create(i * 0.1, cc.p(i * self._interval + basePosX, basePosY)), cc.Sequence:create(cc.DelayTime:create((i - 1) * 0.1), cc.FadeIn:create(0.1)))
		end

		node:runAction(action)
	end
end

function Navigation:closeTop()
	if not self._topOpen then
		return
	end

	self:closeAction()

	self._topOpen = false
end

function Navigation:closeAction()
	local basePosX, basePosY = self._topLayoutFoldBtn:getPosition()
	basePosY = basePosY - 1

	for i = 1, #self._topNodes do
		local node = self._topNodes[i]
		local action = nil

		if i == #self._topNodes then
			action = cc.Sequence:create(cc.Spawn:create(cc.MoveTo:create(i * 0.1, cc.p(basePosX, basePosY)), cc.FadeOut:create(0.1)), cc.Hide:create())
		else
			action = cc.Sequence:create(cc.DelayTime:create((#self._topNodes - i) * 0.1), cc.Spawn:create(cc.MoveTo:create(i * 0.1, cc.p(basePosX, basePosY)), cc.FadeOut:create(0.1)), cc.Hide:create())
		end

		node:runAction(action)
	end
end

function Navigation:checkTopRedPoint()
	if self._topOpen then
		return false
	end

	for i = 1, #self._topNodes do
		local node = self._topNodes[i]
		local redPoint = node:getChildByFullName("mRedSprite")

		if redPoint and redPoint:isVisible() then
			return true
		end
	end

	return false
end
