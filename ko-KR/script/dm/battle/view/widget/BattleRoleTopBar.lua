BattleRoleTopBar = class("BattleRoleTopBar", BaseWidget)

BattleRoleTopBar:has("_viewContext", {
	is = "r"
})

local lowlimit = 5
local HpColor = {
	Red = {
		g = 0,
		b = 0,
		contrast = 20,
		r = 0.8
	},
	White = {
		g = 0.9,
		saturation = 0,
		contrast = 20,
		r = 0.9,
		o_b = 255,
		o_g = 255,
		o_r = 255,
		b = 0.9
	}
}
local shineColor = {
	HpColor.Red,
	HpColor.White,
	HpColor.Red
}

function BattleRoleTopBar:initialize(view, mode, isLeft, viewContext)
	super.initialize(self, view)

	self._viewContext = viewContext
	self._isLeft = isLeft
end

function BattleRoleTopBar:dispose()
	if self._showTask then
		self._showTask:stop()

		self._showTask = nil
	end

	if self._hpBarShineTask then
		self._hpBarShineTask:stop()

		self._hpBarShineTask = nil
	end

	if self._hpBarTask then
		self._hpBarTask:stop()

		self._hpBarTask = nil
	end

	if self._rpBarTask then
		self._rpBarTask:stop()

		self._rpBarTask = nil
	end

	super.dispose(self)
end

function BattleRoleTopBar:bindActor(actor)
	self._actor = actor
	self._dataModel = actor:getDataModel()

	self:_setupView()
end

local rangeMap = {
	Single_Cure = "zhiye_wz01_green.png",
	Col_Cure = "zhiye_wz03_green.png",
	X_Attack = "zhiye_wz05_red.png",
	Single_Attack = "zhiye_wz01_red.png",
	Card = "zhiye_wzkp_green.png",
	Random4_Attack = "zhiye_wz04w_red.png",
	Row_Attack = "zhiye_wz03s_red.png",
	Row_Cure = "zhiye_wz03s_green.png",
	Single_Atk_Double_Cure = "zhiye_wz03_rg.png",
	Random3_Attack = "zhiye_wz03w_red.png",
	Summon = "zhiye_wzzh_green.png",
	Cross_Attack = "zhiye_wz05z_red.png",
	Col_Attack = "zhiye_wz03_red.png",
	Random1_Attack = "zhiye_wz00w_red.png",
	All_Cure = "zhiye_wz09_green.png",
	Cross_Cure = "zhiye_wz05z_green.png",
	X_Cure = "zhiye_wz05_green.png",
	All_Attack = "zhiye_wz09_red.png"
}

function BattleRoleTopBar:_setupView()
	local barsPanel = nil
	local spRes = ""
	local resId = "asset/ui/BattleRoleTopBars.csb"
	local topBarNode = cc.CSLoader:createNode(resId)
	local roleType = self._dataModel:getRoleType()

	if roleType == RoleType.Master then
		if self._isLeft then
			barsPanel = topBarNode:getChildByName("master"):clone()
		else
			barsPanel = topBarNode:getChildByName("enemy_master"):clone()
		end
	else
		barsPanel = topBarNode:getChildByName("pet"):clone()
	end

	barsPanel:setVisible(true)
	barsPanel:posite(0, 0)
	self._view:addChild(barsPanel)

	local hpbar = barsPanel:getChildByFullName("bars.hp_bar")

	hpbar:setPercent(100)

	self._hpbar = hpbar
	self._bg = barsPanel:getChildByName("bg")
	self._hpBg = barsPanel:getChildByName("hp_bg")
	self._barBg = barsPanel:getChildByName("barBg")
	self._hpCover = barsPanel:getChildByName("hp_coverbar")
	local mpbar = barsPanel:getChildByFullName("bars.mp_bar")
	self._baseShield = barsPanel:getChildByName("Node_shield")
	self._shield = self._baseShield:getChildByName("shield")

	self._shield:setVisible(false)
	mpbar:setPercent(0)

	self._mpbar = mpbar
	self._mpBg = barsPanel:getChildByName("mp_bg")
	self._baseColorTrans = self._hpbar:getColorTransform()

	if roleType ~= RoleType.Master then
		local genreIcon = barsPanel:getChildByFullName("genre")
		local genreBg = barsPanel:getChildByFullName("genreBg")
		self._genreIcon = genreIcon
		self._genreBg = genreBg

		if genreIcon then
			local genre = self._dataModel:getGenre()

			if genre and genre ~= "" then
				local occupation = ConfigReader:requireDataByNameIdAndKey("ConfigValue", "Hero_Type", "content")

				if not occupation[genre] then
					local roleId = self._dataModel:getRoleId()

					CommonUtils.uploadDataToBugly("BattleRoleTopBar:_setupView", "genre:" .. genre .. "___roleId:" .. roleId)

					return
				end

				local _, genrePic = GameStyle:getHeroOccupation(genre)

				genreIcon:loadTexture(genrePic)
			end
		end
	end
end

function BattleRoleTopBar:setRoleAttrbute(attr)
end

