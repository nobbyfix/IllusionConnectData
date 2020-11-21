if ccs == nil then
	return
end

local function deprecatedTip(old_name, new_name)
	print("\n********** \n" .. old_name .. " was deprecated please use " .. new_name .. " instead.\n**********")
end

local GUIReaderDeprecated = {
	shareReader = function ()
		deprecatedTip("GUIReader:shareReader", "ccs.GUIReader:getInstance")

		return ccs.GUIReader:getInstance()
	end
}
GUIReader.shareReader = GUIReaderDeprecated.shareReader

function GUIReaderDeprecated.purgeGUIReader()
	deprecatedTip("GUIReader:purgeGUIReader", "ccs.GUIReader:destroyInstance")

	return ccs.GUIReader:destroyInstance()
end

GUIReader.purgeGUIReader = GUIReaderDeprecated.purgeGUIReader
local SceneReaderDeprecated = {
	sharedSceneReader = function ()
		deprecatedTip("SceneReader:sharedSceneReader", "ccs.SceneReader:getInstance")

		return ccs.SceneReader:getInstance()
	end
}
SceneReader.sharedSceneReader = SceneReaderDeprecated.sharedSceneReader

function SceneReaderDeprecated:purgeSceneReader()
	deprecatedTip("SceneReader:purgeSceneReader", "ccs.SceneReader:destroyInstance")

	return self:destroyInstance()
end

SceneReader.purgeSceneReader = SceneReaderDeprecated.purgeSceneReader
local CCSGUIReaderDeprecated = {
	purgeGUIReader = function ()
		deprecatedTip("ccs.GUIReader:purgeGUIReader", "ccs.GUIReader:destroyInstance")

		return ccs.GUIReader:destroyInstance()
	end
}
ccs.GUIReader.purgeGUIReader = CCSGUIReaderDeprecated.purgeGUIReader
local CCSActionManagerExDeprecated = {
	destroyActionManager = function ()
		deprecatedTip("ccs.ActionManagerEx:destroyActionManager", "ccs.ActionManagerEx:destroyInstance")

		return ccs.ActionManagerEx:destroyInstance()
	end
}
ccs.ActionManagerEx.destroyActionManager = CCSActionManagerExDeprecated.destroyActionManager
local CCSSceneReaderDeprecated = {
	destroySceneReader = function (self)
		deprecatedTip("ccs.SceneReader:destroySceneReader", "ccs.SceneReader:destroyInstance")

		return self:destroyInstance()
	end
}
ccs.SceneReader.destroySceneReader = CCSSceneReaderDeprecated.destroySceneReader
local CCArmatureDataManagerDeprecated = {
	sharedArmatureDataManager = function ()
		deprecatedTip("CCArmatureDataManager:sharedArmatureDataManager", "ccs.ArmatureDataManager:getInstance")

		return ccs.ArmatureDataManager:getInstance()
	end
}
CCArmatureDataManager.sharedArmatureDataManager = CCArmatureDataManagerDeprecated.sharedArmatureDataManager

function CCArmatureDataManagerDeprecated.purge()
	deprecatedTip("CCArmatureDataManager:purge", "ccs.ArmatureDataManager:destoryInstance")

	return ccs.ArmatureDataManager:destoryInstance()
end

CCArmatureDataManager.purge = CCArmatureDataManagerDeprecated.purge
