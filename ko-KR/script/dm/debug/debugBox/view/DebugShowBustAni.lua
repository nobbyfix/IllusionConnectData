DebugShowBustAni = class("DebugShowBustAni", DebugViewTemplate, _M)

function DebugShowBustAni:initialize()
	self._viewConfig = {
		{
			default = "Model_SYAi",
			name = "modelId",
			title = "英魂id",
			type = "Input"
		},
		{
			default = "5",
			name = "bustIndex",
			title = "bustIndex",
			type = "Input"
		},
		{
			default = "0",
			name = "ispos",
			title = "0读配置 1位置 2偏移",
			type = "Input"
		},
		{
			default = "0,0,1",
			name = "pos",
			title = "x,y,zoom",
			type = "Input"
		},
		{
			default = "0",
			name = "useAnim",
			title = "0静态 1动态",
			type = "Input"
		}
	}
end

function DebugShowBustAni:onClick(data)
	self:createBustAnim(data)
end

function DebugShowBustAni:createBustAnim(data)
	local info = {
		id = data.modelId,
		iconType = "Bust" .. data.bustIndex,
		useAnim = data.useAnim == "1" and true or false,
		inputIsPos = data.ispos,
		inputPos = data.pos
	}
	local bustIndex = data.bustIndex
	bustIndex = tonumber(bustIndex)

	if bustIndex == 1 then
		info.stencil = 1
		info.size = cc.size(246, 206)
	elseif bustIndex == 2 then
		-- Nothing
	elseif bustIndex == 3 then
		local img = ccui.ImageView:create("asset/stencil/yh_img_hzz.png")
		info.stencil = img
	elseif bustIndex == 4 then
		-- Nothing
	elseif bustIndex == 5 then
		info.stencil = 1
		info.size = cc.size(368, 446)
	elseif bustIndex == 6 then
		-- Nothing
	elseif bustIndex == 7 then
		info.stencil = 1
		info.size = cc.size(245, 336)
	elseif bustIndex == 8 then
		info.stencil = 2
		info.size = cc.size(234, 234)
	elseif bustIndex == 9 then
		-- Nothing
	elseif bustIndex == 10 then
		-- Nothing
	elseif bustIndex == 11 then
		info.size = cc.size(160, 58)
	elseif bustIndex == 12 then
		info.stencil = 6
		info.size = cc.size(188, 274)
	elseif bustIndex == 13 then
		info.stencil = 1
		info.size = cc.size(185, 132)
	elseif bustIndex == 14 then
		-- Nothing
	elseif bustIndex == 15 then
		-- Nothing
	elseif bustIndex == 16 then
		info.stencil = 1
		info.size = cc.size(375, 446)
	end

	if bustIndex == 11 then
		local playerHeadImgConfig = ConfigReader:getRecordById("PlayerHeadModel", info.id)

		if not playerHeadImgConfig then
			self:dispatch(ShowTipEvent({
				tip = "参数错误"
			}))

			return
		end
	else
		local rolePicId = ConfigReader:getDataByNameIdAndKey("RoleModel", info.id, info.iconType)
		local r = string.split(info.inputPos, ",")

		if bustIndex > 16 or info.id == "" or not rolePicId or #r ~= 3 then
			self:dispatch(ShowTipEvent({
				tip = "参数错误"
			}))

			return
		end
	end

	local winSize = cc.Director:getInstance():getWinSize()
	self._parent = cc.Director:getInstance():getRunningScene()
	self._mainPanel = ccui.Layout:create()

	self._mainPanel:setContentSize(cc.size(winSize.width, winSize.height))
	self._mainPanel:setTouchEnabled(true)
	self._parent:addChild(self._mainPanel, 999999)

	if self._mainPanel then
		self._mainPanel:setBackGroundColorType(1)
		self._mainPanel:setBackGroundColor(cc.c3b(200, 0, 0))
		self._mainPanel:setBackGroundColorOpacity(180)
	end

	local closeBtn = ccui.Button:create(DebugBoxTool:getResPath("pic_dm_debug_ok_normal.png"), DebugBoxTool:getResPath("pic_dm_debug_ok_press.png"), "")

	closeBtn:setName("closeBtn")
	closeBtn:setScale(2)
	self._mainPanel:addChild(closeBtn, 0)
	closeBtn:setPosition(winSize.width - 100, winSize.height - 100)
	closeBtn:addTouchEventListener(function (sender, eventType)
		if eventType == ccui.TouchEventType.ended then
			self._mainPanel:removeFromParent(true)
		end
	end)

	local heroIcon = nil

	if bustIndex == 11 then
		heroIcon, oldIcon = self:createRactHeadImage(info)

		oldIcon:offset(30, 0)
	elseif bustIndex == 14 then
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
		local img = ccui.Layout:create()

		img:setContentSize(cc.size(240, 370))

		local posList = __topThreePos[1]
		info.offsetList = posList
		info.stencil = img
		heroIcon = self:createTopThreeIcon(info)
	else
		heroIcon = self:createRoleIconSprite(info)
	end

	if bustIndex == 4 then
		heroIcon:addTo(self._mainPanel)
		heroIcon:setPosition(cc.p(442, 191))
	elseif bustIndex == 6 then
		heroIcon:addTo(self._mainPanel)
		heroIcon:setPosition(cc.p(618, 20))
	elseif bustIndex == 9 then
		heroIcon:setScale(0.8)
		heroIcon:addTo(self._mainPanel)
		heroIcon:setPosition(cc.p(345, 234))
	else
		heroIcon:addTo(self._mainPanel):center(self._mainPanel:getContentSize())
	end
