require("dm.gameplay.develop.model.hero.Hero")

RecruitMainMediator = class("RecruitMainMediator", DmAreaViewMediator, _M)

RecruitMainMediator:has("_recruitSystem", {
	is = "r"
}):injectWith("RecruitSystem")
RecruitMainMediator:has("_developSystem", {
	is = "r"
}):injectWith("DevelopSystem")
RecruitMainMediator:has("_shopSystem", {
	is = "r"
}):injectWith("ShopSystem")
RecruitMainMediator:has("_activitySystem", {
	is = "r"
}):injectWith("ActivitySystem")
RecruitMainMediator:has("_gameServerAgent", {
	is = "r"
}):injectWith("GameServerAgent")
require("dm.gameplay.recruit.view.RecruitResultMediator")

local kBtnHandlers = {
	recruitSkip = {
		clickAudio = "Se_Click_Common_2",
		func = "onClickSkip"
	},
	shopBtn = {
		clickAudio = "Se_Click_Common_2",
		func = "onClickShop"
	},
	tipBtn = {
		clickAudio = "Se_Click_Common_2",
		func = "onClickTip"
	},
	["main.node1.recruitBtn1"] = {
		clickAudio = "Se_Click_Common_1",
		func = "onRecruit1Clicked"
	},
	["main.node2.recruitBtn2"] = {
		clickAudio = "Se_Click_Common_1",
		func = "onRecruit2Clicked"
	},
	["moreNode.btn"] = {
		clickAudio = "Se_Click_Common_1",
		func = "onClickMore"
	},
	["rewardNode.btn"] = {
		clickAudio = "Se_Click_Common_1",
		func = "onClickReward"
	},
	["activityNode.btn"] = {
		clickAudio = "Se_Click_Common_1",
		func = "onClickActivity"
	}
}
local kTipBtnPosX = {
	[RecruitPoolType.kDiamond] = 480
}
local kLeftTopNodePosX = {
	[RecruitPoolType.kDiamond] = 360
}
local kLeftTopNodeText = {
	[RecruitPoolType.kActivity] = "Recruit_Time_Left1",
	[RecruitPoolType.kDiamond] = "Recruit_UI24",
	[RecruitPoolType.kEquip] = "Recruit_UI24"
}
local kLeftTopNodeBgPic = {
	[RecruitPoolType.kActivity] = "ck_xs_bg.png",
	[RecruitPoolType.kDiamond] = "ck_bg_ckxq.png",
	[RecruitPoolType.kEquip] = "ck_bg_ckxq.png"
}
local kLeftTopNodeFontSize = {
	[RecruitPoolType.kActivity] = 28,
	[RecruitPoolType.kDiamond] = 28,
	[RecruitPoolType.kEquip] = 28
}
local actions = {
	"skill3",
	"skill2",
	"skill1"
}

function RecruitMainMediator:initialize()
	super.initialize(self)
end

function RecruitMainMediator:dispose()
	self._roleSpine = nil

	if self._timer then
		self._timer:stop()

		self._timer = nil
	end

	if self._timer2 then
		self._timer2:stop()

		self._timer2 = nil
	end

	if self._tabController then
		self._tabController:dispose()

		self._tabController = nil
	end

	super.dispose(self)
end

function RecruitMainMediator:userInject()
end

function RecruitMainMediator:onRegister()
	super.onRegister(self)

	self._systemKeeper = self:getInjector():getInstance(SystemKeeper)
	self._bagSystem = self._developSystem:getBagSystem()
	self._heroSystem = self._developSystem:getHeroSystem()

	self:mapButtonHandlersClick(kBtnHandlers)
	self:mapEventListener(self:getEventDispatcher(), EVT_RECRUIT_SUCC, self, self.onRecruitSucc)
	self:mapEventListener(self:getEventDispatcher(), EVT_PLAYER_SYNCHRONIZED, self, self.onDiffRefresh)
	self:mapEventListener(self:getEventDispatcher(), EVT_RESET_DONE, self, self.onResetRefresh)
	self:mapEventListener(self:getEventDispatcher(), EVT_PLAYER_SYNCHRONIZED, self, self.updateResultView)
	self:mapEventListener(self:getEventDispatcher(), EVT_CLUB_FORCEDLEVEL, self, self.onForcedLevel)

	self._recruitBtn1 = self:getView():getChildByFullName("main.node1.recruitBtn1")
	self._recruitBtn2 = self:getView():getChildByFullName("main.node2.recruitBtn2")
	local anim = cc.MovieClip:create("shiciguang_choukarenwu")

	anim:addTo(self._recruitBtn2)
	anim:setPosition(cc.p(130, 42))
	self._recruitBtn1:getChildByFullName("text"):enableOutline(cc.c4b(0, 0, 0, 114.75), 2)
	self._recruitBtn2:getChildByFullName("text"):enableOutline(cc.c4b(0, 0, 0, 114.75), 2)
end

function RecruitMainMediator:enterWithData(data)
	self._currencyInfo = ConfigReader:requireDataByNameIdAndKey("ConfigValue", "DrawCard_Resource", "content")
	self._currencyInfos = ConfigReader:requireDataByNameIdAndKey("ConfigValue", "DrawCard_Resource1", "content")

	self:setupTopInfoWidget()
	self:initViewData()
	self:initView()

	self._isFromClub = data and data.isFromClub or false
	self._recruitIndex = 0
	self._recruitId = data and data.recruitId or nil
	self._curTabType = 1

	if self._recruitId then
		for i = 1, #self._recruitData do
			if self._recruitId == self._recruitData[i]:getId() then
				self._curTabType = i

				break
			end
		end
	end

	self:initTabController()
	self:setupClickEnvs()
	self:setupResultClickEnvs()
end