function BattleRoleTopBar:setHp(value)
	local dataModel = self._actor:getDataModel()
	local maxHp = dataModel:getMaxHp()
	local hp = dataModel:getHp()

	if value > 100 then
		value = 100
	end

	if value > 0 and value < lowlimit then
		value = lowlimit
	end

	if value <= 0 then
		value = 0
	end

	local percent = value

	self._hpbar:setPercent(percent)

	if DEBUG and DEBUG > 1 then
		local function formatCount(count)
			if count <= 99999 then
				return tostring(math.floor(count)), false
			else
				local curLanage = getCurrentLanguage()

				if curLanage == GameLanguageType.CN then
					count = count - count % 1000
					count = string.format("%.1f", count / 10000) .. Strings:get("HERO_HP_UNIT")
				else
					count = count - count % 100
					count = string.format("%.1f", count / 1000) .. "k"
				end

				return count, true
			end
		end

		if not self._hpLabel then
			local label = ccui.Text:create("", CUSTOM_TTF_FONT_1, 20)

			label:setColor(cc.c3b(0, 255, 0))
			label:setAnchorPoint(cc.p(0.5, 0))
			label:addTo(self._hpbar):posite(self._hpbar:getContentSize().width / 2, 10)

			self._hpLabel = label
		end

		self._hpLabel:setString(formatCount(hp) .. "/" .. formatCount(maxHp))
	end
end

function BattleRoleTopBar:setRp(value)
	local dataModel = self._actor:getDataModel()
	local percent = math.max(math.floor(value), 1)

	self._mpbar:setPercent(value)

	local rp = self._dataModel:getRp()

	if not self._rpLabel then
		local label = ccui.Text:create(" ", CUSTOM_TTF_FONT_1, 20)

		label:setColor(cc.c3b(255, 0, 0))
		label:setAnchorPoint(cc.p(0.5, 0.5))
		label:addTo(self._mpbar:getParent()):posite(0, 0):offset(self._mpbar:getPositionX(), self._mpbar:getPositionY())

		self._rpLabel = label
	end

	if DEBUG and DEBUG > 1 then
		self._rpLabel:setString(rp)
	end
end

function BattleRoleTopBar:setHpVisible(visible)
	self._hpbar:setVisible(visible)
	self._hpBg:setVisible(visible)
	self._hpCover:setVisible(visible)
	self._baseShield:setVisible(visible)
	self._mpbar:setVisible(visible)

	if self._bg then
		self._bg:setVisible(visible)
	end

	if self._genreIcon then
		self._genreIcon:setVisible(visible)
	end

	if self._genreBg then
		self._genreBg:setVisible(visible)
	end

	if self._hpLabel then
		self._hpLabel:setVisible(visible)
	end

	if self._rpLabel then
		self._rpLabel:setVisible(visible)
	end

	if self._barBg then
		self._barBg:setVisible(visible)
	end
end

function BattleRoleTopBar:setRpVisible(visible)
	self:setHpVisible(visible)
end

function BattleRoleTopBar:isHpBarVisible()
	return self._hpbar:isVisible()
end

function BattleRoleTopBar:isRpBarVisible()
	return self._mpbar:isVisible()
end

function BattleRoleTopBar:shine()
	return

	local function setHpBarColor(args)
		local trans = {}

		table.deepcopy(self._baseColorTrans, trans)

		local mults = trans.mults
		local offsets = trans.offsets

		self._hpbar:setSaturation(args.saturation or 0)
		self._hpbar:setContrast(args.contrast or 0)
		self._hpbar:setColorTransform(ColorTransform(args.r or mults.x, args.g or mults.y, args.b or mults.z, args.a or mults.w, args.o_r or offsets.x, args.o_g or offsets.y, args.o_b or offsets.z, args.o_a or offsets.w))
	end

	if self._hpBarShineTask then
		self._hpBarShineTask:stop()
	end

	self._tick = 0
	self._hpBarShineTask = self._viewContext:scalableSchedule(function (task, dt)
		if self._hpBarShineTask ~= task then
			task:stop()

			return
		end

		self._tick = self._tick + 1

		if shineColor[self._tick] then
			setHpBarColor(shineColor[self._tick])
		else
			setHpBarColor({})
			task:stop()

			self._hpBarShineTask = nil
		end
	end, 0.05, true)
end

function BattleRoleTopBar:scheduleShowHp(duration)
	self._displayHpTime = duration or 1

	if self._hpBarTask then
		return false
	end

	self._actor:updateHpBarVisibility(true)

	self._hpBarTask = self._viewContext:scalableSchedule(function (task, dt)
		if self._hpBarTask ~= task then
			return
		end

		self._displayHpTime = self._displayHpTime - dt

		if self._displayHpTime <= 0 then
			self._actor:updateHpBarVisibility(false)
			task:stop()

			self._hpBarTask = nil
		end
	end)

	return true
end

function BattleRoleTopBar:scheduleShowRp(duration)
	self._displayRpTime = duration or 1

	if self:isRpBarVisible() or self._rpBarTask then
		return
	end

	self._actor:updateRpBarVisibility(true)

	self._rpBarTask = self._viewContext:scalableSchedule(function (task, dt)
		if self._rpBarTask ~= task then
			return
		end

		self._displayRpTime = self._displayRpTime - dt

		if self._displayRpTime <= 0 then
			self._actor:updateRpBarVisibility(false)
			task:stop()

			self._rpBarTask = nil
		end
	end)
end

function BattleRoleTopBar:stopRpTask()
	if self._rpBarTask then
		self._rpBarTask:stop()

		self._rpBarTask = nil
	end
end

function BattleRoleTopBar:resetTierTextScale(scale)
end

function BattleRoleTopBar:refreshShield()
	local maxSize = 124
	local minSize = 29
	local dataModel = self._actor:getDataModel()
	local maxHp = dataModel:getMaxHp()
	local shield = dataModel:getShield()

	if shield > 0 then
		self._shield:setVisible(true)

		local percent = shield / maxHp

		if percent > 1 then
			percent = 1
		end

		if percent < 0.2 then
			percent = 0.2
		end

		local size = cc.size((maxSize - minSize) * percent + minSize, 32)

		self._shield:setContentSize(size)
	else
		self._shield:setVisible(false)
	end
end
