local snapshotCache = {}

function getCurrentTexSnapshot()
	local snapshot = {
		info = {}
	}
	local info = cc.Director:getInstance():getTextureCache():getCachedTextureInfo()
	local lines = string.split(info, "\n")
	local patternTex = "\"(.*)\" rc=(%d+) id=(%d+) (%d+) x (%d+) @ (%d+) bpp => (%d+) KB"
	local patternTotal = "TextureCache dumpDebugInfo: (%d+) textures, for (%d+) KB %((.*) MB%)"

	table.remove(lines)

	for lineNum, lineContent in ipairs(lines) do
		if lineNum == #lines then
			local count, memkb, memmb = string.match(lineContent, patternTotal)
			snapshot.count = tonumber(count)
			snapshot.mem = tonumber(memmb)
		else
			local filename, rc, id, w, h, bpp, mem = string.match(lineContent, patternTex)
			local filenameArr = string.split(filename, "/")
			local texInfo = {
				filename = string.format("%s/%s", filenameArr[#filenameArr - 1], filenameArr[#filenameArr]),
				rc = tonumber(rc),
				id = id,
				w = tonumber(w),
				h = tonumber(h),
				bpp = bpp,
				mem = tonumber(mem)
			}
			snapshot.info[texInfo.id] = texInfo
		end
	end

	return snapshot
end

function cacheCurrentTexSnapshot(tag)
	local snapshot = getCurrentTexSnapshot()
	snapshotCache[tag] = snapshot

	return snapshot
end

function cacheCurrentTexSnapshotIfAbsent(tag)
	if not snapshotCache[tag] then
		local snapshot = getCurrentTexSnapshot()
		snapshotCache[tag] = snapshot
	end

	return snapshotCache[tag]
end

function getSnapshotInCache(tag)
	return snapshotCache[tag]
end

function getSnapshotDiff(tag)
	local currentSnapshot = getCurrentTexSnapshot()
	local originSnapshot = snapshotCache[tag]
	local snapshotDiff = {
		diff = {},
		countOrigin = originSnapshot.count,
		memOrigin = originSnapshot.mem,
		countNow = currentSnapshot.count,
		memNow = currentSnapshot.mem
	}

	for i, v in pairs(currentSnapshot.info) do
		local texDiff = {
			info = v,
			rcNow = v.rc,
			rcOrigin = originSnapshot.info[i] and originSnapshot.info[i].rc or 0
		}

		if texDiff.rcOrigin < texDiff.rcNow then
			snapshotDiff.diff[i] = texDiff
		end
	end

	return snapshotDiff
end

function getSnapshotFormat(snapshot)
	snapshot = snapshot or getCurrentTexSnapshot()
	local str = "Snapshot:\n"
	local sortArr = {}

	for _, v in pairs(snapshot.info) do
		sortArr[#sortArr + 1] = v
	end

	table.sort(sortArr, function (a, b)
		return b.mem < a.mem and a.mem ~= b.mem
	end)

	for _, v in ipairs(sortArr) do
		str = str .. string.format("\"%s\" rc=%d id=%s %d x %d @ %d bpp => %dMB\n", v.filename, v.rc, v.id, v.w, v.h, v.bpp, v.mem)
	end

	str = str .. string.format("TextureCache dumpDebugInfo: %d textures, for %.2f MB\n", snapshot.count, snapshot.mem)

	return str
end

function getSnapshotDiffFormat(texSnapshotDiff)
	local str = "TexSnapshotDiff:\n"
	local sortArr = {}

	for _, v in pairs(texSnapshotDiff.diff) do
		sortArr[#sortArr + 1] = v
	end

	table.sort(sortArr, function (a, b)
		return b.info.mem < a.info.mem and a.info.mem ~= b.info.mem
	end)

	for _, v in ipairs(sortArr) do
		str = str .. string.format("\"%s\" rcOrigin=%d rcCurrent=%d id=%d %d x %d @ %d bpp => %d KB\n", v.info.filename, v.rcOrigin, v.rcNow, v.info.id, v.info.w, v.info.h, v.info.bpp, v.info.mem)
	end

	str = str .. string.format("Origin: %d textures, for %.2f MB\n Current: %d textures, for %.2f MB\n", texSnapshotDiff.countOrigin, texSnapshotDiff.memOrigin, texSnapshotDiff.countNow, texSnapshotDiff.memNow)

	return str
end

function getSnapshotDiffFormatWithTag(tag)
	local texSnapshotDiff = getSnapshotDiff(tag)

	return getSnapshotDiffFormat(texSnapshotDiff)
end

function clearSnapshotCache()
	snapshotCache = {}
end