function RecruitMainMediator:setupTopInfoWidget()
	local topInfoNode = self:getView():getChildByFullName("topinfo_node")
	local currencyInfo = {}

	for i = #self._currencyInfo, 1, -1 do
		currencyInfo[#self._currencyInfo - i + 1] = self._currencyInfo[i]
	end

	local config = {
		style = 1,
		hasAnim = true,
		currencyInfo = currencyInfo,
		btnHandler = {
			clickAudio = "Se_Click_Close_1",
			func = bind1(self.onClickBack, self)
		},
		title = Strings:get("Recruit_UI1")
	}
	local injector = self:getInjector()
	self._topInfoWidget = self:autoManageObject(injector:injectInto(TopInfoWidget:new(topInfoNode)))

	self._topInfoWidget:updateView(config)

	self._topInfoNode = topInfoNode
end

function RecruitMainMediator:initView()
	self._heroInfoBtn = self:getView():getChildByFullName("heroInfoBtn")

	self._heroInfoBtn:setVisible(false)

	self._moreNode = self:getView():getChildByFullName("moreNode")

	self._moreNode:setVisible(false)

	self._activityNode = self:getView():getChildByFullName("activityNode")

	self._activityNode:setVisible(false)

	self._rewardNode = self:getView():getChildByFullName("rewardNode")

	self._rewardNode:setVisible(false)

	self._checkBtn = self:getView():getChildByFullName("checkBtn")

	self._checkBtn:setVisible(false)

	self._main = self:getView():getChildByFullName("main")
	self._heroInfoNode = self._main:getChildByFullName("heroInfo")

	self._heroInfoNode:setVisible(false)

	local touchPanel = self._heroInfoNode:getChildByFullName("roleNode.touchPanel")

	touchPanel:addClickEventListener(function ()
		self:onClickRoleNode()
	end)

	self._leftCountNode = self:getView():getChildByFullName("leftCountNode")

	self._leftCountNode:setVisible(false)

	self._leftTimeNode = self:getView():getChildByFullName("leftTimeNode")

	self._leftTimeNode:setVisible(false)

	self._middleTimeNode = self._main:getChildByFullName("middleTimeCountNode")

	self._middleTimeNode:setVisible(false)

	self._shopBtn = self:getView():getChildByFullName("shopBtn")

	self._shopBtn:setVisible(false)

	self._tipBtn = self:getView():getChildByFullName("tipBtn")

	self._tipBtn:setVisible(false)

	self._touchLayer = self:getView():getChildByFullName("touchLayer")

	self._touchLayer:setVisible(false)

	self._recruitSkip = self:getView():getChildByFullName("recruitSkip")

	self._recruitSkip:setVisible(false)
	self._recruitSkip:setLocalZOrder(100)

	self._resultMain = self:getView():getChildByFullName("resultMain")

	self._resultMain:setVisible(false)

	self._drawNode = self:getView():getChildByFullName("drawNum")
	self._drawNum = self._drawNode:getChildByFullName("text")
	local title1 = cc.Label:createWithTTF(Strings:get("Story_Skip"), TTF_FONT_FZYH_R, 24)

	title1:enableOutline(cc.c4b(0, 0, 0, 204), 2)
	title1:addTo(self._recruitSkip):offset(self._recruitSkip:getContentSize().width * 0.5, self._recruitSkip:getContentSize().height * 0.6)

	local lineGradiantVec1 = {
		{
			ratio = 0.5,
			color = cc.c4b(255, 255, 255, 255)
		},
		{
			ratio = 1,
			color = cc.c4b(225, 231, 252, 255)
		}
	}

	title1:enablePattern(cc.LinearGradientPattern:create(lineGradiantVec1, {
		x = 0,
		y = -1
	}))

	local lineGradiantVec1 = {
		{
			ratio = 0.3,
			color = cc.c4b(255, 255, 255, 255)
		},
		{
			ratio = 1,
			color = cc.c4b(225, 222, 0, 255)
		}
	}

	self._moreNode:getChildByFullName("text"):enablePattern(cc.LinearGradientPattern:create(lineGradiantVec1, {
		x = 0,
		y = -1
	}))
	self._activityNode:getChildByFullName("text"):enablePattern(cc.LinearGradientPattern:create(lineGradiantVec1, {
		x = 0,
		y = -1
	}))
	self._rewardNode:getChildByFullName("text"):enablePattern(cc.LinearGradientPattern:create(lineGradiantVec1, {
		x = 0,
		y = -1
	}))

	self._showResult = nil
	self._bestRarity = 11
	self._soundId = nil
	self._linkStr = ""

	self:createVideoSprite()
end

function RecruitMainMediator:showResult()
	if self._showResult then
		self._showResult()

		self._showResult = nil

		self._recruitSkip:setVisible(false)

		if self._videoSprite then
			self._videoSprite:removeFromParent()
			self:createVideoSprite()
		end

		self._bestRarity = 11

		if self._soundId then
			AudioEngine:getInstance():stopEffect(self._soundId)

			self._soundId = nil
		end
	end
end

function RecruitMainMediator:createVideoSprite()
	self._videoSprite = VideoSprite.create("video/recruitAnim.usm", function (sprite, eventName)
		if eventName == ResultAnimOfRarity[self._bestRarity][2] then
			self:showResult()
		end
	end, nil, true)

	self:getView():addChild(self._videoSprite)
	self._videoSprite:setPosition(cc.p(568, 320))
	self._videoSprite:setVisible(false)
	self._videoSprite:getPlayer():pause(true)
end

function RecruitMainMediator:initTabController()
	local config = {
		addCellHeight = 3,
		tabImageScale = 0.6666666666666666,
		onClickTab = function (name, tag)
			self:onClickTab(name, tag)
		end
	}
	local data = {}

	for i = 1, #self._recruitData do
		local recruitData = self._recruitData[i]
		local btnImage = recruitData:getPreview().btn
		local btnText = ""
		local temp = nil
		local type = recruitData:getType()

		if type == RecruitPoolType.kClub or type == RecruitPoolType.kPve or type == RecruitPoolType.kPvp or type == RecruitPoolType.ACTIVITYDRAW then
			temp = {
				textOffsety = -33,
				fontSize = 12,
				unEnableOutline = true,
				textOffsetx = -74,
				tabTextTranslate = "",
				tabText = Strings:get("Recruit_Time_Left1"),
				fontName = TTF_FONT_FZYH_R,
				fontColor = cc.c3b(255, 255, 255),
				tabImage = {
					"asset/ui/recruit/" .. btnImage .. "1.png",
					"asset/ui/recruit/" .. btnImage .. "2.png"
				}
			}
		else
			temp = {
				tabText = "",
				tabTextTranslate = "",
				tabImage = {
					"asset/ui/recruit/" .. btnImage .. "1.png",
					"asset/ui/recruit/" .. btnImage .. "2.png"
				}
			}
		end

		if temp then
			function temp.redPointFunc()
				if self._recruitSystem:checkIsShowRedPointByPool(recruitData) then
					return true
				end

				return false
			end

			temp.redPointPosx = 215
			temp.redPointPosy = 78
			data[#data + 1] = temp
		end
	end

	config.btnDatas = data
	local injector = self:getInjector()
	local widget = TabBtnWidget:createWidgetNode()
	self._tabBtnWidget = self:autoManageObject(injector:injectInto(TabBtnWidget:new(widget)))

	self._tabBtnWidget:adjustScrollViewSize(10)
	self._tabBtnWidget:initTabBtn(config, {
		noCenterBtn = true,
		ignoreSound = true,
		hideBtnAnim = true,
		imageType = ccui.TextureResType.localType
	})
	self._tabBtnWidget:selectTabByTag(self._curTabType)

	local view = self._tabBtnWidget:getMainView()
	local tabPanel = self:getView():getChildByFullName("tab_panel")

	view:addTo(tabPanel):posite(0, 0)
	view:setLocalZOrder(1100)
	view:setName("TabWidget")
end

function RecruitMainMediator:refreshTabBtn()
	local tabPanel = self:getView():getChildByFullName("tab_panel")

	tabPanel:removeChildByName("TabWidget")
	self:initTabController()
end

function RecruitMainMediator:onClickTab(name, tag)
	if self._refreshTabBtn then
		return
	end

	self._curTabType = tag

	self:updateData()
	self:updateView()

	local id = self._recruitData[tag]:getType()
	local currencyInfoData = self._currencyInfos[id] or self._currencyInfo
	local currencyInfo = {}

	for i = #currencyInfoData, 1, -1 do
		currencyInfo[#currencyInfoData - i + 1] = currencyInfoData[i]
	end

	local config_ = {
		style = 1,
		currencyInfo = currencyInfo,
		title = Strings:get("Recruit_UI1")
	}

	self._topInfoWidget:updateView(config_)
end

function RecruitMainMediator:getPoolTagByName(idStr)
	for key, value in pairs(self._recruitData) do
		local id = value:getId()

		if id == idStr then
			return key
		end
	end

	return 1
end

function RecruitMainMediator:initViewData()
	self._recruitData = self._recruitSystem:getShowRecruitPools()
	self._recruitDataShow = {}
	self._recruitDataTemp = {}

	for i = 1, #self._recruitData do
		table.insert(self._recruitDataTemp, self._recruitData[i]:getId())
	end

	self._recruitDataShow = self._recruitData[self._curTabType]
end

function RecruitMainMediator:updateData()
	self._recruitManager = self._recruitSystem:getManager()
	self._recruitDataShow = {}

	if self._recruitData then
		self._recruitDataTemp = {}

		for i = 1, #self._recruitData do
			table.insert(self._recruitDataTemp, self._recruitData[i]:getId())
		end
	end

	self._recruitData = self._recruitSystem:getShowRecruitPools()

	if self._recruitDataTemp then
		if #self._recruitDataTemp ~= #self._recruitData then
			self._curTabType = 1
			self._refreshTabBtn = true
		else
			local refresh = false

			for i = 1, #self._recruitData do
				local id = self._recruitData[i]:getId()

				if not table.indexof(self._recruitDataTemp, id) then
					refresh = true

					break
				end
			end

			if refresh then
				self._curTabType = 1
				self._refreshTabBtn = true
			end
		end
	end

	self._recruitDataShow = self._recruitData[self._curTabType]
end

function RecruitMainMediator:initRoleInfo(heroId, adjustPos)
	local model = IconFactory:getRoleModelByKey("HeroBase", heroId)

	if not model or model == "" then
		return
	end

	model = ConfigReader:getDataByNameIdAndKey("RoleModel", model, "Model")
	local roleNode = self._heroInfoNode:getChildByFullName("roleNode")
	local skillDescPosX = 464

	if adjustPos then
		skillDescPosX = 600

		self._heroInfoNode:setPosition(cc.p(801.3, 426))
		roleNode:setPosition(cc.p(163.6, -161.3))
	else
		self._heroInfoNode:setPosition(cc.p(274, 146))
		roleNode:setPosition(cc.p(143.6, 101.3))
	end

	local role = RoleFactory:createRoleAnimation(model)

	role:setName("RoleAnim")
	role:addTo(roleNode):setScale(0.8):posite(-5, 5)
	role:registerSpineEventHandler(handler(self, self.spineCompleteHandler), sp.EventType.ANIMATION_COMPLETE)

	local heroData = Hero:new(heroId, self._developSystem:getPlayer())

	heroData:rCreateEffect()

	self._roleSpine = role
	self._heroActionIndex = 0
	local skillIds = heroData:getShowSkillIds()
	local num = math.min(4, #skillIds)
	local skills = {}

	for i = 1, num do
		local skillId = skillIds[i]
		local skill = heroData:getSkillById(skillId)

		table.insert(skills, skill)
	end

	for index = 1, num do
		local panel = self._heroInfoNode:getChildByFullName("node_" .. index)
		local skill = skills[index]
		local skillId = skill:getSkillId()

		skill:setLevel(1)
		skill:setEnable(true)
		panel:setTouchEnabled(true)
		panel:addClickEventListener(function ()
			self:onClickSkill(skill, heroData, skillDescPosX)
		end)

		local skillIcon = IconFactory:createHeroSkillIcon({
			levelHide = true,
			hideBg = true,
			id = skillId
		})

		skillIcon:addTo(panel):center(panel:getContentSize())
		skillIcon:setScale(0.68)
		skillIcon:offset(1, 0)
	end
end

function RecruitMainMediator:onClickSkill(skill, heroData, skillDescPosX)
	AudioEngine:getInstance():playEffect("Se_Click_Common_1", false)

	if not self._skillWidget then
		self._skillWidget = self:autoManageObject(self:getInjector():injectInto(SkillDescWidget:new(SkillDescWidget:createWidgetNode(), {
			skill = skill,
			mediator = self
		})))

		self._skillWidget:getView():addTo(self:getView()):posite(464, 200)
	end

	self._skillWidget:refreshInfo(skill, heroData)
	self._skillWidget:show()
	self._skillWidget:getView():setPositionX(skillDescPosX)
end

function RecruitMainMediator:clearRoleInfo()
	self._roleSpine = nil
	self._heroActionIndex = 0

	self._heroInfoNode:getChildByFullName("roleNode"):removeChildByName("RoleAnim")

	for i = 1, 4 do
		self._heroInfoNode:getChildByFullName("node_" .. i):removeAllChildren()
	end
end

function RecruitMainMediator:refreshHeroInfo()
	local type = self._recruitDataShow:getType()
	local nodeShow = type == RecruitPoolType.kPve or type == RecruitPoolType.kPvp or type == RecruitPoolType.kClub
	local hero_text = self._middleTimeNode:getChildByFullName("hero_text")
	local common_text_node = self._middleTimeNode:getChildByFullName("common_text")

	common_text_node:removeAllChildren()
	self._middleTimeNode:setVisible(nodeShow)

	local heroInfo = self._recruitDataShow:getRoleDetail()

	if heroInfo then
		local showhero = ""
		local showACThero = ""
		local showHeroId = ""

		self._heroInfoBtn:setVisible(true)
		self._heroInfoBtn:removeAllChildren()

		for i = 1, #heroInfo do
			local heroId = heroInfo[i].hero
			local btn = self._checkBtn:clone()

			btn:setVisible(true)
			btn:addTo(self._heroInfoBtn)
			btn:setPosition(cc.p(heroInfo[i].position[1], heroInfo[i].position[2]))
			btn:addClickEventListener(function ()
				self:onClickHeroInfo(heroId)
			end)

			if nodeShow and heroId then
				local str = Strings:get("Recruit_Common_UI1", {
					fontName = CUSTOM_TTF_FONT_1
				})
				local common_text = ccui.RichText:createWithXML(str, {})

				common_text:setFontColor("#a9adb5")
				common_text:setFontSize(28)
				common_text:ignoreContentAdaptWithSize(true)
				common_text:rebuildElements()
				common_text:formatText()
				common_text:setAnchorPoint(cc.p(0.5, 1))
				common_text:renderContent()
				common_text:setPosition(92, 190)
				common_text:addTo(common_text_node)

				local heroPrototype = PrototypeFactory:getInstance():getHeroPrototype(heroId)
				local descId = heroPrototype:getConfig().Position

				if descId then
					hero_text:setVisible(true)
					hero_text:setString(Strings:get(descId))
				end
			end

			if heroInfo[i].showhero and heroInfo[i].showhero ~= "" then
				showhero = heroInfo[i].showhero
				showHeroId = showhero
			elseif heroInfo[i].showACThero and heroInfo[i].showACThero ~= "" then
				showACThero = heroInfo[i].showACThero
				showHeroId = showACThero
			end
		end

		self:clearRoleInfo()

		if showHeroId ~= "" then
			self._heroInfoNode:setVisible(true)
			self:initRoleInfo(showHeroId, showACThero ~= "")
		else
			self._heroInfoNode:setVisible(false)
		end
	else
		self._heroInfoNode:setVisible(false)
		self._heroInfoBtn:setVisible(false)
	end
end

function RecruitMainMediator:refreshRewardNode()
	self._rewardNode:setVisible(self._recruitDataShow:getRebateCanShow())

	if not self._rewardNodeRedPoint then
		self._rewardNodeRedPoint = RedPoint:createDefaultNode()

		self._rewardNodeRedPoint:addTo(self._rewardNode):posite(93, 93)
		self._rewardNodeRedPoint:setLocalZOrder(99)
	end

	self._rewardNodeRedPoint:setVisible(self._recruitSystem:checkIsShowRedPointByPool(self._recruitDataShow))
end

function RecruitMainMediator:refreshMoreNode()
	self._linkStr = self._recruitDataShow:getLink()

	self._moreNode:setVisible(self._linkStr ~= "")

	local px = self._rewardNode:isVisible() and self._rewardNode:getPositionX() + 95 or self._rewardNode:getPositionX()

	self._moreNode:setPositionX(px)
end

function RecruitMainMediator:refreshActivityNode()
	local recruitId = self._recruitDataShow:getId()
	local activity = self._activitySystem:getActivityByType(ActivityType.KDrawCardFeedbackActivity)

	if activity then
		if activity:checkRecruitIdIsInActivity(recruitId) then
			self._activityNode:setVisible(true)
		else
			self._activityNode:setVisible(false)
		end
	else
		self._activityNode:setVisible(false)
	end

	local st = self._rewardNode:isVisible() or self._moreNode:isVisible()
	local px = st and self._rewardNode:getPositionX() + 95 or self._rewardNode:getPositionX()

	self._activityNode:setPositionX(px)
end

function RecruitMainMediator:runNodeActions()
	local recruitBg = self._main:getChildByFullName("recruitBg")

	recruitBg:removeAllChildren()
	self._shopBtn:stopAllActions()
	self._moreNode:stopAllActions()
	self._rewardNode:stopAllActions()
	self._activityNode:stopAllActions()
	self._recruitBtn1:stopAllActions()
	self._recruitBtn2:stopAllActions()
	self._recruitBtn1:setTouchEnabled(false)
	self._recruitBtn2:setTouchEnabled(false)
	self._shopBtn:setOpacity(0)
	self._moreNode:setOpacity(0)
	self._rewardNode:setOpacity(0)
	self._activityNode:setOpacity(0)
	self._recruitBtn1:setOpacity(0)
	self._recruitBtn2:setOpacity(0)

	local bgName = self._recruitDataShow:getPreview().main

	if bgName then
		local function showFunc()
			self._recruitBtn1:setPosition(cc.p(0, -70))
			self._recruitBtn2:setPosition(cc.p(0, -70))

			local moveTo1 = cc.MoveTo:create(0.2, cc.p(0, 15))
			local fadeIn = cc.FadeIn:create(0.2)
			local moveTo2 = cc.MoveTo:create(0.06666666666666667, cc.p(0, 0))
			local spawn = cc.Spawn:create(moveTo1, fadeIn)
			local seq = cc.Sequence:create(spawn, moveTo2)
			local openNormal = cc.CallFunc:create(function ()
				local id = self._recruitDataShow:getId()

				if id == "DrawCard_Diamond_1" or id == "DrawCard_NewPlayer" then
					local storyDirector = self:getInjector():getInstance(story.StoryDirector)

					storyDirector:notifyWaiting("enter_recruitMain_view_open_normal")
				end
			end)

			self._recruitBtn1:runAction(seq)

			moveTo1 = cc.MoveTo:create(0.2, cc.p(0, 15))
			fadeIn = cc.FadeIn:create(0.2)
			moveTo2 = cc.MoveTo:create(0.06666666666666667, cc.p(0, 0))
			spawn = cc.Spawn:create(moveTo1, fadeIn)
			seq = cc.Sequence:create(spawn, moveTo2, openNormal)

			self._recruitBtn2:runAction(seq)
			self._recruitBtn1:setTouchEnabled(true)
			self._recruitBtn2:setTouchEnabled(true)
			self._shopBtn:fadeIn({
				time = 0.2
			})
			self._moreNode:fadeIn({
				time = 0.2
			})
			self._rewardNode:fadeIn({
				time = 0.2
			})
			self._activityNode:fadeIn({
				time = 0.2
			})
		end

		local recruitId = self._recruitDataShow:getId()
		local hasAnim = table.keyof(RecruitPoolId, recruitId)

		if hasAnim then
			local anim = cc.MovieClip:create(bgName .. "_choukarenwu")

			anim:addTo(recruitBg)
			anim:setPosition(cc.p(50, 50))
			anim:addEndCallback(function ()
				anim:stop()
			end)
			anim:setName(bgName)

			local frame = 23

			anim:addCallbackAtFrame(frame, function ()
				showFunc()
			end)

			local bg = nil

			if recruitId == RecruitPoolId.kHeroDiamond then
				bg = cc.MovieClip:create("dh_choukachangjing")

				bg:addEndCallback(function ()
					bg:stop()
				end)

				local animPath = "asset/anim/portraitpic_MLYTLSha_CK.skel"

				if cc.FileUtils:getInstance():isFileExist(animPath) then
					local spineNode = sp.SkeletonAnimation:create(animPath)

					spineNode:playAnimation(0, "animation", true)
					spineNode:addTo(bg):posite(55, -660)
					spineNode:setScale(1.15)
				end
			else
				bg = ccui.ImageView:create("asset/scene/" .. bgName .. ".jpg")
			end

			bg:addTo(anim:getChildByFullName("bgPanel"))
			anim:gotoAndPlay(0)
			anim:setVisible(true)
		else
			showFunc()

			local bg = ccui.ImageView:create("asset/scene/" .. bgName .. ".jpg")

			bg:addTo(recruitBg):center(recruitBg:getContentSize())
			bg:setScale(0.6666666666666666)
		end
	end
end

function RecruitMainMediator:initCostNode(recruitCost, costNode, offCount)
	local icon1 = costNode:getChildByFullName("icon")
	local name1 = costNode:getChildByFullName("name")
	local freeText = costNode:getChildByFullName("freeText")
	local costId = recruitCost.costId
	local costCount = recruitCost.costCount

	if costCount == 0 then
		icon1:setVisible(false)
		name1:setVisible(false)
		freeText:setVisible(true)
	else
		icon1:setVisible(true)
		name1:setVisible(true)
		freeText:setVisible(false)

		local prototype = ItemPrototype:new(costId)
		local item = Item:new(prototype)

		name1:setString(item:getName() .. "  x" .. costCount)
		icon1:removeAllChildren()

		local costIcon = IconFactory:createPic({
			id = costId
		}, {
			largeIcon = true
		})

		costIcon:setScale(0.5)
		costIcon:addTo(icon1):center(icon1:getContentSize())

		if costId ~= "IM_DiamondDraw" and costId ~= "IM_DiamondDrawEX" then
			icon1:setPositionY(10)
		end

		icon1:setPositionX(name1:getPositionX() - name1:getContentSize().width / 2 - 2)
	end

	local costOffBg = costNode:getChildByFullName("costOffBg")

	if offCount ~= 100 then
		costOffBg:setVisible(true)
		costOffBg:getChildByFullName("costOff"):setString(100 - offCount .. "%")
	else
		costOffBg:setVisible(false)
	end
end

function RecruitMainMediator:refreshLeftTopNode()
	local id = self._recruitDataShow:getId()
	local type = self._recruitDataShow:getType()

	if type == RecruitPoolType.kActivity or type == RecruitPoolType.kPve or type == RecruitPoolType.kPvp or type == RecruitPoolType.kClub then
		if id == RecruitNewPlayerPool then
			self._leftTimeNode:setVisible(false)
			self._tipBtn:setVisible(false)
		else
			self._leftTimeNode:setVisible(true)
			self._tipBtn:setVisible(true)

			local bgpic = self._leftTimeNode:getChildByFullName("bgpic")
			local text1 = self._leftTimeNode:getChildByFullName("text1")

			bgpic:loadTexture(kLeftTopNodeBgPic[RecruitPoolType.kActivity], ccui.TextureResType.plistType)
			bgpic:ignoreContentAdaptWithSize(true)
			bgpic:setScale(0.66)
			text1:setString(Strings:get(kLeftTopNodeText[RecruitPoolType.kActivity]))
			text1:setFontSize(kLeftTopNodeFontSize[RecruitPoolType.kActivity])

			local function checkTimeFunc()
				local type = self._recruitDataShow:getType()
				local id = self._recruitDataShow:getId()

				if type == RecruitPoolType.kActivity or type == RecruitPoolType.kPve or type == RecruitPoolType.kPvp or type == RecruitPoolType.kClub and id ~= RecruitNewPlayerPool then
					local text = self._leftTimeNode:getChildByFullName("text")
					local unlock, activityId = self._recruitSystem:getActivityIsOpen(id)

					if not unlock then
						self._recruitSystem:tryEnter()

						return
					end

					local activity = self._activitySystem:getActivityById(activityId)
					local endTime = activity:getEndTime()
					local remoteTimestamp = self:getInjector():getInstance("GameServerAgent"):remoteTimeMillis()
					local remainTime = endTime - remoteTimestamp

					if remainTime <= 0 then
						self._leftTimeNode:setVisible(false)

						return
					end

					local str = ""
					local fmtStr = "${d}:${H}:${M}:${S}"
					local timeStr = TimeUtil:formatTime(fmtStr, remainTime * 0.001)
					local parts = string.split(timeStr, ":", nil, true)
					local timeTab = {
						day = tonumber(parts[1]),
						hour = tonumber(parts[2]),
						min = tonumber(parts[3]),
						sec = tonumber(parts[4])
					}

					if timeTab.day > 0 then
						str = timeTab.day .. Strings:get("TimeUtil_Day") .. timeTab.hour .. Strings:get("TimeUtil_Hour")
					elseif timeTab.hour > 0 then
						str = timeTab.hour .. Strings:get("TimeUtil_Hour") .. timeTab.min .. Strings:get("TimeUtil_Min")
					else
						str = timeTab.min .. Strings:get("TimeUtil_Min") .. timeTab.sec .. Strings:get("TimeUtil_Sec")
					end

					text:setString(Strings:get("Recruit_Time_Left") .. str)
				end
			end

			if not self._timer then
				self._timer = LuaScheduler:getInstance():schedule(checkTimeFunc, 0.2, false)

				checkTimeFunc()
			end
		end
	else
		self._leftTimeNode:setVisible(true)
		self._tipBtn:setVisible(true)

		local bgpic = self._leftTimeNode:getChildByFullName("bgpic")
		local text1 = self._leftTimeNode:getChildByFullName("text1")
		local timeLeft = self._leftTimeNode:getChildByFullName("text")

		bgpic:loadTexture(kLeftTopNodeBgPic[type] or kLeftTopNodeBgPic[RecruitPoolType.kEquip], ccui.TextureResType.plistType)
		bgpic:ignoreContentAdaptWithSize(false)
		bgpic:setScaleY(0.66)
		bgpic:setScaleX(0.45)
		timeLeft:setString("")
		text1:setString(Strings:get(kLeftTopNodeText[type] or kLeftTopNodeText[RecruitPoolType.kEquip]))
		text1:setFontSize(kLeftTopNodeFontSize[type] or kLeftTopNodeFontSize[RecruitPoolType.kEquip])
	end

	local tabPanel = self:getView():getChildByFullName("tab_panel")

	self._leftTimeNode:setPositionX(kLeftTopNodePosX[type] or tabPanel:getPositionX() + 220)

	if type == RecruitPoolType.kEquip then
		self._tipBtn:setPositionX(tabPanel:getPositionX() + 340)
	else
		self._tipBtn:setPositionX(kTipBtnPosX[type] or tabPanel:getPositionX() + 629)
	end

	self._drawNode:setVisible(id ~= RecruitNewPlayerPool)

	if type == RecruitPoolType.kActivity or type == RecruitPoolType.kPve or type == RecruitPoolType.kPvp or type == RecruitPoolType.kClub then
		self._drawNode:setPosition(cc.p(900, self._leftTimeNode:getPositionY() - 23))
	else
		self._drawNode:setPosition(cc.p(self._leftTimeNode:getPositionX(), self._leftTimeNode:getPositionY() - 62))
	end

	local n = self._recruitSystem:getDrawTimeById(id)
	n = n and n["1"] or 0
	local str = Strings:get("RecruitHero_Times", {
		num = n
	})

	self._drawNum:setString(str)

	local imgbg = self._drawNode:getChildByFullName("Image_1")

	imgbg:setContentSize(cc.size(self._drawNum:getAutoRenderSize().width + 100, imgbg:getContentSize().height))
end

function RecruitMainMediator:refreshMiddleTime()
	local id = self._recruitDataShow:getId()
	local type = self._recruitDataShow:getType()

	local function checkTimeFunc()
		local type = self._recruitDataShow:getType()
		local id = self._recruitDataShow:getId()
		local nodeShow = type == RecruitPoolType.kPve or type == RecruitPoolType.kPvp or type == RecruitPoolType.kClub

		self._middleTimeNode:setVisible(nodeShow)

		if nodeShow then
			local text = self._middleTimeNode:getChildByFullName("text")
			local count = self._middleTimeNode:getChildByFullName("count")
			local unlock, activityId = self._recruitSystem:getActivityIsOpen(id)

			if not unlock then
				self._recruitSystem:tryEnter()

				return
			end

			local activity = self._activitySystem:getActivityById(activityId)
			local endTime = activity:getEndTime()
			local remoteTimestamp = self:getInjector():getInstance("GameServerAgent"):remoteTimeMillis()
			local remainTime = endTime - remoteTimestamp

			if remainTime <= 0 then
				self._middleTimeNode:setVisible(false)

				return
			end

			local str = ""
			local fmtStr = "${d}:${H}:${M}:${S}"
			local timeStr = TimeUtil:formatTime(fmtStr, remainTime * 0.001)
			local parts = string.split(timeStr, ":", nil, true)
			local timeTab = {
				day = tonumber(parts[1]),
				hour = tonumber(parts[2]),
				min = tonumber(parts[3]),
				sec = tonumber(parts[4])
			}

			if timeTab.day > 0 then
				str = timeTab.day .. Strings:get("TimeUtil_Day") .. timeTab.hour .. Strings:get("TimeUtil_Hour2")
			elseif timeTab.hour > 0 then
				str = timeTab.hour .. Strings:get("TimeUtil_Hour2") .. timeTab.min .. Strings:get("TimeUtil_Min")
			else
				str = timeTab.min .. Strings:get("TimeUtil_Min") .. timeTab.sec .. Strings:get("TimeUtil_Sec")
			end

			text:setString(str .. Strings:get("Recruit_Time_Left3"))

			local timeMap = self._recruitSystem:getDrawTimeById(id)
			local specialTime = self._recruitDataShow:getSpecialRewardTimes()
			local usedTime = timeMap["1"] or 0
			local leftTime = math.floor(tonumber(usedTime) % specialTime)
			leftTime = specialTime - leftTime
			self._remainTimes = leftTime

			count:setString(leftTime)
		end
	end

	if not self._timer2 then
		self._timer2 = LuaScheduler:getInstance():schedule(checkTimeFunc, 0.2, false)

		checkTimeFunc()
	end
end

function RecruitMainMediator:updateView()
	if self._refreshTabBtn then
		self:refreshTabBtn()
	end

	local type = self._recruitDataShow:getType()

	self._tipBtn:setVisible(type ~= RecruitPoolType.kDiamond and type ~= RecruitPoolType.kEquip and self._recruitDataShow:getId() ~= RecruitNewPlayerPool)
	self._shopBtn:setVisible(self._shopSystem:isShopFragmentOpen() and (type == RecruitPoolType.kDiamond or type == RecruitPoolType.kActivity))
	self:refreshHeroInfo()
	self:refreshRewardNode()
	self:refreshMoreNode()
	self:refreshActivityNode()
	self:refreshLeftTopNode()
	self:refreshMiddleTime()
	self:runNodeActions()

	local costNode1 = self._main:getChildByFullName("node1.recruitBtn1")
	local costNode2 = self._main:getChildByFullName("node2.recruitBtn2")
	local id = self._recruitDataShow:getId()
	local hasLeft = ""
	local costData = nil

	if self._recruitDataShow:getRealCostIdAndCount()[1] then
		local costCount = self._recruitDataShow:getRealCostIdAndCount()[1]
		local offCount = 100
		local time = self._recruitDataShow:getRecruitTimes()[1]

		if time ~= 1 then
			costCount, offCount = self._recruitSystem:getRecruitRealCost(self._recruitDataShow, costCount, time)
		end

		self:initCostNode(costCount, costNode1, offCount)
		self._recruitBtn1:getChildByFullName("text"):setString(Strings:get(self._recruitDataShow:getShortDesc()[1]))
		self._recruitBtn1:getChildByFullName("text_1"):setString(Strings:get(self._recruitDataShow:getShortDescEn()[1]))

		if self._recruitDataShow:hasDrawLimit() then
			costData = costCount
			local usedTime = self._recruitSystem:getDrawTimeById(id)
			local timeLimit = self._recruitDataShow:getDrawLimit()
			usedTime = usedTime["1"] or usedTime[tostring(time)]
			usedTime = tonumber(usedTime)
			hasLeft = (timeLimit <= usedTime or time > timeLimit - usedTime) and 0 or math.floor((timeLimit - usedTime) / time)
		end
	end

	if self._recruitDataShow:getRealCostIdAndCount()[2] then
		self:getView():getChildByFullName("main.node1"):setPositionX(452)
		self._recruitBtn2:setVisible(true)

		local costCount = self._recruitDataShow:getRealCostIdAndCount()[2]
		local offCount = 100
		local time = self._recruitDataShow:getRecruitTimes()[2]

		if time ~= 1 then
			costCount, offCount = self._recruitSystem:getRecruitRealCost(self._recruitDataShow, costCount, time)
		end

		if hasLeft == "" and self._recruitDataShow:hasDrawLimit() then
			costData = costCount
			local usedTime = self._recruitSystem:getDrawTimeById(id)
			local timeLimit = self._recruitDataShow:getDrawLimit()
			usedTime = usedTime["1"] or usedTime[tostring(time)]
			usedTime = tonumber(usedTime)
			hasLeft = (timeLimit <= usedTime or time > timeLimit - usedTime) and 0 or math.floor((timeLimit - usedTime) / time)
		end

		self:initCostNode(costCount, costNode2, offCount)
		self._recruitBtn2:getChildByFullName("text"):setString(Strings:get(self._recruitDataShow:getShortDesc()[2]))
		self._recruitBtn2:getChildByFullName("text_1"):setString(Strings:get(self._recruitDataShow:getShortDescEn()[2]))
	else
		self:getView():getChildByFullName("main.node1"):setPositionX(629)
		self._recruitBtn2:setVisible(false)
	end

	if hasLeft ~= "" then
		self._leftCountNode:setVisible(true)
		self._leftCountNode:getChildByFullName("text"):setString(hasLeft)

		local icon = self._leftCountNode:getChildByFullName("icon")
		local costIcon = IconFactory:createPic({
			id = costData.costId
		}, {
			largeIcon = true
		})

		costIcon:setScale(0.5)
		costIcon:addTo(icon)
	else
		self._leftCountNode:setVisible(false)
	end
end

function RecruitMainMediator:onDiffRefresh(event)
	self:updateData()
	self:updateView()
end

function RecruitMainMediator:onResetRefresh(event)
	local data = event:getData()

	if data and (data[ResetId.kRecruitGoldFree] or data[ResetId.kRecruitDiamondFree] or data[ResetId.kRecruitEquipFree] or data[ResetId.kRecruitDiamondTimes]) then
		self:updateData()
		self:updateView()
	end
end

function RecruitMainMediator:onRecruitSucc(event)
	self._touchLayer:setVisible(true)

	local data = event:getData()

	if data == nil then
		self._touchLayer:setVisible(false)

		return
	end

	data.recruitId = self._recruitDataShow:getId()
	self._recruitManager = self._recruitSystem:getManager()
	local recruitPool = self._recruitManager:getRecruitPoolById(data.recruitId)
	local storyDirector = self:getInjector():getInstance(story.StoryDirector)
	local guideAgent = storyDirector:getGuideAgent()

	if guideAgent:isGuiding() and guideAgent:getCurrentScriptName() == "guide_chapterOne1_4" then
		StatisticSystem:send({
			point = "guide_main_recruit_12",
			type = "loginpoint"
		})
	end

	if recruitPool then
		self:enterResultWithData(data)
	end
end

function RecruitMainMediator:onClickBack()
	self:getView():stopAllActions()

	local storyDirector = self:getInjector():getInstance(story.StoryDirector)

	storyDirector:notifyWaiting("exit_recruitMain_view")
	self:dismissWithOptions({
		transition = ViewTransitionFactory:create(ViewTransitionType.kCommonAreaView)
	})
end

function RecruitMainMediator:onForcedLevel(event)
	if self._isFromClub then
		self:onClickBack()
	end
end

function RecruitMainMediator:checkHasTimesLimit(recruitDataShow, realTimes)
	local id = recruitDataShow:getId()

	if recruitDataShow:hasDrawLimit() then
		local time = self._recruitSystem:getDrawTimeById(id)
		local timeLimit = recruitDataShow:getDrawLimit()
		time = time["1"] or time[tostring(realTimes)]
		time = tonumber(time)

		if timeLimit <= time or realTimes > timeLimit - time then
			self:dispatch(ShowTipEvent({
				tip = Strings:get("Recruit_Times_Out")
			}))

			return true
		end
	end

	return false
end

function RecruitMainMediator:onRecruit1Clicked()
	self._recruitIndex = 1
	local id = self._recruitDataShow:getId()
	local times = self._recruitDataShow:getRecruitTimes()[self._recruitIndex]
	local hasLimit = self:checkHasTimesLimit(self._recruitDataShow, times)

	if hasLimit then
		return
	end

	local costId = self._recruitDataShow:getRealCostIdAndCount()[self._recruitIndex].costId
	local costCount = self._recruitDataShow:getRealCostIdAndCount()[self._recruitIndex].costCount

	if times ~= 1 then
		local countData = self._recruitDataShow:getRealCostIdAndCount()[self._recruitIndex]
		costCount = self._recruitSystem:getRecruitRealCost(self._recruitDataShow, countData, times)
		costCount = costCount.costCount
	end

	local param = {
		id = id,
		times = times
	}

	if self._bagSystem:checkCostEnough(costId, costCount) then
		self._recruitSystem:requestRecruit(param)
	elseif costId == CurrencyIdKind.kDiamondDrawItem or costId == CurrencyIdKind.kDiamondDrawExItem then
		self:buyCard(costId, costCount, param)
	else
		self._bagSystem:checkCostEnough(costId, costCount, {
			type = "popup"
		})
	end
end

function RecruitMainMediator:onRecruit2Clicked()
	self._recruitIndex = 2
	local id = self._recruitDataShow:getId()
	local times = self._recruitDataShow:getRecruitTimes()[self._recruitIndex]
	local hasLimit = self:checkHasTimesLimit(self._recruitDataShow, times)

	if hasLimit then
		return
	end

	local costId = self._recruitDataShow:getRealCostIdAndCount()[self._recruitIndex].costId
	local costCount = self._recruitDataShow:getRealCostIdAndCount()[self._recruitIndex].costCount

	if times ~= 1 then
		local countData = self._recruitDataShow:getRealCostIdAndCount()[self._recruitIndex]
		costCount = self._recruitSystem:getRecruitRealCost(self._recruitDataShow, countData, times)
		costCount = costCount.costCount
	end

	local param = {
		id = id,
		times = times
	}

	if self._bagSystem:checkCostEnough(costId, costCount) then
		self._recruitSystem:requestRecruit(param)
	elseif costId == CurrencyIdKind.kDiamondDrawItem or costId == CurrencyIdKind.kDiamondDrawExItem then
		self:buyCard(costId, costCount, param)
	else
		self._bagSystem:checkCostEnough(costId, costCount, {
			type = "popup"
		})
	end
end

function RecruitMainMediator:buyCard(costId, costCount, param)
	if self._recruitSystem:getCanAutoBuy(costId) then
		self:autoBuy(costId, costCount, param)

		return
	end

	local view = self:getInjector():getInstance("RecruitBuyView")

	self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
		transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
	}, {
		itemId = costId,
		costCount = costCount,
		param = param
	}))
	self._resultMain:removeAllChildren()
	self._resultMain:setVisible(false)
end

function RecruitMainMediator:autoBuy(costId, costCount, param)
	local price = param.times == 1 and RecruitCurrencyStr.KBuyPrice.single[costId] or RecruitCurrencyStr.KBuyPrice.ten[costId]
	local hasCount = self._bagSystem:getItemCount(costId)
	local num = costCount - hasCount
	local cost = num * price
	local hasDiamondCount = self._bagSystem:getItemCount(CurrencyIdKind.kDiamond)
	local canBuy = cost <= hasDiamondCount

	if not canBuy then
		local data = {
			title = Strings:get("SHOP_REFRESH_DESC_TEXT1"),
			content = RecruitCurrencyStr.KGoToShop[costId],
			sureBtn = {},
			cancelBtn = {}
		}
		local outSelf = self
		local delegate = {
			willClose = function (self, popupMediator, data)
				if data.response == "ok" then
					outSelf._shopSystem:tryEnter({
						shopId = "Shop_Mall"
					})
				end
			end
		}
		local view = self:getInjector():getInstance("AlertView")

		self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
			transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
		}, data, delegate))

		return
	else
		self._recruitSystem:requestRecruit(param)
	end
