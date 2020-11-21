BattleBubbleWidget = class("BattleBubbleWidget", BaseWidget)

function BattleBubbleWidget:initialize(view, args, callback)
	super.initialize(self, view)

	self._callback = callback
	self._data = args

	view:setScale(0.1)
end

function BattleBubbleWidget:dispose()
	self._callback = nil

	if self._textTask then
		self._textTask:stop()

		self._textTask = nil
	end

	super.dispose(self)
end

function BattleBubbleWidget:removeView()
	if self._view then
		self._view:removeFromParent(true)

		self._view = nil
	end
end

function BattleBubbleWidget:setViewContext(context)
	self._viewContext = context

	self:setupView()
end

function BattleBubbleWidget:setupView()
	local view = self:getView()
	local bg = view:getChildByName("bg")
	local text = bg:getChildByName("text")
	local data = self._data
	local style = data.style

	if style and style == "boom" then
		bg:loadTexture("zhandou_bg_qipao_2.png", 1)
		bg:setCapInsets(cc.rect(23, 12, 27, 15))

		self._textAreaSize = cc.size(153, 0)
	else
		self._textAreaSize = cc.size(153, 0)
	end

	self:setTextContent(1)
	view:runAction(cc.ScaleTo:create(0.2, 1))
end

function BattleBubbleWidget:setTextContent(index)
	local data = self._data
	local stmts = data.stmts
	local stmt = stmts[index]
	local content = stmt[1]
	local duration = stmt[2] / 1000
	local scheduler = self._viewContext:getScalableScheduler()

	if self._textTask then
		self._textTask:stop()

		self._textTask = nil
	end

	self._textTask = scheduler:schedule(function (task, dt)
		duration = duration - dt

		if duration <= 0 then
			task:stop()

			self._textTask = nil
			index = index + 1

			if index <= #stmts then
				self:setTextContent(index)
			elseif self._callback then
				self:_callback()
			end
		end
	end)
	local view = self:getView()
	local bg = view:getChildByName("bg")
	local text = bg:getChildByName("text")

	text:setString(Strings:get(content))

	local tsize = text:getContentSize()

	if self._textAreaSize.width < tsize.width then
		text:setTextAreaSize(self._textAreaSize)

		tsize = text:getContentSize()
	end

	if data.style and data.style == "boom" then
		text:offset(7, 0)
		bg:setContentSize(cc.size(tsize.width + 32, tsize.height + 50))
		bg:offset(76 - tsize.width / 2 + 25, -16)
	else
		bg:setContentSize(cc.size(tsize.width + 32, tsize.height + 35))
		bg:offset(76 - tsize.width / 2 + 25, -16)
	end
end

BattleEmoteWidget = class("BattleEmoteWidget", BaseWidget)

function BattleEmoteWidget:initialize(view, args, callback)
	super.initialize(self, view)

	self._callback = callback
	self._data = args
end

function BattleEmoteWidget:dispose()
	self._callback = nil

	if self._emoteTask then
		self._emoteTask:stop()

		self._emoteTask = nil
	end

	super.dispose(self)
end

function BattleEmoteWidget:removeView()
	if self._view then
		self._view:removeFromParent(true)

		self._view = nil
	end
end

function BattleEmoteWidget:setViewContext(context)
	self._viewContext = context

	self:setupView()
end

function BattleEmoteWidget:setupView()
	local data = self._data
	local resId = data.id
	local duration = data.dur and data.dur / 1000 or nil
	local emote = cc.MovieClip:create(resId)

	emote:addTo(self:getView())

	if duration then
		local scheduler = self._viewContext:getScalableScheduler()
		self._emoteTask = scheduler:schedule(function (task, dt)
			duration = duration - dt

			if duration <= 0 then
				emote:stop()
				emote:removeFromParent(true)

				if self._callback then
					self:_callback()
				end

				task:stop()

				self._emoteTask = nil
			end
		end)

		emote:addEndCallback(function (cid, mc)
			mc:stop()
		end)
	else
		emote:addEndCallback(function (cid, mc)
			mc:stop()
			mc:removeFromParent(true)

			if self._callback then
				self:_callback()
			end
		end)
	end
end
