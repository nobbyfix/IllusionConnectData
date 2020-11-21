function DumpMemory(tag, callback)
	display.removeUnusedSpriteFrames()
	collectgarbage("collect")
	delayCallByTime(1500, function ()
		local str = getSnapshotDiffFormatWithTag(tag) .. StringFormat("Memory: {} KB", collectgarbage("count"))

		callback(str)
	end)
end
