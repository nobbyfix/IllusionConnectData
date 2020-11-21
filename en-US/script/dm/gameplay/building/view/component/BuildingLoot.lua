local random = math.random
local sqrt = math.sqrt
local kHPixelsPerMeter = 180
local kGravity = 9.8 * kHPixelsPerMeter
local kCollectDelay = {
	0,
	0.4
}
local kCollectDuration = {
	0.5,
	0.0004
}
local __ItemActionConfigs__ = {
	[KBuildingType.kGoldOre] = {
		minZ = 16,
		mc = "jinbi_lingquziyuan",
		sound = "Se_Effect_Drop_Coin",
		scale = 0.6,
		evz = {
			2 * kHPixelsPerMeter,
			4 * kHPixelsPerMeter
		},
		bounce = {
			0.6,
			0.6
		}
	},
	[KBuildingType.kCrystalOre] = {
		minZ = 16,
		mc = "sj_lingquziyuan",
		sound = "Se_Effect_Drop_Coin",
		scale = 0.6,
		evz = {
			2 * kHPixelsPerMeter,
			4 * kHPixelsPerMeter
		},
		bounce = {
			0.6,
			0.6
		}
	},
	[KBuildingType.kExpOre] = {
		minZ = 16,
		mc = "pz_lingquziyuan",
		sound = "Se_Effect_Drop_Box",
		scale = 0.6,
		evz = {
			2 * kHPixelsPerMeter,
			4 * kHPixelsPerMeter
		},
		bounce = {
			0.6,
			0.6
		}
	}
}

local function createMCReplacement(info)
	if type(info) == "string" then
		return cc.Sprite:create(info)
	else
		local sprite = cc.Sprite:create(info.name)

		if info.flipx then
			sprite:setScaleX(-1)
		end

		return sprite
	end
end

BuildingLoot = class("BuildingLoot")

BuildingLoot:has("_itemType", {
	is = "r"
})

function BuildingLoot:initialize(itemType)
	super.initialize(self)

	local actionConfig = __ItemActionConfigs__[itemType]

	assert(actionConfig ~= nil, string.format("Invalid item type: %s", tostring(itemType)))

	self._actionConfig = actionConfig
	self._itemType = itemType
	self._itemList = {}
end

function BuildingLoot:splashItems(parentNode, dropPoint, amount, landCallback)
	local actionConfig = self._actionConfig
	local itemList = self._itemList
	local total = amount or 1

	for i = 1, total do
		local index = #itemList + 1
		local anim = self:_createItemAnimation(actionConfig)
		local path = self:_calcSplashPath(actionConfig, dropPoint)
		local item = {
			index = index,
			anim = anim,
			path = path
		}
		itemList[index] = item

		anim:addTo(parentNode)
		self:_splashAlongPath(item, landCallback)
	end
end

function BuildingLoot:beCollectedOne(item, flyToPos, finalCallback)
	local anim = item.anim
	local delay1 = kCollectDelay[1]
	local delay2 = kCollectDelay[2]
	local delay = random() * (delay2 - delay1) + delay1

	performWithDelay(anim, function ()
		local speed = 1200
		local animPos = cc.p(anim:getPosition())
		local len = cc.pGetDistance(animPos, flyToPos)
		local time = len / speed
		local action1 = cc.MoveTo:create(time, cc.p(flyToPos.x, flyToPos.y))
		local callbackFunc = cc.CallFunc:create(function ()
			local dispatcher = DmGame:getInstance()

			dispatcher:dispatch(Event:new(BUILDING_EVT_GETRES_SUCCESS, {
				loopType = self._itemType
			}))
			anim:removeFromParent()

			if finalCallback then
				finalCallback()
			end
		end)

		anim:runAction(cc.Sequence:create(action1, callbackFunc))
	end, delay)
end

function BuildingLoot:_createItemAnimation(actionConfig)
	local anim = cc.MovieClip:create(actionConfig.mc)

	if actionConfig.scale then
		anim:setScale(actionConfig.scale)
	end

	local node = cc.Node:create()

	anim:addTo(node)

	return node
end

function BuildingLoot:_calcSplashPath(actionConfig, dropPoint)
	local evzRange = actionConfig.evz
	local evz = random() * (evzRange[2] - evzRange[1]) + evzRange[1]
	local finalX = (random() - 0.5) * 160 + dropPoint.x
	local finalY = 0
	local finalZ = dropPoint.y - 50
	local path = {
		start = {
			y = 0,
			x = dropPoint.x,
			z = dropPoint.y
		},
		final = {
			y = 0,
			x = finalX,
			z = finalZ
		}
	}
	local fvz = sqrt(evz * evz + 2 * kGravity * (dropPoint.y - finalZ))
	local totalTime = 0
	local time = (evz + fvz) / kGravity
	path[1] = {
		time = time,
		vz = evz
	}
	totalTime = totalTime + time

	if actionConfig.bounce ~= nil then
		for i, factor in ipairs(actionConfig.bounce) do
			fvz = factor * fvz
			time = 2 * fvz / kGravity
			path[i + 1] = {
				time = time,
				vz = fvz
			}
			totalTime = totalTime + time
		end
	end

	local vx = (finalX - dropPoint.x) / totalTime
	local vy = 0

	for _, seg in ipairs(path) do
		seg.vy = vy
		seg.vx = vx
	end

	return path
end

function BuildingLoot:_splashAlongPath(item, landCallback)
	local function setPos(node, p)
		node:setPosition(cc.p(p.x, p.z))
	end

	local anim = item.anim
	local path = item.path
	local iseg = 1
	local seg = path[iseg]
	local start = path.start
	local final = path.final
	local p = {
		x = start.x,
		y = start.y,
		z = start.z
	}

	setPos(anim, p)

	local vx = seg.vx
	local vy = seg.vy
	local vz = seg.vz
	local x0 = p.x
	local y0 = p.y
	local z0 = p.z
	slot17 = vz
	local time = 0
	local totalTime = seg.time
	local startTime = app.getTime()
	local action = schedule(anim, function ()
		local interval = app.getTime() - startTime
		startTime = app.getTime()
		time = time + interval

		if totalTime <= time then
			time = totalTime
		end

		p.x = x0 + vx * time
		p.y = y0 + vy * time
		p.z = z0 + (vz - 0.5 * kGravity * time) * time

		setPos(anim, p)

		if totalTime <= time then
			iseg = iseg + 1
			seg = path[iseg]

			if seg ~= nil then
				vz = seg.vz
				vy = seg.vy
				vx = seg.vx
				z0 = p.z
				y0 = p.y
				x0 = p.x
				totalTime = seg.time
				time = 0
			else
				setPos(anim, final)
				anim:stopActionByTag(1001)

				if landCallback then
					landCallback(item)
				end
			end
		end
	end, 0)

	action:setTag(1001)
end
