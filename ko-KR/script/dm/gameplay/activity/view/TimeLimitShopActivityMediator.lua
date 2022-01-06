TimeLimitShopActivityMediator = class("TimeLimitShopActivityMediator", DmPopupViewMediator, _M)

TimeLimitShopActivityMediator:has("_activitySystem", {
	is = "r"
}):injectWith("ActivitySystem")
TimeLimitShopActivityMediator:has("_gameServerAgent", {
	is = "r"
}):injectWith("GameServerAgent")
TimeLimitShopActivityMediator:has("_shopSystem", {
	is = "r"
}):injectWith("ShopSystem")
TimeLimitShopActivityMediator:has("_bagSystem", {
	is = "r"
}):injectWith("BagSystem")

local timeLimitShopConfig = {
	xige = {
		BG = "jqtd_txt_jjbjwz_di",
		TimeOutLineColor = cc.c4b(52, 31, 255, 255)
	},
	valentine = {
		BG = "jqtd_txt_mtzazl_di",
		TimeOutLineColor = cc.c4b(106, 0, 24, 255)
	},
	whiteday = {
		BG = "jqtd_txt_ymzdbz_di",
		TimeOutLineColor = cc.c4b(59, 65, 98, 255)
	},
	foolsday = {
		BG = "jqtd_txt_zgmszl_di",
		TimeOutLineColor = cc.c4b(106, 0, 24, 255)
	},
	ambition = {
		BG = "jqtd_txt_swzzl_di",
		TimeOutLineColor = cc.c4b(187, 41, 1, 255)
	},
	female = {
		BG = "jqtd_txt_xtxlzl_di",
		TimeOutLineColor = cc.c4b(187, 1, 106, 255)
	},
	xide = {
		BG = "jqtd_txt_typl_di",
		TimeOutLineColor = cc.c4b(186, 51, 20, 255)
	},
	storybook = {
		TimeOutLineColor = cc.c4b(187, 1, 1, 255)
	},
	storybook = {
		TimeOutLineColor = cc.c4b(187, 1, 1, 255)
	},
	rezero = {
		CellBuyEndImg = "jqtd_img_bjmnzl_jldih.png",
		CellBuyImg = "jqtd_img_bjmnzl_jldi.png",
		BG = "jqtd_txt_bjmnzl_di",
		TimeOutLineColor = cc.c4b(84, 1, 187, 255),
		CellNameColor = cc.c4b(160, 193, 247, 255)
	},
	xide = {
		BG = "jqtd_txt_typl_di",
		TimeOutLineColor = cc.c4b(186, 51, 20, 255)
	},
	half = {
		TimeOutLineColor = cc.c4b(186, 51, 20, 255),
		BGSize = cc.size(1031, 640)
	},
	deepsea = {
		TimeOutLineColor = cc.c4b(1, 6, 187, 255),
		bgSize = cc.size(1136, 640)
	},
	summerre = {
		BG = "jqtd_txt_qlyxzl_di",
		TimeOutLineColor = cc.c4b(9, 70, 173, 255)
	},
	wuxiu = {
		TimeOutLineColor = cc.c4b(162, 16, 16, 255),
		cell = {
			cellPanel = "deepseaCell",
			cellDi = {
				"jqtd_img_hwxxl_jldi.png",
				"jqtd_img_hwxxl_jldih.png"
			},
			nameColor = cc.c3b(227, 183, 123)
		}
	},
	fireworks = {
		TimeOutLineColor = cc.c4b(67, 1, 187, 255),
		bgSize = cc.size(1136, 640)
	},
	terror = {
		BG = "jqtd_txt_xzldmm_di",
		TimeOutLineColor = cc.c4b(106, 0, 24, 255)
	},
	riddle = {
		BG = "jqtd_txt_zhyazl_di",
		TimeOutLineColor = cc.c4b(105, 0, 106, 255)
	},
	Anniversary = {
		BG = "jqtd_txt_ydzr_di",
		TimeOutLineColor = cc.c4b(195, 73, 36, 255),
		cell = {
			cellPanel = "deepseaCell",
			cellDi = {
				"jqtd_img_ydzr_jldi.png",
				"jqtd_img_ydzr_jldih.png"
			},
			nameColor = cc.c3b(250, 166, 149)
		}
	},
	animal = {
		BG = "jqtd_txt_zwzj_di",
		TimeOutLineColor = cc.c4b(164, 116, 91, 255)
	},
	halloweenday = {
		TimeOutLineColor = cc.c4b(32, 1, 187, 255),
		cell = {
			cellPanel = "deepseaCell",
			cellDi = {
				"jqtd_img_ayzl_jldi.png",
				"jqtd_img_ayzl_jldih.png"
			},
			nameColor = cc.c4b(144, 144, 250, 115)
		}
	},
	dusk = {
		CellBuyEndImg = "jqtd_img_yywgzl_jldih.png",
		CellBuyImg = "jqtd_img_yywgzl_jldi.png",
		BG = "jqtd_txt_yywgzl_di",
		TimeOutLineColor = cc.c4b(105, 0, 106, 255),
		CellNameColor = cc.c4b(159, 122, 165, 89.25)
	},
	silentnight = {
		CellBuyImg = "jqtd_img_sdqjzl_jldi.png",
		CellBuyEndImg = "jqtd_img_sdqjzl_jldih.png",
		CellNameColor = cc.c4b(224, 193, 148, 89.25)
	},
	drama = {
		CellBuyImg = "jqtd_img_ysmlzl_jldi.png",
		CellBuyEndImg = "jqtd_img_ysmlzl_jldih.png",
		CellNameOpacity = 255,
		CellNameColor = cc.c4b(190, 177, 241, 255)
	}
}
local btnHandlers = {
	["main.btn_close"] = {
		clickAudio = "Se_Click_Common_2",
		func = "onClickClose"
	}
}

