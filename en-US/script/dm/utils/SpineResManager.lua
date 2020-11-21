module("SpineResManager", package.seeall)

local spineResReferenceCountCache = {}
local spineResPools = {}

table.insert(spineResPools, {
	poolMaxNum = 20,
	newIndex = 0,
	pool = {}
})

local oldCreator = sp.SkeletonAnimation.create

function sp.SkeletonAnimation:create(pathStr)
	retainSpineResByPath(pathStr)
	pushToCurPoolByPath(pathStr)

	return oldCreator(self, pathStr)
end

function releaseSpineResByPath(pathStr)
	if not spineResReferenceCountCache[pathStr] then
		return
	end

	spineResReferenceCountCache[pathStr] = spineResReferenceCountCache[pathStr] - 1

	print("尝试释放spine", pathStr, spineResReferenceCountCache[pathStr])

	if spineResReferenceCountCache[pathStr] == 0 then
		sp.SkeletonAnimationCache:getInstance():removeSkeletonDataExtend(pathStr)

		spineResReferenceCountCache[pathStr] = nil
	end
end

function retainSpineResByPath(pathStr)
	if not spineResReferenceCountCache[pathStr] then
		spineResReferenceCountCache[pathStr] = 0
	end

	spineResReferenceCountCache[pathStr] = spineResReferenceCountCache[pathStr] + 1
end

function pushToCurPoolByPath(pathStr)
	local poolInfo = spineResPools[#spineResPools]

	if not poolInfo then
		table.insert(spineResPools, {
			poolMaxNum = 20,
			newIndex = 0,
			pool = {}
		})

		poolInfo = spineResPools[1]
	end

	poolInfo.newIndex = poolInfo.newIndex + 1
	local info = poolInfo.pool[pathStr] or {
		newIndex = 0,
		referenceCount = 0
	}
	info.newIndex = poolInfo.newIndex
	info.referenceCount = info.referenceCount + 1
	poolInfo.pool[pathStr] = info

	if poolInfo.poolMaxNum < table.nums(poolInfo.pool) then
		local temp = 9999
		local targetKey = nil

		for i, v in pairs(poolInfo.pool) do
			if v.newIndex <= temp then
				temp = v.newIndex
				targetKey = i
			end
		end

		local resInfo = poolInfo.pool[targetKey]
		poolInfo.pool[targetKey] = nil

		for i = 1, resInfo.referenceCount do
			releaseSpineResByPath(targetKey)
		end
	end
end

function pushReleasePool(poolMaxNum)
	local pool = {
		newIndex = 0,
		poolMaxNum = poolMaxNum or 10,
		pool = {}
	}

	table.insert(spineResPools, pool)

	return pool
end

function popReleasePool(popPool)
	local index = #spineResPools

	for i = 1, #spineResPools do
		if spineResPools[i] == popPool then
			index = i

			break
		end
	end

	local poolInfo = table.remove(spineResPools, index)

	for i, v in pairs(poolInfo.pool) do
		for num = 1, v.referenceCount do
			releaseSpineResByPath(i)
		end
	end

	if #spineResPools == 0 then
		table.insert(spineResPools, {
			poolMaxNum = 20,
			newIndex = 0,
			pool = {}
		})
	end
end

function cleanAllPool()
	local num = #spineResPools

	for i = 1, num do
		popReleasePool()
	end
end
