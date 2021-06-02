local MAX_BAR_INDEX = 30
local MAX_ENERGY_NUM = 199
local kColorCharMap = {
	"a",
	"c",
	"b"
}
local kBarIndexCharMap = {
	"a",
	"b",
	[10.0] = "c"
}
local kBarPicNumMap = {
	"1",
	"2",
	[10.0] = "1"
}
local kCircleAnimMap = {
	"qqlan_shuijingtiaoman",
	"qqhuang_shuijingtiaoman",
	"qqcai_shuijingtiaoman"
}
BattleEnergyBar = class("BattleEnergyBar", BattleWidget, _M)

function BattleEnergyBar:initialize(view)
	super.initialize(self, view)

	self._energy = 0
	self._remain = 0
	self._speed = 0

	self:_setupEnergyLabel(view)
	self:_setupBarNode(view)

	self._circleAnims = setmetatable({}, {
		__index = function (t, k)
			local node = self:getView():getChildByFullName("energy_circle.circle" .. k)

			return node
		end,
		__newindex = function (t, k, v)
			local circle_layer = self:getView():getChildByFullName("energy_circle")

			circle_layer:removeChildByName("circle" .. k)

			if v then
				local colorIndex = math.floor((k - 1) / 10) + 1
				local animName = kCircleAnimMap[colorIndex]

				if animName then
					local anim = cc.MovieClip:create(animName, "BattleMCGroup")

					anim:addTo(circle_layer):setName("circle" .. k)
					anim:addCallbackAtFrame(35, function (cid, mc)
						mc:stop()
						mc:removeFromParent()
					end)
					anim:addCallbackAtFrame(30, function (cid, mc)
						mc:stop()
					end)
					anim:gotoAndStop(1)
				end
			end
		end
	})

	self:_updateBarNodes()
end

function BattleEnergyBar:dispose()
	self:stopIncreasing()
	super.dispose(self)
end

function BattleEnergyBar:_setupEnergyLabel(view)
	local lblEnergy = view:getChildByFullName("energy_lab")

	lblEnergy:setString("0")

	self._lblEnergy = lblEnergy
	self._energyTextAnim = view:getChildByFullName("energy_text")
	self._oldEnergy = 0
end

function BattleEnergyBar:_setupBarNode(view)
	local record = {}

	for i = 1, 10 do
		local bar = self:getView():getChildByFullName("bar_node.energybar.bar" .. i)

		bar:setVisible(false)
	end

	self._animBars = setmetatable({}, {
		__index = function (t, k)
			local node = self:getView():getChildByFullName("bar_node.energybar.barAnim" .. k)

			return node
		end,
		__newindex = function (t, k, v)
			if record[k] == v then
				return
			end

			record[k] = v
			local bar_layer = self:getView():getChildByFullName("bar_node.energybar")

			bar_layer:removeChildByName("barAnim" .. k)

			local barIndex = (k - 1) % 10 + 1
			local barColorIndex = math.floor((k - 1) / 10) + 1
			local bar = bar_layer:getChildByFullName("bar" .. barIndex)

			if v and v >= 0 then
				local posx, posy = bar:getPosition()
				local anim = nil
				local colorChar = kColorCharMap[barColorIndex]
				local animChar = kBarIndexCharMap[barIndex] or kBarIndexCharMap[2]
				anim = cc.MovieClip:create("st" .. colorChar .. animChar .. "_shuijingtiao", "BattleMCGroup")

				anim:posite(posx, posy):addTo(bar_layer, 100 + 20 * barColorIndex - barIndex):setName("barAnim" .. k)
				anim:addCallbackAtFrame(37, function (cid, mc)
					mc:stop()
				end)
				anim:addCallbackAtFrame(60, function (cid, mc)
					mc:stop()
					mc:removeFromParent()
				end)

				if barColorIndex == 3 then
					cc.Sprite:createWithSpriteFrameName("zd_energybar_b" .. string.format("%d", barIndex) .. ".png"):posite(0, 0):addTo(anim:getChildByFullName("show"))
					cc.Sprite:createWithSpriteFrameName("zd_energybar_b" .. string.format("%d", barIndex) .. ".png"):posite(0, 0):addTo(anim:getChildByFullName("scale.icon"))

					if anim:getChildByFullName("next") then
						cc.Sprite:createWithSpriteFrameName("zd_energybar_b11.png"):posite(0, 0):addTo(anim:getChildByFullName("next"))
					end
				end

				anim:gotoAndStop(1)
			end

			if v and v > 0 then
				bar:setVisible(false)
			elseif v then
				bar:setVisible(true)

				if v >= -1 then
					barColorIndex = barColorIndex - 1
				end

				local colorChar = kColorCharMap[barColorIndex]

				if colorChar then
					if barColorIndex == 3 then
						bar:loadTexture("zd_energybar_b" .. string.format("%d", barIndex) .. ".png", ccui.TextureResType.plistType)
					else
						local picNum = kBarPicNumMap[barIndex] or kBarPicNumMap[2]

						bar:loadTexture("zd_energybar_" .. colorChar .. picNum .. ".png", ccui.TextureResType.plistType)
					end
				else
					bar:setVisible(false)
				end
			end
		end
	})
	local barNode = view:getChildByFullName("bar_node")

	barNode:removeChildByName("max_effect")
	barNode:removeChildByName("full_effect")

	local anim = cc.Node:create()

	anim:addTo(barNode, 10):offset(-3, 4):setName("max_effect")
	anim:setVisible(false)

	self._maxEffect = anim
