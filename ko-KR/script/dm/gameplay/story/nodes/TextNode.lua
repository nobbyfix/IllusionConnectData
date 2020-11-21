module("story", package.seeall)

TextNode = class("TextNode", StageNode)

register_stage_node("Text", TextNode)

local actions = {
	typeOut = TypeOutAction,
	setText = SetTextAction
}

TextNode:extendActionsForClass(actions)

function TextNode:createRenderNode(config)
	local content = config.content or ""
	local textNode = ccui.RichText:createWithXML(content, {
		fontName_FONT_1 = CUSTOM_TTF_FONT_1,
		fontName_FONT_2 = CUSTOM_TTF_FONT_2,
		fontName_FZYH_R = TTF_FONT_FZYH_R,
		fontName_FZYH_M = TTF_FONT_FZYH_M
	})

	textNode:setWrapMode(1)

	local size = textNode:getContentSize()

	textNode:renderContent(size.width, 0, true)

	return textNode
end

function TextNode:typeOut(interval, content, callback)
	local charInterval = interval or 0.2
	local renderNode = self:getRenderNode()

	if content then
		local size = renderNode:getContentSize()

		renderNode:setString(content)
		renderNode:renderContent(size.width, 0, true)
		renderNode:clipContent(0, 0)
	end

	local length = renderNode:getContentLength()
	local typerAction = TypeWriterAction:create(interval, length)
	local seq = cc.Sequence:create(typerAction, cc.CallFunc:create(callback))

	renderNode:runAction(seq)
end