end

function RecruitMainMediator:onClickPreview()
	local function callback(rewards)
		local view = self:getInjector():getInstance("recruitHeroPreviewView")

		self:getEventDispatcher():dispatchEvent(ViewEvent:new(EVT_SHOW_POPUP, view, {
			transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
		}, {
			recruitPool = self._recruitDataShow,
			rewards = rewards
		}))
	end

	local showRewards = self._recruitDataShow:getShowRewards()
	local key = next(showRewards)

	if not key or key == "" then
		return
	end

	local params = {
		drawID = self._recruitDataShow:getId(),
		key = key
	}

	self._recruitSystem:requestRewardPreview(params, callback)
end

function RecruitMainMediator:onClickTip()
	local type = self._recruitDataShow:getType()

	if type == RecruitPoolType.kActivity then
		local view = self:getInjector():getInstance("RecruitTipView")

		self:getEventDispatcher():dispatchEvent(ViewEvent:new(EVT_SHOW_POPUP, view, nil, {
			info = self._recruitDataShow:getPoolInfo()
		}))
	elseif type == RecruitPoolType.kPve or type == RecruitPoolType.kPvp or type == RecruitPoolType.kClub then
		local function callback(rewards)
			local view = self:getInjector():getInstance("RecruitCommonPreviewView")

			self:getEventDispatcher():dispatchEvent(ViewEvent:new(EVT_SHOW_POPUP, view, {
				transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
			}, {
				recruitPool = self._recruitDataShow,
				rewards = rewards,
				remainTimes = self._remainTimes
			}))
		end

		local showRewards = self._recruitDataShow:getShowRewards()
		local key = next(showRewards)

		if not key or key == "" then
			return
		end

		local params = {
			drawID = self._recruitDataShow:getId(),
			key = key
		}

		self._recruitSystem:requestRewardPreview(params, callback)
	else
		self:onClickPreview()
	end
