PlayerInfoMediator = class("PlayerInfoMediator", DmPopupViewMediator, _M)

PlayerInfoMediator:has("_developSystem", {
	is = "r"
}):injectWith("DevelopSystem")
PlayerInfoMediator:has("_friendSystem", {
	is = "r"
}):injectWith("FriendSystem")
PlayerInfoMediator:has("_chatSystem", {
	is = "r"
}):injectWith("ChatSystem")

local kBtnHandlers = {}
local constellationAge = {
	120,
	219,
	321,
	420,
	521,
	622,
	723,
	823,
	923,
	1024,
	1123,
	1222
}
local constellation = {
	"Aquarius",
	"Pisces",
	"Aries",
	"Taurus",
	"Gemini",
	"Cancer",
	"Leo",
	"Virgo",
	"Libra",
	"Scorpio",
	"Sagittarius",
	"Capricorn"
}

function PlayerInfoMediator:initialize()
	super.initialize(self)
end

function PlayerInfoMediator:dispose()
	self._viewClose = true

	super.dispose(self)
end

function PlayerInfoMediator:onRemove()
	super.onRemove(self)
end

function PlayerInfoMediator:onRegister()
	super.onRegister(self)
	self:mapButtonHandlersClick(kBtnHandlers)
	self:bindWidget("bg.btn_Ok", OneLevelMainButton, {
		handler = {
			clickAudio = "Se_Click_Confirm",
			func = bind1(self.onOkClicked, self)
		}
	})
	self:bindWidget("bg.btn_chat", OneLevelMainButton, {
		handler = {
			clickAudio = "Se_Click_Common_1",
			func = bind1(self.onSendMsgClicked, self)
		}
	})
	self:bindWidget("bg.btn_add", OneLevelViceButton, {
		handler = {
			clickAudio = "Se_Click_Common_1",
			func = bind1(self.onAddFriendClicked, self)
		}
	})
end

function PlayerInfoMediator:userInject()
	self._heroSystem = self._developSystem:getHeroSystem()
	self._player = self._developSystem:getPlayer()
end

function PlayerInfoMediator:enterWithData(data)
	self._bg = self:getView():getChildByName("bg")
	local text = self._bg:getChildByFullName("Text_107")

	text:setAdditionalKerning(35)

	local bgNode = self._bg:getChildByFullName("tipnode")

	bindWidget(self, bgNode, PopupNormalWidget, {
		btnHandler = {
			clickAudio = "Se_Click_Close_2",
			func = bind1(self.onOkClicked, self)
		},
		title = Strings:get("RANK_PLAYER_VIEW_TITLE"),
		title1 = Strings:get("UITitle_EN_Wanjiaxinxi"),
		bgSize = {
			width = 761,
			height = 580
		}
	})

	self._record = data
	local extraData = {
		gender = data:getGender(),
		birthday = data:getBirthday(),
		city = data:getCity(),
		tags = data:getTags()
	}
	self._baseData = extraData

	self:initRoleInfo()
	self:initBaseInfo()
	self:initTeamInfo()
end

function PlayerInfoMediator:addShieldView()
	if self:getView():getChildByName("shieldBtn") then
		return
	end

	local button = ccui.Button:create()

	button:addTo(self:getView()):center(self:getView():getContentSize())
	button:setTitleText("以后不想见到他")
	button:setTitleColor(cc.c3b(255, 0, 0))
	button:setName("shieldBtn")
	button:addTouchEventListener(function (sender, eventType)
		if eventType == ccui.TouchEventType.ended then
			self._chatSystem:getChat():setShieldSender(self._record:getRid())
			self:dispatch(ShowTipEvent({
				tip = "以后不再收到他的消息",
				duration = 0.35
			}))
		end
	end)
	button:setScale(2)
end

