CheckConfigBox = class("CheckConfigBox", DebugViewTemplate, _M)

function CheckConfigBox:initialize()
	self._viewConfig = {
		{
			default = "",
			name = "Table",
			title = "表名",
			type = "Input"
		},
		{
			default = "",
			name = "Id",
			title = "id",
			type = "Input"
		},
		{
			default = "",
			name = "Key",
			title = "列名",
			type = "Input"
		}
	}
end

function CheckConfigBox:onClick(data)
	local tableName = data.Table
	local id = data.Id
	local key = data.Key
	local config = ConfigReader:getDataTable(tableName)

	if not config then
		self:dispatch(ShowTipEvent({
			tip = tableName .. "表不存在"
		}))

		return
	end

	local item = config[id]

	if not item then
		self:dispatch(ShowTipEvent({
			tip = tableName .. "表里没有" .. id .. "项"
		}))

		return
	end

	local value = item[key]

	if not value then
		self:dispatch(ShowTipEvent({
			tip = tableName .. "表" .. id .. "项" .. key .. "列不存在或者为nil"
		}))

		return
	end

	local valueType = type(value)

	if valueType == "number" then
		self:dispatch(ShowTipEvent({
			tip = tableName .. "表" .. id .. "项" .. key .. "列为数字,值为" .. value
		}))

		return
	elseif valueType == "string" then
		self:dispatch(ShowTipEvent({
			tip = tableName .. "表" .. id .. "项" .. key .. "列为字符串,值为" .. value
		}))

		return
	elseif valueType == "boolean" then
		self:dispatch(ShowTipEvent({
			tip = tableName .. "表" .. id .. "项" .. key .. "列为布尔值,值为" .. value
		}))

		return
	else
		local cjson = require("cjson.safe")
		local content = cjson.encode(value)

		self:dispatch(ShowTipEvent({
			tip = tableName .. "表" .. id .. "项" .. key .. "列为table,值为" .. content
		}))

		return
	end
end
