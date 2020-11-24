local ccui = _G.ccui or {}
ccui.ClippingType = {
	SCISSOR = 1,
	STENCIL = 0
}

local function setTextAdditionalKerning(textWidget, value)
	if textWidget.getVirtualRenderer ~= nil then
		local label = textWidget:getVirtualRenderer()

		if label and label.setAdditionalKerning ~= nil then
			label:setAdditionalKerning(value)
		end
	end
end

local function setTextLineSpace(textWidget, value)
	if textWidget.getVirtualRenderer ~= nil then
		local label = textWidget:getVirtualRenderer()

		if label and label.setLineSpacing ~= nil then
			label:setLineSpacing(value)
		end
	end
end

local function enableUserCursor(textWidget, cursorFilePath)
	if not cursorFilePath then
		return
	end

	if textWidget then
		local cursor = cc.Sprite:create(cursorFilePath)

		if cursor then
			local render = tolua.cast(textWidget:getVirtualRenderer(), "cc.Label")

			if render then
				local contentSize = cursor:getContentSize()

				if contentSize.height ~= 0 then
					local scaleFactor = render:getLineHeight() / contentSize.height

					cursor:setScaleY(scaleFactor)
				end
			end

			textWidget:removeUserCursor()
			cursor:setAnchorPoint(cc.p(0, 0))
			textWidget:setUserCursor(cursor)
			cursor:runAction(cc.RepeatForever:create(FadeInOutAction:create(0.5)))
		end
	end
end

local function disableUserCursor(textWidget)
	textWidget:removeUserCursor()
end

function replaceTextFieldToEditBox(textWidget)
	if not textWidget then
		return nil
	end

	local widgetType = textWidget:getDescription()

	if widgetType ~= "TextField" then
		return textWidget
	end

	local textFieldSize = textWidget:getContentSize()
	local editBox = ccui.EditBox:create(textFieldSize, " ")
	local parent = textWidget:getParent()

	if not parent then
		dump("error: EditBox parent is nil")

		return textWidget
	end

	parent:addChild(editBox)
	editBox:setText(textWidget:getString())

	local anchorPt = textWidget:getAnchorPoint()

	editBox:setAnchorPoint(anchorPt)

	local x, y = textWidget:getPosition()

	editBox:setPosition(cc.p(x, y))
	editBox:setLocalZOrder(textWidget:getLocalZOrder())
	editBox:setVisible(textWidget:isVisible())
	editBox:setFontSize(textWidget:getFontSize())
	editBox:setFontName(textWidget:getFontName())
	editBox:setFontColor(textWidget:getColor())
	editBox:setPlaceHolder(textWidget:getPlaceHolder())
	editBox:setPlaceholderFont(textWidget:getFontName(), textWidget:getFontSize())
	editBox:setPlaceholderFontColor(textWidget:getPlaceHolderColor())
	editBox:setScaleX(textWidget:getScaleX())
	editBox:setScaleY(textWidget:getScaleY())
	editBox:setTag(textWidget:getTag())
	editBox:setName(textWidget:getName())

	if textWidget:isMaxLengthEnabled() then
		editBox._maxLengthEnabled = textWidget:isMaxLengthEnabled()
		editBox._maxLength = textWidget:getMaxLength()
	end

	local function adjustEditBox(editBox)
		local size = editBox:getContentSize()
		local editContent = editBox:getContentLabel()

		editContent:setAnchorPoint(cc.p(0.5, 0.5))

		local placeHolderContent = editBox:getPlaceholderLabel()

		placeHolderContent:setAnchorPoint(cc.p(0.5, 0.5))

		if textWidget:isIgnoreContentAdaptWithSize() == false then
			editContent:setDimensions(size.width, size.height)
			placeHolderContent:setDimensions(size.width, size.height)
			editContent:setPosition(cc.p(size.width / 2, size.height / 2))
			placeHolderContent:setPosition(cc.p(size.width / 2, size.height / 2))
		end
	end

	function editBox:getMaxLength()
		return self._maxLength
	end

	function editBox:onEvent(callback)
		self._callback = callback
	end

	function editBox:getkeyboardState()
		return self._keyboardState
	end

	adjustEditBox(editBox)
	editBox:unregisterScriptEditBoxHandler()
	editBox:registerScriptEditBoxHandler(function (eventName, sender)
		if eventName == "began" then
			local contentLabel = editBox:getContentLabel()

			if contentLabel:getString() ~= editBox:getText() then
				editBox:setText(contentLabel:getString())
			end

			if contentLabel then
				contentLabel:setVisible(false)
			end

			local placeHolderContent = editBox:getPlaceholderLabel()

			if placeHolderContent then
				placeHolderContent:setVisible(false)
			end

			editBox._keyboardState = true
		elseif eventName == "ended" then
			local content = editBox:getText()
			local toContent = string.gsub(content, "\n", " ")
			toContent = string.gsub(toContent, "\r\n", " ")

			if toContent ~= content then
				editBox:setText(toContent)
			end

			local result, finalString = StringChecker.hasForbiddenWords(editBox:getText())

			if result then
				editBox:setText(finalString)

				if editBox._callback then
					editBox._callback("ForbiddenWord", sender)
				end
			end

			if editBox._maxLengthEnabled and editBox._maxLength < utf8.len(editBox:getText()) then
				editBox:setText(utf8.sub(editBox:getText(), 1, editBox._maxLength))

				if editBox._callback then
					editBox._callback("Exceed", sender)
				end
			end

			local contentLabel = editBox:getContentLabel()

			if contentLabel then
				contentLabel:setVisible(true)
			end

			local placeHolderContent = editBox:getPlaceholderLabel()

			if placeHolderContent and placeHolderContent:getString() == "" then
				placeHolderContent:setVisible(true)
			end

			editBox._keyboardState = false
		elseif eventName == "return" then
			-- Nothing
		elseif eventName == "changed" and editBox and editBox._maxLengthEnabled and editBox._keyboardState then
			if editBox._maxLength < utf8.len(editBox:getText()) then
				local text = utf8.sub(editBox:getText(), 1, editBox._maxLength)

				if text ~= editBox:getText() then
					editBox:setText(utf8.sub(editBox:getText(), 1, editBox._maxLength))

					if editBox._callback then
						editBox._callback("Exceed", sender)
					end
				end
			end

			local contentLabel = editBox:getContentLabel()

			if contentLabel then
				contentLabel:setVisible(not editBox._keyboardState)
			end
		end

		if editBox._callback then
			editBox._callback(eventName, sender)
		end
	end)

	editBox._keyboardState = false

	parent:removeChild(textWidget)

	return editBox
