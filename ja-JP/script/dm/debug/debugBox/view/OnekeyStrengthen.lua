OnekeyStrengthen = class("OnekeyStrengthen", DebugViewTemplate, _M)

function OnekeyStrengthen:initialize()
	self._opType = 112
	self._viewConfig = {
		{
			default = 0,
			name = "code",
			title = "1中强，其他值小强",
			type = "Input"
		}
	}
end

function OnekeyStrengthen:onClick(data)
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

function OnekeyStrengthen:storyFinish()
	local stageSystem = self:getInjector():getInstance(StageSystem)

	stageSystem:debugStoryAutoFinish()
end