end

function BattleEnergyBar:_hideFullEffect()
	if self._fullEffect then
		self._fullEffect:removeFromParent()
		self._fullEffect1:removeFromParent()

		self._fullEffect = nil
		self._fullEffect1 = nil
	end
end

function BattleEnergyBar:_showFullEffect()
	if not self._fullEffect then
		local anim = cc.MovieClip:create("tcaiman_shuijingtiaoman")

		anim:addTo(self:getView():getChildByFullName("bar_node"), 10):offset(-7, -5):setName("full_effect")
		anim:stop()
		anim:setVisible(false)

		self._fullEffect = anim
		local anim = cc.MovieClip:create("qmcai_shuijingtiaoman")

		anim:addTo(self:getView():getChildByFullName("energy_circle"), 10):offset(0, 0):setName("full_effect")
		anim:setVisible(false)

		self._fullEffect1 = anim
	end

	if not self._fullEffect:isVisible() then
		self._fullEffect:stopAllActions()
		self._fullEffect:runAction(cc.Sequence:create(cc.DelayTime:create(0.1), cc.Show:create(), cc.CallFunc:create(function ()
			local circle_layer = self:getView():getChildByFullName("energy_circle")

			for i = 1, MAX_BAR_INDEX do
				circle_layer:removeChildByName("circle" .. i)
			end
		end)))
		self._fullEffect:play()
		self._fullEffect1:stopAllActions()
		self._fullEffect1:runAction(cc.Sequence:create(cc.DelayTime:create(0.1), cc.Show:create()))
		self._fullEffect1:play()
	end
end

function BattleEnergyBar:_updateBarNodes()
	local isFull = true
	local energy = self._energy
	local remain = self._remain
	local ten = math.floor((energy - 1) / 10) + 1

	for i = 1, MAX_BAR_INDEX do
		local bar = self._animBars[i]

		if i == energy then
			if bar then
				if bar:getCurrentFrame() <= 25 then
					bar:gotoAndPlay(26)
				end
			else
				self._animBars[i] = i
				bar = self._animBars[i]

				bar:gotoAndPlay(26)
			end
		elseif i == energy + 1 then
			isFull = false

			if remain < 0 then
				remain = 0
			end

			if remain > 1 then
				remain = 1
			end

			self._remain = remain

			if not bar then
				self._animBars[i] = 0
				bar = self._animBars[i]
			end

			bar:gotoAndStop(math.max(1, math.floor(remain * 25)))
		elseif i >= energy + 2 then
			isFull = false

			if i <= ten * 10 then
				self._animBars[i] = -1
			elseif i <= 10 then
				self._animBars[i] = -1
			else
				self._animBars[i] = nil
			end
		elseif i < energy then
			if i > (ten - 1) * 10 then
				self._animBars[i] = -2
			else
				self._animBars[i] = nil
			end
		end

		local circle = self._circleAnims[i]

		if i == energy then
			if circle then
				if circle:getCurrentFrame() <= 30 then
					circle:gotoAndPlay(31)
				end
			elseif not isFull then
				self._circleAnims[i] = i
				circle = self._circleAnims[i]

				circle:gotoAndPlay(31)
			end
		elseif i == energy + 1 then
			if not circle then
				self._circleAnims[i] = i
				circle = self._circleAnims[i]
			end

			circle:gotoAndStop(math.max(1, math.floor(remain * 30)))
		elseif circle then
			self._circleAnims[i] = nil
		end
	end

	if MAX_ENERGY_NUM <= energy then
		if not self._maxEffect:isVisible() then
			self._maxEffect:setVisible(true)
		end

		self:_hideFullEffect()
	elseif isFull then
		self:_showFullEffect()
		self._maxEffect:setVisible(false)
	else
		self:_hideFullEffect()
		self._maxEffect:setVisible(false)
	end
