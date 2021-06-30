DebugAddLeadStageLevel = class("DebugAddLeadStageLevel", DebugViewTemplate, _M)

function DebugAddLeadStageLevel:initialize()
	self._opType = 303
	self._viewConfig = {
		{
			default = "Master_XueZhan",
			name = "masterId",
			_selectBoxShow = true,
			type = "SelectBox",
			title = "角色id ",
			selectHandler = function (selectStr)
				local ret = {}
				local maxRows = 50

				if string.len(selectStr) > 0 and not GameConfigs.useLuaCfg then
					local dataTable = DataReader:getDBTable("MasterBase")
					local datas = dataTable.table:getRowsByConditionStr("inner join Translate on MasterBase.Name_key = Translate.Id where MasterBase.Id like \"%" .. selectStr .. "%\" or Translate.Zh_CN_key like \"%" .. selectStr .. "%\";")
					local translateDataTable = DataReader:getDBTable("Translate")
					local keys = {}

					for k, v in pairs(dataTable.columnNames) do
						table.insert(keys, v)
					end

					for k, v in pairs(translateDataTable.columnNames) do
						table.insert(keys, v)
					end

					local idIdx, nameIdx = nil

					for k, v in pairs(keys) do
						if v == "Id" and idIdx == nil then
							idIdx = k
						elseif v == "Zh_CN" and nameIdx == nil then
							nameIdx = k
						end
					end

					local idx = 1

					for k, v in pairs(datas) do
						table.insert(ret, {
							v[idIdx],
							v[nameIdx]
						})

						if maxRows <= idx then
							break
						end

						idx = idx + 1
					end
				end

				return ret
			end
		},
		{
			default = 1,
			name = "level",
			title = "增加等级",
			type = "Input"
		}
	}
end