end

function DebugShowBustAni:createRoleIconSprite(info)
	local id = info.id
	local type = info.iconType or 1
	local rolePicId = ConfigReader:getDataByNameIdAndKey("RoleModel", id, IconFactory.kIconType[type] or type)

	assert(rolePicId and rolePicId ~= "", string.format("未找到RoleModel表中所配字段ID:%s,字段：%s", id, IconFactory.kIconType[type] or type))

	local modelID = ConfigReader:getDataByNameIdAndKey("RoleModel", id, "Model")
	local commonResource = ConfigReader:getDataByNameIdAndKey("RoleModel", id, "CommonResource")

	if not commonResource or commonResource == "" then
		commonResource = modelID
	end

	local picInfo = ConfigReader:getRecordById("SpecialPicture", rolePicId)

	assert(picInfo, string.format("未找到SpecialPicture表中所配字段ID:%s", rolePicId))

	local path = string.format("%s%s/%s.png", IconFactory.kIconPathCfg[tonumber(picInfo.Path)], commonResource, picInfo.Filename)
	local animPath, sprite, spineani = nil

	if info.useAnim then
		animPath = string.format("asset/anim/%s.skel", picInfo.Filename)
		local imagePath = string.format("asset/anim/%s.png", picInfo.Filename)
		local plistPath = string.format("asset/anim/%s.plist", picInfo.Filename)
		local imageAlphaPath = string.format("asset/anim/%s.png@alpha", picInfo.Filename)

		if (DEBUG ~= 0 or cc.FileUtils:getInstance():isFileExist(imageAlphaPath)) and cc.FileUtils:getInstance():isFileExist(animPath) and cc.FileUtils:getInstance():isFileExist(imagePath) and cc.FileUtils:getInstance():isFileExist(plistPath) then
			local spineNode = sp.SkeletonAnimation:create(animPath)

			spineNode:playAnimation(0, "", true)
			spineNode:setTag(666)

			spineani = spineNode
			local boundingBox = spineNode:getBoundingBox()

			spineNode:playAnimation(0, "animation", true)

			local size = cc.size(boundingBox.width, boundingBox.height)
			local node = self:createBaseNode(true)

			node:setTouchEnabled(false)
			node:setContentSize(size)
			node:setAnchorPoint(cc.p(0.5, 0.5))
			spineNode:addTo(node)
			spineNode:setPosition(size.width * 0.5, 0)

			sprite = node
		end
	end

	sprite = sprite or cc.Sprite:create(path)

	if not sprite then
		sprite = cc.Sprite:create()

		CommonUtils.uploadDataToBugly("IconFactory:createRoleIconSprite", "未找到SpecialPicture表中所配文件：" .. path)
	end

	local spriteSize = sprite:getContentSize()
	local x = 0
	local y = 0

	if info.inputIsPos == "0" then
		local coordinates = picInfo.Coordinates or {}
		x = coordinates[1] or 0
		y = coordinates[2] or 0
	elseif info.inputIsPos == "1" then
		local p = string.split(info.inputPos, ",")
		x = tonumber(p[1]) or 0
		y = tonumber(p[2]) or 0
	end

	if info.useAnim and (x ~= 0 or y ~= 0) and picInfo.bustani then
		x = picInfo.bustani[0] or 0
		y = picInfo.bustani[1] or 0
	end

	local clipSzie = info.size

	if not clipSzie and (x ~= 0 or y ~= 0) then
		clipSzie = cc.size(spriteSize.width - x, spriteSize.height - y)
	end

	if info.stencil then
		if _G.type(info.stencil) == "number" then
			info.stencil = self:getStencilByType(info.stencil, info.size)
		end

		local contentScale = nil

		if info.inputIsPos == "0" then
			contentScale = picInfo.zoom or 1
		else
			local p = string.split(info.inputPos, ",")
			contentScale = tonumber(tonumber(p[3])) or 1
		end

		local size = info.stencil:getContentSize()
		size.width = size.width * info.stencil:getScaleX()
		size.height = size.height * info.stencil:getScaleY()

		sprite:setAnchorPoint(cc.p(x / (spriteSize.width * contentScale), y / (spriteSize.height * contentScale)))

		if info.stencilFlip then
			sprite:setFlippedX(info.stencilFlip)
		end

		sprite:setScale(contentScale)
		info.stencil:setPosition(0, 0)
		info.stencil:setAnchorPoint(cc.p(0, 0))

		if info.offset then
			local posX = sprite:getPositionX() + info.offset[1]
			local posY = sprite:getPositionY() + info.offset[2]

			sprite:setPosition(cc.p(posX, posY))
		end

		sprite = ClippingNodeUtils.getClippingNodeByData({
			stencil = info.stencil,
			content = sprite
		}, info.alpha)

		sprite:setContentSize(size)
		sprite:setAnchorPoint(cc.p(0, 0))
		sprite:setIgnoreAnchorPointForPosition(false)
	elseif clipSzie then
		local offsetX = math.max(0, x)
		local offsetY = math.max(0, spriteSize.height - y - clipSzie.height)
		local width = x < 0 and clipSzie.width + x or clipSzie.width
		local height = spriteSize.height - y - clipSzie.height < 0 and clipSzie.height + spriteSize.height - y - clipSzie.height or clipSzie.height

		sprite:setTextureRect(cc.rect(offsetX, offsetY, math.min(width, spriteSize.width - offsetX), height))
	end

	if picInfo.Deviation or picInfo.zoom then
		if picInfo.zoom and not info.stencil then
			if info.inputIsPos == "0" then
				sprite:setScale(picInfo.zoom)
			else
				local p = string.split(info.inputPos, ",")

				sprite:setScale(tonumber(tonumber(p[3])) or 1)
			end
		elseif not picInfo.Deviation then
			return sprite
		end

		local size = sprite:getContentSize()
		size.width = size.width * sprite:getScale()
		size.height = size.height * sprite:getScale()
		local x = picInfo.Deviation[1] or 0
		local y = picInfo.Deviation[2] or 0

		if info.inputIsPos == "2" then
			local p = string.split(info.inputPos, ",")
			x = tonumber(p[1]) or 0
			y = tonumber(p[2]) or 0
		end

		if info.useAnim and (x ~= 0 or y ~= 0) and picInfo.bustani then
			x = picInfo.bustani[0] or 0
			y = picInfo.bustani[1] or 0
		end

		local node = self:createBaseNode(true)

		node:setTouchEnabled(false)
		node:setContentSize(size)
		node:setAnchorPoint(cc.p(0.5, 0.5))
		sprite:setAnchorPoint(cc.p(0.5, 0.5))
		sprite:addTo(node)
		sprite:setPosition(x + size.width * 0.5, y + size.height * 0.5)

		sprite = node
	end

	return sprite, animPath, spineani, picInfo