function TimeLimitShopActivityMediator:initialize()
	super.initialize(self)
end

function TimeLimitShopActivityMediator:dispose()
	super.dispose(self)

	if self._timeLimitShopTimer then
		self._timeLimitShopTimer:stop()

		self._timeLimitShopTimer = nil
	end
end

function TimeLimitShopActivityMediator:onRegister()
	super.onRegister(self)
	self:mapButtonHandlersClick(btnHandlers)
	self:mapEventListener(self:getEventDispatcher(), EVT_BUY_PACKAGE_SUCC, self, self.setUpPackageState)
end

function TimeLimitShopActivityMediator:onRemove()
	super.onRemove(self)
end

function TimeLimitShopActivityMediator:enterWithData(data)
	self._activity = data.activity
	self._activityConfig = self._activity:getConfig().ActivityConfig
	self._packType = self._activityConfig.PackType

	self:setupView()
end

function TimeLimitShopActivityMediator:setupView()
	self._view = self:getView()
	self._main = self._view:getChildByName("main")
	self._deadline = self._main:getChildByFullName("deadline")
	self._bg = self._main:getChildByFullName("bg")
	self._packageUI = {
		self._main:getChildByFullName("package_1"),
		self._main:getChildByFullName("package_2"),
		self._main:getChildByFullName("package_3")
	}
	local config = timeLimitShopConfig[self._packType]

	if self._activityConfig.UIBG and self._activityConfig.UIBG ~= "" then
		self._bg:loadTexture("asset/lang_ui/activity/" .. self._activityConfig.UIBG .. ".png", ccui.TextureResType.localType)
	elseif config and config.BG then
		self._bg:loadTexture("asset/lang_ui/activity/" .. config.BG .. ".png", ccui.TextureResType.localType)
	end

	if config and config.BGSize then
		local size = self._bg:getContentSize()

		self._bg:setContentSize(config.BGSize)
		self._bg:offset((config.BGSize.width - size.width) * 0.5, 0)
	end

	local config = timeLimitShopConfig[self._packType]

	if config and config.TimeOutLineColor then
		self._deadline:enableOutline(config.TimeOutLineColor, 1)
	end

	if config and config.bgSize then
		self._bg:setContentSize(config.bgSize)
	end

	self._cellClone = self._view:getChildByFullName(self._packType .. "Cell")

	if not self._cellClone and config.cell then
		self._cellClone = self._view:getChildByFullName(config.cell.cellPanel)

		if config.cell.cellDi then
			self._cellClone:getChildByFullName("cell.bg"):loadTexture("asset/ui/activity/" .. config.cell.cellDi[1])
			self._cellClone:getChildByFullName("cell.bg_buy"):loadTexture("asset/ui/activity/" .. config.cell.cellDi[2])
		end

		if config.cell.nameColor then
			self._cellClone:getChildByFullName("cell.goods_name"):setTextColor(config.cell.nameColor)
		end
	end

	if not self._cellClone then
		self._cellClone = self._view:getChildByFullName("foolsdayCell")
	end

	assert(self._cellClone ~= nil, "Error:Not Found ItemCell By Type:" .. self._packType)

	if config and config.CellBuyImg then
		self._cellClone:getChildByFullName("cell.bg"):loadTexture("asset/ui/activity/" .. config.CellBuyImg, ccui.TextureResType.localType)
	end

	if config and config.CellBuyEndImg then
		self._cellClone:getChildByFullName("cell.bg_buy"):loadTexture("asset/ui/activity/" .. config.CellBuyEndImg, ccui.TextureResType.localType)
	end

	if config and config.CellNameColor then
		self._cellClone:getChildByFullName("cell.goods_name"):setTextColor(config.CellNameColor)
	end

	if config and config.CellNameOpacity then
		self._cellClone:getChildByFullName("cell.goods_name"):setOpacity(config.CellNameOpacity)
	end

	self:enableTimeLimitShopTimer()
	self:setUpPackageState()
	self:setupAnim()