end

function BattleEnergyBar:setListener(listener)
	self._listener = listener
end

function BattleEnergyBar:getEnergy()
	return self._energy
end

function BattleEnergyBar:isEnergyEnough(cost)
	return cost <= self:getEnergy()
end

function BattleEnergyBar:setEnergyText(energy, withEffect)
	local lblEnergy = self._lblEnergy
	local energyTextAnim = self._energyTextAnim

	lblEnergy:stopAllActions()

	if MAX_ENERGY_NUM < energy then
		energy = MAX_ENERGY_NUM
	end

	if not withEffect then
		energyTextAnim:setVisible(false)
		lblEnergy:setVisible(true)
		lblEnergy:setString(tostring(energy))
	else
		local fntFile = "asset/font/zd_cost.fnt"

		energyTextAnim:setVisible(true)
		lblEnergy:setVisible(false)
		energyTextAnim:removeAllChildren()

		local animName = nil

		if energy >= 100 and self._oldEnergy >= 100 then
			animName = "dhg_zhandoushuzi"
		elseif energy >= 100 and self._oldEnergy < 100 then
			animName = "dhe_zhandoushuzi"
		elseif energy < 100 and self._oldEnergy >= 100 then
			animName = "dhf_zhandoushuzi"
		elseif energy >= 10 and self._oldEnergy >= 10 then
			animName = "dhc_zhandoushuzi"
		elseif energy >= 10 and self._oldEnergy < 10 then
			animName = "dhb_zhandoushuzi"
		elseif energy < 10 and self._oldEnergy < 10 then
			animName = "dha_zhandoushuzi"
		else
			animName = "dhd_zhandoushuzi"
		end

		local anim = cc.MovieClip:create(animName, "BattleMCGroup")

		if energy >= 100 then
			local bai = string.format("%d", energy):sub(-3, -3)
			local baiText = ccui.TextBMFont:create(bai, fntFile)

			anim:getChildByFullName("bai2"):addChild(baiText)

			local baiText = ccui.TextBMFont:create(bai, fntFile)

			anim:getChildByFullName("bai_shine"):addChild(baiText)
		end

		if energy >= 10 then
			local ten = string.format("%d", energy):sub(-2, -2)
			local tenText = ccui.TextBMFont:create(ten, fntFile)

			anim:getChildByFullName("ten2"):addChild(tenText)

			local tenText = ccui.TextBMFont:create(ten, fntFile)

			anim:getChildByFullName("ten_shine"):addChild(tenText)
		end

		local unit = string.format("%d", energy):sub(-1, -1)
		local unitText = ccui.TextBMFont:create(unit, fntFile)

		anim:getChildByFullName("unit2"):addChild(unitText)

		local unitText = ccui.TextBMFont:create(ten, fntFile)

		anim:getChildByFullName("unit_shine"):addChild(unitText)

		if self._oldEnergy >= 100 then
			local bai = string.format("%d", self._oldEnergy):sub(-3, -3)
			local baiText = ccui.TextBMFont:create(bai, fntFile)

			anim:getChildByFullName("bai"):addChild(baiText)
		end

		if self._oldEnergy >= 10 then
			local ten = string.format("%d", self._oldEnergy):sub(-2, -2)
			local tenText = ccui.TextBMFont:create(ten, fntFile)

			anim:getChildByFullName("ten"):addChild(tenText)
		end

		local unit = string.format("%d", self._oldEnergy):sub(-1, -1)
		local unitText = ccui.TextBMFont:create(unit, fntFile)

		anim:getChildByFullName("unit"):addChild(unitText)
		anim:addTo(energyTextAnim):gotoAndPlay(1)
		anim:addCallbackAtFrame(40, function (cid, mc)
			mc:stop()
		end)
		anim:setScale(0.85)
	end

	self._oldEnergy = energy
