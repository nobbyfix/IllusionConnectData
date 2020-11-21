PetRaceOverLayer = class("PetRaceOverLayer", DmBaseUI)

PetRaceOverLayer:has("_petRaceSystem", {
	is = "r"
}):injectWith("PetRaceSystem")

local kBtnHandlers = {}
local __topThreePos = {
	{
		{
			-45,
			190
		}
	},
	{
		{
			0,
			100
		},
		{
			-80,
			210
		}
	},
	{
		{
			10,
			50
		},
		{
			-95,
			220
		},
		{
			-20,
			175
		}
	}
}
local __topThreeZorder = {
	3,
	1,
	2
}
local kCellWidth = 280
local kCellHeight = 113
local kCellGap = 0

function PetRaceOverLayer:initialize(data)
	super.initialize(self)
	self:setView(data.view)
	self:mapButtonHandlersClick(kBtnHandlers)
	AdjustUtils.adjustLayoutUIByRootNode(self:getView())
end

function PetRaceOverLayer:userInject()
	self:intiView()
end

function PetRaceOverLayer:intiView()
	local nodeRank = self:getView():getChildByFullName("Panel_base.Node_RankF")
end

function PetRaceOverLayer:refreshView()
	self:refreshTopThreeInfo()
	self:refreshEightRank()
end

