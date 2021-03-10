DiffCommand = class("DiffCommand", legs.Command, _M)

function DiffCommand:execute(event)
	local data = event:getData()
	local developSystem = self:getInjector():getInstance(DevelopSystem)
	local shopSystem = self:getInjector():getInstance(ShopSystem)
	local systemKeeper = self:getInjector():getInstance(SystemKeeper)
	local stageSystem = self:getInjector():getInstance(StageSystem)
	local mazeSystem = self:getInjector():getInstance(MazeSystem)
	local buildingSystem = self:getInjector():getInstance(BuildingSystem)

	if data.del then
		developSystem:syncDeleteData(data.del)
		shopSystem:syncDeleteData(data.del)
		buildingSystem:syncDeleteBuff(data.del)
	end

	if data.diff and data.diff.player then
		developSystem:syncPlayer(data.diff.player, true)
		shopSystem:syncDiffShop(data.diff)

		if data.diff.player.galleryMemories then
			for type, value in pairs(data.diff.player.galleryMemories) do
				if type == GalleryMemoryType.ACTIVI then
					local customDataSystem = self:getInjector():getInstance(CustomDataSystem)

					customDataSystem:setValue(PrefixType.kGlobal, "GalleryCGRed", "1")
				end
			end
		end
	end

	systemKeeper:backupUnlockSystem()
	self:dispatch(Event:new(EVT_REDPOINT_REFRESH))
end