end

function RecruitMainMediator:onClickSkip()
	self._animSkip = true

	self:showResult()
end

function RecruitMainMediator:onClickShop()
	local shopSystem = self:getInjector():getInstance(ShopSystem)

	shopSystem:tryEnterDebris()
end

function RecruitMainMediator:onClickHeroInfo(heroId)
	local view = self:getInjector():getInstance("HeroInfoView")

	self:dispatch(ViewEvent:new(EVT_PUSH_VIEW, view, nil, {
		heroId = heroId
	}))
end

function RecruitMainMediator:onClickMore()
	if self._linkStr == "" then
		return
	end

	local context = self:getInjector():instantiate(URLContext)
	local entry, params = UrlEntryManage.resolveUrlWithUserData(self._linkStr)

	if not entry then
		self:dispatch(ShowTipEvent({
			tip = Strings:get("Function_Not_Open")
		}))
	else
		entry:response(context, params)
	end
end

function RecruitMainMediator:onClickReward()
	local view = self:getInjector():getInstance("RecruitRewardView")

	self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
		transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
	}, {
		recruitData = self._recruitDataShow
	}, nil))
end

function RecruitMainMediator:onClickActivity()
	local activity = self._activitySystem:getActivityByType(ActivityType.KDrawCardFeedbackActivity)

	self._activitySystem:tryEnter({
		id = activity:getId()
	})