function PlayerInfoMediator:initRoleInfo()
	local name = self._bg:getChildByFullName("name")
	local group = self._bg:getChildByFullName("group_name")
	local combat = self._bg:getChildByFullName("fighting_bg.fighting_number")
	local rank = self._bg:getChildByFullName("rank_bg.rank_content")
	local slogan = self._bg:getChildByName("slogan")
	local playerIconBg = self._bg:getChildByName("icon_top")
	local level = self._bg:getChildByName("level")
	self._masterIconBg = self._bg:getChildByFullName("teamInfo.icon_bottom")
	local vip = self._bg:getChildByFullName("vip_num")

	vip:setVisible(false)

	local friendImg = self._bg:getChildByFullName("friendImg")

	friendImg:setVisible(false)
	rank:setString(self._record:getRank())
	name:setString(self._record:getName())

	local clubName = self._record:getClubName()

	if clubName == nil or clubName == "" then
		clubName = Strings:get("ARENA_NO_RANK")
	end

	group:setString(clubName)
	combat:setString(self._record:getCombat())
	level:setString("Lv." .. self._record:getLevel())
	slogan:setString(self._record:getSlogan())
	slogan:enableOutline(cc.c4b(0, 0, 0, 219.29999999999998, 1))

	local headIcon = IconFactory:createPlayerIcon({
		frameStyle = 3,
		clipType = 1,
		headFrameScale = 0.415,
		id = self._record:getHeadId(),
		size = playerIconBg:getContentSize(),
		headFrameId = self._record:getHeadFrame()
	})

	headIcon:setScale(1.15)
	headIcon:addTo(playerIconBg):center(playerIconBg:getContentSize())

	local chatBtn = self._bg:getChildByName("btn_chat")
	local friendBtn = self._bg:getChildByName("btn_add")
	local btnOk = self._bg:getChildByName("btn_Ok")

	chatBtn:setVisible(self._record:getRid() ~= self._player:getRid())
	friendBtn:setVisible(self._record:getRid() ~= self._player:getRid())

	local isFriend = self._friendSystem:checkIsFriend(self._record:getRid())

	if friendBtn:isVisible() and isFriend then
		friendBtn:setVisible(false)
		chatBtn:setPositionX(btnOk:getPositionX())
		friendImg:setVisible(true)
	end

	if self._record.nochat then
		chatBtn:setVisible(false)
		friendBtn:setPositionX(btnOk:getPositionX())
	end

	btnOk:setVisible(not friendBtn:isVisible() and not chatBtn:isVisible())
end

function PlayerInfoMediator:initBaseInfo()
	local genderView = self._bg:getChildByName("gender")
	local birthdayView = self._bg:getChildByName("birthdayImg")
	local areaView = self._bg:getChildByName("areaImg")
	local playerBaseData = self._baseData

	if not playerBaseData then
		return
	end

	genderView:ignoreContentAdaptWithSize(true)

	if playerBaseData.gender == 1 then
		genderView:setVisible(true)
		genderView:loadTexture("sz_icon_nan.png", ccui.TextureResType.plistType)
	elseif playerBaseData.gender == 2 then
		genderView:setVisible(true)
		genderView:loadTexture("sz_icon_nv.png", ccui.TextureResType.plistType)
	else
		genderView:setVisible(false)
	end

	if playerBaseData.birthday and playerBaseData.birthday ~= "" then
		birthdayView:setVisible(true)

		local birthdayTab, constellationStr = self:parseTimeStr(playerBaseData.birthday)

		birthdayView:getChildByName("birthday"):setString(tostring(birthdayTab.month) .. Strings:get("Setting_UI_Month") .. tostring(birthdayTab.day) .. Strings:get("Setting_UI_Day") .. " " .. constellationStr)
	else
		birthdayView:setVisible(false)
	end

	if playerBaseData.city and playerBaseData.city ~= "" then
		areaView:setVisible(true)

		local parts = string.split(playerBaseData.city, "-")
		local areaInfo = ConfigReader:getRecordById("PlayerPlace", parts[1])
		local str1 = Strings:get(areaInfo.Provinces)
		local cityInfo = areaInfo.City[tonumber(parts[2])]
		local str2 = Strings:get(cityInfo)

		areaView:getChildByName("area"):setString(str1 .. " " .. str2)
	else
		areaView:setVisible(false)
	end

	if playerBaseData.tags and playerBaseData.tags ~= "" then
		local cjson = require("cjson.safe")
		local playerTags = cjson.decode(playerBaseData.tags)
		local playerTagsArray = ConfigReader:getDataByNameIdAndKey("ConfigValue", "Player_Tag", "content")
		local cloneCell = self:getView():getChildByName("cell")

		for k, v in ipairs(playerTags) do
			local _cell = cloneCell:clone()

			_cell:getChildByName("text"):setString(Strings:get(playerTagsArray[v]))
			_cell:addTo(self._bg)
			_cell:setPosition(cc.p(454 + 86 * (k - 1), 412))
		end
	end
