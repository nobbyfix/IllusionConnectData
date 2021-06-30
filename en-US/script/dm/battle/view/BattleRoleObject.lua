require("dm.battle.view.BattleBehaviorNode")
require("dm.battle.view.widget.BattleRoleTopBar")
require("dm.battle.view.widget.BattleRoleIconBar")
require("dm.battle.view.widget.BattleBubbleWidget")

local specId = ""
local BuffColor = {
	Negative = "Negative",
	Red = {
		o_r = 96
	},
	Green = {
		o_r = -30,
		o_g = 70
	},
	Black = {
		g = 0.3,
		b = 0.3,
		contrast = 20,
		r = 0.3
	},
	Yellow = {
		o_g = 70,
		contrast = -30,
		o_r = 240
	},
	Purple = {
		o_r = 90,
		contrast = -30,
		o_b = 160
	},
	Statue = {
		o_g = 64,
		saturation = -100,
		o_r = 64,
		o_b = 64
	},
	Translucent = {
		a = 0.5
	},
	Invisible = {
		a = 0
	}
}
local kGravity = 14.700000000000001
local kMeasuringScale = 90
RoleType = {
	Hero = 2,
	Master = 1
}
local LiveState = {
	Lived = 1,
	Dead = -1,
	Fleeing = -3,
	Remove = -2,
	Dying = 0
}
local kTopBarHeight = 15
local cjson = require("cjson.safe")
BattleRoleObject = class("BattleRoleObject", DisposableObject, _M)

BattleRoleObject:has("_id", {
	is = "r"
})
BattleRoleObject:has("_homePlace", {
	is = "rw"
})
BattleRoleObject:has("_isLeftTeam", {
	is = "rw"
})
BattleRoleObject:has("_heroType", {
	is = "r"
})
BattleRoleObject:has("_context", {
	is = "rw"
})
BattleRoleObject:has("_battleGround", {
	is = "r"
})
BattleRoleObject:has("_liveState", {
	is = "r"
})
BattleRoleObject:has("_dataModel", {
	is = "r"
})
BattleRoleObject:has("_headWidget", {
	is = "rw"
})
BattleRoleObject:has("_heroHeadWidget", {
	is = "rw"
})
BattleRoleObject:has("_equipHpWidget", {
	is = "rw"
})
BattleRoleObject:has("_masterWidget", {
	is = "rw"
})
BattleRoleObject:has("_actionTransform", {
	is = "rw"
})
BattleRoleObject:has("_actionTransformRevise", {
	is = "rw"
})
BattleRoleObject:has("_isTeamFlipped", {
	is = "rwb"
})
BattleRoleObject:has("_roleAnim", {
	is = "r"
})
BattleRoleObject:has("_roleType", {
	is = "w"
})

local ROLE_ANIM_TAG = 100
local ROLE_TOP_ZORDER = 10
local kRelPosWithHeight = 0
local kRoleScale = 0.65

function BattleRoleObject:initialize(id, dataModel, viewContext)
	super.initialize(self)

	self._id = id
	self._dataModel = dataModel
	self._roleType = dataModel:getRoleType()
	self._isLeftTeam = self:isLeft()
	self._actionTransform = {}
	self._actionTransformRevise = {}

	self:setupViewContext(viewContext)

	self._buffMap = {}
	self._flyLabels = {}
	self._activeTags = {}
	self._activateNum = 0
	self._filmedNum = 0
	self._skillStateTag = {}
	self._liveState = LiveState.Lived
	local modelId = tostring(dataModel:getModelId())
	local modelCfg = self._dataModel:getModelConfig()

	assert(modelCfg ~= nil, "Model with modelId: " .. modelId .. " not exists!")

	self._modelScale = modelCfg.Zoom or 1
	self._modelScale = self._modelScale * (dataModel:getModelScale() or 1)

	if dataModel:getIsBattleField() then
		self._modelScale = 1.5
	end

	self._root = cc.Node:create()

	self._root:setLocalZOrder(math.abs(dataModel:getCellId()))

	self._node = cc.Node:create()

	self._node:addTo(self._root)

	self._activeNode = cc.Node:create()

	self._activeNode:addTo(self._node)

	self._modelNode = cc.Node:create()

	self._activeNode:addChild(self._modelNode, 0)
	self:positRoleNode()

	self._effectNode = cc.Node:create()

	self._effectNode:addTo(self._activeNode, 101)

	self._backFlaNode = cc.Node:create()

	self._backFlaNode:addTo(self._node, -1)
	self._backFlaNode:setVisible(false)

	self._frontFlaNode = cc.Node:create()

	self._frontFlaNode:addTo(self._node, 20)
	self._frontFlaNode:setVisible(false)

	self._topFlaNode = cc.GroupedNode:create()

	self._topFlaNode:addTo(self._node)
	self._topFlaNode:setVisible(false)
	self._topFlaNode:setGlobalZOrder(10)

	self._bottomFlaNode = cc.GroupedNode:create()

	self._bottomFlaNode:addTo(self._node)
	self._bottomFlaNode:setVisible(false)
	self._bottomFlaNode:setGlobalZOrder(-10)

	self._backActiveFla = cc.Node:create()

	self._backActiveFla:addTo(self._activeNode, -1)
	self._backActiveFla:setVisible(false)

	self._frontActiveFla = cc.Node:create()

	self._frontActiveFla:addTo(self._activeNode, 20)
	self._frontActiveFla:setVisible(false)

	self._coverActiveFla = cc.Node:create()

	self._coverActiveFla:addTo(self._activeNode, 21)

	self._bubbleNode = cc.Node:create()

	self._bubbleNode:addTo(self._activeNode, 102):setName("bubble")

	self._topBarContainer = cc.Node:create()

	self._node:addChild(self._topBarContainer, 10)

	self._iconContainer = cc.Node:create()

	self._topBarContainer:addChild(self._iconContainer, 10)

	local topBar = self:autoManageObject(BattleRoleTopBar:new(self._topBarContainer, nil, self._isLeftTeam, viewContext))

	topBar:bindActor(self)

	self._topBar = topBar
	local iconBar = self:autoManageObject(BattleRoleIconBar:new(self._iconContainer, nil, viewContext))

	iconBar:bindActor(self)

	self._iconBar = iconBar
	local lineGradiantVec2 = {
		{
			ratio = 0.3,
			color = cc.c4b(229, 54, 34, 255)
		},
		{
			ratio = 0.7,
			color = cc.c4b(255, 255, 255, 255)
		}
	}
	local lineGradiantDir = {
		x = 0,
		y = -1
	}
	self._professionalRestraintSupLab = cc.Label:createWithTTF(Strings:get("BATTLE_Restraint"), TTF_FONT_FZYH_R, 26)

	self._node:addChild(self._professionalRestraintSupLab, 10)
	self._professionalRestraintSupLab:enablePattern(cc.LinearGradientPattern:create(lineGradiantVec2, lineGradiantDir))
	self._professionalRestraintSupLab:enableOutline(cc.c4b(99, 5, 5, 255), 2)
	self._professionalRestraintSupLab:setVisible(false)
	self:updateHpBarVisibility(false)
	self:updateRpBarVisibility(false)
	self:createHeroAnim()

	self._baseColorMatrix = self._roleAnim:getColorMatrix()
	self._baseColorTrans = self._roleAnim:getColorTransform()
	local forward = self._isLeftTeam and 1 or -1

	self:setForward(forward)

	self._animLoop = 0
	self._state = "stand"
	self._backDur = 80
	self._skillEffect = {}
	self._skillMovies = {}

	if self._context then
		self._context:addEventListener(EVT_Battle_Hp_Changed, self, self.onHpChanged)
		self._context:addEventListener(EVT_Battle_Rp_Changed, self, self.onRpChanged)
		self._context:addEventListener(EVT_BATTLE_SHOW_BUFF, self, self.showBuff)
		self._context:addEventListener(EVT_BATTLE_HIDE_BUFF, self, self.hideBuff)
		self._context:addEventListener(EVT_Battle_Shield_Changed, self, self.onShieldChanged)
	end
end

function BattleRoleObject:dispose()
	if self._root ~= nil then
		self._root:removeFromParent()

		self._root = nil
	end

	if self._animTask then
		self._animTask:stop()

		self._animTask = nil
	end

	if self._flyTask then
		self._flyTask:stop()

		self._flyTask = nil
	end

	if self._moveTask then
		self._moveTask:stop()

		self._moveTask = nil
	end

	if self._groundMaskTask then
		self._groundMaskTask:stop()

		self._groundMaskTask = nil
	end

	if self._shiftPosTask then
		self._shiftPosTask:stop()

		self._shiftPosTask = nil
	end

	if self._context then
		self._context:removeEventListener(EVT_Battle_Hp_Changed, self, self.onHpChanged)
		self._context:removeEventListener(EVT_Battle_Shield_Changed, self, self.onShieldChanged)
		self._context:removeEventListener(EVT_Battle_Rp_Changed, self, self.onRpChanged)
		self._context:removeEventListener(EVT_BATTLE_SHOW_BUFF, self, self.showBuff)
		self._context:removeEventListener(EVT_BATTLE_HIDE_BUFF, self, self.hideBuff)
	end

	if self._buffIconEntry then
		self._buffIconEntry:stop()

		self._buffIconEntry = nil
	end

	self._dataModel:dispose()
	super.dispose(self)
end

function BattleRoleObject:isLive()
	return self._liveState == LiveState.Lived
end

function BattleRoleObject:isLeft()
	return self._dataModel:getCellId() > 0
end

function BattleRoleObject:isIdleState()
	return self._state == "stand" or self._state == "charge"
end

function BattleRoleObject:getStaticModelRes()
	local res = ""
	local model = self._dataModel:getModelConfig().Model
	res = "asset/heros/" .. model .. "/portraitpic_" .. model .. ".png"

	if not cc.FileUtils:getInstance():isFileExist(res) then
		res = "asset/master/" .. model .. "/battle_" .. model .. ".png"
	end

	return res
end

function BattleRoleObject:getHeightOffset()
	return kRelPosWithHeight
end

function BattleRoleObject:setupViewContext(viewContext)
	if self._context then
		return
	end

	self._context = viewContext
	self._unitManager = viewContext:getValue("BattleUnitManager")
	self._battleGround = viewContext:getValue("BattleGroundLayer")
	self._skeletonAnimGroup = viewContext:getValue("SkeletonAnimGroup")
end

function BattleRoleObject:setBattleGround(battleGround)
	self._battleGround = battleGround
end

function BattleRoleObject:setListener(listener)
	self._listener = listener
end

function BattleRoleObject:getView()
	return self._root
end

function BattleRoleObject:getRoleState()
	return self._state or "stand"
end

function BattleRoleObject:isInHomePlace()
	return self:getRelPosition().x == self:getHomePlace().x and self:getRelPosition().y == self:getHomePlace().y
end

function BattleRoleObject:normalized2Real(pos)
	local perspectiveTool = self._battleGround:getPerspectiveTool()
	local x, y = perspectiveTool:norm2view(pos.x, pos.y)

	return cc.p(x, y)
end

function BattleRoleObject:getRelPosition()
	if self._relPosition == nil then
		return {
			x = 0,
			y = 0
		}
	else
		return {
			x = self._relPosition.x,
			y = self._relPosition.y
		}
	end
end

function BattleRoleObject:setRelPosition(relPos, extraZ, height)
	assert(relPos ~= nil)

	self._relPosition = cc.p(relPos.x, relPos.y)

	if self._battleGround ~= nil then
		self._battleGround:setRelPosition(self:getView(), relPos, extraZ, height)
	end
end

function BattleRoleObject:setForward(forward)
	self._node:setScaleX(forward)

	self._forward = forward

	self._topBar:getView():setScaleX(forward)
	self._bubbleNode:setScaleX(forward)
	self._professionalRestraintSupLab:setScaleX(forward)
end

function BattleRoleObject:getForward()
	return self._forward
end

function BattleRoleObject:getScale()
	local scale = self._modelNode:getScaleX()

	return math.abs(scale)
end

function BattleRoleObject:positRoleNode()
	if self._modelNode ~= nil then
		self._modelNode:setPosition(0, 0)
	end
end

function BattleRoleObject:getModelWidth()
	local modelCfg = self._dataModel:getModelConfig()

	return math.abs(modelCfg.Width * kRoleScale * self._modelScale)
end

function BattleRoleObject:getModelHeight()
	local modelCfg = self._dataModel:getModelConfig()

	return modelCfg.Height * kRoleScale * self._modelScale
end

function BattleRoleObject:setLookat(offsetX)
	if self._isLeftTeam then
		self:setForward(offsetX < 0 and -1 or 1)
	else
		self:setForward(offsetX < 0 and 1 or -1)
	end
end

function BattleRoleObject:stopMoving()
	if self._moveTask ~= nil then
		self._moveTask:stop()

		self._moveTask = nil
		self._gobackDirty = false
	end
end

function BattleRoleObject:cancelThrown()
	if self._flyTask then
		self._flyTask:stop()

		self._flyTask = nil
		self._velocity = nil
		self._displacement = nil
		self._frameLabel = nil

		self._roleAnim:resumeAnimation()
		self._activeNode:setPosition(0, 0)
	end
end

function BattleRoleObject:updateHpBarVisibility(isVisible, force)
	if self._roleAnim and not self._roleAnim:isVisible() then
		return
	end

	local hpShow = tonumber(self._context:getValue("ShowHpMode"))
	local visibleSta = true

	if force then
		visibleSta = isVisible
	elseif hpShow == BattleHp_ShowType.Show then
		visibleSta = true
	elseif hpShow == BattleHp_ShowType.Hide then
		visibleSta = false
	elseif hpShow == BattleHp_ShowType.Simple then
		visibleSta = isVisible
	end

	self._topBarVisibleSta = isVisible
	self._topBarVisibleForceSta = force

	self._topBar:setHpVisible(visibleSta)
	self._iconContainer:setVisible(visibleSta)
end

function BattleRoleObject:updateFanBar(prgress)
	self._topBar:updateFanProgress(prgress)
end

function BattleRoleObject:isHpBarVisible()
	return self._topBar:isHpBarVisible()
end

function BattleRoleObject:updateRpBarVisibility(isVisible, force)
	local hpShow = tonumber(self._context:getValue("ShowHpMode"))
	local visibleSta = true

	if force then
		visibleSta = isVisible
	elseif hpShow == BattleHp_ShowType.Show then
		visibleSta = true
	elseif hpShow == BattleHp_ShowType.Hide then
		visibleSta = false
	elseif hpShow == BattleHp_ShowType.Simple then
		visibleSta = isVisible
	end

	self._topBar:setRpVisible(visibleSta)
end

function BattleRoleObject:isRpBarVisible()
	return self._topBar:isRpBarVisible()
end

function BattleRoleObject:showBuff()
	self._iconBar:stopShowTask()
	self._topBar:stopHpTask()
	self._topBar:stopRpTask()
	self:updateHpBarVisibility(true, true)
	self:updateRpBarVisibility(true, true)
end

function BattleRoleObject:hideBuff()
	self._iconBar:stopShowTask()
	self._topBar:stopHpTask()
	self._topBar:stopRpTask()
	self:updateHpBarVisibility(false, true)
	self:updateRpBarVisibility(false, true)
end

function BattleRoleObject:createHeroAnim()
	local child = self._modelNode:getChildByTag(ROLE_ANIM_TAG)

	if child then
		self._modelNode:removeChild(child, true)
	end

	local modelCfg = self._dataModel:getModelConfig()
	local animName = modelCfg.Model
	local pre = "asset/anim/"
	local jsonFile = pre .. animName .. ".skel"

	if not cc.FileUtils:getInstance():isFileExist(jsonFile) then
		jsonFile = self:createDefaultModel()
	end

	local roleAnim = sp.SkeletonAnimation:create(jsonFile)

	roleAnim:setSkeletonAnimationGroup(self._skeletonAnimGroup)
	self._modelNode:addChild(roleAnim, 0, ROLE_ANIM_TAG)

	self._roleAnim = roleAnim

	self:watchAnimAction()
	roleAnim:registerSpineEventHandler(handler(self, self.spineHandler), sp.EventType.ANIMATION_COMPLETE)
	roleAnim:registerSpineEventHandler(handler(self, self.spineHandler), sp.EventType.ANIMATION_EVENT)

	if self._roleType == RoleType.Master then
		self:switchState("stand", {
			loop = -1
		}, false, self.animCallback)
	else
		self:switchState("debut", {
			loop = -1
		}, false, self.animCallback)
	end

	local hpPercent = self._dataModel:getHp() / self._dataModel:getMaxHp() * 100

	self._topBar:setHp(hpPercent)

	local mpPercent = self:getShowRpNum(self._dataModel:getRp()) / self._dataModel:getMaxRp() * 100

	self._topBar:setRp(mpPercent)
	self._topBarContainer:setPosition(cc.p(0, self:getModelHeight() + kTopBarHeight))

	if self._roleType == RoleType.Master then
		self._professionalRestraintSupLab:setPosition(cc.p(0, self._topBarContainer:getPositionY() + kTopBarHeight + 20))
	else
		self._professionalRestraintSupLab:setPosition(cc.p(0, self._topBarContainer:getPositionY() + kTopBarHeight + 10))
	end

	if self._dataModel:getIsBattleField() then
		self._modelScale = 1.5

		roleAnim:setVisible(false)
		self._topBarContainer:setVisible(false)
		self._topBar:getView():setVisible(false)

		function self._topBarContainer.setVisible()
		end

		function roleAnim.setVisible()
		end

		self._topBar:getView().setVisible = function ()
		end
	end

	roleAnim:setScale(kRoleScale * self._modelScale)