end

function TimeLimitShopActivityMediator:setupAnim()
	local action = cc.CSLoader:createTimeline("asset/ui/TimeShopActivityFoolsday.csb")

	self._main:runAction(action)
	action:clearFrameEventCallFunc()
	action:gotoFrameAndPlay(0, 30, false)
end

function TimeLimitShopActivityMediator:setUpPackageState()
	local timePurchaseIds = self._activityConfig.TimePurchaseId

	table.sort(timePurchaseIds, function (a, b)
		local aShop = self._shopSystem:getPackageById(a)
		local bShop = self._shopSystem:getPackageById(b)

		return aShop:getSort() < bShop:getSort()
	end)

	for i = 1, #timePurchaseIds do
		local packageId = timePurchaseIds[i]
		local itemUI = self._packageUI[i]
		local packageShop = self._shopSystem:getPackageById(packageId)

		if itemUI then
			itemUI:setName(packageId)
			self:setPackageItemInfo(itemUI, packageShop)
			itemUI:addTouchEventListener(function (sender, eventType)
				if eventType == ccui.TouchEventType.ended then
					self:onBuyItem(packageId)
				end
			end)
		end
	end
end

function TimeLimitShopActivityMediator:setPackageItemInfo(cell, data)
	local baseClone = self._cellClone:clone()

	baseClone:addTo(cell):center(cell:getContentSize())

	local panel = baseClone:getChildByName("cell")
	local mask = baseClone:getChildByFullName("mask")
	local iconLayout = panel:getChildByFullName("icon_layout")
	local nameText = panel:getChildByFullName("goods_name")
	local money_icon = panel:getChildByFullName("money_layout.money_icon")

	money_icon:removeAllChildren()

	local moneyText = panel:getChildByFullName("money_layout.money")
	local discountPanel = panel:getChildByFullName("costOffTagPanel")
	local discountText = panel:getChildByFullName("costOffTagPanel.number")
	local leaveTimesText = panel:getChildByFullName("info_panel.duihuan_text")
	local priceText = panel:getChildByFullName("money_layout.price")

	priceText:removeAllChildren()

	local bg_buy = panel:getChildByName("bg_buy")
	local bg = panel:getChildByName("bg")
	local xian = panel:getChildByFullName("money_layout.xian")
	local infoPanel = panel:getChildByName("info_panel")
	local moneyLauout = panel:getChildByName("money_layout")

	moneyLauout:setPositionX(infoPanel:getPositionX() - 6)

	local isFree = data:getIsFree()

	nameText:setString(data:getName())
	nameText:setPosition(cc.p(129, 300))

	if isFree == 1 then
		moneyText:setString(Strings:get("Recruit_Free"))
		moneyText:setAnchorPoint(0.5, 0.5)
		moneyText:setPosition(cc.p(101, 30))
	elseif isFree == 2 then
		local goldIcon = IconFactory:createResourcePic({
			id = data:getGameCoin().type
		})

		goldIcon:addTo(money_icon):center(money_icon:getContentSize()):offset(0, 0)
		moneyText:setString(tostring(data:getGameCoin().amount))
		moneyText:setPositionX(85)

		if data:getCostOff() then
			discountPanel:setVisible(true)
			discountText:setString(tostring(data:getCostOff() * 100) .. "%")
		else
			discountPanel:setVisible(false)
		end

		priceText:setVisible(true)
		priceText:setString(tostring(data:getPrice()))
		xian:setVisible(true)

		local goldIcon2 = IconFactory:createResourcePic({
			id = data:getGameCoin().type
		})

		goldIcon2:addTo(priceText):center(priceText:getContentSize()):offset(-25, 0)
		goldIcon2:setScale(0.7)

		if data:getPrice() == 0 then
			priceText:setVisible(false)
			xian:setVisible(false)
			discountPanel:setVisible(false)
		end
	else
		local symbol, price = data:getPaySymbolAndPrice(data:getPayId())

		moneyText:setString(symbol .. price)
		moneyText:setPositionX(60)

		if data:getCostOff() then
			discountText:setString(tostring(data:getCostOff() * 100) .. "%")
			discountPanel:setVisible(true)
		else
			discountPanel:setVisible(false)
		end

		priceText:setVisible(true)
		priceText:setString(symbol .. tostring(data:getPrice()))
		xian:setVisible(true)

		if data:getPrice() == 0 then
			priceText:setVisible(false)
			xian:setVisible(false)
			discountPanel:setVisible(false)
		end
	end

	local rewardId = data:getItem()
	local rewards = RewardSystem:getRewardsById(rewardId)

	iconLayout:removeAllChildren()
	iconLayout:setAnchorPoint(cc.p(0.5, 0.5))

	local icon = IconFactory:createRewardIcon(rewards[1], {
		showAmount = true,
		isWidget = true
	})

	IconFactory:bindTouchHander(icon, IconTouchHandler:new(self), rewards[1], {
		touchDisappear = true,
		swallowTouches = true
	})
	iconLayout:addChild(icon)
	icon:setAnchorPoint(cc.p(0.5, 0.5))

	local pos = cc.p(iconLayout:getContentSize().width / 2, iconLayout:getContentSize().height / 2)

	icon:setPosition(pos)
	icon:setScale(0.9)

	local rewardPanel = panel:getChildByFullName("rewardPanel")

	rewardPanel:removeAllChildren()

	local rewardId = data:getItem()
	local rewards = RewardSystem:getRewardsById(rewardId)
	local rewardCount = #rewards - 1
	local offset = rewardCount == 1 and 70 or rewardCount == 2 and 40 or rewardCount == 3 and 0 or 0
	local scale = 0.55
	local cellWidth = 70

	for i = 1, 4 do
		local reward = rewards[i + 1]

		if reward then
			local rewardIcon = IconFactory:createRewardIcon(reward, {
				showAmount = true,
				isWidget = true
			})

			rewardPanel:addChild(rewardIcon)
			rewardIcon:setScaleNotCascade(scale)
			rewardIcon:setPosition((i - 1) * cellWidth + offset, 8)
			rewardIcon:setAnchorPoint(0, 0)
			IconFactory:bindTouchHander(rewardIcon, IconTouchHandler:new(self), reward, {
				touchDisappear = true,
				swallowTouches = true
			})
		end
	end

	local times1 = data:getLeftCount()
	local times2 = data:getStorage()

	if data:getTimeTypeType() == "limit" then
		leaveTimesText:setVisible(true)
		leaveTimesText:setString(Strings:get("LimitPack_TotalLimit", {
			cur = times1,
			total = times2
		}))
	elseif data:getTimeTypeType() == "day" then
		leaveTimesText:setVisible(true)
		leaveTimesText:setString(Strings:get("LimitPack_TodayLimit", {
			cur = times1,
			total = times2
		}))
	elseif data:getTimeTypeType() == "unlimit" then
		leaveTimesText:setVisible(false)
	end

	if times1 <= 0 and data:getTimeTypeType() ~= "unlimit" then
		bg:setVisible(false)
		bg_buy:setVisible(true)
		mask:setVisible(true)
		panel:setColor(cc.c3b(120, 120, 120))
		cell:setTouchEnabled(false)
		moneyText:enableShadow(cc.c4b(49, 49, 49, 255), cc.size(0, -3), 3)
	else
		bg:setVisible(true)
		bg_buy:setVisible(false)
		mask:setVisible(false)
		panel:setColor(cc.c3b(255, 255, 255))
		cell:setTouchEnabled(true)
	end
