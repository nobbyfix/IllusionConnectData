Strings = {
	_default = "",
	find = function (self, id)
		local content = nil

		if ConfigReader ~= nil then
			local strId = tostring(id)
			local r = ConfigReader:getRecordById("Translate", strId)

			if r ~= nil then
				content = r.Zh_CN

				if content ~= nil then
					-- Nothing
				end
			end
		elseif StringConstants ~= nil then
			content = StringConstants[id]

			if content ~= nil then
				-- Nothing
			end
		end

		if content ~= nil then
			local contentType = type(content)

			if contentType == "string" then
				return content
			elseif contentType == "table" then
				local total = #content

				if total == 1 then
					return content[1]
				else
					return content[math.random(1, total)]
				end
			end
		end

		return nil
	end,
	setDefault = function (self, string)
		self._default = string
	end,
	get = function (self, id, env, filters)
		local text = self:find(id)

		if text == nil then
			return id
		end

		if env ~= nil and type(env) == "table" then
			local tmpl = TextTemplate:new(text)
			text = tmpl:stringify(env, filters)
		end

		return text
	end,
	newTemplate = function (self, id)
		local text = self:find(id)

		if text == nil then
			return nil
		end

		return TextTemplate:new(text)
	end
}
