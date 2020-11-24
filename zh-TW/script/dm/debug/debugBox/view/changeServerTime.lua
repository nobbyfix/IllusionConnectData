changeServerTime = class("changeServerTime", DebugViewTemplate, _M)

function changeServerTime:initialize()
	self._opType = 99
	self._viewConfig = {
		{
			default = 0,
			name = "timestamp",
			title = "时间(秒)",
			type = "Input"
		},
		{
			default = 0,
			name = "timestamp_D",
			title = "n天以后",
			type = "Input"
		},
		{
			default = 0,
			name = "timestamp_H",
			title = "n小时以后",
			type = "Input"
		}
	}
end

function changeServerTime:onClick(data)
	local parms = {
		type = 99
	}

	if data.timestamp == 0 then
		if data.timestamp_H == 0 and data.timestamp_D == 0 then
			return
		else
			local serverTimeMap = DmGame:getInstance()._injector:getInstance("GameServerAgent"):remoteTimestamp()
			parms.timestamp = serverTimeMap + 86400 * data.timestamp_H + 3600 * data.timestamp_H
		end
	else
		parms.timestamp = data.timestamp
	end

	local dataModificationDS = self:getInjector():getInstance(DataModificationDS)

	dataModificationDS:requestTest(data, function (response)
		local isSucc = response.resCode == GS_SUCCESS

		self:dispatch(ShowTipEvent({
			tip = Strings:get(isSucc and "EXEC_SUCC" or "EXEC_FAIL")
		}))
	end)
end