end

function DebugShowBustAni:createBaseNode(isWidget)
	local node = nil

	if isWidget then
		node = ccui.Widget:create()
	else
		node = cc.Node:create()
	end

	node:setAnchorPoint(0.5, 0.5)
	node:setCascadeOpacityEnabled(true)

	return node
end

function DebugShowBustAni:getStencilByType(clipIndex, size)
	local info = IconFactory.kClikpStencil[clipIndex]
	local stencilPath = info.path
	local stencil = nil

	if clipIndex == 2 then
		local radius = (size and size.width or 100) * 0.5
		stencil = cc.DrawNode:create()

		stencil:drawSolidCircle(cc.p(radius, radius), radius, 0, 100, 1, 1, cc.c4f(1, 0, 0, 1))
		stencil:setContentSize(cc.size(radius * 2, radius * 2))
		stencil:setAnchorPoint(0.5, 0.5)
	else
		if info.scale9 then
			stencil = ccui.Scale9Sprite:create(info.scale9, stencilPath)
		else
			stencil = ccui.ImageView:create()

			stencil:loadTexture(stencilPath)
		end

		size = size or stencil:getContentSize()

		stencil:setContentSize(size)
	end

	return stencil
end

function DebugShowBustAni:createRactHeadImage(info)
	local playerHeadImgConfig = ConfigReader:getRecordById("PlayerHeadModel", info.id)
	local id = playerHeadImgConfig.HeroMasterId
	local imageType = playerHeadImgConfig.Type
	local icon, offset = nil

	if imageType == 1 then
		local modelId = IconFactory:getRoleModelByKey("HeroBase", id)
		info.id = modelId
		local i = {
			id = info.id,
			iconType = info.iconType,
			useAnim = info.useAnim,
			inputIsPos = info.inputIsPos,
			inputPos = info.inputPos
		}
		icon = self:createRoleIconSprite(i)
		offset = {
			0,
			0
		}
	elseif imageType == 2 then
		local modelId = ConfigReader:getDataByNameIdAndKey("MasterBase", id, "RoleModel")
		info.id = modelId
		local i = {
			id = info.id,
			iconType = info.iconType,
			useAnim = info.useAnim,
			inputIsPos = info.inputIsPos,
			inputPos = info.inputPos
		}
		icon = self:createRoleIconSprite(i)
		offset = {
			0,
			0
		}
	elseif imageType == 4 then
		local modelId = ConfigReader:getDataByNameIdAndKey("HeroAwaken", id, "ModelId")
		info.id = modelId
		local i = {
			id = info.id,
			iconType = info.iconType,
			useAnim = info.useAnim,
			inputIsPos = info.inputIsPos,
			inputPos = info.inputPos
		}
		icon = self:createRoleIconSprite(i)
	elseif imageType == 5 then
		local skinId = playerHeadImgConfig.SurfaceMasterId
		local modelId = ConfigReader:getDataByNameIdAndKey("Surface", skinId, "Model")
		info.id = modelId
		local i = {
			id = info.id,
			iconType = info.iconType,
			useAnim = info.useAnim,
			inputIsPos = info.inputIsPos,
			inputPos = info.inputPos
		}
		icon = self:createRoleIconSprite(i)
	else
		icon = cc.Sprite:create(playerHeadImgConfig.IconPath)

		icon:setScale(0.4)

		offset = {
			-40,
			10
		}
	end

	local oldIcon = icon
	icon = self:addStencilForIcon(icon, 1, info.size, offset)
	local node = self:createBaseNode(true)

	node:setTouchEnabled(false)

	local size = icon:getContentSize()

	node:setContentSize(size)
	icon:addTo(node):center(node:getContentSize())

	return node, oldIcon