function PetRaceOverLayer:refreshTopThreeInfo()
	local node_topThree = self:getView():getChildByFullName("Panel_base.Node_RankT")
	local rankList = self._petRaceSystem:getEightRankData()
	local allIdList = {
		{
			"ZTXChang"
		},
		{
			"ZTXChang",
			"FTLEShi"
		},
		{
			"ZTXChang",
			"FTLEShi",
			"CLMan"
		}
	}

	for i = 1, 3 do
		local role = node_topThree:getChildByName("role_" .. i)
		local text_roleName = role:getChildByFullName("Text_roleName")
		local text_clubName = role:getChildByFullName("Text_clubName")
		local panel_icon = role:getChildByFullName("Panel_icon")
		local node_icon = role:getChildByFullName("Node_Icon")

		node_icon:removeAllChildren()

		local info = rankList[i]

		if info then
			text_roleName:setString(info.nickname)

			local clubStr = info.clubName

			if info.clubName == nil or info.clubName == "" then
				clubStr = Strings:get("Petrace_Text_78")
			end

			text_clubName:setString(clubStr)

			local showId, modelId = self:getBoardHero(info)
			local idList = {
				showId
			}
			local modelIdList = {
				modelId
			}
			local posList = __topThreePos[#idList]
			local info = {
				iconType = "Bust14",
				idList = idList,
				modelIdList = modelIdList,
				offsetList = posList,
				stencil = panel_icon
			}
			local realImgRole = self:createTopThreeIcon(info)

			realImgRole:addTo(node_icon):center(node_icon:getContentSize())
		else
			text_clubName:setString(Strings:get("Petrace_Text_94"))
			text_roleName:setString(Strings:get("Petrace_Text_94"))
		end

		for j = 1, 3 do
			local image_rank = role:getChildByFullName("Image_rank" .. j)

			if j == i then
				image_rank:setVisible(true)
			else
				image_rank:setVisible(false)
			end
		end
	end
end

function PetRaceOverLayer:getBoardHero(info)
	local showHeroId = nil
	local finalEightInfo = self._petRaceSystem:getFinalVO() or {}
	local userList = finalEightInfo.userList or {}
	local modelId = nil

	for k, v in pairs(userList) do
		if v.rid == info.rid then
			if v.showSurface then
				modelId = ConfigReader:getDataByNameIdAndKey("Surface", v.showSurface, "Model")
			end

			showHeroId = v.showId

			break
		end
	end

	return showHeroId, modelId
end

function PetRaceOverLayer:showTip(str)
	self:dispatch(ShowTipEvent({
		duration = 0.5,
		tip = str
	}))
end

function PetRaceOverLayer:getFinalEmbattles(info)
	local finalEightInfo = self._petRaceSystem:getFinalVO() or {}
	local userList = finalEightInfo.userList or {}
	local list = {}
	local embattle = nil

	for k, v in pairs(userList) do
		if v.rid == info.rid then
			local maxNum = 0
			local finalEmbattle = v.finalEmbattle or {}

			for kk, vv in pairs(finalEmbattle) do
				if maxNum < vv.combat then
					embattle = vv.embattle
					maxNum = vv.combat
				end
			end

			break
		end
	end

	if embattle then
		for k, v in pairs(embattle) do
			local heroId = v.heroId
			list[#list + 1] = heroId
		end
	end

	return list
end

function PetRaceOverLayer:getRoleModel(heroId, node_parent)
	local roleModel = IconFactory:getRoleModelByKey("HeroBase", heroId)
	local hero = RoleFactory:createHeroAnimation(roleModel)

	hero:setScale(0.6)
	hero:addTo(node_parent, 1):center(node_parent:getContentSize())
	hero:setAnchorPoint(cc.p(0.5, 0))
end

function PetRaceOverLayer:refreshEightRank()
	local rankList = self._petRaceSystem:getEightRankData()
	local nodeRank = self:getView():getChildByFullName("Panel_base.Node_RankF")

	for i = 1, 5 do
		local nodeBase = nodeRank:getChildByFullName("Node_" .. i)
		local text_name = nodeBase:getChildByFullName("Text_name")
		local node_head = nodeBase:getChildByFullName("Node_head")

		node_head:removeAllChildren()
		node_head:setScale(1)

		local info = rankList[i + 3]

		if info then
			local heroIcon = self:getRoleIcon(info.headImage)

			node_head:addChild(heroIcon)
			heroIcon:setPosition(cc.p(3, 8))
			text_name:setString(info.nickname or "")
		else
			text_name:setString(Strings:get("Petrace_Text_94"))
		end
	end
end

function PetRaceOverLayer:onClickTopThreeOne(sender, eventType)
	self:showPlayerInfoByIndex(1)
end

function PetRaceOverLayer:onClickTopThreeTwo(sender, eventType)
	self:showPlayerInfoByIndex(2)
end

function PetRaceOverLayer:onClickTopThreeThr(sender, eventType)
	self:showPlayerInfoByIndex(3)
end

function PetRaceOverLayer:showPlayerInfoByIndex(index)
end

function PetRaceOverLayer:createTopThreeIcon(info)
	local type = info.iconType or 1
	local offsetList = info.offsetList
	local scaleTo = 1

	for k, v in pairs(info.idList) do
		local id = ConfigReader:getDataByNameIdAndKey("HeroBase", v, "RoleModel")
		local rolePicId = ConfigReader:getDataByNameIdAndKey("RoleModel", id, IconFactory.kIconType[type] or type)
		local picInfo = ConfigReader:getRecordById("SpecialPicture", rolePicId)
		local contentScale = picInfo.zoom or 1

		if scaleTo < 1 / contentScale then
			scaleTo = 1 / contentScale
		end
	end

	local showSize = info.stencil:getContentSize()
	local rtx = cc.RenderTexture:create(showSize.width * scaleTo, showSize.height * scaleTo, cc.TEXTURE2_D_PIXEL_FORMAT_RGB_A8888)
	local topPic = cc.Sprite:createWithSpriteFrameName("smzb_bg_bzdi_zhezhao.png")

	topPic:setBlendFunc(cc.blendFunc(gl.ZERO, gl.SRC_ALPHA))
	topPic:setPosition(cc.p(showSize.width * scaleTo / 2, showSize.height * scaleTo / 2))
	topPic:setScaleY(1.5 * scaleTo)
	topPic:setScaleX(scaleTo)

	local index = 1
	local heroAll = {}
	local nodeBase = cc.Node:create()

	nodeBase:setScale(scaleTo)

	for k, v in pairs(info.idList) do
		local surfaceModelId = info.modelIdList[k]
		local id = ConfigReader:getDataByNameIdAndKey("HeroBase", v, "RoleModel")
		id = surfaceModelId or id
		local rolePicId = ConfigReader:getDataByNameIdAndKey("RoleModel", id, IconFactory.kIconType[type] or type)
		local modelID = ConfigReader:getDataByNameIdAndKey("RoleModel", id, "Model")
		local commonResource = ConfigReader:getDataByNameIdAndKey("RoleModel", id, "CommonResource")

		if not commonResource or commonResource == "" then
			commonResource = modelID
		end

		local picInfo = ConfigReader:getRecordById("SpecialPicture", rolePicId)
		local path = string.format("%s%s/%s.png", IconFactory.kIconPathCfg[tonumber(picInfo.Path)], commonResource, picInfo.Filename)
		local sprite = ccui.ImageView:create(path)
		local spriteSize = sprite:getContentSize()
		local coordinates = picInfo.Coordinates or {}
		local contentScale = picInfo.zoom or 1

		sprite:setScale(contentScale)
		sprite:setAnchorPoint(cc.p(0, 0))

		local posX = 0 - (coordinates[1] or 0)
		local posY = 0 - (coordinates[2] or 0)
		local offset = offsetList[index]

		if offset then
			posX = posX + offset[1]
			posY = posY + offset[2]
		end

		sprite:setPosition(cc.p(posX, posY))
		nodeBase:addChild(sprite, __topThreeZorder[index])

		index = index + 1
	end

	rtx:begin()
	nodeBase:visit()
	topPic:visit()
	rtx:endToLua()

	local texture = rtx:getSprite():getTexture()

	texture:setAntiAliasTexParameters()

	local retval = cc.Sprite:createWithTexture(texture)

	retval:setFlippedY(true)
	retval:setScale(1 / scaleTo)

	return retval
end

function PetRaceOverLayer:getRoleIcon(headId)
	local headIcon = IconFactory:createPetRaceHeadImage({
		id = headId
	})

	return headIcon
end
