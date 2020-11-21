TextTemplate = {}
local __builtinFilters = {}

function TextTemplate:new(fmt)
	return setmetatable({
		_fmt = fmt
	}, {
		__index = self
	})
end

local TokenTypes = {
	kId = 1,
	kLB = 11,
	kSep = 15,
	kRAB = 14,
	kComma = 16,
	kString = 4,
	kFloat = 3,
	kLAB = 13,
	kBlank = 0,
	kRB = 12,
	kInteger = 2,
	kDot = 10
}
local token_def = {
	{
		pat = "^(%a[%w_]*)",
		type = TokenTypes.kId
	},
	{
		pat = "^([+-]?%d*%.%d+)",
		type = TokenTypes.kFloat
	},
	{
		pat = "^([+-]?%d+)",
		type = TokenTypes.kInteger
	},
	{
		pat = "^\"([^\"]*)\"",
		type = TokenTypes.kString
	},
	{
		pat = "^'([^']*)'",
		type = TokenTypes.kString
	},
	{
		pat = "^(%.)",
		type = TokenTypes.kDot
	},
	{
		pat = "^(%[)",
		type = TokenTypes.kLB
	},
	{
		pat = "^(%])",
		type = TokenTypes.kRB
	},
	{
		pat = "^(<)",
		type = TokenTypes.kLAB
	},
	{
		pat = "^(>)",
		type = TokenTypes.kRAB
	},
	{
		pat = "^(%|)",
		type = TokenTypes.kSep
	},
	{
		pat = "^(,)",
		type = TokenTypes.kComma
	},
	{
		pat = "^([ ]+)",
		type = TokenTypes.kBlank
	}
}
local Tokenizer = {
	new = function (self, s)
		return setmetatable({
			_p = 1,
			_str = s,
			_len = s:len()
		}, {
			__index = self
		})
	end,
	_next = function (self)
		if self._len < self._p then
			return nil
		end

		for i, t in ipairs(token_def) do
			local s, e, text = self._str:find(t.pat, self._p)

			if s ~= nil then
				self._p = e + 1

				return {
					type = t.type,
					value = text
				}
			end
		end

		local c = self._str:sub(self._p, self._p)
		self._p = self._p + 1

		return {
			type = "error",
			value = c
		}
	end,
	next = function (self)
		if self._cached ~= nil then
			local t = self._cached
			self._cached = nil

			return t
		end

		local t = self:_next()

		while t ~= nil and t.type == TokenTypes.kBlank do
			t = self:_next()
		end

		return t
	end,
	putback = function (self, t)
		assert(self._cached == nil)

		self._cached = t
	end
}

function TextTemplate:_getValue(tokenizer, env)
	local t = tokenizer:next()

	if t.type == TokenTypes.kId then
		if type(env) ~= "table" then
			return nil
		end

		local ret = env[t.value]
		t = tokenizer:next()

		while t ~= nil do
			if t.type == TokenTypes.kDot then
				if type(ret) ~= "table" then
					return nil
				end

				t = tokenizer:next()

				if t == nil or t.type ~= TokenTypes.kId then
					return nil
				end

				ret = ret[t.value]
			elseif t.type == TokenTypes.kLB then
				if type(ret) ~= "table" then
					return nil
				end

				local key = self:_getValue(tokenizer, env)

				if key == nil then
					return nil
				end

				ret = ret[key]
				t = tokenizer:next()

				if t == nil or t.type ~= TokenTypes.kRB then
					return nil
				end
			else
				tokenizer:putback(t)

				break
			end

			t = tokenizer:next()
		end

		return ret
	elseif t.type == TokenTypes.kInteger or t.type == TokenTypes.kFloat then
		return tonumber(t.value)
	elseif t.type == TokenTypes.kString then
		return t.value
	end

	return nil
end