end

function BattleEnergyBar:syncEnergy(energy, remain, speed)
	local oldEnergy = self._energy
	self._energy = energy
	self._remain = remain
	self._speed = speed

	self:_updateBarNodes()

	if oldEnergy ~= energy then
		self:setEnergyText(energy, true)
		self:showAddEnergyAnim()
	end

	if self._listener ~= nil then
		self._listener:onEnergyChanged(self._energy, self._remain)
	end
end

function BattleEnergyBar:showAddEnergyAnim()
	local energy = self._oldEnergy
	local node_energy = self:getView():getChildByFullName("Node_energy")

	node_energy:removeAllChildren()

	local energyAnim = cc.MovieClip:create("baoshiN_feiyongbianhua", "BattleMCGroup")

	energyAnim:addTo(node_energy)

	if MAX_BAR_INDEX <= energy then
		energyAnim:addEndCallback(function (fid, mc)
			mc:stop()
			mc:gotoAndPlay(1)
		end)
		energyAnim:gotoAndPlay(1)
	elseif energy > 20 then
		energyAnim:addEndCallback(function (fid, mc)
			mc:gotoAndStop(1)
		end)
		energyAnim:gotoAndPlay(1)
	else
		energyAnim:gotoAndStop(1)
	end
end

function BattleEnergyBar:showRecoveryEnergyAnim()
	local circle_layer = self:getView():getChildByFullName("energy_circle")
	local node_energy = self:getView():getChildByFullName("Node_energy")
	local anim = cc.MovieClip:create("baoshi_feiyongbianhua")

	anim:addTo(circle_layer, 20)
	anim:addEndCallback(function (fid, mc)
		node_energy:setVisible(true)
		anim:stop()
		anim:removeFromParent(true)
	end)
	anim:gotoAndPlay(0)
	node_energy:setVisible(false)
end

function BattleEnergyBar:startIncreasing(scheduler)
	if self._increasingTask ~= nil then
		return
	end

	self._increasingTask = scheduler:schedule(function (task, dt)
		local energy = self._energy
		local remain = self._remain

		if MAX_BAR_INDEX <= energy or remain >= 1 then
			return
		end

		self._remain = remain + dt * (self._speed or 0)

		self:_updateBarNodes()

		if self._listener ~= nil then
			self._listener:onEnergyChanged(self._energy, self._remain)
		end
	end)
end

function BattleEnergyBar:stopIncreasing()
	if self._increasingTask then
		self._increasingTask:stop()

		self._increasingTask = nil
	end
end

function BattleEnergyBar:pauseIncreasing()
	self._speedBeforePause = self._speed

	self:syncEnergy(self._energy, self._remain, 0)
end

function BattleEnergyBar:resumeIncreasing()
	local speed = self._speedBeforePause or self._speed

	self:syncEnergy(self._energy, self._remain, speed)
end

function BattleEnergyBar:shine()
	local view = self:getView()
	local redNode = view:getChildByFullName("red")

	redNode:setVisible(true)
	redNode:stopAllActions()

	local function callback()
		redNode:setVisible(false)
	end

	redNode:runAction(cc.Sequence:create(cc.FadeIn:create(0.2), cc.FadeOut:create(0.2), cc.FadeIn:create(0.2), cc.FadeOut:create(0.2), cc.CallFunc:create(callback)))
end
