local q1 = 8039
local a1 = 113
local K = 4 * q1 + 1
local C = 2 * a1 + 1
local M = 65536

local function _random(lastseed)
	local seed = lastseed % M
	seed = K * seed + C
	seed = seed % M

	return seed / M, seed
end

Random = {
	new = function (self, ...)
		local obj = setmetatable({}, {
			__index = self
		})

		obj:initialize(...)

		return obj
	end,
	initialize = function (self, seed)
		self:randomseed(seed)
	end,
	randomseed = function (self, seed)
		if seed == nil then
			seed = tonumber(tostring(os.time()):reverse():sub(1, 6))
		end

		self._seed = seed
	end,
	getRandomseed = function (self)
		return self._seed
	end,
	rand = function (self)
		local r = 0
		r, self._seed = _random(self._seed)

		return r
	end,
	random = function (self, n, m)
		if n == nil then
			return self:rand()
		elseif m == nil then
			return math.floor(self:rand() * n) + 1
		else
			return math.floor(self:rand() * (m + 1 - n)) + n
		end
	end,
	discreteRandom = function (self, distribution)
		assert(distribution ~= nil)

		local r = self:rand()
		local i = 1
		local n = #distribution

		while i <= n do
			local prob = distribution[i]

			if prob == nil or r <= prob then
				return i
			end

			i = i + 1
		end

		return i
	end
}