end

ccui.Text.setAdditionalKerning = setTextAdditionalKerning
ccui.Text.setLineSpacing = setTextLineSpace
ccui.TextField.setAdditionalKerning = setTextAdditionalKerning
ccui.TextField.setLineSpacing = setTextLineSpace
ccui.TextField.enableUserCursor = enableUserCursor
ccui.TextField.disableUserCursor = disableUserCursor

function ccui.RichText:renderContent(width, height, forceRebuild)
	if width ~= nil or height ~= nil then
		if width == nil then
			width = self:getContentSize().width
		end

		if height == nil then
			height = self:getContentSize().height
		end

		if width <= 0 and height <= 0 then
			self:ignoreContentAdaptWithSize(true)
		else
			self:ignoreContentAdaptWithSize(false)
			self:setContentSize(cc.size(width, height))
		end
	end

	self:rebuildElements(forceRebuild)
	self:formatText()
end

function setTextShadowOpacity(text, opacity)
	opacity = opacity or 1

	if text:isShadowEnabled() then
		local shadowColor = text:getShadowColor()
		shadowColor.a = shadowColor.a * opacity

		text:enableShadow(shadowColor, text:getShadowOffset(), text:getShadowBlurRadius())
	end
end

function setTextOutlineOpacity(text, opacity)
	opacity = opacity or 1
	local outlineSize = text:getOutlineSize()

	if outlineSize > 0 then
		local effectColor = text:getEffectColor()
		effectColor.a = effectColor.a * opacity

		text:enableOutline(effectColor, text:getOutlineSize())
	end
end

ccui.Text.setShadowOpacity = setTextShadowOpacity
cc.Label.setShadowOpacity = setTextShadowOpacity
ccui.Text.setOutlineOpacity = setTextOutlineOpacity
cc.Label.setOutlineOpacity = setTextOutlineOpacity
