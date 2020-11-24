BattlePerspective = {
	new = function (self, ...)
		self.__index = self
		local obj = setmetatable({}, self)

		obj:initialize(...)

		return obj
	end,
	initialize = function (self, viewWidth, viewHeight, eyeHeight, eyeDistance)
		local eyeY = -eyeDistance
		local eyeZ = eyeHeight
		self._unitX = viewWidth / 2
		self._unitY = viewHeight * (1 - eyeY) / eyeZ
		self._eyeZ = eyeZ
		self._eyeY = eyeY
	end,
	setFarScale = function (self, scale)
		self._farScale = scale
	end,
	norm2view = function (self, nx, ny)
		local eyeY = self._eyeY
		local eyeZ = self._eyeZ
		local p = 1 / (eyeY - ny)
		local sx = eyeY * p
		local vx = nx * sx * self._unitX
		local vz = -ny * eyeZ * p * self._unitY
		local dist2 = nx * nx + (ny - eyeY) * (ny - eyeY)
		local farScale = self._farScale

		if farScale ~= nil then
			local scale = 1 + (farScale - 1) * ny

			return vx, vz, scale, dist2
		else
			return vx, vz, sx, dist2
		end
	end,
	view2norm = function (self, vx, vy)
		local eyeY = self._eyeY
		local eyeZ = self._eyeZ
		local px = vx / self._unitX
		local py = vy / self._unitY
		local p = 1 / (py - eyeZ)
		local ny = py * eyeY * p
		local nx = -px * eyeZ * p

		return nx, ny
	end
}