end

function TimeLimitShopActivityMediator:onClickClose()
	self:close()
end

function TimeLimitShopActivityMediator:enableTimeLimitShopTimer()
	if self._timeLimitShopTimer then
		self._timeLimitShopTimer:stop()

		self._timeLimitShopTimer = nil
	end

	local function updata()
		local leaveTime = self._activity:getEndTime() / 1000 - self._gameServerAgent:remoteTimestamp()

		if leaveTime <= 0 then
			if self._timeLimitShopTimer then
				self._timeLimitShopTimer:stop()

				self._timeLimitShopTimer = nil
			end

			self:close()
		end

		local str = ""
		local fmtStr = "${d}:${H}:${M}:${S}"
		local timeStr = TimeUtil:formatTime(fmtStr, leaveTime)
		local parts = string.split(timeStr, ":", nil, true)
		local timeTab = {
			day = tonumber(parts[1]),
			hour = tonumber(parts[2]),
			min = tonumber(parts[3]),
			s = tonumber(parts[4])
		}

		if timeTab.day > 0 then
			str = timeTab.day .. Strings:get("TimeUtil_Day") .. timeTab.hour .. Strings:get("TimeUtil_Hour")
		elseif timeTab.hour > 0 then
			str = timeTab.hour .. Strings:get("TimeUtil_Hour") .. timeTab.min .. Strings:get("TimeUtil_Min")
		elseif timeTab.min > 0 then
			str = timeTab.min .. Strings:get("TimeUtil_Min") .. timeTab.s .. Strings:get("TimeUtil_Sec")
		else
			str = timeTab.s .. Strings:get("TimeUtil_Sec")
		end

		self._deadline:setString(Strings:get("LimitPack_Countdown", {
			time = str
		}))
	end

	self._timeLimitShopTimer = LuaScheduler:getInstance():schedule(updata, 1, false)

	updata()
