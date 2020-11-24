CurrencySystem = class("CurrencySystem", Facade, _M)

CurrencySystem:has("_currencyService", {
	is = "r"
}):injectWith("CurrencyService")
CurrencySystem:has("_shopSystem", {
	is = "r"
}):injectWith("ShopSystem")

local CurrencyType2ResIdMap = {
	[CurrencyType.kGold] = "gold",
	[CurrencyType.kDiamond] = "diamond"
}

function CurrencySystem:initialize()
	super.initialize(self)
end

function CurrencySystem:requestBuyGold(params, callBack)
	self._currencyService:requestBuyGold(params, function (response)
		if response.resCode == GS_SUCCESS then
			self:dispatch(Event:new(EVT_BUY_GOLD_SUCC, {}))
			self:dispatch(ShowTipEvent({
				duration = 0.2,
				tip = Strings:find("CURRENCYBUY_GOLD_SUCC")
			}))

			if callBack then
				callBack(response)
			end
		end
	end)
end

function CurrencySystem:requestBuyCrystal(params, callBack)
	self._currencyService:requestBuyCrystal(params, function (response)
		if response.resCode == GS_SUCCESS then
			self:dispatch(Event:new(EVT_BUY_CRYSTAL_SUCC, {}))
			self:dispatch(ShowTipEvent({
				duration = 0.2,
				tip = Strings:find("CURRENCYBUY_CRYSTL_SUCC")
			}))

			if callBack then
				callBack(response)
			end
		end
	end)
end

function CurrencySystem:requestBuyExp(params, callBack)
	self._currencyService:requestBuyExp(params, function (response)
		if response.resCode == GS_SUCCESS then
			self:dispatch(Event:new(EVT_BUY_EXP_SUCC, {}))
			self:dispatch(ShowTipEvent({
				duration = 0.2,
				tip = Strings:find("CURRENCYBUY_EXP_SUCC")
			}))

			if callBack then
				callBack(response)
			end
		end
	end)
end

function CurrencySystem:requestBuyEngry(callBack)
	self._currencyService:requestBuyEngry(function (response)
		if response.resCode == GS_SUCCESS then
			self:dispatch(Event:new(EVT_BUY_ENERGRY_SUCC, {}))
			self:dispatch(ShowTipEvent({
				duration = 0.2,
				tip = Strings:find("CURRENCYBUY_ENERGY_EXCHANGE_SUCC")
			}))

			if callBack then
				callBack()
			end
		end
	end)
end

function CurrencySystem.class:checkEnoughGold(mediator, needGold, delegate, style)
	local developSystem = mediator:getInjector():getInstance(DevelopSystem)
	local gold = developSystem:getGolds()

	if gold < needGold then
		if style == nil or style.tipType == nil then
			CurrencySystem:buyCurrencyByType(mediator, CurrencyType.kGold)
		elseif style.tipType == "tip" then
			mediator:dispatch(ShowTipEvent({
				duration = 0.2,
				tip = Strings:get("Tips_3010010")
			}))
		end
	end

	return needGold <= gold
end

function CurrencySystem.class:checkEnoughDiamond(mediator, needDiamond, delegate, style)
	local developSystem = mediator:getInjector():getInstance(DevelopSystem)
	local shopSystem = mediator:getInjector():getInstance(ShopSystem)
	local diamond = developSystem:getDiamonds()

	if diamond < needDiamond then
		if style == nil or style.tipType == nil then
			local delegate = {
				willClose = function (self, popupMediator, data)
					dump(data.response, "data.response")

					if data.response == AlertResponse.kOK then
						shopSystem:tryEnter({
							shopId = "Shop_Mall"
						})
					end
				end
			}

			CurrencySystem:_showAlertView(mediator, Strings:get("DiamondNotEngouh_Text"), Strings:get("DiamondNotEngouh_Content"), delegate)
		elseif style.tipType == "tip" then
			mediator:dispatch(ShowTipEvent({
				duration = 0.2,
				tip = Strings:get("Tips_3010008")
			}))
		end
	end

	return needDiamond <= diamond
end

function CurrencySystem.class:checkEnoughEquipPiece(mediator, needCount, delegate, style)
	local bagSystem = mediator:getInjector():getInstance(DevelopSystem):getBagSystem()
	local count = bagSystem:getItemCount(CurrencyIdKind.kEquipPiece)

	if count < needCount then
		if style == nil or style.tipType == nil then
			mediator:dispatch(ShowTipEvent({
				duration = 0.2,
				tip = Strings:get("EQUIPPIECE_NO_ENOUGH")
			}))
		elseif style.tipType == "tip" then
			mediator:dispatch(ShowTipEvent({
				duration = 0.2,
				tip = Strings:get("EQUIPPIECE_NO_ENOUGH")
			}))
		end
	end

	return needCount <= count
end

function CurrencySystem.class:checkEnoughHonor(mediator, needCount, delegate, style)
	local bagSystem = mediator:getInjector():getInstance(DevelopSystem):getBagSystem()
	local count = bagSystem:getItemCount(CurrencyIdKind.kHonor)

	if count < needCount then
		if style == nil or style.tipType == nil then
			mediator:dispatch(ShowTipEvent({
				duration = 0.2,
				tip = Strings:get("SHOP_HONOR_NO_ENOUGH")
			}))
		elseif style.tipType == "tip" then
			mediator:dispatch(ShowTipEvent({
				duration = 0.2,
				tip = Strings:get("SHOP_HONOR_NO_ENOUGH")
			}))
		end
	end

	return needCount <= count
end

