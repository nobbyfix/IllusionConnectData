local _G = _G
local require = _G.require
local string = _G.string
local math = _G.math
local tonumber = _G.tonumber
local tostring = _G.tostring

module(...)

local utf8data = require(_PACKAGE .. "utf8data")
local utf8_upper = utf8data.utf8_upper
local utf8_lower = utf8data.utf8_lower

function char(s)
	local i = 1
	s = s or ""

	return function ()
		local a, l, d = nil

		while true do
			a = string.byte(s, i)

			if a == nil then
				return nil
			end

			i = i + 1

			if a < 128 then
				return a
			elseif a > 191 then
				l = 1
				a = a - 192

				if a > 31 then
					l = l + 1
					a = a - 32

					if a > 15 then
						l = l + 1
						a = a - 16
					end
				end

				d = a
			else
				l = l - 1
				d = d * 64 + a - 128

				if l == 0 then
					return d
				end
			end
		end
	end
end

function len(s)
	local n, a, i = nil
	n = 0
	i = 1

	while true do
		a = string.byte(s, i)
		i = i + 1

		if a == nil then
			return n
		end

		if a > 191 or a < 128 then
			n = n + 1
		end
	end
end

function sub(s, i, j)
	local l = nil
	l = len(s)

	if i < 0 then
		i = i + l + 1
	end

	if j < 0 then
		j = j + l + 1
	end

	if i < 1 or l < i or j < 1 or l < j or j < i then
		return ""
	end

	local a, k, m, add, sub = nil
	k = 1
	m = 0
	sub = ""
	add = false

	while true do
		a = string.byte(s, k)

		if a == nil then
			return sub
		end

		k = k + 1

		if a > 191 or a < 128 then
			m = m + 1

			if m == i then
				add = true
			end

			if m == j + 1 then
				add = false
			end
		end

		if add then
			sub = sub .. string.char(a)
		end
	end

	return sub
end

function split(s, i)
	local l = nil
	l = len(s)

	if i < 0 then
		i = i + l + 1
	end

	if i < 1 then
		return s, ""
	end

	if l < i then
		return "", s
	end

	local a, k, m, add, st, en = nil
	k = 1
	m = 0
	st = ""
	en = ""
	add = false

	while true do
		a = string.byte(s, k)

		if a == nil then
			return st, en
		end

		k = k + 1

		if a > 191 or a < 128 then
			m = m + 1

			if m == i then
				add = true
			end
		end

		if add then
			en = en .. string.char(a)
		else
			st = st .. string.char(a)
		end
	end

	return st, en
end

function utf8hex(s)
	return utf8dec(Hex2Dec(s))
end

function utf8dec(a)
	a = tonumber(a)

	if a < 128 then
		return string.char(a)
	elseif a < 2048 then
		local b, c = nil
		b = a % 64 + 128
		c = math.floor(a / 64) + 192

		return string.char(c, b)
	elseif a < 65536 then
		local b, c, d = nil
		b = a % 64 + 128
		c = math.floor(a / 64) % 64 + 128
		d = math.floor(a / 4096) + 224

		return string.char(d, c, b)
	elseif a < 1114112 then
		local b, c, d, e = nil
		b = a % 64 + 128
		c = math.floor(a / 64) % 64 + 128
		d = math.floor(a / 4096) % 64 + 128
		e = math.floor(a / 262144) + 240

		return string.char(e, d, c, b)
	else
		return nil
	end
end

function toupper(s)
	local t = ""

	for c in char(s) do
		c = utf8dec(c)

		if utf8_upper[c] then
			t = t .. utf8_upper[c]
		else
			t = t .. c
		end
	end

	return t
end

function tolower(s)
	local t = ""

	for c in char(s) do
		c = utf8dec(c)

		if utf8_lower[c] then
			t = t .. utf8_lower[c]
		else
			t = t .. c
		end
	end

	return t
end