end

function BattleRoleObject:transform()
	self:setBusyState(false)
	self:cancelThrown()
	self:setRelPosition(self._homePlace)

	self._modelScale = self._dataModel:getModelConfig().Zoom or 1

	self:createHeroAnim()
	self._roleAnim:setColorTransform(self._baseColorTrans)
	self:switchState("squat", {
		loop = 1
	})
end

function BattleRoleObject:doAction(actionName, record)
	if self._liveState == LiveState.Dead or self._liveState == LiveState.Remove then
		return
	end

	local processors = {}

	local function runCmd(cmd, params)
		local func = processors[cmd]

		if func ~= nil then
			func(cmd, params)
		else
			assert(false, cmd .. "can't be dealed")
		end
	end

	function processors.Hurt(cmd, args)
		assert(args ~= nil)

		local actId = args.act
		local final = args.final
		local deadly = args.deadly or false

		if deadly and self._liveState == LiveState.Lived then
			-- Nothing
		end

		if args.raw == 0 then
			return
		end

		if deadly and false then
			local modelCfg = self._dataModel:getModelConfig()
			local mainMediator = self._context:getValue("BattleMainMediator")
			local soundName = modelCfg.DeathVoice

			if soundName ~= "" and soundName then
				mainMediator:playDieEffect(soundName)
			end
		end

		if final then
			local context = self._context

			context:setValue("FinalHit", true)
		end

		local crit = args.crit
		local block = args.block

		if block then
			local blockAnim = self._frontActiveFla:getChildByName("BlockAnim")

			if blockAnim then
				blockAnim:stop()
				blockAnim:removeFromParent(true)
			end

			blockAnim = self:addActiveEffect("gedang_bufftexiao", false, cc.p(0.5, 0.5), "front", 1, function (cid, mc)
				mc:removeFromParent(true)
			end)

			blockAnim:setName("BlockAnim")
			self._dataModel:addBlockInfo(actId)
		end

		self._topBar:shine()

		if self._headWidget then
			self._headWidget:shake(self._context)
		end
	end

	function processors.Reflected(cmd, args)
		assert(args ~= nil)
	end

	function processors.Cured(cmd, args)
		local rawDamage = args.raw

		self:addHealth(rawDamage)
	end

	function processors.Absorb(cmd, args)
		local rawDamage = args.raw

		self:addHealth(rawDamage, {
			absorb = true
		})
	end

	function processors.Die(cmd, args)
		self._context:dispatch(Event:new(EVT_Battle_UnitDie, {
			id = self._id
		}))

		self._liveState = LiveState.Dying

		self:tryDie()
	end

	function processors.Kick(cmd, args)
		self._liveState = LiveState.Dead

		self:kick()
	end

	function processors.Clear(cmd, args)
		self:goBack()
	end

	runCmd(actionName, record)
end

local function randomN(n, array)
	local targets = {}
	local cnt = 0

	for i, target in ipairs(array) do
		cnt = cnt + 1
		targets[cnt] = target
	end

	local random = math.random

	if cnt < n then
		n = cnt
	end

	for i = 1, n do
		local x = random(i, cnt)

		if i ~= x then
			targets[x] = targets[i]
			targets[i] = targets[x]
		end
	end

	targets[n + 1] = nil

	return targets
end