function TextTemplate:_getValueList(tokenizer, env)
	local list = {}
	local i = 1

	while true do
		local a = self:_getValue(tokenizer, env)
		i = i + 1
		list[i] = a
		local t = tokenizer:next()

		if t == nil or t.type ~= TokenTypes.kComma then
			tokenizer:putback(t)

			break
		end
	end

	return list
end

function TextTemplate:_applyOneFilter(tokenizer, value, env, filters)
	local t = nil
	t = tokenizer:next()

	if t == nil or t.type ~= TokenTypes.kId then
		return value
	end

	local filterName = t.value
	local filterArgs = nil
	t = tokenizer:next()

	if t ~= nil then
		if t.type == TokenTypes.kLAB then
			filterArgs = self:_getValueList(tokenizer, env)
			t = tokenizer:next()

			if t == nil or t.type ~= TokenTypes.kRAB then
				return nil
			end
		else
			tokenizer:putback(t)
		end
	end

	local filterFunc = nil

	if filters ~= nil then
		filterFunc = filters[filterName]
	end

	if filterFunc == nil then
		local filterMap = self._filters or __builtinFilters
		filterFunc = filterMap[filterName]
	end

	if filterFunc ~= nil then
		if filterArgs == nil then
			value = filterFunc(value)
		else
			value = filterFunc(value, unpack(filterArgs, 1, table.maxn(filterArgs)))
		end
	end

	return value
end

function TextTemplate:_applyFilters(tokenizer, value, env, filters)
	while true do
		local t = tokenizer:next()

		if t == nil or t.type ~= TokenTypes.kSep then
			tokenizer:putback(t)

			return value
		end

		value = self:_applyOneFilter(tokenizer, value, env, filters)
	end
end

function TextTemplate:_parsePlaceholder(env, name, filters)
	local ret = env
	local tokenizer = Tokenizer:new(name)
	local value = self:_getValue(tokenizer, env)

	if value == nil then
		return nil
	end

	value = self:_applyFilters(tokenizer, value, env, filters)

	if value == nil then
		return "<nil>"
	end

	return value
end

function TextTemplate:stringify(env, filters)
	local strbuf = {}
	local fmt = self._fmt
	local pat = "(${([^}]+)})"
	local s, e, matched, name = nil
	local t = 1
	s, e, matched, name = fmt:find(pat, t)

	while s ~= nil do
		local skipped = fmt:sub(t, s - 1)
		local value = self:_parsePlaceholder(env, name, filters)

		table.insert(strbuf, skipped)

		if value == nil then
			table.insert(strbuf, matched)
		else
			table.insert(strbuf, tostring(value))
		end

		t = e + 1
		s, e, matched, name = fmt:find(pat, t)
	end

	table.insert(strbuf, fmt:sub(t))

	return table.concat(strbuf, "")
end

function TextTemplate.mapGlobalFilter(name, filterFunc)
	if name == nil then
		return
	end

	__builtinFilters[name] = filterFunc
end

function TextTemplate:mapFilter(name, filterFunc)
	if name == nil then
		return
	end

	if self._filters == nil then
		self._filters = setmetatable({}, {
			__index = __builtinFilters
		})
	end

	self._filters[name] = filterFunc
end

local mapGlobalFilter = TextTemplate.mapGlobalFilter

mapGlobalFilter("percent", function (value, precision)
	local num = tonumber(value)

	if precision ~= nil then
		local tmp = num >= 0 and num or -num
		local a = 2

		while tmp >= 1 do
			a = a + 1
			tmp = tmp / 10
		end

		return string.format("%." .. a + precision .. "g%%", num * 100)
	else
		return tostring(num * 100) .. "%"
	end
end)
mapGlobalFilter("scale", function (value, rate, base)
	return value * rate / (base or 1)
end)
mapGlobalFilter("format", function (value, format, ...)
	return string.format(format or "", value, ...)
end)
mapGlobalFilter("date", function (value, format)
	return os.date(format, value)
end)
mapGlobalFilter("select", function (index, ...)
	if index == nil then
		return nil
	end

	return select(index, ...)
end)