end

function TimeLimitShopActivityMediator:onBuyItem(packageId)
	local data = {
		doActivityType = 101,
		packageId = packageId
	}
	local packageShop = self._shopSystem:getPackageById(packageId)
	local isFree = packageShop:getIsFree()

	if isFree == KShopBuyType.KCoin then
		local gameCoin = packageShop:getGameCoin()
		local amount = gameCoin.amount
		local costType = gameCoin.type
		local curCoin = self._bagSystem:getItemCount(costType)

		if curCoin < amount then
			local outSelf = self
			local delegate = {
				willClose = function (self, popupMediator, data)
					if not outSelf._activitySystem:checkTimeLimitShopShow() then
						outSelf:dispatch(ShowTipEvent({
							tip = Strings:get("Recharge_ERROR_Tip2")
						}))
						outSelf:close()
					end

					if data.response == "ok" then
						outSelf._shopSystem:tryEnter({
							shopId = "Shop_Mall"
						})
					elseif data.response == "cancel" then
						-- Nothing
					elseif data.response == "close" then
						-- Nothing
					end
				end
			}
			local data = {
				title1 = "Tips",
				title = Strings:get("Tip_Remind"),
				content = Strings:get("LimitPack_DiamondTip"),
				sureBtn = {},
				cancelBtn = {}
			}
			local view = self:getInjector():getInstance("AlertView")

			self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
				transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
			}, data, delegate))

			return
		end
	end

	self._activitySystem:requestDoActivity(self._activity:getId(), data, function (response)
		if response.resCode == GS_SUCCESS then
			if isFree == KShopBuyType.KFree or isFree == KShopBuyType.KCoin then
				if DisposableObject:isDisposed(self) or DisposableObject:isDisposed(self:getView()) then
					return
				end

				local view = self:getInjector():getInstance("getRewardView")

				self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
					maskOpacity = 0
				}, {
					rewards = response.data.rewards
				}))
				self:setUpPackageState()

				return
			end

			local payOffSystem = self:getInjector():getInstance(PayOffSystem)

			payOffSystem:payOffToSdk(response.data)
		end
	end)
end