end

function RecruitMainMediator:onClickRoleNode()
	if not self._roleSpine then
		return
	end

	self._heroActionIndex = self._heroActionIndex + 1

	if self._heroActionIndex > #actions then
		self._heroActionIndex = 1
	end

	local actionName = actions[self._heroActionIndex]

	if actionName then
		self._roleSpine:playAnimation(0, actionName, true)
	end
end

function RecruitMainMediator:spineCompleteHandler(event)
	if event.type == "complete" and event.animation ~= "stand" and self._roleSpine then
		self._roleSpine:playAnimation(0, "stand", true)
	end
end

function RecruitMainMediator:setupClickEnvs()
	if GameConfigs.closeGuide then
		return
	end

	local storyDirector = self:getInjector():getInstance(story.StoryDirector)
	local guideAgent = storyDirector:getGuideAgent()

	if guideAgent:isGuiding() and guideAgent:getCurrentScriptName() == "guide_chapterOne1_4" then
		local stageSystem = self:getInjector():getInstance(StageSystem)
		local point = stageSystem:getPointById("M01S04")
		local tag = nil

		if point and point:isPass() then
			tag = self:getPoolTagByName("DrawCard_NewPlayer")
		else
			tag = self:getPoolTagByName("DrawCard_Diamond_1")
		end

		self:onClickTab(nil, tag)

		if self._tabBtnWidget then
			local tabBtn = self._tabBtnWidget._tabBtns

			if tabBtn[1] then
				storyDirector:setClickEnv("recruitMain.friendBtn", tabBtn[1], function (sender, eventType)
					self:onClickTab(nil, 1)
				end)
			end

			if tabBtn[2] then
				storyDirector:setClickEnv("recruitMain.friendBtn", tabBtn[2], function (sender, eventType)
					self:onClickTab(nil, 2)
				end)
			end
		end

		self._tabBtnWidget:selectTabByTag(self._curTabType)

		local btnBack = self:getView():getChildByFullName("topinfo_node.back_btn")

		storyDirector:setClickEnv("recruitMain.btnBack", btnBack, function (sender, eventType)
			AudioEngine:getInstance():playEffect("Se_Click_Close_1", false)
			self:onClickBack()
		end)

		local sequence = cc.Sequence:create(cc.DelayTime:create(0.5), cc.CallFunc:create(function ()
			local recruitBtn1 = self:getView():getChildByFullName("main.node1.recruitBtn1")

			storyDirector:setClickEnv("recruitMain.recruitBtn1", recruitBtn1, function (sender, eventType)
				AudioEngine:getInstance():playEffect("Se_Click_Common_1", false)
				self:onRecruit1Clicked()

				if SDKHelper and SDKHelper:isEnableSdk() then
					SDKHelper:postAfData({
						eventKey = "Gacha_First"
					})
				end
			end)

			local recruitBtn2 = self:getView():getChildByFullName("main.node2.recruitBtn2")

			storyDirector:setClickEnv("recruitMain.recruitBtn2", recruitBtn2, function (sender, eventType)
				AudioEngine:getInstance():playEffect("Se_Click_Common_1", false)
				self:onRecruit2Clicked()
			end)

			local recruitBtn3 = self:getView():getChildByFullName("main.node3")

			storyDirector:setClickEnv("recruitMain.recruitBtn3", recruitBtn3, function (sender, eventType)
				AudioEngine:getInstance():playEffect("Se_Click_Common_1", false)
				self:onRecruit1Clicked()

				if SDKHelper and SDKHelper:isEnableSdk() then
					SDKHelper:postAfData({
						eventKey = "Gacha_First"
					})
				end
			end)
			storyDirector:notifyWaiting("enter_recruitMain_view")
		end))

		self:getView():runAction(sequence)

		local __onClickSkip = self.onClickSkip
		local this = self

		function self.onClickSkip()
			__onClickSkip(this)
			StatisticSystem:send({
				point = "guide_main_recruit_13",
				type = "loginpoint"
			})
		end
	end
end

function RecruitMainMediator:setupResultClickEnvs()
	if GameConfigs.closeGuide then
		return
	end

	local storyDirector = self:getInjector():getInstance(story.StoryDirector)
	local view = self:getView()
	local btn = view:getChildByFullName("guideNode")

	if btn then
		storyDirector:setClickEnv("recruitHeroDiamondResul.okBtn", btn, function (sender, eventType)
			AudioEngine:getInstance():playEffect("Se_Click_Common_1", false)
			self:onClickClose(sender, eventType)
		end)
	end

	storyDirector:notifyWaiting("enter_recruitHeroDiamondResul_view")
end