function CurrencySystem.class:checkEnoughTrial(mediator, needCount, delegate, style)
	local bagSystem = mediator:getInjector():getInstance(DevelopSystem):getBagSystem()
	local count = bagSystem:getItemCount(CurrencyIdKind.kTrial)

	if count < needCount then
		if style == nil or style.tipType == nil then
			mediator:dispatch(ShowTipEvent({
				duration = 0.2,
				tip = Strings:get("SHOP_TRIAL_NO_ENOUGH")
			}))
		elseif style.tipType == "tip" then
			mediator:dispatch(ShowTipEvent({
				duration = 0.2,
				tip = Strings:get("SHOP_TRIAL_NO_ENOUGH")
			}))
		end
	end

	return needCount <= count
end

function CurrencySystem.class:checkEnoughPetCoin(mediator, needCount, delegate, style)
	local bagSystem = mediator:getInjector():getInstance(DevelopSystem):getBagSystem()
	local count = bagSystem:getItemCount(CurrencyIdKind.kPetRace)

	if count < needCount and style and style.tipType == "tip" then
		mediator:dispatch(ShowTipEvent({
			duration = 0.2,
			tip = Strings:get("SHOP_PET_NO_ENOUGH")
		}))
	end

	return needCount <= count
end

function CurrencySystem.class:checkEnoughCrystal(mediator, needCount, delegate, style)
	local developSystem = mediator:getInjector():getInstance(DevelopSystem)
	local crystal = developSystem:getCrystal()

	if crystal < needCount then
		if style == nil or style.tipType == nil then
			CurrencySystem:buyCurrencyByType(mediator, CurrencyType.kCrystal)
		elseif style.tipType == "tip" then
			mediator:dispatch(ShowTipEvent({
				duration = 0.2,
				tip = Strings:get("Tips_3010010")
			}))
		end
	end

	return needCount <= crystal
end

function CurrencySystem.class:checkEnoughCurrency(mediator, currencyId, needNum, style)
	local checkFuncMap = {
		[CurrencyIdKind.kGold] = CurrencySystem.checkEnoughGold,
		[CurrencyIdKind.kDiamond] = CurrencySystem.checkEnoughDiamond,
		[CurrencyIdKind.kEquipPiece] = CurrencySystem.checkEnoughEquipPiece,
		[CurrencyIdKind.kHonor] = CurrencySystem.checkEnoughHonor,
		[CurrencyIdKind.kTrial] = CurrencySystem.checkEnoughTrial,
		[CurrencyIdKind.kCrystal] = CurrencySystem.checkEnoughCrystal,
		[CurrencyIdKind.kPetRace] = CurrencySystem.checkEnoughPetCoin
	}

	if checkFuncMap[tostring(currencyId)] then
		return checkFuncMap[tostring(currencyId)](self, mediator, needNum, nil, style)
	end
end

function CurrencySystem.class:getResIdByType(currencyType)
	return CurrencyType2ResIdMap[currencyType]
end

local alertTest = {
	[CurrencyType.kGold] = {
		title = Strings:get("Resource_Lack_Title"),
		des = Strings:get("Resource_Lack_Text_JB")
	},
	[CurrencyType.kCrystal] = {
		title = Strings:get("Resource_Lack_Title"),
		des = Strings:get("Resource_Lack_Text_JS")
	},
	[CurrencyType.kActionPoint] = {
		title = Strings:get("Resource_Lack_Title"),
		des = Strings:get("Resource_Lack_Text_TL")
	}
}

function CurrencySystem.class:buyCurrencyByType(parentMediator, currencyType)
	local injector = parentMediator:getInjector()

	local function callfunBuy()
		if currencyType == CurrencyType.kGold or currencyType == CurrencyType.kCrystal or currencyType == CurrencyType.kExp then
			parentMediator:dispatch(ViewEvent:new(EVT_SHOW_POPUP, injector:getInstance("NewCurrencyBuyPopView"), {
				transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
			}, {
				_currencyType = currencyType
			}, self))
		else
			parentMediator:dispatch(ViewEvent:new(EVT_SHOW_POPUP, injector:getInstance("CurrencyBuyPopView"), {
				transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
			}, {
				_currencyType = currencyType
			}, self))
		end
	end

	if currencyType == CurrencyType.kGold or currencyType == CurrencyType.kCrystal or currencyType == CurrencyType.kActionPoint then
		local delegate = {
			willClose = function (self, popupMediator, data)
				if data.response == AlertResponse.kOK then
					callfunBuy()
				end
			end
		}
		local data = {
			title = alertTest[currencyType].title,
			content = alertTest[currencyType].des,
			sureBtn = {},
			cancelBtn = {}
		}
		local view = injector:getInstance("AlertView")

		parentMediator:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
			transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
		}, data, delegate))
	else
		callfunBuy()
	end
end

function CurrencySystem.class:getCurrencyCount(mediator, currencyId)
	local bagSystem = mediator:getInjector():getInstance(DevelopSystem):getBagSystem()

	return bagSystem:getItemCount(currencyId) or 0
end

function CurrencySystem.class:getCurrencyStr(currencyCount)
	if currencyCount then
		if currencyCount <= 999999 then
			return tostring(currencyCount)
		else
			currencyCount = currencyCount - currencyCount % 1000

			return string.format("%.1f", currencyCount / 10000)
		end
	end
end

function CurrencySystem.class:_showAlertView(mediator, title, content, delegate)
	local alertView = mediator:getInjector():getInstance("AlertView")

	mediator:dispatch(ViewEvent:new(EVT_SHOW_POPUP, alertView, nil, {
		title = title,
		content = content,
		sureBtn = {},
		cancelBtn = {}
	}, delegate))
end

function CurrencySystem.class:formatCurrency(count)
	if count <= 999999 then
		return tostring(count), false
	else
		count = count - count % 1000
		count = string.format("%.1f", count / 10000)

		return count, true
	end
end