end

function DebugShowBustAni:addStencilForIcon(node, clipIndex, size, offset)
	offset = offset or {}
	local stencil = self:getStencilByType(clipIndex, size)

	stencil:setAnchorPoint(cc.p(0, 0))

	size = size or stencil:getContentSize()
	local offsetX = offset[1] or 0
	local offsetY = offset[2] or 0

	node:setPosition(size.width * 0.5 + offsetX, size.height * 0.5 + offsetY)

	local clipSprite = ClippingNodeUtils.getClippingNodeByData({
		stencil = stencil,
		content = node
	})

	clipSprite:setContentSize(size)
	clipSprite:setAnchorPoint(cc.p(0.5, 0.5))

	return clipSprite
end

function DebugShowBustAni:createTopThreeIcon(info)
	local type = info.iconType or 1
	local offsetList = info.offsetList
	local scaleTo = 1
	local rolePicId = ConfigReader:getDataByNameIdAndKey("RoleModel", info.id, IconFactory.kIconType[type] or type)
	local picInfo = ConfigReader:getRecordById("SpecialPicture", rolePicId)

	if info.inputIsPos == "0" then
		local contentScale = picInfo.zoom or 1

		if scaleTo < 1 / contentScale then
			scaleTo = 1 / contentScale
		end
	else
		local p = string.split(info.inputPos, ",")
		local contentScale = tonumber(tonumber(p[3])) or 1

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

	local modelID = ConfigReader:getDataByNameIdAndKey("RoleModel", info.id, "Model")
	local commonResource = ConfigReader:getDataByNameIdAndKey("RoleModel", id, "CommonResource")

	if not commonResource or commonResource == "" then
		commonResource = modelID
	end

	local picInfo = ConfigReader:getRecordById("SpecialPicture", rolePicId)
	local path = string.format("%s%s/%s.png", IconFactory.kIconPathCfg[tonumber(picInfo.Path)], commonResource, picInfo.Filename)
	local sprite = ccui.ImageView:create(path)
	local spriteSize = sprite:getContentSize()
	local coordinates = nil

	if info.inputIsPos == "0" then
		coordinates = picInfo.Coordinates or {}
	elseif info.inputIsPos == "1" then
		coordinates = string.split(info.inputPos, ",")
	end

	local contentScale = nil

	if info.inputIsPos == "0" then
		contentScale = picInfo.zoom or 1
	else
		local p = string.split(info.inputPos, ",")
		contentScale = tonumber(tonumber(p[3])) or 1
	end

	sprite:setScale(contentScale)
	sprite:setAnchorPoint(cc.p(0, 0))

	local posX = 0 - (coordinates[1] or 0)
	local posY = 0 - (coordinates[2] or 0)
	local offset = offsetList[index]

	if offset then
		posX = posX + offset[1]
		posY = posY + offset[2]
	end

	local __topThreeZorder = {
		3,
		1,
		2
	}

	sprite:setPosition(cc.p(posX, posY))
	nodeBase:addChild(sprite, __topThreeZorder[index])

	index = index + 1

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
