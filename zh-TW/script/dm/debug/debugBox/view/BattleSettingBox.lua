BattleLoadingBox = class("BattleLoadingBox", DebugViewTemplate, _M)

function BattleLoadingBox:initialize()
	self._viewConfig = {
		{
			default = "",
			name = "FileName",
			_selectBoxShow = true,
			type = "SelectBox",
			title = "开启/关闭战斗开始loading",
			_selectBoxAutoHide = true,
			selectHandler = function (selectStr)
				local ret = {}

				table.insert(ret, {
					"1",
					"开启战斗开始loading"
				})
				table.insert(ret, {
					"2",
					"关闭战斗开始loading"
				})

				return ret
			end
		}
	}
end

function BattleLoadingBox:onClick(data)
	local mText = self._viewConfig[1].mtext

	if tostring(mText) == "1" then
		GameConfigs.CloseBattleLoading = true
	else
		GameConfigs.CloseBattleLoading = false
	end

	self:dispatch(ShowTipEvent({
		tip = "设置完成"
	}))
end

HealthMultiBox = class("HealthMultiBox", DebugViewTemplate, _M)

function HealthMultiBox:initialize()
	self._viewConfig = {
		{
			default = "",
			name = "FileName",
			_selectBoxShow = true,
			type = "SelectBox",
			title = "设置血量增加倍数",
			_selectBoxAutoHide = true,
			selectHandler = function (selectStr)
				local ret = {}

				table.insert(ret, {
					"1",
					"5倍血量"
				})
				table.insert(ret, {
					"2",
					"10倍血量"
				})
				table.insert(ret, {
					"3",
					"100倍血量"
				})

				return ret
			end
		}
	}
end

function HealthMultiBox:onClick(data)
	local mText = self._viewConfig[1].mtext

	if tostring(mText) == "1" then
		GameConfigs.healthMulti = 5
	elseif tostring(mText) == "2" then
		GameConfigs.healthMulti = 10
	elseif tostring(mText) == "3" then
		GameConfigs.healthMulti = 100
	else
		GameConfigs.healthMulti = tonumber(mText)
	end

	self:dispatch(ShowTipEvent({
		tip = "设置完成"
	}))
end

DumpUnitPropertiesBox = class("DumpUnitPropertiesBox", DebugViewTemplate, _M)

function DumpUnitPropertiesBox:initialize()
	self._viewConfig = {
		{
			default = "",
			name = "FileName",
			_selectBoxShow = true,
			type = "SelectBox",
			title = "开启/关闭打印实时属性",
			_selectBoxAutoHide = true,
			selectHandler = function (selectStr)
				local ret = {}

				table.insert(ret, {
					"1",
					"开启打印实时属性"
				})
				table.insert(ret, {
					"2",
					"关闭打印实时属性"
				})

				return ret
			end
		}
	}
end

function DumpUnitPropertiesBox:onClick(data)
	local mText = self._viewConfig[1].mtext

	if tostring(mText) == "1" then
		GameConfigs.DumpUnitProperties = true
	else
		GameConfigs.DumpUnitProperties = false
	end

	self:dispatch(ShowTipEvent({
		tip = "设置完成"
	}))
end

NoAiSetBox = class("NoAiSetBox", DebugViewTemplate, _M)

function NoAiSetBox:initialize()
	self._viewConfig = {
		{
			default = "",
			name = "FileName",
			_selectBoxShow = true,
			type = "SelectBox",
			title = "开启/关闭顺序出牌",
			_selectBoxAutoHide = true,
			selectHandler = function (selectStr)
				local ret = {}

				table.insert(ret, {
					"1",
					"开启顺序出牌"
				})
				table.insert(ret, {
					"2",
					"关闭顺序出牌"
				})

				return ret
			end
		}
	}
end

function NoAiSetBox:onClick(data)
	local mText = self._viewConfig[1].mtext

	if tostring(mText) == "1" then
		GameConfigs.NoAiSetBox = true
	else
		GameConfigs.NoAiSetBox = false
	end

	self:dispatch(ShowTipEvent({
		tip = "设置完成"
	}))
end
