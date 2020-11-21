local bit = _G.bit

if bit ~= nil then
	return bit
end

local pow2s = {
	1,
	2,
	4,
	8,
	16,
	32,
	64,
	128,
	256,
	512,
	1024,
	2048,
	4096,
	8192,
	16384,
	32768,
	65536,
	131072,
	262144,
	524288,
	1048576,
	2097152,
	4194304,
	8388608,
	16777216,
	33554432,
	67108864,
	134217728,
	268435456,
	536870912,
	1073741824,
	2147483648.0
}
local bit = {
	bnot = function (a)
		a = a % 4294967296.0

		return 4294967295.0 - a
	end,
	band = function (a, b)
		local calc = 0
		b = b % 4294967296.0
		a = a % 4294967296.0

		for i = 31, 0, -1 do
			local val = pow2s[i + 1]
			local aa = false
			local bb = false

			if a == 0 or b == 0 then
				break
			end

			if val <= a then
				aa = true
				a = a - val
			end

			if val <= b then
				bb = true
				b = b - val
			end

			if aa and bb then
				calc = calc + val
			end
		end

		return calc
	end,
	bor = function (a, b)
		local calc = 0
		b = b % 4294967296.0
		a = a % 4294967296.0

		for i = 31, 0, -1 do
			local val = pow2s[i + 1]
			local aa = false
			local bb = false

			if a == 0 or b == 0 then
				calc = calc + a + b

				break
			end

			if val <= a then
				aa = true
				a = a - val
			end

			if val <= b then
				bb = true
				b = b - val
			end

			if aa or bb then
				calc = calc + val
			end
		end

		return calc
	end,
	bxor = function (a, b)
		local calc = 0
		b = b % 4294967296.0
		a = a % 4294967296.0

		for i = 31, 0, -1 do
			local val = pow2s[i + 1]
			local aa = false
			local bb = false

			if a == 0 or b == 0 then
				calc = calc + a + b

				break
			end

			if val <= a then
				aa = true
				a = a - val
			end

			if val <= b then
				bb = true
				b = b - val
			end

			if aa ~= bb then
				calc = calc + val
			end
		end

		return calc
	end,
	lshift = function (a, bits)
		local res = a * pow2s[bits + 1]

		return res % 4294967296.0
	end,
	rshift = function (a, bits)
		a = a % 4294967296.0
		local mod = pow2s[bits + 1]
		local r = a % mod

		return (a - r) / mod
	end,
	arshift = function (a, bits)
		a = a % 4294967296.0

		if a >= 2147483648.0 then
			a = a - 4294967296.0
		end

		local mod = pow2s[bits + 1]
		local r = a % mod

		return (a - r) / mod % 4294967296.0
	end
}
_G.bit = bit

return bit