function BattleRoleObject:addBuff(args)
	local display = args.disp

	if display == nil or display == "" then
		return
	end

	local buffModel = ConfigReader:getRecordById("BuffModel", display)

	if not buffModel then
		return
	end

	local priorityValue = buffModel.Priority or 0
	local priorityGroup = buffModel.Type or "@Default"
	local groupMap = self._buffMap[priorityGroup] or {}
	groupMap[display] = groupMap[display] or {}
	self._buffMap[priorityGroup] = groupMap
	local buffValue = groupMap[display]
	buffValue.count = (buffValue.count or 0) + 1
	local isFixPos = buffModel.Id == "Protecto" or buffModel.Id == "LeadStage_SenLing" or buffModel.Id == "LeadStage_SenLing_Start"
	local fixOrder = {
		Protecto = 1,
		LeadStage_SenLing = 0,
		LeadStage_SenLing_Start = 0
	}

	if buffValue.count <= 1 or buffValue.displayNodes == nil or #buffValue.displayNodes == 0 then
		if buffModel.Effect and buffModel.Effect ~= "" then
			buffValue.loopMode = buffModel.Loop
			buffValue.priority = priorityValue
			buffValue.displayNodes = {}
			local offsetX = buffModel.HorizontalPos
			offsetX = offsetX and (self._isLeftTeam and offsetX or 0 - offsetX)

			local function addEffect(anim, layer)
				return self:addActiveEffect(anim, buffValue.loopMode == 1, cc.p(offsetX or 0.5, buffModel.EffectPos), layer, 1, function (cid, mc)
					if buffValue.loopMode == 0 then
						table.removevalues(buffValue.displayNodes, mc)
						mc:removeFromParent()
					end
				end, isFixPos, fixOrder[buffModel.Id])
			end

			local displayNode = addEffect(buffModel.Effect, buffModel.Invisible == 2 and "cover" or "front")

			displayNode:setVisible(false)

			buffValue.displayNodes[#buffValue.displayNodes + 1] = displayNode
		end

		if buffModel.Color and buffModel.Color ~= "" then
			buffValue.color = buffModel.Color
			self._filmed = buffModel.Color == BuffColor.Negative

			self:refreshColor()
		end
	end

	if buffModel.DescWord and buffModel.DescWord ~= "" then
		self:flyImage(buffModel.DescWord)
	end

	self:refreshBuffEffect()

	if buffModel.Icon and buffModel.Icon ~= "" then
		self._iconBar:addBuffIcon(args.buffId, buffModel.Icon, args.dur)
	end
end

function BattleRoleObject:removeBuff(args)
	local display = args and args.disp

	if display == nil or display == "" then
		return
	end

	for key, groupMap in pairs(self._buffMap) do
		for disp, buffValue in pairs(groupMap) do
			if disp == display then
				buffValue.count = math.max(buffValue.count - 1, 0)

				if buffValue.count == 0 then
					if buffValue.displayNodes then
						for i, displayNode in ipairs(buffValue.displayNodes) do
							displayNode:stop()
							displayNode:removeFromParent(true)
						end
					end

					groupMap[display] = nil
				end
			end
		end
	end

	self._filmed = false

	self:refreshColor()
	self:refreshBuffEffect()

	local buffModel = ConfigReader:getRecordById("BuffModel", display)

	if not buffModel then
		return
	end

	if buffModel.Icon and buffModel.Icon ~= "" then
		self._iconBar:removeIcon(args.buffId)
	end
end

function BattleRoleObject:cleanBuff()
	for key, groupMap in pairs(self._buffMap) do
		for disp, buffValue in pairs(groupMap) do
			if buffValue.displayNodes then
				for i, displayNode in ipairs(buffValue.displayNodes) do
					displayNode:stop()
					displayNode:removeFromParent(true)
				end
			end

			groupMap[disp] = nil
		end

		self._buffMap[key] = nil
	end
end

function BattleRoleObject:tickBuff(args)
	local display = args.disp

	if display == nil or display == "" then
		return
	end

	local buffModel = ConfigReader:getRecordById("BuffModel", display)

	if not buffModel then
		return
	end

	if buffModel.Icon and buffModel.Icon ~= "" then
		self._iconBar:tickBuff(args.buffId, args.dur)
	end

	if buffModel.Tick and buffModel.Tick ~= "" then
		self._tickMap = self._tickMap or {}

		if not self._tickMap[display] then
			self._tickMap[display] = {}
		end

		local buffValue = self._tickMap[display]
		buffValue.count = (buffValue.count or 0) + 1

		if buffValue.count > 1 then
			return
		end

		local displayNode = cc.MovieClip:create(buffModel.Tick, "BattleMCGroup")

		displayNode:setPositionY(self:getModelHeight() * buffModel.TickPos)
		displayNode:addTo(self._effectNode)

		buffValue.displayNode = displayNode

		displayNode:addEndCallback(function (cid, mc)
			mc:stop()
			mc:removeFromParent(true)

			buffValue.count = 0
			buffValue.displayNode = nil
		end)
	end
end

function BattleRoleObject:stackBuff(args)
	local display = args.disp

	if display == nil or display == "" then
		return
	end

	local buffModel = ConfigReader:getRecordById("BuffModel", display)

	if not buffModel then
		return
	end

	if buffModel.Icon and buffModel.Icon ~= "" then
		self._iconBar:stackBuff(args.buffId, args.dur, args.times)
	end

	local loopMode = buffModel.Loop

	if not loopMode or loopMode ~= 1 then
		self:addBuff(args)
	end
end

function BattleRoleObject:refreshBuffEffect()
	for key, grounMap in pairs(self._buffMap) do
		local por = 65535

		for display, buffValue in pairs(grounMap) do
			por = math.min(buffValue.priority or 0, por)
			local displayNodes = buffValue.displayNodes

			if displayNodes then
				for _, displayNode in ipairs(displayNodes) do
					displayNode:setVisible(false)
				end
			end
		end

		for display, buffValue in pairs(grounMap) do
			if buffValue.priority == por then
				local displayNodes = buffValue.displayNodes

				if displayNodes then
					for _, displayNode in ipairs(displayNodes) do
						displayNode:setVisible(true)
					end
				end
			end
		end
	end
end

function BattleRoleObject:refreshColor()
	self:colorReset()

	if self._filmed then
		self:colorFilm(-80, 10)

		return
	end

	for key, grounMap in pairs(self._buffMap) do
		local por = 65535

		for display, buffValue in pairs(grounMap) do
			local priority = buffValue.priority or 0
			local color = buffValue.color

			if color and priority < por then
				por = priority
				local args = BuffColor[color]

				self:colorDye(args)
			end
		end
	end
end

function BattleRoleObject:colorFilm(saturation, contrast)
	local node = self._roleAnim

	node:setSaturation(saturation or -100)
	node:setContrast(contrast or 0)

	local colorMatrix = node:getColorMatrix()
	local tran = colorMatrix.transform
	local off = colorMatrix.offsets
	tran[1] = -tran[1]
	tran[2] = -tran[2]
	tran[3] = -tran[3]
	tran[5] = -tran[5]
	tran[6] = -tran[6]
	tran[7] = -tran[7]
	tran[9] = -tran[9]
	tran[10] = -tran[10]
	tran[11] = -tran[11]
	off.x = 255
	off.y = 255
	off.z = 255

	node:setColorMatrix(colorMatrix)
end

function BattleRoleObject:colorDye(args)
	local trans = {}

	table.deepcopy(self._baseColorTrans, trans)

	local mults = trans.mults
	local offsets = trans.offsets

	self._roleAnim:setSaturation(args.saturation or 0)
	self._roleAnim:setContrast(args.contrast or 0)
	self._roleAnim:setColorTransform(ColorTransform(args.r or mults.x, args.g or mults.y, args.b or mults.z, args.a or mults.w, args.o_r or offsets.x, args.o_g or offsets.y, args.o_b or offsets.z, args.o_a or offsets.w))
end

function BattleRoleObject:colorReset()
	self._roleAnim:setSaturation(0)
	self._roleAnim:setColorMatrix(self._baseColorMatrix)
	self._roleAnim:setColorTransform(self._baseColorTrans)
end

function BattleRoleObject:addActiveEffect(mcFile, loop, dot, layer, zOrder, callback, isFixPos, FixZorder)
	if not mcFile then
		return
	end

	layer = layer or "front"
	dot = dot or {
		x = 0.5,
		y = 0.5
	}
	dot.x = dot.x or 0.5
	dot.y = dot.y or 0.5
	local anim = cc.MovieClip:create(mcFile, "BattleMCGroup")

	assert(anim, "MovieClip :" .. mcFile .. " not exists!")
	anim:addEndCallback(function (cid, mc)
		if loop ~= true then
			mc:stop()

			if callback then
				callback(cid, mc)
			end
		end
	end)

	local point = cc.p(self:getModelWidth() * dot.x - self:getModelWidth() * 0.5, self:getModelHeight() * dot.y)

	anim:addTo(layer == "cover" and self._coverActiveFla or layer == "front" and self._frontActiveFla or self._backActiveFla)
	anim:setLocalZOrder((layer == "front" or layer == "cover") and zOrder or -zOrder)
	anim:setPosition(point)

	if isFixPos then
		local w_p = anim:getParent():convertToWorldSpace(point)
		local pos_h = self:getHomePlace()
		local pos_r = {
			x = pos_h.x + dot.x * 0.4,
			y = pos_h.y + 0.3333333333333333 * dot.y
		}

		self._battleGround:setRelPosition(anim, pos_r, 100, 100)
		anim:setScale(1)

		if FixZorder and FixZorder <= 0 then
			anim:changeParent(self._battleGround:getCellLayer())
		else
			anim:changeParent(self._battleGround:getGroundLayer())
		end
	end

	return anim
end

function BattleRoleObject:watchAnimAction()
	local function isDagunFinalAnim(animName)
		return animName == "win" or animName == "win_2" or animName == "win_3" or animName == "win_4" or animName == "die_5" or animName == "die_6" or animName == "die_7" or animName == "die_8"
	end

	local function adjustWinOrLoseZorder(animName)
		if isDagunFinalAnim(animName) and self._dataModel:getModelId() == "Model_LFKLFTe_DGun" then
			self:setDisplayZorder(1000)
		end
	end

	local playAnimation = self._roleAnim.playAnimation

	function self._roleAnim.playAnimation(anim, frameIndex, animName, isloop)
		if self._actionTransform[animName] then
			animName = self._actionTransform[animName]
		end

		adjustWinOrLoseZorder(animName)
		playAnimation(anim, frameIndex, animName, isloop)
	end

	local setLocalZOrder = self:getView().setLocalZOrder

	self:getView().setLocalZOrder = function (target, zorder)
		if self._specialZorder then
			return
		end

		setLocalZOrder(target, zorder)
	end
end

function BattleRoleObject:addActiveNode(node, dot, layer, zOrder)
	layer = layer or "front"
	dot = dot or {
		x = 0.5,
		y = 0.5
	}
	dot.x = dot.x or 0.5
	dot.y = dot.y or 0.5
	local point = cc.p(self:getModelWidth() * dot.x - self:getModelWidth() * 0.5, self:getModelHeight() * dot.y)

	node:addTo(layer == "cover" and self._coverActiveFla or layer == "front" and self._frontActiveFla or self._backActiveFla)
	node:setLocalZOrder((layer == "front" or layer == "cover") and zOrder or -zOrder)
	node:setPosition(point)
end

function BattleRoleObject:flyImage(path)
	local label = ccui.ImageView:create()

	label:loadTexture(path, ccui.TextureResType.plistType)

	local pos = cc.p(0, self:getModelHeight())
	pos = cc.pAdd(pos, cc.p(self:getView():getPosition()))
	local anim = cc.MovieClip:create("dhdh_diaoxue", "BattleMCGroup")
	local textNode = anim:getChildByName("text")

	label:addTo(textNode)

	local flyImages = self._flyImages or {}

	for i, mc in ipairs(flyImages) do
		mc:setLocalZOrder(i + 100)
		mc:setPositionY(mc:getPositionY() + 30)
	end

	flyImages[#flyImages + 1] = anim

	self._battleGround:addEffectNode(anim, pos, function (mc)
		local index = table.indexof(flyImages, mc)

		if index then
			table.remove(flyImages, index)
		end
	end)
	anim:setLocalZOrder(#flyImages + 100)

	self._flyImages = flyImages
end

function BattleRoleObject:reduceHealth(raw, params)
	local label = self:createLabel(raw, params)

	self:flyLabel(label)
end

function BattleRoleObject:addHealth(raw, params)
	local curedAnim = self._frontActiveFla:getChildByName("CuredAnim")

	if curedAnim then
		curedAnim:stop()
		curedAnim:removeFromParent(true)
	end

	curedAnim = self:addActiveEffect("zhiliao_zhandoubuff", false, cc.p(0.5, 0.5), "front", 1, function (cid, mc)
		mc:removeFromParent(true)
	end)

	curedAnim:setName("CuredAnim")

	local label = self:createLabel(raw, {
		type = "cure",
		absorb = params and params.absorb
	})

	self:flyLabel(label)
end

local fntTable = {
	shield = "asset/font/zd_xishou.fnt",
	block = "asset/font/zd_diaoxue.fnt",
	damage = "asset/font/zd_diaoxue.fnt",
	cure = "asset/font/zd_huixue.fnt",
	reflect = "asset/font/zd_diaoxue.fnt",
	sub = "asset/font/zd_kz.fnt",
	poison = "asset/font/zd_zd.fnt",
	burning = "asset/font/zd_zs.fnt",
	crit = "asset/font/zd_baoji.fnt"
}
local labelTable = {
	shield = "zd_xs_word.png",
	block = "zd_gd_word.png",
	poison = "zd_zd_icon.png",
	immune = "zd_my_word.png",
	reflect = "zd_fs_word.png",
	burning = "zd_zs_icon.png",
	sub = "zd_kz_word.png",
	crit = "zd_bj_word.png"
}
local offsetYTable = {
	poison = 40
}

function BattleRoleObject:createLabel(raw, params)
	local labelType = params.type
	local fntFile = fntTable[labelType]
	local labelFile = labelTable[labelType]
	local offsetY = offsetYTable[labelType] or 0

	if not fntFile and params.type ~= "" then
		fntFile = fntTable.damage
	end

	if labelType == "damage" then
		if params.sub then
			fntFile = fntTable.sub
			labelFile = labelTable.sub
		end
	elseif labelType == "block" and params.sub then
		fntFile = fntTable.sub
	end

	local animFile = "szb_shuzi"
	local textNodeName = "text"
	local numscale = 1
	local offsetX = 100

	if params.type == "cure" and not params.absorb then
		animFile = "sz_shuzi"
		textNodeName = "text"
		numscale = 0.5
		offsetX = 0
	elseif self:isLeft() then
		animFile = "szbb_shuzi"
		textNodeName = "text"
		numscale = 1
		offsetX = 150
	end

	local anim = cc.MovieClip:create(animFile, "BattleMCGroup")

	anim:addEndCallback(function (cid, mc)
		mc:stop()
		mc:removeFromParent(true)
	end)
	anim:setPositionY(self:getModelHeight() + 10)

	local numText = tostring(raw)

	for i = 1, math.min(#numText, 7) do
		ccui.TextBMFont:create(string.sub(numText, i, i), fntFile):addTo(anim:getChildByFullName("num" .. i)):setScale(numscale)
		anim:offset(-10)
	end

	if labelFile then
		local sp = cc.Sprite:createWithSpriteFrameName(labelFile)
		local baseNode = anim:getChildByFullName(textNodeName)

		if sp and baseNode then
			sp:addTo(baseNode)
		end
	else
		anim:offset(-40)
	end

	anim:offset(offsetX, 50 + offsetY)
	anim:play()

	return anim
end

function BattleRoleObject:flyLabel(node)
	local pos = cc.p(node:getPosition())
	pos = cc.pAdd(pos, cc.p(self:getView():getPosition()))

	self._battleGround:addEffevtive(node, pos)
	self._topBar:scheduleShowHp()
end

function BattleRoleObject:syncMainViewMaster(maxHp)
	if self._masterWidget then
		self._masterWidget:setRp(self:getShowRpNum(self._dataModel:getRp()))
	end

	if self._headWidget then
		self._headWidget:setHp(self._dataModel:getHp(), maxHp)
		self._headWidget:setRp(self:getShowRpNum(self._dataModel:getRp()), self._dataModel:getMaxRp())
	end

	if self._heroHeadWidget then
		self._heroHeadWidget:updateHeroHpInfo(self._id, self._dataModel:getHp(), maxHp)
	end

	if self._equipHpWidget then
		self._equipHpWidget:refreshHp(self._id, self._dataModel:getHp(), maxHp)
	end
end

function BattleRoleObject:goBack()
	if self._liveState == LiveState.Fleeing then
		return
	end

	if self:isInHomePlace() then
		self:stopMoving()
		self:actionEndCallback()

		return
	end

	if self._gobackDirty then
		return
	end

	local dur = self._backDur
	local homePlace = self._homePlace

	self:switchState("-run", {
		loop = -1,
		dur = dur
	})
	self:setBusyState(true)

	self._gobackDirty = true

	self:moveWithDuration(homePlace, dur / 1000, function ()
		self:setBusyState(false)

		self._gobackDirty = false
	end)
end

function BattleRoleObject:forceGoBack(dur)
	dur = dur or 1000

	self:cancelThrown()
	self._activeNode:setPosition(0, 0)
	self:switchState("run", {
		loop = -1,
		dur = dur
	})

	local homePlace = self._homePlace

	self:setBusyState(true)

	self._gobackDirty = true

	self:moveWithDuration(homePlace, dur / 1000, function ()
		self:setBusyState(false)

		self._gobackDirty = false
	end)
end

function BattleRoleObject:forceGoOutScreen(dur, posX, posY)
	dur = dur or 1000
	posX = posX or 0
	posY = posY or 0

	self:cancelThrown()
	self:switchState("-run", {
		loop = -1,
		dur = dur
	})
	self:setBusyState(true)

	self._gobackDirty = true
	local pos = {
		x = posX,
		y = posY
	}

	self:moveWithDuration(pos, dur / 1000, function ()
		self:setBusyState(false)

		self._gobackDirty = false
	end)
end

function BattleRoleObject:tryDie()
	if self._flyTask == nil and self:isFree() and not self:isLive() then
		if self._animEnded then
			if self._liveState == LiveState.Remove then
				return false
			end

			self._liveState = LiveState.Dead

			self:die()

			return true
		else
			self:switchState("tanghao")
		end
	end

	return false
end

function BattleRoleObject:die()
	if self._liveState == LiveState.Remove or self._liveState == LiveState.Lived then
		return
	end

	self._liveState = LiveState.Remove
	local fadeOut = cc.FadeOut:create(0.2)
	local callback = cc.CallFunc:create(function ()
		self._battleGround:resetGroundCell(self._dataModel:getCellId(), GroundCellStatus.NORMAL, self._dataModel)
		self._node:removeFromParent()
		self._unitManager:removeUnitById(self._id, self._dataModel:getCellId())
	end)

	self._roleAnim:runAction(cc.Sequence:create(fadeOut, callback))
end

function BattleRoleObject:remove()
	if self._liveState == LiveState.Remove then
		return
	end

	self._liveState = LiveState.Remove

	self._battleGround:resetGroundCell(self._dataModel:getCellId(), GroundCellStatus.NORMAL, self._dataModel)
	delayCallByTime(0, function ()
		self._unitManager:removeUnitById(self:getId(), self._dataModel:getCellId())
	end)
end

function BattleRoleObject:kick()
	if self._liveState == LiveState.Remove then
		return
	end

	self._liveState = LiveState.Remove

	self._battleGround:resetGroundCell(self._dataModel:getCellId(), GroundCellStatus.NORMAL, self._dataModel)
	self._unitManager:removeUnitById(self._id, self._dataModel:getCellId())

	local fadeOut = cc.FadeOut:create(0.2)
	local callback = cc.CallFunc:create(function ()
		self._node:removeFromParent()

		self._node = nil
	end)

	self._roleAnim:runAction(cc.Sequence:create(fadeOut, callback))
end

function BattleRoleObject:doReborn(args)
	local raw = args.hp < 0 and math.abs(args.hp) or args.hp

	self:addHealth(raw)
	self._roleAnim:stopAllActions()

	self._liveState = LiveState.Lived

	self:switchState("stand", {
		loop = -1
	}, true)
end

function BattleRoleObject:moveWithDuration(targetPos, duration, onReached)
	self:stopMoving()

	local from = self:getRelPosition()
	local to = targetPos
	local extraZ = nil

	if to.x ~= self._homePlace.x or to.y ~= self._homePlace.y then
		extraZ = ROLE_TOP_ZORDER
	else
		extraZ = nil
	end

	self._moveTask = self._context:runActionTask(duration, function (p)
		local speed = {
			x = (to.x - from.x) / duration,
			y = (to.y - from.y) / duration
		}
		local t = duration * p
		local pos = nil

		if p < 0.5 then
			pos = {
				x = from.x + 2 * speed.x * t * t / duration,
				y = from.y + 2 * speed.y * t * t / duration
			}
		elseif p < 1 then
			pos = {
				x = from.x + 4 * speed.x * t - 2 * speed.x * t * t / duration - speed.x * duration,
				y = from.y + 4 * speed.y * t - 2 * speed.y * t * t / duration - speed.y * duration
			}
		elseif p == 1 then
			pos = to
		end

		self:setRelPosition(pos, ROLE_TOP_ZORDER, kRelPosWithHeight)
	end, function ()
		self._moveTask = nil

		if onReached ~= nil then
			onReached(self)
		end

		if extraZ == nil then
			self:setRelPosition(self:getRelPosition())
		end

		if self._state == "run" then
			self:actionEndCallback()
		end

		if to.x == self._homePlace.x then
			local forward = self._isLeftTeam and 1 or -1

			self:setForward(forward)
		end
	end)
end

local skillList = {
	"attack",
	"skill1",
	"skill2",
	"skill3",
	"skill4",
	"skill5",
	"dieskill",
	"skill1_1",
	"skill1_2",
	"skill1_3",
	"skill1_4",
	"skill1_5",
	"skill3_1",
	"skill3_2",
	"skill3_3",
	"skill3_4",
	"skill2_1",
	"skill2_2",
	"skill2_3",
	"skill2_4",
	"skill5_1",
	"skill5_2",
	"skill5_3"
}
local normalList = {
	"down",
	"getup",
	"run",
	"stand",
	"win",
	"hurt",
	"hurt1",
	"debut",
	"fail",
	"charge",
	"squat",
	"burst"
}
local actMap = {
	debut = "stand",
	skill2 = "skill2",
	lockdie = "die",
	fakedie = "die",
	squat = "squat",
	skill1_3 = "skill1_3",
	skill1_4 = "skill1_4",
	die2 = "die2",
	skill3_3 = "skill3_3",
	dieskill = "dieskill",
	charge = "charge",
	down = "down",
	attack = "skill1",
	skill3 = "skill3",
	skill3_2 = "skill3_2",
	run = "run",
	skill2_3 = "skill2_3",
	skill5_2 = "skill5_2",
	stand = "stand",
	skill3_1 = "skill3_1",
	skill3_4 = "skill3_4",
	win = "win",
	hurt = "hurt1",
	skill1 = "skill1",
	hurt1 = "hurt1",
	burst = "burst",
	skill1_5 = "skill1_5",
	skill2_1 = "skill2_1",
	skill5_1 = "skill5_1",
	getup = "getup",
	skill4 = "skill4",
	skill5_3 = "skill5_3",
	skill5 = "skill5",
	skill2_4 = "skill2_4",
	die = "die",
	walk = "run",
	skill1_1 = "skill1_1",
	fail = "stand",
	skill1_2 = "skill1_2",
	skill2_2 = "skill2_2"
}

local function startsWith(src, sub)
	local len = string.len(sub)

	return string.sub(src, 1, len) == sub
end

function BattleRoleObject:switchState(state, extra, always, callback)
	if self:getId() == specId then
		Bcallstack("changeState", state, "extra:", extra or "nil", "time:", os.clock(), "from:", self._state, "isBusy:", self._isBusy)
	end

	local isPrologue = self._context:getValue("Prologue")

	if not always then
		if not self:canChangeState(state) then
			if self._state == state then
				self.animCallback = self.animCallback or callback
			end

			return false
		end

		if startsWith(state, "hurt") and self._state ~= "stand" and self._state ~= "charge" and not startsWith(self._state, "hurt") then
			return false
		end

		if startsWith(state, "down") and self._state ~= "stand" and self._state ~= "charge" and not startsWith(self._state, "hurt") and self._state ~= "down" then
			return false
		end

		if startsWith(state, "tanghao") and self._state == "lockdie" then
			return false
		end
	end

	local forward = 1

	if string.sub(state, 1, 1) == "-" then
		if self:isLeft() then
			forward = -1
		else
			forward = 1
		end

		state = string.sub(state, 2)
	elseif self:isLeft() then
		forward = 1
	else
		forward = -1
	end

	self:setForward(forward)

	local anim = self._roleAnim
	self.animCallback = callback or nil
	local stateAct = actMap[state]

	if not self:isLive() and self:isFree() then
		if isPrologue then
			self._state = state

			self:die()
		elseif self._state ~= "down" then
			self._state = "down"

			anim:resumeAnimation()

			if anim:hasAnimation("die") and not self._finalHitDown then
				anim:playAnimation(0, "die", false)

				if self._context:getValue("FinalHit") == true and self._roleType == RoleType.Master then
					local mainMediator = self._context:getValue("BattleMainMediator")

					mainMediator:showFinalDieAnim(self)

					if not self:isLeft() then
						mainMediator:showFinalTaskFinish(self)
					end

					self._finalHitDown = true
				end

				self:playSpecialSound("die")
			else
				self:die()
			end
		else
			anim:pauseAnimation()

			self._animEnded = true

			if self._context:getValue("FinalHit") == true and self._roleType == RoleType.Master then
				local mainMediator = self._context:getValue("BattleMainMediator")

				if not self:isLeft() then
					mainMediator:showFinalTaskFinish(self)
				end

				if mainMediator:showFinalDieAnim(self) then
					return false
				end
			end

			self:tryDie()
		end

		return false
	end

	if stateAct == nil then
		return false
	end

	local busy = false
	extra = extra or {}

	for _, skill in ipairs(skillList) do
		if self._state == skill then
			anim:removeUserEventForAnimation(skill)
		end

		if state == skill then
			self:parseSkillTimeline(stateAct, extra.specialEvts)

			busy = true
		end
	end

	local start = extra.strt
	local loop = extra.loop or 1
	local animDur = extra.dur and extra.dur / 1000 or nil
	self._animLoop = loop

	if anim:isAnimationPaused() then
		anim:resumeAnimation()
	end

	if self._dataModel:getAwakenLevel() > 0 then
		if stateAct == "stand" then
			stateAct = "stand1"
		end

		if stateAct == "squat" then
			stateAct = "squat1"
		end
	end

	if anim:hasAnimation(stateAct) then
		anim:playAnimation(0, stateAct, true)
	else
		stateAct = "stand"
		self._state = "stand"

		anim:playAnimation(0, "stand", true)
	end

	if start then
		anim:playAnimationInFrameIndex(0, stateAct, start, true)
	else
		anim:playAnimation(0, stateAct, true)
	end

	if loop == 0 then
		anim:pauseAnimation()
	end

	if self._animTask then
		self._animTask:stop()

		self._animTask = nil
	end

	if animDur then
		local scheduler = self:getContext():getScalableScheduler()
		self._animTask = scheduler:schedule(function (task, dt)
			animDur = animDur - dt

			if animDur <= 0 then
				task:stop()

				self._animTask = nil

				self:actionEndCallback()
			end
		end)
	end

	self._state = state

	return true
end

function BattleRoleObject:parseSkillTimeline(actionName, specialEvts)
	local modelCfg = self._dataModel:getModelConfig()
	local animId = modelCfg.Animation
	local skillId = animId .. "_" .. actionName

	if specialEvts then
		skillId = specialEvts
	end

	local skillConfig = ConfigReader:getRecordById("SkillAnima", skillId)

	if not skillConfig then
		assert(false, tostring(skillId) .. " not exists in SkillAnima." .. "\nId:" .. tostring(self._id) .. "\nanimId:" .. tostring(animId) .. "\nactionName:" .. tostring(actionName) .. "\nSpecialEvts:" .. tostring(specialEvts))
	end

	local frameEvts = skillConfig.events
	local anim = self._roleAnim

	anim:removeUserEventForAnimation(actionName)

	local i = 0

	for _, cfg in ipairs(frameEvts) do
		local frame = cfg.f
		local events = cfg.evts or {}

		for _, evt in ipairs(events) do
			local name = evt.e .. i
			local src = evt.d or {}
			local data = {}

			table.deepcopy(src, data)

			data.eventType = evt.e
			local dataStr = cjson.encode(data)

			anim:addUserEventForStringEx(actionName, name, frame, dataStr)

			i = i + 1
		end
	end
end

function BattleRoleObject:switchAction(srcAnim, descAnim)
	if self._roleAnim:hasAnimation(descAnim) then
		if self._actionTransform[srcAnim] and self._actionTransform[srcAnim] == descAnim then
			return
		end

		self._actionTransform[srcAnim] = descAnim
		self._actionTransformRevise[descAnim] = srcAnim

		for k, v in pairs(skillList) do
			if v == descAnim then
				self._roleAnim:removeUserEventForAnimation(srcAnim)
				self:parseSkillTimeline(descAnim)

				break
			end
		end
	end
end

function BattleRoleObject:clearAllTransformAction()
	self._actionTransform = {}
	self._actionTransformRevise = {}
end

function BattleRoleObject:canChangeState(newState)
	if self:isBusyState() then
		for _, v in ipairs(normalList) do
			if newState == v then
				return false
			end
		end
	end

	return true
end

function BattleRoleObject:setBusyState(val)
	if self:getId() == specId then
		Bcallstack(self._id, "setBusyState", val)
	end

	self._isBusy = val
end

function BattleRoleObject:isBusyState()
	return self._isBusy
end

function BattleRoleObject:isBlockByActId(actId)
	return self._dataModel:getBlockInfo(actId)
end

function BattleRoleObject:actionEndCallback()
	self._animLoop = nil
	local state = self._state
	local forward = self._isLeftTeam and 1 or -1

	self:setForward(forward)

	if self._state ~= "fail" then
		if self._state == "win" then
			self._roleAnim:pauseAnimation()
		elseif self._roleType == RoleType.Master or self._dataModel:getRp() < self._dataModel:getMaxRp() then
			self:switchState("stand", {
				loop = -1
			})
		else
			self:switchState("charge", {
				loop = 1
			})
		end
	end

	if self.animCallback then
		self.animCallback()
	end
end

function BattleRoleObject:pauseAnim(frameIndex)
	self._roleAnim:setAnimationFrameIndex(0, frameIndex)
	self._roleAnim:pauseAnimation()
end

function BattleRoleObject:createBehaviorNode(args)
	local behaviorNode = nil

	while true do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 3-5, warpins: 1 ---
		if args.seq then

			-- Decompilation error in this vicinity:
			--- BLOCK #1 6-15, warpins: 1 ---
			behaviorNode = SequenceBehavior:new(self:arrIterator(args.seq))

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 16-16, warpins: 1 ---
			break

			--- END OF BLOCK #2 ---

			FLOW; TARGET BLOCK #3



			-- Decompilation error in this vicinity:
			--- BLOCK #3 16-16, warpins: 0 ---
			--- END OF BLOCK #3 ---

			FLOW; TARGET BLOCK #4



			-- Decompilation error in this vicinity:
			--- BLOCK #4 17-19, warpins: 1 ---
			if args.par then

				-- Decompilation error in this vicinity:
				--- BLOCK #5 20-29, warpins: 1 ---
				behaviorNode = ParallelSelectorBehavior:new(self:arrIterator(args.par))

				--- END OF BLOCK #5 ---

				FLOW; TARGET BLOCK #6



				-- Decompilation error in this vicinity:
				--- BLOCK #6 30-30, warpins: 1 ---
				break
				--- END OF BLOCK #6 ---

				FLOW; TARGET BLOCK #7



				-- Decompilation error in this vicinity:
				--- BLOCK #7 30-30, warpins: 0 ---
				break
				--- END OF BLOCK #7 ---



			end
			--- END OF BLOCK #4 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #8



		-- Decompilation error in this vicinity:
		--- BLOCK #1 6-15, warpins: 1 ---
		behaviorNode = SequenceBehavior:new(self:arrIterator(args.seq))

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 16-16, warpins: 1 ---
		break

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 16-16, warpins: 0 ---
		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 17-19, warpins: 1 ---
		if args.par then

			-- Decompilation error in this vicinity:
			--- BLOCK #5 20-29, warpins: 1 ---
			behaviorNode = ParallelSelectorBehavior:new(self:arrIterator(args.par))

			--- END OF BLOCK #5 ---

			FLOW; TARGET BLOCK #6



			-- Decompilation error in this vicinity:
			--- BLOCK #6 30-30, warpins: 1 ---
			break
			--- END OF BLOCK #6 ---

			FLOW; TARGET BLOCK #7



			-- Decompilation error in this vicinity:
			--- BLOCK #7 30-30, warpins: 0 ---
			break
			--- END OF BLOCK #7 ---



		end

		--- END OF BLOCK #4 ---




		-- Decompilation error in this vicinity:
		--- BLOCK #5 20-29, warpins: 1 ---
		behaviorNode = ParallelSelectorBehavior:new(self:arrIterator(args.par))

		--- END OF BLOCK #5 ---

		FLOW; TARGET BLOCK #6



		-- Decompilation error in this vicinity:
		--- BLOCK #6 30-30, warpins: 1 ---
		break
		--- END OF BLOCK #6 ---

		FLOW; TARGET BLOCK #7



		-- Decompilation error in this vicinity:
		--- BLOCK #7 30-30, warpins: 0 ---
		break

		--- END OF BLOCK #7 ---




		-- Decompilation error in this vicinity:
		--- BLOCK #8 31-33, warpins: 1 ---
		if args.name and args.name == "ShiftMove" then

			-- Decompilation error in this vicinity:
			--- BLOCK #10 37-43, warpins: 1 ---
			behaviorNode = BattleMoveBehaviorNode:new(args)

			--- END OF BLOCK #10 ---

			FLOW; TARGET BLOCK #11



			-- Decompilation error in this vicinity:
			--- BLOCK #11 44-44, warpins: 1 ---
			break
			--- END OF BLOCK #11 ---

			FLOW; TARGET BLOCK #12



			-- Decompilation error in this vicinity:
			--- BLOCK #12 44-44, warpins: 0 ---
			break
			--- END OF BLOCK #12 ---



		end

		--- END OF BLOCK #8 ---

		FLOW; TARGET BLOCK #13



		-- Decompilation error in this vicinity:
		--- BLOCK #9 34-36, warpins: 1 ---
		--- END OF BLOCK #9 ---

		if args.name == "ShiftMove" then
		JUMP TO BLOCK #10
		else
		JUMP TO BLOCK #13
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #10 37-43, warpins: 1 ---
		behaviorNode = BattleMoveBehaviorNode:new(args)

		--- END OF BLOCK #10 ---

		FLOW; TARGET BLOCK #11



		-- Decompilation error in this vicinity:
		--- BLOCK #11 44-44, warpins: 1 ---
		break
		--- END OF BLOCK #11 ---

		FLOW; TARGET BLOCK #12



		-- Decompilation error in this vicinity:
		--- BLOCK #12 44-44, warpins: 0 ---
		break

		--- END OF BLOCK #12 ---




		-- Decompilation error in this vicinity:
		--- BLOCK #13 45-47, warpins: 2 ---
		if args.name and args.name == "Animation" then

			-- Decompilation error in this vicinity:
			--- BLOCK #15 51-66, warpins: 1 ---
			local param = {}
			param.name = args.actName
			param.loop = args.loop
			param.dur = args.dur
			param.strt = args.strt
			behaviorNode = BattleActionBehaviorNode:new(param)

			--- END OF BLOCK #15 ---

			FLOW; TARGET BLOCK #16



			-- Decompilation error in this vicinity:
			--- BLOCK #16 67-67, warpins: 1 ---
			break
			--- END OF BLOCK #16 ---

			FLOW; TARGET BLOCK #17



			-- Decompilation error in this vicinity:
			--- BLOCK #17 67-67, warpins: 0 ---
			break
			--- END OF BLOCK #17 ---



		end

		--- END OF BLOCK #13 ---

		FLOW; TARGET BLOCK #18



		-- Decompilation error in this vicinity:
		--- BLOCK #14 48-50, warpins: 1 ---
		--- END OF BLOCK #14 ---

		if args.name == "Animation" then
		JUMP TO BLOCK #15
		else
		JUMP TO BLOCK #18
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #15 51-66, warpins: 1 ---
		local param = 
		param.name = args.actName
		param.loop = args.loop
		param.dur = args.dur
		param.strt = args.strt
		behaviorNode = BattleActionBehaviorNode:new(param)

		--- END OF BLOCK #15 ---

		FLOW; TARGET BLOCK #16



		-- Decompilation error in this vicinity:
		--- BLOCK #16 67-67, warpins: 1 ---
		break
		--- END OF BLOCK #16 ---

		FLOW; TARGET BLOCK #17



		-- Decompilation error in this vicinity:
		--- BLOCK #17 67-67, warpins: 0 ---
		break

		--- END OF BLOCK #17 ---




		-- Decompilation error in this vicinity:
		--- BLOCK #18 68-72, warpins: 2 ---
		local cfgArr = {}
		local param = {}

		if args.move then

			-- Decompilation error in this vicinity:
			--- BLOCK #19 73-84, warpins: 1 ---
			local moveParam = {}

			table.deepcopy(args.move, moveParam)

			moveParam.name = "ShiftMove"
			cfgArr[#cfgArr + 1] = moveParam
			param = moveParam
			--- END OF BLOCK #19 ---



		end

		--- END OF BLOCK #18 ---

		FLOW; TARGET BLOCK #20



		-- Decompilation error in this vicinity:
		--- BLOCK #19 73-84, warpins: 1 ---
		local moveParam = 

		table.deepcopy(args.move, moveParam)

		moveParam.name = "ShiftMove"
		cfgArr[#cfgArr + 1] = moveParam
		param = moveParam

		--- END OF BLOCK #19 ---




		-- Decompilation error in this vicinity:
		--- BLOCK #20 85-87, warpins: 2 ---
		if args.name then

			-- Decompilation error in this vicinity:
			--- BLOCK #21 88-100, warpins: 1 ---
			local actParam = {
				name = "Animation"
			}
			actParam.actName = args.name
			actParam.loop = args.loop
			actParam.dur = args.dur
			actParam.strt = args.strt
			cfgArr[#cfgArr + 1] = actParam
			param = actParam
			--- END OF BLOCK #21 ---



		end

		--- END OF BLOCK #20 ---

		FLOW; TARGET BLOCK #22



		-- Decompilation error in this vicinity:
		--- BLOCK #21 88-100, warpins: 1 ---
		local actParam = 
		actParam.actName = args.name
		actParam.loop = args.loop
		actParam.dur = args.dur
		actParam.strt = args.strt
		cfgArr[#cfgArr + 1] = actParam
		param = actParam

		--- END OF BLOCK #21 ---




		-- Decompilation error in this vicinity:
		--- BLOCK #22 101-104, warpins: 2 ---
		if #cfgArr > 1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #23 105-114, warpins: 1 ---
			behaviorNode = ParallelSelectorBehavior:new(self:arrIterator(cfgArr))

			--- END OF BLOCK #23 ---

			FLOW; TARGET BLOCK #24



			-- Decompilation error in this vicinity:
			--- BLOCK #24 115-115, warpins: 1 ---
			break
			--- END OF BLOCK #24 ---

			FLOW; TARGET BLOCK #25



			-- Decompilation error in this vicinity:
			--- BLOCK #25 115-115, warpins: 0 ---
			break
			--- END OF BLOCK #25 ---



		end

		--- END OF BLOCK #22 ---

		FLOW; TARGET BLOCK #26



		-- Decompilation error in this vicinity:
		--- BLOCK #23 105-114, warpins: 1 ---
		behaviorNode = ParallelSelectorBehavior:new(self:arrIterator(cfgArr))

		--- END OF BLOCK #23 ---

		FLOW; TARGET BLOCK #24



		-- Decompilation error in this vicinity:
		--- BLOCK #24 115-115, warpins: 1 ---
		break
		--- END OF BLOCK #24 ---

		FLOW; TARGET BLOCK #25



		-- Decompilation error in this vicinity:
		--- BLOCK #25 115-115, warpins: 0 ---
		break

		--- END OF BLOCK #25 ---




		-- Decompilation error in this vicinity:
		--- BLOCK #26 116-118, warpins: 1 ---
		--- END OF BLOCK #26 ---




		-- Decompilation error in this vicinity:
		--- BLOCK #27 119-124, warpins: 1 ---
		behaviorNode = self:createBehaviorNode(param)

		--- END OF BLOCK #27 ---

		FLOW; TARGET BLOCK #28



		-- Decompilation error in this vicinity:
		--- BLOCK #28 125-125, warpins: 1 ---
		break
		--- END OF BLOCK #28 ---

		FLOW; TARGET BLOCK #29



		-- Decompilation error in this vicinity:
		--- BLOCK #29 125-125, warpins: 0 ---
		break
		--- END OF BLOCK #29 ---

		FLOW; TARGET BLOCK #30



		-- Decompilation error in this vicinity:
		--- BLOCK #30 126-126, warpins: 0 ---
		--- END OF BLOCK #30 ---

		FLOW; TARGET BLOCK #31



		-- Decompilation error in this vicinity:
		--- BLOCK #31 127-127, warpins: 0 ---
		--- END OF BLOCK #31 ---



	end

	behaviorNode = behaviorNode or EmptyBehaviorNode:new()

	if args.delay then

		-- Decompilation error in this vicinity:
		--- BLOCK #4 137-142, warpins: 1 ---
		return DelayBehaviorNode:new(behaviorNode, args.delay)
		--- END OF BLOCK #4 ---



	end

	return behaviorNode
end

function BattleRoleObject:arrIterator(configArr)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	local function f(ctx, ctrlVar)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-1, warpins: 1 ---
		local action = nil

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 2-3, warpins: 3 ---
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 4-20, warpins: 0 ---
		while action == nil do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 4-4, warpins: 1 ---
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 5-9, warpins: 1 ---
			ctrlVar = ctrlVar + 1

			--- END OF BLOCK #1 ---

			if ctrlVar > #configArr then
			JUMP TO BLOCK #2
			else
			JUMP TO BLOCK #3
			end



			-- Decompilation error in this vicinity:
			--- BLOCK #2 10-11, warpins: 1 ---
			return

			--- END OF BLOCK #2 ---

			UNCONDITIONAL JUMP; TARGET BLOCK #4



			-- Decompilation error in this vicinity:
			--- BLOCK #3 12-19, warpins: 1 ---
			action = self:createBehaviorNode(configArr[ctrlVar])
			--- END OF BLOCK #3 ---

			FLOW; TARGET BLOCK #4



			-- Decompilation error in this vicinity:
			--- BLOCK #4 20-20, warpins: 1 ---
			--- END OF BLOCK #4 ---



		end

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 20-22, warpins: 1 ---
		return ctrlVar, action
		--- END OF BLOCK #3 ---



	end

	return f, 0
	--- END OF BLOCK #0 ---



end

function BattleRoleObject:settle()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	--- END OF BLOCK #0 ---

	slot1 = if not self._topBar:scheduleShowHp()

	 then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #3
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 7-9, warpins: 1 ---
	--- END OF BLOCK #1 ---

	slot1 = if not self._hiding then
	JUMP TO BLOCK #2
	else
	JUMP TO BLOCK #3
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #2 10-10, warpins: 1 ---
	return

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 11-43, warpins: 3 ---
	self._frontActiveFla:setVisible(true)
	self._backActiveFla:setVisible(true)
	self._frontFlaNode:setVisible(true)
	self._backFlaNode:setVisible(true)
	self._topFlaNode:setVisible(true)
	self._bottomFlaNode:setVisible(true)

	--- END OF BLOCK #3 ---

	slot1 = if self._hiding then
	JUMP TO BLOCK #4
	else
	JUMP TO BLOCK #5
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #4 44-69, warpins: 1 ---
	self._hiding = nil

	self._roleAnim:setVisible(true)
	self._roleAnim:setColorTransform(self._baseColorTrans)
	self:switchState("squat", {
		loop = 1
	})
	AudioEngine:getInstance():playEffect("Se_Alert_Unique_Skill", false)
	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 70-80, warpins: 2 ---
	self._battleGround:resetGroundCell(self._dataModel:getCellId(), GroundCellStatus.OCCUPIED)

	return
	--- END OF BLOCK #5 ---



end

function BattleRoleObject:playWinOrLoseAnim(result)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	--- END OF BLOCK #0 ---

	if result == 1 then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #2
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 3-5, warpins: 1 ---
	--- END OF BLOCK #1 ---

	slot2 = if not self._isLeftTeam then
	JUMP TO BLOCK #2
	else
	JUMP TO BLOCK #4
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #2 6-7, warpins: 2 ---
	--- END OF BLOCK #2 ---

	if result == -1 then
	JUMP TO BLOCK #3
	else
	JUMP TO BLOCK #5
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #3 8-10, warpins: 1 ---
	--- END OF BLOCK #3 ---

	slot2 = if not self._isLeftTeam then
	JUMP TO BLOCK #4
	else
	JUMP TO BLOCK #5
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #4 11-16, warpins: 2 ---
	self:switchState("win", {
		loop = 1
	})
	--- END OF BLOCK #4 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #12



	-- Decompilation error in this vicinity:
	--- BLOCK #5 17-18, warpins: 2 ---
	--- END OF BLOCK #5 ---

	if result == -1 then
	JUMP TO BLOCK #6
	else
	JUMP TO BLOCK #7
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #6 19-21, warpins: 1 ---
	--- END OF BLOCK #6 ---

	slot2 = if not self._isLeftTeam then
	JUMP TO BLOCK #7
	else
	JUMP TO BLOCK #9
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #7 22-23, warpins: 2 ---
	--- END OF BLOCK #7 ---

	if result == 1 then
	JUMP TO BLOCK #8
	else
	JUMP TO BLOCK #12
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #8 24-26, warpins: 1 ---
	--- END OF BLOCK #8 ---

	slot2 = if not self._isLeftTeam then
	JUMP TO BLOCK #9
	else
	JUMP TO BLOCK #12
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #9 27-31, warpins: 2 ---
	--- END OF BLOCK #9 ---

	slot2 = if self:isLive()

	 then
	JUMP TO BLOCK #10
	else
	JUMP TO BLOCK #11
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #10 32-36, warpins: 1 ---
	self._specialSoundDisabled = true
	self._liveState = LiveState.Dying

	--- END OF BLOCK #10 ---

	FLOW; TARGET BLOCK #11



	-- Decompilation error in this vicinity:
	--- BLOCK #11 37-39, warpins: 2 ---
	self:tryDie()

	--- END OF BLOCK #11 ---

	FLOW; TARGET BLOCK #12



	-- Decompilation error in this vicinity:
	--- BLOCK #12 40-42, warpins: 4 ---
	--- END OF BLOCK #12 ---

	slot2 = if self._isLeftTeam then
	JUMP TO BLOCK #13
	else
	JUMP TO BLOCK #14
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #13 43-44, warpins: 1 ---
	slot2 = 1
	--- END OF BLOCK #13 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #15



	-- Decompilation error in this vicinity:
	--- BLOCK #14 45-45, warpins: 1 ---
	local forward = -1

	--- END OF BLOCK #14 ---

	FLOW; TARGET BLOCK #15



	-- Decompilation error in this vicinity:
	--- BLOCK #15 46-50, warpins: 2 ---
	self:setForward(forward)

	return
	--- END OF BLOCK #15 ---



end

function BattleRoleObject:isDieAnim(animName)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	--- END OF BLOCK #0 ---

	if animName ~= "die" then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #7
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 3-4, warpins: 1 ---
	--- END OF BLOCK #1 ---

	if animName ~= "die_1" then
	JUMP TO BLOCK #2
	else
	JUMP TO BLOCK #7
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #2 5-6, warpins: 1 ---
	--- END OF BLOCK #2 ---

	if animName ~= "die_5" then
	JUMP TO BLOCK #3
	else
	JUMP TO BLOCK #7
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #3 7-8, warpins: 1 ---
	--- END OF BLOCK #3 ---

	if animName ~= "die_6" then
	JUMP TO BLOCK #4
	else
	JUMP TO BLOCK #7
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #4 9-10, warpins: 1 ---
	--- END OF BLOCK #4 ---

	if animName ~= "die_7" then
	JUMP TO BLOCK #5
	else
	JUMP TO BLOCK #7
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #5 11-12, warpins: 1 ---
	--- END OF BLOCK #5 ---

	if animName ~= "die_8" then
	JUMP TO BLOCK #6
	else
	JUMP TO BLOCK #7
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #6 13-14, warpins: 1 ---
	slot2 = false
	--- END OF BLOCK #6 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #7 15-15, warpins: 6 ---
	slot2 = true

	--- END OF BLOCK #7 ---

	FLOW; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #8 16-16, warpins: 2 ---
	return slot2
	--- END OF BLOCK #8 ---



end

function BattleRoleObject:isDownAnim(animName)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	--- END OF BLOCK #0 ---

	if animName ~= "down" then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #5
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 3-4, warpins: 1 ---
	--- END OF BLOCK #1 ---

	if animName ~= "down_2" then
	JUMP TO BLOCK #2
	else
	JUMP TO BLOCK #5
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #2 5-6, warpins: 1 ---
	--- END OF BLOCK #2 ---

	if animName ~= "down_3" then
	JUMP TO BLOCK #3
	else
	JUMP TO BLOCK #5
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #3 7-8, warpins: 1 ---
	--- END OF BLOCK #3 ---

	if animName ~= "down_4" then
	JUMP TO BLOCK #4
	else
	JUMP TO BLOCK #5
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #4 9-10, warpins: 1 ---
	slot2 = false
	--- END OF BLOCK #4 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #5 11-11, warpins: 4 ---
	slot2 = true

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 12-12, warpins: 2 ---
	return slot2
	--- END OF BLOCK #6 ---



end

function BattleRoleObject:spineHandler(event)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	--- END OF BLOCK #0 ---

	if event.type == "complete" then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #21
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 4-6, warpins: 1 ---
	--- END OF BLOCK #1 ---

	if event.animation == "debut" then
	JUMP TO BLOCK #2
	else
	JUMP TO BLOCK #4
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #2 7-11, warpins: 1 ---
	--- END OF BLOCK #2 ---

	if self._liveState == LiveState.Lived then
	JUMP TO BLOCK #3
	else
	JUMP TO BLOCK #4
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #3 12-17, warpins: 1 ---
	self:switchState("stand", {
		loop = -1
	})

	return

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 18-23, warpins: 3 ---
	--- END OF BLOCK #4 ---

	slot2 = if self:isDownAnim(event.animation)
	 then
	JUMP TO BLOCK #5
	else
	JUMP TO BLOCK #8
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #5 24-28, warpins: 1 ---
	--- END OF BLOCK #5 ---

	slot2 = if self:isLive()
	 then
	JUMP TO BLOCK #6
	else
	JUMP TO BLOCK #7
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #6 29-34, warpins: 1 ---
	self:switchState("getup")

	return

	--- END OF BLOCK #6 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #7 35-40, warpins: 1 ---
	self._animEnded = true

	self:tryDie()

	return

	--- END OF BLOCK #7 ---

	FLOW; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #8 41-46, warpins: 3 ---
	--- END OF BLOCK #8 ---

	slot2 = if self:isDieAnim(event.animation)
	 then
	JUMP TO BLOCK #9
	else
	JUMP TO BLOCK #13
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #9 47-49, warpins: 1 ---
	--- END OF BLOCK #9 ---

	if self._state ~= "fakedie" then
	JUMP TO BLOCK #10
	else
	JUMP TO BLOCK #11
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #10 50-52, warpins: 1 ---
	--- END OF BLOCK #10 ---

	if self._state == "lockdie" then
	JUMP TO BLOCK #11
	else
	JUMP TO BLOCK #12
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #11 53-57, warpins: 2 ---
	self._roleAnim:pauseAnimation()

	return

	--- END OF BLOCK #11 ---

	FLOW; TARGET BLOCK #12



	-- Decompilation error in this vicinity:
	--- BLOCK #12 58-63, warpins: 2 ---
	self._animEnded = true

	self:tryDie()

	return
	--- END OF BLOCK #12 ---

	FLOW; TARGET BLOCK #13



	-- Decompilation error in this vicinity:
	--- BLOCK #13 64-66, warpins: 2 ---
	--- END OF BLOCK #13 ---

	slot2 = if self._animLoop then
	JUMP TO BLOCK #14
	else
	JUMP TO BLOCK #15
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #14 67-70, warpins: 1 ---
	--- END OF BLOCK #14 ---

	if self._animLoop <= 0 then
	JUMP TO BLOCK #15
	else
	JUMP TO BLOCK #16
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #15 71-71, warpins: 2 ---
	return

	--- END OF BLOCK #15 ---

	FLOW; TARGET BLOCK #16



	-- Decompilation error in this vicinity:
	--- BLOCK #16 72-78, warpins: 2 ---
	self._animLoop = self._animLoop - 1
	--- END OF BLOCK #16 ---

	if self._animLoop > 0 then
	JUMP TO BLOCK #17
	else
	JUMP TO BLOCK #18
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #17 79-88, warpins: 1 ---
	local extra = {}
	extra.loop = self._animLoop

	self:switchState(self._state, extra, true)

	--- END OF BLOCK #17 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #20



	-- Decompilation error in this vicinity:
	--- BLOCK #18 89-102, warpins: 1 ---
	local frameCount = self._roleAnim:getAnimationFrames(event.animation)

	self._roleAnim:goToFrameIndexAndPaused(0, frameCount - 1)
	--- END OF BLOCK #18 ---

	if self._animTask == nil then
	JUMP TO BLOCK #19
	else
	JUMP TO BLOCK #20
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #19 103-105, warpins: 1 ---
	self:actionEndCallback()

	--- END OF BLOCK #19 ---

	FLOW; TARGET BLOCK #20



	-- Decompilation error in this vicinity:
	--- BLOCK #20 106-106, warpins: 3 ---
	return

	--- END OF BLOCK #20 ---

	FLOW; TARGET BLOCK #21



	-- Decompilation error in this vicinity:
	--- BLOCK #21 107-121, warpins: 2 ---
	local handler = self:getContext():getValue("SpineHandler")
	local eventData = event.eventData
	local argsStr = eventData.stringValue
	local params = cjson.decode(argsStr)

	--- END OF BLOCK #21 ---

	slot5 = if not params then
	JUMP TO BLOCK #22
	else
	JUMP TO BLOCK #23
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #22 122-129, warpins: 1 ---
	DpsLogger:debug("battle", "Invalid events in '{}'", event.animation)

	return

	--- END OF BLOCK #22 ---

	FLOW; TARGET BLOCK #23



	-- Decompilation error in this vicinity:
	--- BLOCK #23 130-149, warpins: 2 ---
	local action = params.eventType
	action = action:sub(1, 1):upper() .. action:sub(2)
	local func = handler["spineHandler_" .. action]

	--- END OF BLOCK #23 ---

	if func == nil then
	JUMP TO BLOCK #24
	else
	JUMP TO BLOCK #25
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #24 150-157, warpins: 1 ---
	DpsLogger:debug("battle", "BattleRoleObject skipped spine handler '{}'", action)

	return

	--- END OF BLOCK #24 ---

	FLOW; TARGET BLOCK #25



	-- Decompilation error in this vicinity:
	--- BLOCK #25 158-164, warpins: 2 ---
	func(handler, event, params, self)

	return
	--- END OF BLOCK #25 ---



end

function BattleRoleObject:onHpChanged(event)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	local data = event:getData()

	--- END OF BLOCK #0 ---

	if self._id ~= data.roleId then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #2
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-8, warpins: 1 ---
	return

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 9-38, warpins: 2 ---
	local hpPercent = self._dataModel:getHp() / self._dataModel:getMaxHp() * 100

	self._topBar:setHp(hpPercent)
	self:syncMainViewMaster(data.maxHp)
	self._topBar:scheduleShowHp()
	--- END OF BLOCK #2 ---

	if self._dataModel:getHp()
	 <= 0 then
	JUMP TO BLOCK #3
	else
	JUMP TO BLOCK #6
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #3 39-44, warpins: 1 ---
	--- END OF BLOCK #3 ---

	slot4 = if not self._dataModel:getIsProcessingBoss()

	 then
	JUMP TO BLOCK #4
	else
	JUMP TO BLOCK #6
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #4 45-49, warpins: 1 ---
	--- END OF BLOCK #4 ---

	if self._roleType == RoleType.Master then
	JUMP TO BLOCK #5
	else
	JUMP TO BLOCK #6
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #5 50-58, warpins: 1 ---
	local mainMediator = self._context:getValue("BattleMainMediator")

	mainMediator:showFinalHitAnim(self)

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 59-59, warpins: 4 ---
	return
	--- END OF BLOCK #6 ---



end

function BattleRoleObject:onShieldChanged(event)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	self._topBar:refreshShield()

	return
	--- END OF BLOCK #0 ---



end

function BattleRoleObject:onRpChanged(event)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	local data = event:getData()

	--- END OF BLOCK #0 ---

	if self._id ~= data.roleId then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #2
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-8, warpins: 1 ---
	return

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 9-34, warpins: 2 ---
	self:syncMainViewMaster()

	local mpPercent = self:getShowRpNum(self._dataModel:getRp()) / self._dataModel:getMaxRp() * 100

	self._topBar:setRp(mpPercent)

	--- END OF BLOCK #2 ---

	if self._roleType == RoleType.Master then
	JUMP TO BLOCK #3
	else
	JUMP TO BLOCK #11
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #3 35-42, warpins: 1 ---
	local anim = self._frontActiveFla:getChildByName("nlm")
	--- END OF BLOCK #3 ---

	if mpPercent >= 100 then
	JUMP TO BLOCK #4
	else
	JUMP TO BLOCK #9
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #4 43-44, warpins: 1 ---
	--- END OF BLOCK #4 ---

	slot4 = if not anim then
	JUMP TO BLOCK #5
	else
	JUMP TO BLOCK #11
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #5 45-71, warpins: 1 ---
	anim = cc.MovieClip:create("mannu_mannu")

	anim:setBlendMode(1)

	local node = cc.Node:create():addTo(self._frontActiveFla)
	slot8 = node
	slot6 = node.setScaleX

	--- END OF BLOCK #5 ---

	slot9 = if self:isLeft()

	 then
	JUMP TO BLOCK #6
	else
	JUMP TO BLOCK #7
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #6 72-73, warpins: 1 ---
	slot9 = -1
	--- END OF BLOCK #6 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #7 74-74, warpins: 1 ---
	slot9 = 1

	--- END OF BLOCK #7 ---

	FLOW; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #8 75-89, warpins: 2 ---
	slot6(slot8, slot9)
	node:setName("nlm")
	anim:posite(0, 68):addTo(node)
	--- END OF BLOCK #8 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #11



	-- Decompilation error in this vicinity:
	--- BLOCK #9 90-91, warpins: 1 ---
	--- END OF BLOCK #9 ---

	slot4 = if anim then
	JUMP TO BLOCK #10
	else
	JUMP TO BLOCK #11
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #10 92-94, warpins: 1 ---
	anim:removeFromParent()
	--- END OF BLOCK #10 ---

	FLOW; TARGET BLOCK #11



	-- Decompilation error in this vicinity:
	--- BLOCK #11 95-99, warpins: 5 ---
	self._topBar:scheduleShowRp()

	return
	--- END OF BLOCK #11 ---



end

function BattleRoleObject:onFilmEvent()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	self._filmedNum = self._filmedNum + 1
	self._filmed = true

	self:refreshColor()

	return
	--- END OF BLOCK #0 ---



end

function BattleRoleObject:onUnFilmEvent()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-13, warpins: 1 ---
	self._filmedNum = self._filmedNum - 1
	self._filmedNum = math.max(self._filmedNum, 0)
	--- END OF BLOCK #0 ---

	if self._filmedNum <= 0 then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #2
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 14-15, warpins: 1 ---
	slot1 = false
	--- END OF BLOCK #1 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #2 16-16, warpins: 1 ---
	slot1 = true
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 17-21, warpins: 2 ---
	self._filmed = slot1

	self:refreshColor()

	return
	--- END OF BLOCK #3 ---



end

function BattleRoleObject:speakBubble(args)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	--- END OF BLOCK #0 ---

	slot2 = if self._bubble then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #2
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 4-9, warpins: 1 ---
	self._bubble:removeView()

	self._bubble = nil
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 10-60, warpins: 2 ---
	local resPath = "asset/ui/BattleBubbleWidget.csb"
	local node = cc.CSLoader:createNode(resPath)
	local bubble = BattleBubbleWidget:new(node, args, function (sender)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		--- END OF BLOCK #0 ---

		slot1 = if self._bubble then
		JUMP TO BLOCK #1
		else
		JUMP TO BLOCK #2
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #1 5-12, warpins: 1 ---
		self._bubble:removeView()

		self._bubble = nil

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 13-13, warpins: 2 ---
		return
		--- END OF BLOCK #2 ---



	end)

	bubble:autoDispose()

	local pos = cc.p(-self:getModelWidth() / 2 - 45, self:getModelHeight() + 30)

	bubble:getView():setPosition(pos)
	bubble:getView():addTo(self._bubbleNode)
	bubble:setViewContext(self._context)

	self._bubble = bubble

	return
	--- END OF BLOCK #2 ---



end

function BattleRoleObject:emoteBubble(args)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	--- END OF BLOCK #0 ---

	slot2 = if self._bubble then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #2
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 4-9, warpins: 1 ---
	self._bubble:removeView()

	self._bubble = nil
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 10-37, warpins: 2 ---
	local node = cc.Node:create()
	local bubble = BattleEmoteWidget:new(node, args, function (sender)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		--- END OF BLOCK #0 ---

		slot1 = if self._bubble then
		JUMP TO BLOCK #1
		else
		JUMP TO BLOCK #2
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #1 5-12, warpins: 1 ---
		self._bubble:removeView()

		self._bubble = nil

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 13-13, warpins: 2 ---
		return
		--- END OF BLOCK #2 ---



	end)
	local pos = cc.p(self:getModelWidth() / 2, self:getModelHeight() + 30)

	--- END OF BLOCK #2 ---

	slot5 = if not self:isLeft()
	 then
	JUMP TO BLOCK #3
	else
	JUMP TO BLOCK #4
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #3 38-57, warpins: 1 ---
	bubble:getView():setScaleX(-1)

	pos = cc.p(-self:getModelWidth() / 2, self:getModelHeight() + 30)

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 58-79, warpins: 2 ---
	bubble:getView():setPosition(pos)
	bubble:getView():addTo(self._bubbleNode, 101)
	bubble:setViewContext(self._context)

	self._bubble = bubble

	return
	--- END OF BLOCK #4 ---



end

function BattleRoleObject:addActivateNums(actId)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	--- END OF BLOCK #0 ---

	slot2 = if not self._activeTags[actId] then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #3
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-14, warpins: 1 ---
	self._activeTags[actId] = true
	self._activateNum = self._activateNum + 1

	--- END OF BLOCK #1 ---

	if self._id == specId then
	JUMP TO BLOCK #2
	else
	JUMP TO BLOCK #3
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #2 15-19, warpins: 1 ---
	Bcallstack("addActivateNum", actId, self._activateNum)

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 20-20, warpins: 3 ---
	return
	--- END OF BLOCK #3 ---



end

function BattleRoleObject:subActivateNums(actId)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	--- END OF BLOCK #0 ---

	slot2 = if not self._activeTags[actId] then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #2
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-5, warpins: 1 ---
	return

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 6-19, warpins: 2 ---
	self._activeTags[actId] = false
	self._activateNum = math.max(self._activateNum - 1, 0)

	--- END OF BLOCK #2 ---

	if self._id == specId then
	JUMP TO BLOCK #3
	else
	JUMP TO BLOCK #4
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #3 20-24, warpins: 1 ---
	Bcallstack("subActivateNum", actId, self._activateNum)
	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 25-32, warpins: 2 ---
	self:tryDie()
	--- END OF BLOCK #4 ---

	slot2 = if self:isFree()
	 then
	JUMP TO BLOCK #5
	else
	JUMP TO BLOCK #7
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #5 33-37, warpins: 1 ---
	--- END OF BLOCK #5 ---

	slot2 = if self:isLive()
	 then
	JUMP TO BLOCK #6
	else
	JUMP TO BLOCK #7
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #6 38-40, warpins: 1 ---
	self:tryResetState()
	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 41-45, warpins: 3 ---
	--- END OF BLOCK #7 ---

	slot2 = if self:isFree()
	 then
	JUMP TO BLOCK #8
	else
	JUMP TO BLOCK #11
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #8 46-50, warpins: 1 ---
	--- END OF BLOCK #8 ---

	slot2 = if not self:isLive()

	 then
	JUMP TO BLOCK #9
	else
	JUMP TO BLOCK #11
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #9 51-53, warpins: 1 ---
	--- END OF BLOCK #9 ---

	if self._state == "stand" then
	JUMP TO BLOCK #10
	else
	JUMP TO BLOCK #11
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #10 54-54, warpins: 1 ---
	--- END OF BLOCK #10 ---

	FLOW; TARGET BLOCK #11



	-- Decompilation error in this vicinity:
	--- BLOCK #11 54-54, warpins: 4 ---
	return
	--- END OF BLOCK #11 ---



end

function BattleRoleObject:isFree()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	--- END OF BLOCK #0 ---

	if self._activateNum ~= 0 then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #2
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 4-5, warpins: 1 ---
	slot1 = false
	--- END OF BLOCK #1 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #2 6-6, warpins: 1 ---
	slot1 = true

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 7-7, warpins: 2 ---
	return slot1
	--- END OF BLOCK #3 ---



end

function BattleRoleObject:shiftPosition(v, a, dur)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	--- END OF BLOCK #0 ---

	if a == nil then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #2
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 3-3, warpins: 1 ---
	a = {
		0,
		0
	}
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 4-5, warpins: 2 ---
	--- END OF BLOCK #2 ---

	if v == nil then
	JUMP TO BLOCK #3
	else
	JUMP TO BLOCK #4
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #3 6-6, warpins: 1 ---
	v = {
		0,
		0
	}

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 7-11, warpins: 2 ---
	--- END OF BLOCK #4 ---

	slot4 = if not self:isLeft()

	 then
	JUMP TO BLOCK #5
	else
	JUMP TO BLOCK #6
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #5 12-25, warpins: 1 ---
	v = {
		-v[1],
		v[2]
	}
	a = {
		-a[1],
		a[2]
	}
	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 26-62, warpins: 2 ---
	v = {
		v[1] * 0.4,
		v[2] * 0.3333333333333333
	}
	a = {
		a[1] * 0.4,
		a[2] * 0.3333333333333333
	}
	local startPos = self:getRelPosition()
	local curZorder = self:getView():getLocalZOrder()
	self._shiftPosTask = self:getContext():runActionTask(dur, function (p)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-47, warpins: 1 ---
		local t = dur * p
		local offsetX = v[1] * t + 0.5 * a[1] * t^2
		local offsetY = v[2] * t + 0.5 * a[2] * t^2
		local offset = cc.p(offsetX, offsetY)
		local curPos = cc.pAdd(startPos, offset)

		self:setRelPosition(curPos, kRoleTopZOrder)
		self:getView():setLocalZOrder(curZorder)

		return
		--- END OF BLOCK #0 ---



	end, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		self._shiftPosTask = nil

		return
		--- END OF BLOCK #0 ---



	end)

	return
	--- END OF BLOCK #6 ---



end

function BattleRoleObject:offsetPosition(x, y)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	--- END OF BLOCK #0 ---

	if self._displacement == nil then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #2
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 4-5, warpins: 1 ---
	self._displacement = {
		0,
		0
	}
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 6-13, warpins: 2 ---
	slot3 = self._displacement
	slot4 = self._displacement[1]

	--- END OF BLOCK #2 ---

	slot5 = if self:isLeft()

	 then
	JUMP TO BLOCK #3
	else
	JUMP TO BLOCK #4
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #3 14-15, warpins: 1 ---
	slot5 = 1
	--- END OF BLOCK #3 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #4 16-16, warpins: 1 ---
	local activeNode = -1
	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 17-39, warpins: 2 ---
	slot3[1] = slot4 + x * activeNode
	self._displacement[2] = self._displacement[2] + y
	local x0 = self._displacement[1] * kMeasuringScale
	local y0 = self._displacement[2] * kMeasuringScale
	local activeNode = self._activeNode

	activeNode:setPosition(x0, y0)

	return
	--- END OF BLOCK #5 ---



end

function BattleRoleObject:dieHide()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	--- END OF BLOCK #0 ---

	if self._liveState == LiveState.Remove then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #2
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-6, warpins: 1 ---
	return

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 7-14, warpins: 2 ---
	self:getView():setVisible(false)

	return
	--- END OF BLOCK #2 ---



end

function BattleRoleObject:hideRole(opacity)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-21, warpins: 1 ---
	self._topBar:setHpVisible(false)
	self._iconContainer:setVisible(false)
	self._topBar:setRpVisible(false)

	self._topBarVisibleSta = false

	--- END OF BLOCK #0 ---

	slot2 = if self._topBar.bg then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #2
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 22-27, warpins: 1 ---
	self._topBar.bg:setVisible(false)

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 28-30, warpins: 2 ---
	--- END OF BLOCK #2 ---

	if opacity > 0 then
	JUMP TO BLOCK #3
	else
	JUMP TO BLOCK #4
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #3 31-53, warpins: 1 ---
	local trans = {}

	table.deepcopy(self._baseColorTrans, trans)

	local mults = trans.mults
	local offsets = trans.offsets

	self._roleAnim:setColorTransform(ColorTransform(0.3, 0.3, 0.3, mults.w, offsets.x, offsets.y, offsets.z, offsets.w))
	--- END OF BLOCK #3 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #4 54-58, warpins: 1 ---
	self._roleAnim:setVisible(false)

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 59-61, warpins: 2 ---
	self._hiding = true

	return
	--- END OF BLOCK #5 ---



end

function BattleRoleObject:playSound(file, rate)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	local random = math.random()

	--- END OF BLOCK #0 ---

	if rate < random then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #2
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-6, warpins: 1 ---
	return

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 7-16, warpins: 2 ---
	local handle = AudioEngine:getInstance():playEffect(file, false)

	return
	--- END OF BLOCK #2 ---



end

function BattleRoleObject:playVoice(file, rate)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	local random = math.random()

	--- END OF BLOCK #0 ---

	if rate < random then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #2
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-6, warpins: 1 ---
	return

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 7-16, warpins: 2 ---
	local handle = AudioEngine:getInstance():playRoleEffect(file, false)

	return
	--- END OF BLOCK #2 ---



end

local SpecialSoundMap = {
	down = "_30",
	hurt = "_29",
	die = "_32"
}

function BattleRoleObject:playSpecialSound(act, actId)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	--- END OF BLOCK #0 ---

	slot3 = if self._specialSoundDisabled then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #2
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 4-4, warpins: 1 ---
	return
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 5-8, warpins: 2 ---
	--- END OF BLOCK #2 ---

	slot3 = if SpecialSoundMap[act] then
	JUMP TO BLOCK #3
	else
	JUMP TO BLOCK #14
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #3 9-10, warpins: 1 ---
	--- END OF BLOCK #3 ---

	slot2 = if actId then
	JUMP TO BLOCK #4
	else
	JUMP TO BLOCK #13
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #4 11-13, warpins: 1 ---
	--- END OF BLOCK #4 ---

	slot3 = if self._specialSoundRec then
	JUMP TO BLOCK #5
	else
	JUMP TO BLOCK #8
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #5 14-17, warpins: 1 ---
	--- END OF BLOCK #5 ---

	slot3 = if self._specialSoundRec[act] then
	JUMP TO BLOCK #6
	else
	JUMP TO BLOCK #8
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #6 18-22, warpins: 1 ---
	--- END OF BLOCK #6 ---

	slot3 = if self._specialSoundRec[act][actId] then
	JUMP TO BLOCK #7
	else
	JUMP TO BLOCK #8
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #7 23-23, warpins: 1 ---
	return

	--- END OF BLOCK #7 ---

	FLOW; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #8 24-26, warpins: 4 ---
	--- END OF BLOCK #8 ---

	slot3 = if not self._specialSoundRec then
	JUMP TO BLOCK #9
	else
	JUMP TO BLOCK #10
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #9 27-27, warpins: 1 ---
	slot3 = {}
	--- END OF BLOCK #9 ---

	FLOW; TARGET BLOCK #10



	-- Decompilation error in this vicinity:
	--- BLOCK #10 28-33, warpins: 2 ---
	self._specialSoundRec = slot3
	slot3 = self._specialSoundRec
	--- END OF BLOCK #10 ---

	slot4 = if not self._specialSoundRec[act] then
	JUMP TO BLOCK #11
	else
	JUMP TO BLOCK #12
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #11 34-34, warpins: 1 ---
	slot4 = {}
	--- END OF BLOCK #11 ---

	FLOW; TARGET BLOCK #12



	-- Decompilation error in this vicinity:
	--- BLOCK #12 35-57, warpins: 2 ---
	slot3[act] = slot4
	self._specialSoundRec[act][actId] = true

	AudioEngine:getInstance():playRoleEffect("Voice_" .. self._dataModel:getModelConfig().Hero .. SpecialSoundMap[act], false)
	--- END OF BLOCK #12 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #14



	-- Decompilation error in this vicinity:
	--- BLOCK #13 58-73, warpins: 1 ---
	AudioEngine:getInstance():playRoleEffect("Voice_" .. self._dataModel:getModelConfig().Hero .. SpecialSoundMap[act])

	--- END OF BLOCK #13 ---

	FLOW; TARGET BLOCK #14



	-- Decompilation error in this vicinity:
	--- BLOCK #14 74-74, warpins: 3 ---
	return
	--- END OF BLOCK #14 ---



end

function BattleRoleObject:freezeFrame(actName, frame)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	local anim = self._roleAnim

	self:switchState(actName)
	anim:goToFrameIndexAndPaused(0, frame)

	return
	--- END OF BLOCK #0 ---



end

function BattleRoleObject:shake(frameCount)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	--- END OF BLOCK #0 ---

	slot2 = if self._pauseTask then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #2
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 4-9, warpins: 1 ---
	self._pauseTask:stop()

	self._pauseTask = nil
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 10-34, warpins: 2 ---
	local onceMoveDur = 0.033
	local duration = onceMoveDur * frameCount
	local offsetX = 2
	local anim = self._roleAnim
	local activeNode = self._activeNode

	activeNode:setPosition(0, 0)
	anim:pauseAnimation()

	self._pauseTask = self:getContext():runActionTask(duration, function (p)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-14, warpins: 1 ---
		offsetX = -1 * offsetX

		activeNode:setPositionX(activeNode:getPositionX() + offsetX)

		return
		--- END OF BLOCK #0 ---



	end, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-14, warpins: 1 ---
		anim:resumeAnimation()
		activeNode:setPosition(0, 0)

		self._pauseTask = nil

		return
		--- END OF BLOCK #0 ---



	end)

	return
	--- END OF BLOCK #2 ---



end

function BattleRoleObject:thrown(force, callback)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-15, warpins: 1 ---
	local flag = {
		a4 = 12,
		a3 = 8,
		a2 = 6,
		a1 = 0
	}
	local anim = self._roleAnim
	local activeNode = self._activeNode

	self:switchState("down")
	anim:goToFrameIndexAndPaused(0, flag.a1)

	--- END OF BLOCK #0 ---

	if self._displacement == nil then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #2
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 16-17, warpins: 1 ---
	self._displacement = {
		0,
		0
	}
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 18-20, warpins: 2 ---
	--- END OF BLOCK #2 ---

	slot6 = if not self._velocity then
	JUMP TO BLOCK #3
	else
	JUMP TO BLOCK #4
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #3 21-21, warpins: 1 ---
	local velocity = {
		0,
		0
	}
	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 22-55, warpins: 2 ---
	local xdist = self._displacement[1]
	local height = self._displacement[2]
	xdist = math.max(0, xdist)
	height = math.max(0, height)
	self._velocity = {
		force[1],
		math.max(velocity[2], 0) + force[2] / (1 + height)
	}
	local time = 0
	--- END OF BLOCK #4 ---

	if self._flyTask == nil then
	JUMP TO BLOCK #5
	else
	JUMP TO BLOCK #6
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #5 56-63, warpins: 1 ---
	self._flyTask = self._context:scalableSchedule(function (task, dt)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-42, warpins: 1 ---
		local d = self._displacement
		local velocity = self._velocity
		self._velocity = {
			velocity[1],
			velocity[2] - kGravity * dt
		}
		velocity[2] = (velocity[2] + self._velocity[2]) * 0.5
		self._displacement[1] = d[1] + velocity[1] * dt
		self._displacement[2] = d[2] + velocity[2] * dt
		local finish = false
		--- END OF BLOCK #0 ---

		if self._displacement[2] <= 0 then
		JUMP TO BLOCK #1
		else
		JUMP TO BLOCK #2
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #1 43-47, warpins: 1 ---
		self._displacement[2] = 0
		finish = true
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 48-67, warpins: 2 ---
		local x = self._displacement[1] * kMeasuringScale
		local y = self._displacement[2] * kMeasuringScale

		activeNode:setPosition(x, y)

		--- END OF BLOCK #2 ---

		if velocity[2] > 1 then
		JUMP TO BLOCK #3
		else
		JUMP TO BLOCK #4
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #3 68-72, warpins: 1 ---
		self._frameLabel = flag.a1
		--- END OF BLOCK #3 ---

		UNCONDITIONAL JUMP; TARGET BLOCK #9



		-- Decompilation error in this vicinity:
		--- BLOCK #4 73-76, warpins: 1 ---
		--- END OF BLOCK #4 ---

		if velocity[2] > 0 then
		JUMP TO BLOCK #5
		else
		JUMP TO BLOCK #6
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #5 77-81, warpins: 1 ---
		self._frameLabel = flag.a2
		--- END OF BLOCK #5 ---

		UNCONDITIONAL JUMP; TARGET BLOCK #9



		-- Decompilation error in this vicinity:
		--- BLOCK #6 82-85, warpins: 1 ---
		--- END OF BLOCK #6 ---

		if velocity[2] > -1 then
		JUMP TO BLOCK #7
		else
		JUMP TO BLOCK #8
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #7 86-90, warpins: 1 ---
		self._frameLabel = flag.a3
		--- END OF BLOCK #7 ---

		UNCONDITIONAL JUMP; TARGET BLOCK #9



		-- Decompilation error in this vicinity:
		--- BLOCK #8 91-94, warpins: 1 ---
		self._frameLabel = flag.a4
		--- END OF BLOCK #8 ---

		FLOW; TARGET BLOCK #9



		-- Decompilation error in this vicinity:
		--- BLOCK #9 95-110, warpins: 4 ---
		time = time + dt

		anim:resumeAnimation()
		anim:goToFrameIndexAndPaused(0, self._frameLabel)
		--- END OF BLOCK #9 ---

		slot4 = if finish then
		JUMP TO BLOCK #10
		else
		JUMP TO BLOCK #13
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #10 111-133, warpins: 1 ---
		task:stop()

		self._flyTask = nil
		self._velocity = nil
		self._displacement = nil
		self._frameLabel = nil

		self:tryDie()
		--- END OF BLOCK #10 ---

		slot7 = if self._animEnded then
		JUMP TO BLOCK #11
		else
		JUMP TO BLOCK #12
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #11 134-147, warpins: 1 ---
		anim:resumeAnimation()
		anim:playAnimationInFrameIndex(0, "down", flag.a4, false)
		--- END OF BLOCK #11 ---

		UNCONDITIONAL JUMP; TARGET BLOCK #13



		-- Decompilation error in this vicinity:
		--- BLOCK #12 148-151, warpins: 1 ---
		anim:resumeAnimation()

		--- END OF BLOCK #12 ---

		FLOW; TARGET BLOCK #13



		-- Decompilation error in this vicinity:
		--- BLOCK #13 152-152, warpins: 3 ---
		return
		--- END OF BLOCK #13 ---



	end, 0, true)

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 64-65, warpins: 2 ---
	return
	--- END OF BLOCK #6 ---



end

function BattleRoleObject:setBarAndBuffVisble(visible)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-16, warpins: 1 ---
	self._topBarContainer:setVisible(visible)
	self._frontActiveFla:setVisible(visible)
	self._backActiveFla:setVisible(visible)

	return
	--- END OF BLOCK #0 ---



end

function BattleRoleObject:addSolidEffect(mcFile, loop, dot, layer, zOrder, callback)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	--- END OF BLOCK #0 ---

	slot1 = if not mcFile then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #2
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 3-3, warpins: 1 ---
	return

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 4-5, warpins: 1 ---
	--- END OF BLOCK #2 ---

	slot2 = if not loop then
	JUMP TO BLOCK #3
	else
	JUMP TO BLOCK #4
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #3 6-6, warpins: 1 ---
	loop = 1
	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 7-8, warpins: 2 ---
	--- END OF BLOCK #4 ---

	slot4 = if not layer then
	JUMP TO BLOCK #5
	else
	JUMP TO BLOCK #6
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #5 9-9, warpins: 1 ---
	layer = "front"
	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 10-11, warpins: 2 ---
	--- END OF BLOCK #6 ---

	slot3 = if not dot then
	JUMP TO BLOCK #7
	else
	JUMP TO BLOCK #8
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #7 12-12, warpins: 1 ---
	dot = {
		x = 0.5,
		y = 0.5
	}
	--- END OF BLOCK #7 ---

	FLOW; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #8 13-15, warpins: 2 ---
	--- END OF BLOCK #8 ---

	slot7 = if not dot.x then
	JUMP TO BLOCK #9
	else
	JUMP TO BLOCK #10
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #9 16-16, warpins: 1 ---
	slot7 = 0.5
	--- END OF BLOCK #9 ---

	FLOW; TARGET BLOCK #10



	-- Decompilation error in this vicinity:
	--- BLOCK #10 17-20, warpins: 2 ---
	dot.x = slot7
	--- END OF BLOCK #10 ---

	slot7 = if not dot.y then
	JUMP TO BLOCK #11
	else
	JUMP TO BLOCK #12
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #11 21-21, warpins: 1 ---
	slot7 = 0.5
	--- END OF BLOCK #11 ---

	FLOW; TARGET BLOCK #12



	-- Decompilation error in this vicinity:
	--- BLOCK #12 22-55, warpins: 2 ---
	dot.y = slot7
	local anim = cc.MovieClip:create(mcFile, "BattleMCGroup")

	anim:addEndCallback(function (cid, mc)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		loop = loop - 1

		--- END OF BLOCK #0 ---

		if loop == 0 then
		JUMP TO BLOCK #1
		else
		JUMP TO BLOCK #2
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #1 7-13, warpins: 1 ---
		mc:stop()
		mc:removeFromParent(true)
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 14-16, warpins: 2 ---
		--- END OF BLOCK #2 ---

		slot2 = if callback then
		JUMP TO BLOCK #3
		else
		JUMP TO BLOCK #4
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #3 17-18, warpins: 1 ---
		callback()

		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 19-19, warpins: 2 ---
		return
		--- END OF BLOCK #4 ---



	end)

	local point = cc.p(self:getModelWidth() * dot.x - self:getModelWidth() * 0.5, self:getModelHeight() * dot.y)
	slot11 = anim
	slot9 = anim.addTo
	--- END OF BLOCK #12 ---

	if layer == "front" then
	JUMP TO BLOCK #13
	else
	JUMP TO BLOCK #14
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #13 56-58, warpins: 1 ---
	--- END OF BLOCK #13 ---

	slot12 = if not self._frontFlaNode then
	JUMP TO BLOCK #14
	else
	JUMP TO BLOCK #15
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #14 59-59, warpins: 2 ---
	slot12 = self._backFlaNode

	--- END OF BLOCK #14 ---

	FLOW; TARGET BLOCK #15



	-- Decompilation error in this vicinity:
	--- BLOCK #15 60-64, warpins: 2 ---
	slot9(slot11, slot12)

	slot11 = anim
	slot9 = anim.setLocalZOrder
	--- END OF BLOCK #15 ---

	if layer == "front" then
	JUMP TO BLOCK #16
	else
	JUMP TO BLOCK #17
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #16 65-66, warpins: 1 ---
	--- END OF BLOCK #16 ---

	slot12 = if not zOrder then
	JUMP TO BLOCK #17
	else
	JUMP TO BLOCK #18
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #17 67-67, warpins: 2 ---
	slot12 = -zOrder

	--- END OF BLOCK #17 ---

	FLOW; TARGET BLOCK #18



	-- Decompilation error in this vicinity:
	--- BLOCK #18 68-74, warpins: 2 ---
	slot9(slot11, slot12)
	anim:setPosition(point)

	return anim
	--- END OF BLOCK #18 ---

	FLOW; TARGET BLOCK #19



	-- Decompilation error in this vicinity:
	--- BLOCK #19 75-75, warpins: 2 ---
	--- END OF BLOCK #19 ---



end

function BattleRoleObject:prepareSkillEffect(effectId, performAct, animation)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	--- END OF BLOCK #0 ---

	slot4 = if not self._skillEffect[performAct] then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #2
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-5, warpins: 1 ---
	local actEffects = {}
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 6-9, warpins: 2 ---
	self._skillEffect[performAct] = actEffects
	--- END OF BLOCK #2 ---

	slot5 = if actEffects then
	JUMP TO BLOCK #3
	else
	JUMP TO BLOCK #4
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #3 10-10, warpins: 1 ---
	local effect = actEffects[effectId]

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 11-12, warpins: 2 ---
	--- END OF BLOCK #4 ---

	slot5 = if effect then
	JUMP TO BLOCK #5
	else
	JUMP TO BLOCK #6
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #5 13-21, warpins: 1 ---
	effect:setVisible(false)
	effect:pause(true)

	--- END OF BLOCK #5 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #27



	-- Decompilation error in this vicinity:
	--- BLOCK #6 22-29, warpins: 1 ---
	local config = ConfigReader:getRecordById("SkillVideo", effectId)
	--- END OF BLOCK #6 ---

	slot6 = if config then
	JUMP TO BLOCK #7
	else
	JUMP TO BLOCK #27
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #7 30-69, warpins: 1 ---
	local file = config.File
	local width = config.Size[1]
	local height = config.Size[2]
	local offset = cc.p(-config.Offset[1], config.Offset[2])
	local anchor = cc.p(config.SpineAnchor[1], config.SpineAnchor[2])
	local zOrder = 10
	effect = VideoSprite.createSkillVideo("video/skill/" .. file)

	effect:setContentSize(cc.size(width, height))

	local layer = config.Layer
	--- END OF BLOCK #7 ---

	slot14 = if config.Bone then
	JUMP TO BLOCK #8
	else
	JUMP TO BLOCK #16
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #8 70-72, warpins: 1 ---
	--- END OF BLOCK #8 ---

	if config.Bone ~= "" then
	JUMP TO BLOCK #9
	else
	JUMP TO BLOCK #16
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #9 73-81, warpins: 1 ---
	local node = cc.Node:create()
	slot17 = node
	slot15 = node.addTo
	--- END OF BLOCK #9 ---

	if layer == "front" then
	JUMP TO BLOCK #10
	else
	JUMP TO BLOCK #11
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #10 82-84, warpins: 1 ---
	--- END OF BLOCK #10 ---

	slot18 = if not self._frontFlaNode then
	JUMP TO BLOCK #11
	else
	JUMP TO BLOCK #12
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #11 85-85, warpins: 2 ---
	slot18 = self._backFlaNode

	--- END OF BLOCK #11 ---

	FLOW; TARGET BLOCK #12



	-- Decompilation error in this vicinity:
	--- BLOCK #12 86-90, warpins: 2 ---
	slot15(slot17, slot18)

	slot17 = node
	slot15 = node.setLocalZOrder
	--- END OF BLOCK #12 ---

	if layer == "front" then
	JUMP TO BLOCK #13
	else
	JUMP TO BLOCK #14
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #13 91-92, warpins: 1 ---
	--- END OF BLOCK #13 ---

	slot18 = if not zOrder then
	JUMP TO BLOCK #14
	else
	JUMP TO BLOCK #15
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #14 93-93, warpins: 2 ---
	slot18 = -zOrder

	--- END OF BLOCK #14 ---

	FLOW; TARGET BLOCK #15



	-- Decompilation error in this vicinity:
	--- BLOCK #15 94-148, warpins: 2 ---
	slot15(slot17, slot18)

	local scale = 1 / self._roleAnim:getScale() / 0.953

	effect:addTo(node):posite(offset.x * scale, offset.y * scale)
	effect:setAnchorPoint(cc.p(config.Anchor[1], config.Anchor[2]))
	effect:setScale(scale)

	local mat4 = node:getParentToNodeTransform()
	mat4 = cc.mat4.new(mat4)

	self._roleAnim:bindAttachingNode(animation, config.Bone, node, mat4)
	effect:setCallback(function (instance, eventName)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-2, warpins: 1 ---
		--- END OF BLOCK #0 ---

		if eventName == "complete" then
		JUMP TO BLOCK #1
		else
		JUMP TO BLOCK #3
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #1 3-7, warpins: 1 ---
		--- END OF BLOCK #1 ---

		slot2 = if actEffects[effectId] then
		JUMP TO BLOCK #2
		else
		JUMP TO BLOCK #3
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #2 8-21, warpins: 1 ---
		self._roleAnim:unbindAttachingNode(node)
		node:removeFromParent()

		actEffects[effectId] = nil

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 22-22, warpins: 3 ---
		return
		--- END OF BLOCK #3 ---



	end)

	actEffects[effectId] = effect
	--- END OF BLOCK #15 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #23



	-- Decompilation error in this vicinity:
	--- BLOCK #16 149-204, warpins: 2 ---
	local scale = 1.0493179433368311 * self._modelScale
	width = width * scale
	height = height * scale
	offset = cc.p(offset.x * scale, offset.y * scale)
	local point = cc.p(self:getModelWidth() * anchor.x + offset.x - self:getModelWidth() * 0.5, self:getModelHeight() * anchor.y + offset.y)

	effect:setScale(scale)
	effect:setAnchorPoint(cc.p(config.Anchor[1], config.Anchor[2]))
	effect:setPosition(point)

	slot18 = effect
	slot16 = effect.addTo
	--- END OF BLOCK #16 ---

	if layer == "front" then
	JUMP TO BLOCK #17
	else
	JUMP TO BLOCK #18
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #17 205-207, warpins: 1 ---
	--- END OF BLOCK #17 ---

	slot19 = if not self._frontFlaNode then
	JUMP TO BLOCK #18
	else
	JUMP TO BLOCK #19
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #18 208-208, warpins: 2 ---
	slot19 = self._backFlaNode

	--- END OF BLOCK #18 ---

	FLOW; TARGET BLOCK #19



	-- Decompilation error in this vicinity:
	--- BLOCK #19 209-213, warpins: 2 ---
	slot16(slot18, slot19)

	slot18 = effect
	slot16 = effect.setLocalZOrder
	--- END OF BLOCK #19 ---

	if layer == "front" then
	JUMP TO BLOCK #20
	else
	JUMP TO BLOCK #21
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #20 214-215, warpins: 1 ---
	--- END OF BLOCK #20 ---

	slot19 = if not zOrder then
	JUMP TO BLOCK #21
	else
	JUMP TO BLOCK #22
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #21 216-216, warpins: 2 ---
	slot19 = -zOrder

	--- END OF BLOCK #21 ---

	FLOW; TARGET BLOCK #22



	-- Decompilation error in this vicinity:
	--- BLOCK #22 217-222, warpins: 2 ---
	slot16(slot18, slot19)

	actEffects[effectId] = effect

	effect:setCallback(function (instance, eventName)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-2, warpins: 1 ---
		--- END OF BLOCK #0 ---

		if eventName == "complete" then
		JUMP TO BLOCK #1
		else
		JUMP TO BLOCK #2
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #1 3-10, warpins: 1 ---
		effect:removeFromParent()

		actEffects[effectId] = nil

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 11-11, warpins: 2 ---
		return
		--- END OF BLOCK #2 ---



	end)
	--- END OF BLOCK #22 ---

	FLOW; TARGET BLOCK #23



	-- Decompilation error in this vicinity:
	--- BLOCK #23 223-224, warpins: 2 ---
	--- END OF BLOCK #23 ---

	if layer == "front" then
	JUMP TO BLOCK #24
	else
	JUMP TO BLOCK #25
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #24 225-229, warpins: 1 ---
	effect:setGlobalZOrder(10)
	--- END OF BLOCK #24 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #26



	-- Decompilation error in this vicinity:
	--- BLOCK #25 230-233, warpins: 1 ---
	effect:setGlobalZOrder(-10)
	--- END OF BLOCK #25 ---

	FLOW; TARGET BLOCK #26



	-- Decompilation error in this vicinity:
	--- BLOCK #26 234-248, warpins: 2 ---
	effect:setSpeed(self._context:getTimeScale())
	effect:pause(true)
	effect:setVisible(false)

	--- END OF BLOCK #26 ---

	FLOW; TARGET BLOCK #27



	-- Decompilation error in this vicinity:
	--- BLOCK #27 249-250, warpins: 3 ---
	return
	--- END OF BLOCK #27 ---



end

function BattleRoleObject:setDisplayZorder(order)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	self:getView():setLocalZOrder(order)

	self._specialZorder = order

	return
	--- END OF BLOCK #0 ---



end

function BattleRoleObject:resetDisplayZorder()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	self._specialZorder = nil

	self:setRelPosition(self:getRelPosition())

	return
	--- END OF BLOCK #0 ---



end

function BattleRoleObject:startSkillEffect(effectId, performAct, animation)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	local actEffects = self._skillEffect[performAct]
	--- END OF BLOCK #0 ---

	slot5 = if actEffects then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #2
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-5, warpins: 1 ---
	local effect = actEffects[effectId]

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 6-7, warpins: 2 ---
	--- END OF BLOCK #2 ---

	slot5 = if effect then
	JUMP TO BLOCK #3
	else
	JUMP TO BLOCK #5
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #3 8-12, warpins: 1 ---
	--- END OF BLOCK #3 ---

	slot6 = if effect:isPaused()
	 then
	JUMP TO BLOCK #4
	else
	JUMP TO BLOCK #5
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #4 13-20, warpins: 1 ---
	effect:setVisible(true)
	effect:pause(false)

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 21-21, warpins: 3 ---
	return
	--- END OF BLOCK #5 ---



end

function BattleRoleObject:clearSkillEffect(performAct)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	local actEffects = self._skillEffect[performAct]

	--- END OF BLOCK #0 ---

	slot2 = if actEffects then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #4
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-8, warpins: 1 ---
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 9-37, warpins: 0 ---
	for effectId, effect in pairs(actEffects) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-17, warpins: 1 ---
		local config = ConfigReader:getRecordById("SkillVideo", effectId)
		--- END OF BLOCK #0 ---

		slot9 = if config.Bone then
		JUMP TO BLOCK #1
		else
		JUMP TO BLOCK #3
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #1 18-20, warpins: 1 ---
		--- END OF BLOCK #1 ---

		if config.Bone ~= "" then
		JUMP TO BLOCK #2
		else
		JUMP TO BLOCK #3
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #2 21-32, warpins: 1 ---
		local node = effect:getParent()

		self._roleAnim:unbindAttachingNode(node)
		node:removeFromParent()
		--- END OF BLOCK #2 ---

		UNCONDITIONAL JUMP; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #3 33-35, warpins: 2 ---
		effect:removeFromParent()
		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 36-37, warpins: 3 ---
		--- END OF BLOCK #4 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 38-40, warpins: 1 ---
	self._skillEffect[performAct] = nil

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 41-41, warpins: 2 ---
	return
	--- END OF BLOCK #4 ---



end

function BattleRoleObject:startSkillMovie(movieId, performAct)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	--- END OF BLOCK #0 ---

	slot3 = if not self._skillMovies[performAct] then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #2
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-5, warpins: 1 ---
	local movies = {}
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 6-9, warpins: 2 ---
	self._skillMovies[performAct] = movies
	--- END OF BLOCK #2 ---

	slot4 = if movies then
	JUMP TO BLOCK #3
	else
	JUMP TO BLOCK #4
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #3 10-10, warpins: 1 ---
	local movie = movies[movieId]

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 11-12, warpins: 2 ---
	--- END OF BLOCK #4 ---

	slot4 = if movie then
	JUMP TO BLOCK #5
	else
	JUMP TO BLOCK #6
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #5 13-17, warpins: 1 ---
	movie:gotoAndPlay(1)

	--- END OF BLOCK #5 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #18



	-- Decompilation error in this vicinity:
	--- BLOCK #6 18-25, warpins: 1 ---
	local config = ConfigReader:getRecordById("SkillMovie", movieId)

	--- END OF BLOCK #6 ---

	slot5 = if config then
	JUMP TO BLOCK #7
	else
	JUMP TO BLOCK #18
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #7 26-34, warpins: 1 ---
	--- END OF BLOCK #7 ---

	if self._context:getValue("ShowSkillEffect")

	 ~= BattleEffect_ShowType.All then
	JUMP TO BLOCK #8
	else
	JUMP TO BLOCK #10
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #8 35-39, warpins: 1 ---
	local loads = config.Load

	--- END OF BLOCK #8 ---

	FLOW; TARGET BLOCK #9



	-- Decompilation error in this vicinity:
	--- BLOCK #9 40-80, warpins: 0 ---
	for _, picname in ipairs(loads) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 40-49, warpins: 1 ---
		--- END OF BLOCK #0 ---

		slot12 = if not MemCacheUtils:hasPlist("asset/anim/" .. picname .. ".plist")

		 then
		JUMP TO BLOCK #1
		else
		JUMP TO BLOCK #6
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #1 50-52, warpins: 1 ---
		--- END OF BLOCK #1 ---

		slot12 = if app then
		JUMP TO BLOCK #2
		else
		JUMP TO BLOCK #5
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #2 53-56, warpins: 1 ---
		--- END OF BLOCK #2 ---

		slot12 = if app.pkConfig then
		JUMP TO BLOCK #3
		else
		JUMP TO BLOCK #5
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #3 57-61, warpins: 1 ---
		--- END OF BLOCK #3 ---

		if app.pkgConfig.hideNotCachedSkillFlash == 1 then
		JUMP TO BLOCK #4
		else
		JUMP TO BLOCK #5
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #4 62-76, warpins: 1 ---
		local mainMediator = self._context:getValue("BattleMainMediator")

		mainMediator:dispatch(ShowTipEvent({
			tip = movieId .. "加载时间不够，不显示"
		}))

		--- END OF BLOCK #4 ---

		FLOW; TARGET BLOCK #5



		-- Decompilation error in this vicinity:
		--- BLOCK #5 77-78, warpins: 4 ---
		return false
		--- END OF BLOCK #5 ---

		FLOW; TARGET BLOCK #6



		-- Decompilation error in this vicinity:
		--- BLOCK #6 79-80, warpins: 2 ---
		--- END OF BLOCK #6 ---



	end

	--- END OF BLOCK #9 ---

	FLOW; TARGET BLOCK #10



	-- Decompilation error in this vicinity:
	--- BLOCK #10 81-150, warpins: 2 ---
	local animName = config.Anim

	print(animName)

	local offset = cc.p(-config.Offset[1], config.Offset[2])
	local anchor = cc.p(config.SpineAnchor[1], config.SpineAnchor[2])
	local zOrder = 10
	movie = cc.MovieClip:create(animName, "BattleMCGroup")
	local layer = config.Layer
	local scale = kRoleScale
	offset = cc.p(offset.x * scale, offset.y * scale)
	local point = cc.p(self:getModelWidth() * anchor.x + offset.x - self:getModelWidth() * 0.5, self:getModelHeight() * anchor.y + offset.y)

	movie:setScale(scale)
	movie:setPosition(point)
	--- END OF BLOCK #10 ---

	if layer == "front" then
	JUMP TO BLOCK #11
	else
	JUMP TO BLOCK #12
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #11 151-159, warpins: 1 ---
	movie:addTo(self._frontFlaNode)
	movie:setLocalZOrder(zOrder)
	--- END OF BLOCK #11 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #17



	-- Decompilation error in this vicinity:
	--- BLOCK #12 160-161, warpins: 1 ---
	--- END OF BLOCK #12 ---

	if layer == "top" then
	JUMP TO BLOCK #13
	else
	JUMP TO BLOCK #14
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #13 162-166, warpins: 1 ---
	movie:addTo(self._topFlaNode)
	--- END OF BLOCK #13 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #17



	-- Decompilation error in this vicinity:
	--- BLOCK #14 167-168, warpins: 1 ---
	--- END OF BLOCK #14 ---

	if layer == "bottom" then
	JUMP TO BLOCK #15
	else
	JUMP TO BLOCK #16
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #15 169-173, warpins: 1 ---
	movie:addTo(self._bottomFlaNode)
	--- END OF BLOCK #15 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #17



	-- Decompilation error in this vicinity:
	--- BLOCK #16 174-181, warpins: 1 ---
	movie:addTo(self._backFlaNode)
	movie:setLocalZOrder(-zOrder)

	--- END OF BLOCK #16 ---

	FLOW; TARGET BLOCK #17



	-- Decompilation error in this vicinity:
	--- BLOCK #17 182-186, warpins: 4 ---
	movies[movieId] = movie

	movie:addEndCallback(function (cid, mc)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-18, warpins: 1 ---
		mc:stop()
		movie:removeFromParent(true)

		movies[movieId] = nil

		self:unloadSkillMovie(movieId)

		return
		--- END OF BLOCK #0 ---



	end)

	--- END OF BLOCK #17 ---

	FLOW; TARGET BLOCK #18



	-- Decompilation error in this vicinity:
	--- BLOCK #18 187-188, warpins: 3 ---
	return
	--- END OF BLOCK #18 ---

	FLOW; TARGET BLOCK #19



	-- Decompilation error in this vicinity:
	--- BLOCK #19 189-189, warpins: 2 ---
	--- END OF BLOCK #19 ---



end

function BattleRoleObject:unloadSkillMovie(movieId)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	local config = ConfigReader:getRecordById("SkillMovie", movieId)
	local loads = config.Load

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 12-22, warpins: 0 ---
	for _, picname in ipairs(loads) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-20, warpins: 1 ---
		MemCacheUtils:releasePlist("asset/anim/" .. picname .. ".plist", "battle")
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 21-22, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 23-23, warpins: 1 ---
	return
	--- END OF BLOCK #2 ---



end

function BattleRoleObject:clearSkillMovie(performAct)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	local movies = self._skillMovies[performAct]

	--- END OF BLOCK #0 ---

	slot2 = if movies then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #4
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-8, warpins: 1 ---
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 9-17, warpins: 0 ---
	for movieId, movie in pairs(movies) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-15, warpins: 1 ---
		movie:removeFromParent()
		self:unloadSkillMovie(movieId)
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 16-17, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 18-20, warpins: 1 ---
	self._skillMovies[performAct] = nil

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 21-21, warpins: 2 ---
	return
	--- END OF BLOCK #4 ---



end

function BattleRoleObject:flee(dur)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	--- END OF BLOCK #0 ---

	slot1 = if not dur then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #2
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 3-3, warpins: 1 ---
	dur = 600
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 4-25, warpins: 2 ---
	local mainMediator = self._context:getValue("BattleMainMediator")
	local homePlace = self._homePlace
	local pos = self._battleGround:convertRelPosition2View(homePlace)
	slot5 = cc.p
	slot7 = pos.x
	slot8 = display.width * 0.6

	--- END OF BLOCK #2 ---

	slot9 = if self:isLeft()

	 then
	JUMP TO BLOCK #3
	else
	JUMP TO BLOCK #4
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #3 26-27, warpins: 1 ---
	slot9 = 1
	--- END OF BLOCK #3 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #4 28-28, warpins: 1 ---
	slot9 = -1
	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 29-55, warpins: 2 ---
	pos = slot5(slot7 - slot8 * slot9, pos.y)
	local to = self._battleGround:convertView2RelPosition(pos)

	self:switchState("-run", {
		loop = -1,
		dur = dur
	})
	self:moveWithDuration(to, dur / 1000, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		self:remove()

		return
		--- END OF BLOCK #0 ---



	end)

	self._liveState = LiveState.Fleeing

	return
	--- END OF BLOCK #5 ---



end

function BattleRoleObject:spawnCallback()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	local mainMediator = self._context:getValue("BattleMainMediator")
	local delegate = mainMediator:getDelegate()
	--- END OF BLOCK #0 ---

	slot2 = if delegate then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #3
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 11-13, warpins: 1 ---
	--- END OF BLOCK #1 ---

	slot3 = if delegate.fighterIsSpawn then
	JUMP TO BLOCK #2
	else
	JUMP TO BLOCK #3
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #2 14-25, warpins: 1 ---
	local heroId, wave = BattleSoleIdProcessor:splitBattleFighterId(self._id)

	delegate:fighterIsSpawn(mainMediator, heroId, self._id, wave)

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 26-26, warpins: 3 ---
	return
	--- END OF BLOCK #3 ---



end

function BattleRoleObject:tryResetState()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	--- END OF BLOCK #0 ---

	slot1 = if self._shiftPosTask then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #2
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 4-9, warpins: 1 ---
	self._shiftPosTask:stop()

	self._shiftPosTask = nil

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 10-14, warpins: 2 ---
	--- END OF BLOCK #2 ---

	slot1 = if self:isBusyState()

	 then
	JUMP TO BLOCK #3
	else
	JUMP TO BLOCK #4
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #3 15-15, warpins: 1 ---
	return

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 16-22, warpins: 2 ---
	self:setRelPosition(self._homePlace)
	--- END OF BLOCK #4 ---

	slot1 = if not self._animEnded then
	JUMP TO BLOCK #5
	else
	JUMP TO BLOCK #7
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #5 23-28, warpins: 1 ---
	--- END OF BLOCK #5 ---

	slot1 = if self._roleAnim:isAnimationPaused()
	 then
	JUMP TO BLOCK #6
	else
	JUMP TO BLOCK #7
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #6 29-32, warpins: 1 ---
	self._roleAnim:resumeAnimation()

	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 33-33, warpins: 3 ---
	return
	--- END OF BLOCK #7 ---



end

function BattleRoleObject:finalHitLock()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	self._state = "lockdie"

	return
	--- END OF BLOCK #0 ---



end

function BattleRoleObject:finalHitDie()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	self._animEnded = true

	self:tryDie()

	return
	--- END OF BLOCK #0 ---



end

function BattleRoleObject:holyHide(alpha)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	self._roleAnim:setOpacity(alpha * 255)

	return
	--- END OF BLOCK #0 ---



end

function BattleRoleObject:createDefaultModel()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	local pre = "asset/anim/"
	local jsonFile = nil
	--- END OF BLOCK #0 ---

	if self._roleType == RoleType.Master then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #2
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-16, warpins: 1 ---
	jsonFile = pre .. "Master_LieSha.skel"

	self._dataModel:setModelId("Model_Master_LieSha")

	--- END OF BLOCK #1 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #2 17-24, warpins: 1 ---
	jsonFile = pre .. "YFZZhu.skel"

	self._dataModel:setModelId("Model_YFZZhu")

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 25-25, warpins: 2 ---
	return jsonFile
	--- END OF BLOCK #3 ---



end

function BattleRoleObject:guideThrown(force, callback)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-15, warpins: 1 ---
	local flag = {
		a4 = 12,
		a3 = 8,
		a2 = 6,
		a1 = 0
	}
	local anim = self._roleAnim
	local activeNode = self._activeNode

	self:switchState("down")
	anim:goToFrameIndexAndPaused(0, flag.a1)

	--- END OF BLOCK #0 ---

	if self._displacement == nil then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #2
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 16-17, warpins: 1 ---
	self._displacement = {
		0,
		0
	}
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 18-20, warpins: 2 ---
	--- END OF BLOCK #2 ---

	slot6 = if not self._velocity then
	JUMP TO BLOCK #3
	else
	JUMP TO BLOCK #4
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #3 21-21, warpins: 1 ---
	local velocity = {
		0,
		0
	}
	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 22-55, warpins: 2 ---
	local xdist = self._displacement[1]
	local height = self._displacement[2]
	xdist = math.max(0, xdist)
	height = math.max(0, height)
	self._velocity = {
		force[1],
		math.max(velocity[2], 0) + force[2] / (1 + height)
	}
	local time = 0
	--- END OF BLOCK #4 ---

	if self._flyTask == nil then
	JUMP TO BLOCK #5
	else
	JUMP TO BLOCK #6
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #5 56-63, warpins: 1 ---
	self._flyTask = self._context:scalableSchedule(function (task, dt)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-42, warpins: 1 ---
		local d = self._displacement
		local velocity = self._velocity
		self._velocity = {
			velocity[1],
			velocity[2] - kGravity * dt
		}
		velocity[2] = (velocity[2] + self._velocity[2]) * 0.5
		self._displacement[1] = d[1] + velocity[1] * dt
		self._displacement[2] = d[2] + velocity[2] * dt
		local finish = false
		--- END OF BLOCK #0 ---

		if self._displacement[2] <= 0 then
		JUMP TO BLOCK #1
		else
		JUMP TO BLOCK #2
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #1 43-47, warpins: 1 ---
		self._displacement[2] = 0
		finish = true
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 48-67, warpins: 2 ---
		local x = self._displacement[1] * kMeasuringScale
		local y = self._displacement[2] * kMeasuringScale

		activeNode:setPosition(x, y)

		--- END OF BLOCK #2 ---

		if velocity[2] > 1 then
		JUMP TO BLOCK #3
		else
		JUMP TO BLOCK #4
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #3 68-72, warpins: 1 ---
		self._frameLabel = flag.a1
		--- END OF BLOCK #3 ---

		UNCONDITIONAL JUMP; TARGET BLOCK #9



		-- Decompilation error in this vicinity:
		--- BLOCK #4 73-76, warpins: 1 ---
		--- END OF BLOCK #4 ---

		if velocity[2] > 0 then
		JUMP TO BLOCK #5
		else
		JUMP TO BLOCK #6
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #5 77-81, warpins: 1 ---
		self._frameLabel = flag.a2
		--- END OF BLOCK #5 ---

		UNCONDITIONAL JUMP; TARGET BLOCK #9



		-- Decompilation error in this vicinity:
		--- BLOCK #6 82-85, warpins: 1 ---
		--- END OF BLOCK #6 ---

		if velocity[2] > -1 then
		JUMP TO BLOCK #7
		else
		JUMP TO BLOCK #8
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #7 86-90, warpins: 1 ---
		self._frameLabel = flag.a3
		--- END OF BLOCK #7 ---

		UNCONDITIONAL JUMP; TARGET BLOCK #9



		-- Decompilation error in this vicinity:
		--- BLOCK #8 91-94, warpins: 1 ---
		self._frameLabel = flag.a4
		--- END OF BLOCK #8 ---

		FLOW; TARGET BLOCK #9



		-- Decompilation error in this vicinity:
		--- BLOCK #9 95-110, warpins: 4 ---
		time = time + dt

		anim:resumeAnimation()
		anim:goToFrameIndexAndPaused(0, self._frameLabel)
		--- END OF BLOCK #9 ---

		slot4 = if finish then
		JUMP TO BLOCK #10
		else
		JUMP TO BLOCK #13
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #10 111-133, warpins: 1 ---
		task:stop()

		self._flyTask = nil
		self._velocity = nil
		self._displacement = nil
		self._frameLabel = nil

		self:tryDie()
		--- END OF BLOCK #10 ---

		slot7 = if self._animEnded then
		JUMP TO BLOCK #11
		else
		JUMP TO BLOCK #12
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #11 134-138, warpins: 1 ---
		anim:resumeAnimation()
		--- END OF BLOCK #11 ---

		UNCONDITIONAL JUMP; TARGET BLOCK #13



		-- Decompilation error in this vicinity:
		--- BLOCK #12 139-142, warpins: 1 ---
		anim:resumeAnimation()

		--- END OF BLOCK #12 ---

		FLOW; TARGET BLOCK #13



		-- Decompilation error in this vicinity:
		--- BLOCK #13 143-143, warpins: 3 ---
		return
		--- END OF BLOCK #13 ---



	end, 0, true)

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 64-65, warpins: 2 ---
	return
	--- END OF BLOCK #6 ---



end

function BattleRoleObject:guideMoveBy(force, callback)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	local activeNode = self._activeNode
	--- END OF BLOCK #0 ---

	slot4 = if not force[1] then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #2
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-5, warpins: 1 ---
	local time = 0.1
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 6-8, warpins: 2 ---
	--- END OF BLOCK #2 ---

	slot5 = if not force[2] then
	JUMP TO BLOCK #3
	else
	JUMP TO BLOCK #4
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #3 9-9, warpins: 1 ---
	local x = -100
	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 10-12, warpins: 2 ---
	--- END OF BLOCK #4 ---

	slot6 = if not force[3] then
	JUMP TO BLOCK #5
	else
	JUMP TO BLOCK #6
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #5 13-13, warpins: 1 ---
	local y = 0

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 14-28, warpins: 2 ---
	activeNode:runAction(cc.MoveBy:create(time, cc.p(x, y)))

	return
	--- END OF BLOCK #6 ---



end

function BattleRoleObject:guideHideObject()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	local rootNode = self._root

	rootNode:setVisible(false)

	return
	--- END OF BLOCK #0 ---



end

function BattleRoleObject:guideGoBattle()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-30, warpins: 1 ---
	local rootNode = self._root

	rootNode:setVisible(true)
	self._roleAnim:setVisible(true)
	self._roleAnim:setColorTransform(self._baseColorTrans)
	self:switchState("squat", {
		loop = 1
	})
	AudioEngine:getInstance():playEffect("Se_Alert_Unique_Skill", false)

	return
	--- END OF BLOCK #0 ---



end

function BattleRoleObject:refreshHpBySetting()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	local hpShow = tonumber(self._context:getValue("ShowHpMode"))

	--- END OF BLOCK #0 ---

	slot2 = if self._topBarVisibleForceSta then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #2
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 11-26, warpins: 1 ---
	self._topBar:setHpVisible(self._topBarVisibleSta)
	self._iconContainer:setVisible(self._topBarVisibleSta)
	self._topBar:setRpVisible(self._topBarVisibleSta)
	--- END OF BLOCK #1 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #2 27-30, warpins: 1 ---
	--- END OF BLOCK #2 ---

	if hpShow == BattleHp_ShowType.Hide then
	JUMP TO BLOCK #3
	else
	JUMP TO BLOCK #4
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #3 31-46, warpins: 1 ---
	self._topBar:setHpVisible(false)
	self._iconContainer:setVisible(false)
	self._topBar:setRpVisible(false)
	--- END OF BLOCK #3 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #4 47-50, warpins: 1 ---
	--- END OF BLOCK #4 ---

	if hpShow == BattleHp_ShowType.Show then
	JUMP TO BLOCK #5
	else
	JUMP TO BLOCK #6
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #5 51-66, warpins: 1 ---
	self._topBar:setHpVisible(true)
	self._iconContainer:setVisible(true)
	self._topBar:setRpVisible(true)
	--- END OF BLOCK #5 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #6 67-70, warpins: 1 ---
	--- END OF BLOCK #6 ---

	if hpShow == BattleHp_ShowType.Simple then
	JUMP TO BLOCK #7
	else
	JUMP TO BLOCK #8
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #7 71-85, warpins: 1 ---
	self._topBar:setHpVisible(self._topBarVisibleSta)
	self._iconContainer:setVisible(self._topBarVisibleSta)
	self._topBar:setRpVisible(self._topBarVisibleSta)

	--- END OF BLOCK #7 ---

	FLOW; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #8 86-86, warpins: 5 ---
	return
	--- END OF BLOCK #8 ---



end

function BattleRoleObject:showProfessionalRestraint(genre)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-12, warpins: 1 ---
	self._professionalRestraintSupLab:setVisible(false)

	local battleSuppress = self._context:getValue("battleSuppress")
	--- END OF BLOCK #0 ---

	slot2 = if battleSuppress then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #8
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 13-15, warpins: 1 ---
	--- END OF BLOCK #1 ---

	slot3 = if battleSuppress[genre] then
	JUMP TO BLOCK #2
	else
	JUMP TO BLOCK #8
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #2 16-19, warpins: 1 ---
	--- END OF BLOCK #2 ---

	slot3 = if not battleSuppress[genre].Sup then
	JUMP TO BLOCK #3
	else
	JUMP TO BLOCK #4
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #3 20-20, warpins: 1 ---
	local sup = {}

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 21-22, warpins: 2 ---
	--- END OF BLOCK #4 ---

	slot3 = if sup then
	JUMP TO BLOCK #5
	else
	JUMP TO BLOCK #8
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #5 23-28, warpins: 1 ---
	--- END OF BLOCK #5 ---

	slot4 = if self._dataModel:getGenre()
	 then
	JUMP TO BLOCK #6
	else
	JUMP TO BLOCK #8
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #6 29-35, warpins: 1 ---
	--- END OF BLOCK #6 ---

	slot4 = if sup[self._dataModel:getGenre()
	] then
	JUMP TO BLOCK #7
	else
	JUMP TO BLOCK #8
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #7 36-41, warpins: 1 ---
	self._professionalRestraintSupLab:setVisible(true)

	return
	--- END OF BLOCK #7 ---

	FLOW; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #8 42-42, warpins: 6 ---
	return
	--- END OF BLOCK #8 ---



end

function BattleRoleObject:resumeProfessionalRestraint()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	self._professionalRestraintSupLab:setVisible(false)

	return
	--- END OF BLOCK #0 ---



end

function BattleRoleObject:getShowRpNum(num)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	--- END OF BLOCK #0 ---

	slot2 = if self._isLeftTeam then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #4
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 4-8, warpins: 1 ---
	--- END OF BLOCK #1 ---

	if self._roleType == RoleType.Master then
	JUMP TO BLOCK #2
	else
	JUMP TO BLOCK #4
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #2 9-15, warpins: 1 ---
	--- END OF BLOCK #2 ---

	if self._context:getValue("unlockMasterSkill")

	 == false then
	JUMP TO BLOCK #3
	else
	JUMP TO BLOCK #4
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #3 16-16, warpins: 1 ---
	num = 0

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 17-17, warpins: 4 ---
	return num
	--- END OF BLOCK #4 ---



end