end

function PlayerInfoMediator:initTeamInfo()
	local master = self._record:getMaster()

	if master then
		local roleModel = ConfigReader:requireDataByNameIdAndKey("MasterBase", master[1], "RoleModel")
		local info = {
			stencil = 6,
			iconType = "Bust5",
			id = roleModel,
			size = cc.size(426, 115)
		}
		local masterIcon = IconFactory:createRoleIconSprite(info)

		masterIcon:setAnchorPoint(cc.p(0, 0))
		masterIcon:setPosition(cc.p(0, 0))
		self._masterIconBg:addChild(masterIcon)

		local teamBg = self._bg:getChildByFullName("teamInfo")
		local text = teamBg:getChildByName("text")

		text:setTextColor(cc.c4b(164, 164, 164, 33.15))
		text:enableOutline(cc.c4b(255, 255, 255, 255), 2)

		local heros = self._record:getHeroes()

		for k, v in ipairs(heros) do
			local petBg = teamBg:getChildByName("pet_" .. k)
			local heroInfo = {
				id = v[1],
				quality = tonumber(v[4]),
				rarity = tonumber(v[5])
			}

			if self._record:getRid() == self._player:getRid() then
				local heroModel = self._heroSystem:getHeroById(v[1])
				heroInfo.roleModel = heroModel:getModel()
			end

			local petNode = IconFactory:createHeroLargeNotRemoveIcon(heroInfo, {
				hideLevel = true,
				hideStar = true,
				hideName = true
			})

			petNode:setScale(0.35)
			petNode:addTo(petBg):center(petBg:getContentSize())
			petNode:setPositionY(petNode:getPositionY() - 5)
		end
	end
end

function PlayerInfoMediator:parseTimeStr(timeStr)
	local _tab = {}
	local _str = nil
	local strTab = string.split(timeStr, "-")
	_tab.year = tonumber(strTab[1])
	_tab.month = tonumber(strTab[2])
	_tab.day = tonumber(strTab[3])
	local tag = 0
	local _compData = _tab.month * 100 + _tab.day

	for k, v in ipairs(constellationAge) do
		if v <= _compData then
			tag = tag + 1
		end
	end

	if tag == 0 then
		tag = 12
	end

	_str = Strings:get(constellation[tag])

	return _tab, _str
end

function PlayerInfoMediator:onSendMsgClicked()
	if self._record.lastView ~= "friendChatView" then
		local data = {
			rid = self._record:getRid(),
			nickname = self._record:getNickName(),
			level = self._record:getLevel(),
			combat = self._record:getCombat(),
			headImage = self._record:getHeadId(),
			vipLevel = self._record:getVipLevel(),
			heroes = self._record:getHeroes(),
			master = self._record:getMaster(),
			clubName = self._record:getClubName(),
			slogan = self._record:getSlogan(),
			online = self._record:getOnline(),
			lastOfflineTime = self._record:getLastOfflineTime(),
			isFriend = self._record:getIsFriend(),
			close = self._record:getIsFriend() == 1 and self._record:getFamiliarity() or nil
		}

		self._friendSystem:addRecentFriend(data)

		local data = {
			subTabType = 2,
			selectFriendIndex = 1,
			tabType = kFriendType.kRecent
		}

		self._friendSystem:tryEnter(data)
	end

	self:close()
end

function PlayerInfoMediator:onAddFriendClicked()
	local record = Friend:new()

	record:synchronize({
		rid = self._record:getRid(),
		nickname = self._record:getNickName(),
		vip = self._record:getVipLevel(),
		level = self._record:getLevel(),
		combat = self._record:getCombat(),
		headImage = self._record:getHeadId(),
		clubName = self._record:getClubName()
	})

	local view = self:getInjector():getInstance("FriendAddPopView")

	self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
		transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
	}, record))
end

function PlayerInfoMediator:onOkClicked()
	self:close()
end
