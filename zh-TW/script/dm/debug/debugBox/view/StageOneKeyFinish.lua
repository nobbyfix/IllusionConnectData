StageOneKeyFinish = class("StageOneKeyFinish", DebugViewTemplate, _M)

function StageOneKeyFinish:initialize()
	self._opType = 124
	self._viewConfig = {
		{
			default = "M09S01",
			name = "pointId",
			title = "关卡Id",
			type = "Input"
		}
	}
end

function StageOneKeyFinish:onClick(data)
	local pointId = data.pointId

	if not pointId or pointId == "" then
		return
	end

	local dataModificationDS = self:getInjector():getInstance(DataModificationDS)

	dataModificationDS:requestTest(data, function (response)
		local isSucc = response.resCode == GS_SUCCESS

		if isSucc then
			self:storyFinish()
			self:dispatch(ShowTipEvent({
				tip = Strings:get(isSucc and "EXEC_SUCC" or "EXEC_FAIL")
			}))
		end
	end)
end

function StageOneKeyFinish:storyFinish()
	local stageSystem = self:getInjector():getInstance(StageSystem)

	stageSystem:debugStoryAutoFinish()
end

PointOneKeyFinish = class("PointOneKeyFinish", DebugViewTemplate, _M)

function PointOneKeyFinish:initialize()
	self._opType = 293
	self._viewConfig = {
		{
			default = "M03S01",
			name = "pointId",
			title = "关卡Id",
			type = "Input"
		}
	}
end

function PointOneKeyFinish:onClick(data)
	local pointId = data.pointId

	if not pointId or pointId == "" then
		return
	end

	local dataModificationDS = self:getInjector():getInstance(DataModificationDS)

	dataModificationDS:requestTest(data, function (response)
		local isSucc = response.resCode == GS_SUCCESS

		if isSucc then
			self:dispatch(ShowTipEvent({
				tip = Strings:get(isSucc and "EXEC_SUCC" or "EXEC_FAIL")
			}))
		end
	end)
end
