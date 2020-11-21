module("md5", package.seeall)

local char = string.char
local byte = string.byte
local format = string.format
local rep = string.rep
local sub = string.sub
local bit_or, bit_and, bit_not, bit_xor, bit_rshift, bit_lshift = nil
local bit = _G.bit

if bit ~= nil then
	bit_lshift = bit.lshift
	bit_rshift = bit.rshift
	bit_xor = bit.bxor
	bit_not = bit.bnot
	bit_and = bit.band
	bit_or = bit.bor
else
	local function tbl2number(tbl)
		local result = 0
		local power = 1

		for i = 1, #tbl do
			result = result + tbl[i] * power
			power = power * 2
		end

		return result
	end

	local function expand(t1, t2)
		local big = t1
		local small = t2

		if #big < #small then
			small = big
			big = small
		end

		for i = #small + 1, #big do
			small[i] = 0
		end
	end

	local to_bits = nil

	function bit_not(n)
		local tbl = to_bits(n)
		local size = math.max(#tbl, 32)

		for i = 1, size do
			if tbl[i] == 1 then
				tbl[i] = 0
			else
				tbl[i] = 1
			end
		end

		return tbl2number(tbl)
	end

	function to_bits(n)
		if n < 0 then
			return to_bits(bit_not(math.abs(n)) + 1)
		end

		local tbl = {}
		local cnt = 1
		local last = nil

		while n > 0 do
			last = n % 2
			tbl[cnt] = last
			n = (n - last) / 2
			cnt = cnt + 1
		end

		return tbl
	end

	function bit_or(m, n)
		local tbl_m = to_bits(m)
		local tbl_n = to_bits(n)

		expand(tbl_m, tbl_n)

		local tbl = {}

		for i = 1, #tbl_m do
			if tbl_m[i] == 0 and tbl_n[i] == 0 then
				tbl[i] = 0
			else
				tbl[i] = 1
			end
		end

		return tbl2number(tbl)
	end

	function bit_and(m, n)
		local tbl_m = to_bits(m)
		local tbl_n = to_bits(n)

		expand(tbl_m, tbl_n)

		local tbl = {}

		for i = 1, #tbl_m do
			if tbl_m[i] == 0 or tbl_n[i] == 0 then
				tbl[i] = 0
			else
				tbl[i] = 1
			end
		end

		return tbl2number(tbl)
	end

	function bit_xor(m, n)
		local tbl_m = to_bits(m)
		local tbl_n = to_bits(n)

		expand(tbl_m, tbl_n)

		local tbl = {}

		for i = 1, #tbl_m do
			if tbl_m[i] ~= tbl_n[i] then
				tbl[i] = 1
			else
				tbl[i] = 0
			end
		end

		return tbl2number(tbl)
	end

	function bit_rshift(n, bits)
		local high_bit = 0

		if n < 0 then
			n = bit_not(math.abs(n)) + 1
			high_bit = 2147483648.0
		end

		local floor = math.floor

		for i = 1, bits do
			n = n / 2
			n = bit_or(floor(n), high_bit)
		end

		return floor(n)
	end

	function bit_lshift(n, bits)
		if n < 0 then
			n = bit_not(math.abs(n)) + 1
		end

		for i = 1, bits do
			n = n * 2
		end

		return bit_and(n, 4294967295.0)
	end
end

local function lei2str(i)
	local function f(s)
		return char(bit_and(bit_rshift(i, s), 255))
	end

	return f(0) .. f(8) .. f(16) .. f(24)
end

local function str2bei(s)
	local v = 0

	for i = 1, #s do
		v = v * 256 + byte(s, i)
	end

	return v
end

local function str2lei(s)
	local v = 0

	for i = #s, 1, -1 do
		v = v * 256 + byte(s, i)
	end

	return v
end

local function cut_le_str(s, ...)
	local o = 1
	local r = {}
	local args = {
		...
	}

	for i = 1, #args do
		table.insert(r, str2lei(sub(s, o, o + args[i] - 1)))

		o = o + args[i]
	end

	return r
end

local function swap(w)
	return str2bei(lei2str(w))
end

local function hex2binaryaux(hexval)
	return char(tonumber(hexval, 16))
end

local function hex2binary(hex)
	local result, _ = hex:gsub("..", hex2binaryaux)

	return result
end

local CONSTS = {
	3614090360.0,
	3905402710.0,
	606105819,
	3250441966.0,
	4118548399.0,
	1200080426,
	2821735955.0,
	4249261313.0,
	1770035416,
	2336552879.0,
	4294925233.0,
	2304563134.0,
	1804603682,
	4254626195.0,
	2792965006.0,
	1236535329,
	4129170786.0,
	3225465664.0,
	643717713,
	3921069994.0,
	3593408605.0,
	38016083,
	3634488961.0,
	3889429448.0,
	568446438,
	3275163606.0,
	4107603335.0,
	1163531501,
	2850285829.0,
	4243563512.0,
	1735328473,
	2368359562.0,
	4294588738.0,
	2272392833.0,
	1839030562,
	4259657740.0,
	2763975236.0,
	1272893353,
	4139469664.0,
	3200236656.0,
	681279174,
	3936430074.0,
	3572445317.0,
	76029189,
	3654602809.0,
	3873151461.0,
	530742520,
	3299628645.0,
	4096336452.0,
	1126891415,
	2878612391.0,
	4237533241.0,
	1700485571,
	2399980690.0,
	4293915773.0,
	2240044497.0,
	1873313359,
	4264355552.0,
	2734768916.0,
	1309151649,
	4149444226.0,
	3174756917.0,
	718787259,
	3951481745.0,
	1732584193,
	4023233417.0,
	2562383102.0,
	271733878
}

local function f(x, y, z)
	return bit_or(bit_and(x, y), bit_and(-x - 1, z))
end

local function g(x, y, z)
	return bit_or(bit_and(x, z), bit_and(y, -z - 1))
end

local function h(x, y, z)
	return bit_xor(x, bit_xor(y, z))
end

local function i(x, y, z)
	return bit_xor(y, bit_or(x, -z - 1))
end

local function z(f, a, b, c, d, x, s, ac)
	a = bit_and(a + f(b, c, d) + x + ac, 4294967295.0)

	return bit_or(bit_lshift(bit_and(a, bit_rshift(4294967295.0, s)), s), bit_rshift(a, 32 - s)) + b
end

local function transform(A, B, C, D, X)
	local a = A
	local b = B
	local c = C
	local d = D
	local t = CONSTS
	a = z(f, a, b, c, d, X[0], 7, t[1])
	d = z(f, d, a, b, c, X[1], 12, t[2])
	c = z(f, c, d, a, b, X[2], 17, t[3])
	b = z(f, b, c, d, a, X[3], 22, t[4])
	a = z(f, a, b, c, d, X[4], 7, t[5])
	d = z(f, d, a, b, c, X[5], 12, t[6])
	c = z(f, c, d, a, b, X[6], 17, t[7])
	b = z(f, b, c, d, a, X[7], 22, t[8])
	a = z(f, a, b, c, d, X[8], 7, t[9])
	d = z(f, d, a, b, c, X[9], 12, t[10])
	c = z(f, c, d, a, b, X[10], 17, t[11])
	b = z(f, b, c, d, a, X[11], 22, t[12])
	a = z(f, a, b, c, d, X[12], 7, t[13])
	d = z(f, d, a, b, c, X[13], 12, t[14])
	c = z(f, c, d, a, b, X[14], 17, t[15])
	b = z(f, b, c, d, a, X[15], 22, t[16])
	a = z(g, a, b, c, d, X[1], 5, t[17])
	d = z(g, d, a, b, c, X[6], 9, t[18])
	c = z(g, c, d, a, b, X[11], 14, t[19])
	b = z(g, b, c, d, a, X[0], 20, t[20])
	a = z(g, a, b, c, d, X[5], 5, t[21])
	d = z(g, d, a, b, c, X[10], 9, t[22])
	c = z(g, c, d, a, b, X[15], 14, t[23])
	b = z(g, b, c, d, a, X[4], 20, t[24])
	a = z(g, a, b, c, d, X[9], 5, t[25])
	d = z(g, d, a, b, c, X[14], 9, t[26])
	c = z(g, c, d, a, b, X[3], 14, t[27])
	b = z(g, b, c, d, a, X[8], 20, t[28])
	a = z(g, a, b, c, d, X[13], 5, t[29])
	d = z(g, d, a, b, c, X[2], 9, t[30])
	c = z(g, c, d, a, b, X[7], 14, t[31])
	b = z(g, b, c, d, a, X[12], 20, t[32])
	a = z(h, a, b, c, d, X[5], 4, t[33])
	d = z(h, d, a, b, c, X[8], 11, t[34])
	c = z(h, c, d, a, b, X[11], 16, t[35])
	b = z(h, b, c, d, a, X[14], 23, t[36])
	a = z(h, a, b, c, d, X[1], 4, t[37])
	d = z(h, d, a, b, c, X[4], 11, t[38])
	c = z(h, c, d, a, b, X[7], 16, t[39])
	b = z(h, b, c, d, a, X[10], 23, t[40])
	a = z(h, a, b, c, d, X[13], 4, t[41])
	d = z(h, d, a, b, c, X[0], 11, t[42])
	c = z(h, c, d, a, b, X[3], 16, t[43])
	b = z(h, b, c, d, a, X[6], 23, t[44])
	a = z(h, a, b, c, d, X[9], 4, t[45])
	d = z(h, d, a, b, c, X[12], 11, t[46])
	c = z(h, c, d, a, b, X[15], 16, t[47])
	b = z(h, b, c, d, a, X[2], 23, t[48])
	a = z(i, a, b, c, d, X[0], 6, t[49])
	d = z(i, d, a, b, c, X[7], 10, t[50])
	c = z(i, c, d, a, b, X[14], 15, t[51])
	b = z(i, b, c, d, a, X[5], 21, t[52])
	a = z(i, a, b, c, d, X[12], 6, t[53])
	d = z(i, d, a, b, c, X[3], 10, t[54])
	c = z(i, c, d, a, b, X[10], 15, t[55])
	b = z(i, b, c, d, a, X[1], 21, t[56])
	a = z(i, a, b, c, d, X[8], 6, t[57])
	d = z(i, d, a, b, c, X[15], 10, t[58])
	c = z(i, c, d, a, b, X[6], 15, t[59])
	b = z(i, b, c, d, a, X[13], 21, t[60])
	a = z(i, a, b, c, d, X[4], 6, t[61])
	d = z(i, d, a, b, c, X[11], 10, t[62])
	c = z(i, c, d, a, b, X[2], 15, t[63])
	b = z(i, b, c, d, a, X[9], 21, t[64])

	return A + a, B + b, C + c, D + d
end

function md5(s)
	local msgLen = #s
	local padLen = 56 - msgLen % 64

	if msgLen % 64 > 56 then
		padLen = padLen + 64
	end

	if padLen == 0 then
		padLen = 64
	end

	s = s .. char(128) .. rep(char(0), padLen - 1) .. lei2str(8 * msgLen) .. lei2str(0)

	assert(#s % 64 == 0)

	local t = CONSTS
	local a = t[65]
	local b = t[66]
	local c = t[67]
	local d = t[68]

	for i = 1, #s, 64 do
		local X = cut_le_str(sub(s, i, i + 63), 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4)

		assert(#X == 16)

		X[0] = table.remove(X, 1)
		a, b, c, d = transform(a, b, c, d, X)
	end

	return format("%08x%08x%08x%08x", swap(a), swap(b), swap(c), swap(d))
end

function sum(s)
	return hex2binary(md5(s))
end
