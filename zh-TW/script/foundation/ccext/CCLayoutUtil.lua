module("ccext", package.seeall)

function stretchToRectRegion(node, targetRect)
	local nodeSize = node:getContentSize()
	local sx = targetRect.width / nodeSize.width
	local sy = targetRect.height / nodeSize.height
	local anchorPt = node:getAnchorPoint()
	local offsetX = anchorPt.x * targetRect.width
	local offsetY = anchorPt.y * targetRect.height

	if node:isIgnoreAnchorPointForPosition() then
		local size = nodeSize
		offsetX = offsetX - size.width * anchorPt.x
		offsetY = offsetY - size.height * anchorPt.y
	end

	node:setScaleX(sx)
	node:setScaleY(sy)
	node:setPosition((targetRect.x or 0) + offsetX, (targetRect.y or 0) + offsetY)

	return node
end

function coverRectRegion(node, targetRect, anchorPt)
	local size = node:getContentSize()
	local sx = 1
	local sy = 1

	if size.width ~= 0 then
		sx = targetRect.width / size.width
	end

	if size.height ~= 0 then
		sy = targetRect.height / size.height
	end

	local targetScale = sx > sy and sx or sy

	if anchorPt == nil then
		anchorPt = cc.p(0.5, 0.5)
	end

	local width = targetScale * size.width
	local height = targetScale * size.height
	local x = (targetRect.x or 0) - (width - targetRect.width) * anchorPt.x
	local y = (targetRect.y or 0) - (height - targetRect.height) * anchorPt.y
	local finalRect = cc.rect(x, y, width, height)

	return stretchToRectRegion(node, finalRect)
end

function fitRectRegion(node, targetRect, anchorPt)
	local size = node:getContentSize()
	local sx = targetRect.width / size.width
	local sy = targetRect.height / size.height
	local targetScale = sx < sy and sx or sy

	if anchorPt == nil then
		anchorPt = cc.p(0.5, 0.5)
	end

	local width = targetScale * size.width
	local height = targetScale * size.height
	local x = (targetRect.x or 0) - (width - targetRect.width) * anchorPt.x
	local y = (targetRect.y or 0) - (height - targetRect.height) * anchorPt.y
	local finalRect = cc.rect(x, y, width, height)

	return stretchToRectRegion(node, finalRect)
end

function positWithRelPosition(node, targetRect, relPos)
	local nodeSize = node:getContentSize()
	local sx = node:getScaleX()
	local sy = node:getScaleY()
	local nodeWidth = nodeSize.width * sx
	local nodeHeight = nodeSize.height * sy
	local relx = relPos.x or relPos[1]
	local rely = relPos.y or relPos[2]
	local x = (targetRect.x or 0) + (targetRect.width - nodeWidth) * (relx or 0)
	local y = (targetRect.y or 0) + (targetRect.height - nodeHeight) * (rely or 0)
	local anchorPt = node:getAnchorPoint()

	if node:isIgnoreAnchorPointForPosition() then
		x = x + anchorPt.x * nodeSize.width * (sx - 1)
		y = y + anchorPt.y * nodeSize.height * (sy - 1)
	else
		x = x + anchorPt.x * nodeWidth
		y = y + anchorPt.y * nodeHeight
	end

	node:setPosition(x, y)

	return node
end

function positAtCenter(node, targetRect)
	return positWithRelPosition(node, targetRect, {
		0.5,
		0.5
	})
end

local Node = cc.Node
Node.stretch = stretchToRectRegion
Node.coverRegion = coverRectRegion
Node.fitRegion = fitRectRegion
Node.center = positAtCenter

function Node:posit(x, y)
	local x0, y0 = self:getPosition()

	self:setPosition(x or x0, y or y0)

	return self
end

function Node:relPosit(rect, x, y)
	return positWithRelPosition(self, rect, {
		x,
		y
	})
end

function Node:offset(x, y)
	local x0, y0 = self:getPosition()

	self:setPosition(x0 + (x or 0), y0 + (y or 0))

	return self
end

positeWithRelPosition = positWithRelPosition
Node.posite = Node.posit
