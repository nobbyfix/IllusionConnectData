cc = cc or {}

function cc.clampf(value, min_inclusive, max_inclusive)
	local temp = 0

	if max_inclusive < min_inclusive then
		temp = min_inclusive
		min_inclusive = max_inclusive
		max_inclusive = temp
	end

	if value < min_inclusive then
		return min_inclusive
	elseif value < max_inclusive then
		return value
	else
		return max_inclusive
	end
end

function cc.p(_x, _y)
	if _y == nil then
		return {
			x = _x.x,
			y = _x.y
		}
	else
		return {
			x = _x,
			y = _y
		}
	end
end

function cc.pAdd(pt1, pt2)
	return {
		x = pt1.x + pt2.x,
		y = pt1.y + pt2.y
	}
end

function cc.pSub(pt1, pt2)
	return {
		x = pt1.x - pt2.x,
		y = pt1.y - pt2.y
	}
end

function cc.pMul(pt1, factor)
	return {
		x = pt1.x * factor,
		y = pt1.y * factor
	}
end

function cc.pMidpoint(pt1, pt2)
	return {
		x = (pt1.x + pt2.x) / 2,
		y = (pt1.y + pt2.y) / 2
	}
end

function cc.pForAngle(a)
	return {
		x = math.cos(a),
		y = math.sin(a)
	}
end

function cc.pGetLength(pt)
	return math.sqrt(pt.x * pt.x + pt.y * pt.y)
end

function cc.pNormalize(pt)
	local length = cc.pGetLength(pt)

	if length == 0 then
		return {
			x = 1,
			y = 0
		}
	end

	return {
		x = pt.x / length,
		y = pt.y / length
	}
end

function cc:pCross(other)
	return self.x * other.y - self.y * other.x
end

function cc:pDot(other)
	return self.x * other.x + self.y * other.y
end

function cc:pToAngleSelf()
	return math.atan2(self.y, self.x)
end

function cc:pGetAngle(other)
	local a2 = cc.pNormalize(self)
	local b2 = cc.pNormalize(other)
	local angle = math.atan2(cc.pCross(a2, b2), cc.pDot(a2, b2))

	if math.abs(angle) < 1.192092896e-07 then
		return 0
	end

	return angle
end

function cc.pGetDistance(startP, endP)
	return cc.pGetLength(cc.pSub(startP, endP))
end

function cc.pIsLineIntersect(A, B, C, D, s, t)
	if A.x == B.x and A.y == B.y or C.x == D.x and C.y == D.y then
		return false, s, t
	end

	local BAx = B.x - A.x
	local BAy = B.y - A.y
	local DCx = D.x - C.x
	local DCy = D.y - C.y
	local ACx = A.x - C.x
	local ACy = A.y - C.y
	local denom = DCy * BAx - DCx * BAy
	s = DCx * ACy - DCy * ACx
	t = BAx * ACy - BAy * ACx

	if denom == 0 then
		if s == 0 or t == 0 then
			return true, s, t
		end

		return false, s, t
	end

	s = s / denom
	t = t / denom

	return true, s, t
end

function cc.pPerp(pt)
	return {
		x = -pt.y,
		y = pt.x
	}
end

function cc.RPerp(pt)
	return {
		x = pt.y,
		y = -pt.x
	}
end

function cc.pProject(pt1, pt2)
	return {
		x = pt2.x * cc.pDot(pt1, pt2) / cc.pDot(pt2, pt2),
		y = pt2.y * cc.pDot(pt1, pt2) / cc.pDot(pt2, pt2)
	}
end

function cc.pRotate(pt1, pt2)
	return {
		x = pt1.x * pt2.x - pt1.y * pt2.y,
		y = pt1.x * pt2.y + pt1.y * pt2.x
	}
end

function cc.pUnrotate(pt1, pt2)
	return {
		pt1.y * pt2.x - pt1.x * pt2.y,
		x = pt1.x * pt2.x + pt1.y * pt2.y
	}
end

function cc.pLengthSQ(pt)
	return cc.pDot(pt, pt)
end

function cc.pDistanceSQ(pt1, pt2)
	return cc.pLengthSQ(cc.pSub(pt1, pt2))
end

function cc.pGetClampPoint(pt1, pt2, pt3)
	return {
		x = cc.clampf(pt1.x, pt2.x, pt3.x),
		y = cc.clampf(pt1.y, pt2.y, pt3.y)
	}
end

function cc.pFromSize(sz)
	return {
		x = sz.width,
		y = sz.height
	}
end

function cc.pLerp(pt1, pt2, alpha)
	return cc.pAdd(cc.pMul(pt1, 1 - alpha), cc.pMul(pt2, alpha))
end

function cc.pFuzzyEqual(pt1, pt2, variance)
	if pt1.x - variance <= pt2.x and pt2.x <= pt1.x + variance and pt1.y - variance <= pt2.y and pt2.y <= pt1.y + variance then
		return true
	else
		return false
	end
end

function cc.pRotateByAngle(pt1, pt2, angle)
	return cc.pAdd(pt2, cc.pRotate(cc.pSub(pt1, pt2), cc.pForAngle(angle)))
end

function cc.pIsSegmentIntersect(pt1, pt2, pt3, pt4)
	local s = 0
	local t = 0
	local ret = false
	ret, s, t = cc.pIsLineIntersect(pt1, pt2, pt3, pt4, s, t)

	if ret and s >= 0 and s <= 1 and t >= 0 and t <= 1 then
		return true
	end

	return false
end

function cc.pGetIntersectPoint(pt1, pt2, pt3, pt4)
	local s = 0
	local t = 0
	local ret = false
	ret, s, t = cc.pIsLineIntersect(pt1, pt2, pt3, pt4, s, t)

	if ret then
		return cc.p(pt1.x + s * (pt2.x - pt1.x), pt1.y + s * (pt2.y - pt1.y))
	else
		return cc.p(0, 0)
	end
end

function cc.size(_width, _height)
	return {
		width = _width,
		height = _height
	}
end

function cc.rect(_x, _y, _width, _height)
	return {
		x = _x,
		y = _y,
		width = _width,
		height = _height
	}
end

function cc.rectEqualToRect(rect1, rect2)
	if rect2.x <= rect1.x or rect2.y <= rect1.y or rect1.x + rect1.width <= rect2.x + rect2.width or rect1.y + rect1.height <= rect2.y + rect2.height then
		return false
	end

	return true
end

function cc.rectGetMaxX(rect)
	return rect.x + rect.width
end

function cc.rectGetMidX(rect)
	return rect.x + rect.width / 2
end

function cc.rectGetMinX(rect)
	return rect.x
end

function cc.rectGetMaxY(rect)
	return rect.y + rect.height
end

function cc.rectGetMidY(rect)
	return rect.y + rect.height / 2
end

function cc.rectGetMinY(rect)
	return rect.y
end

function cc.rectContainsPoint(rect, point)
	local ret = false

	if rect.x <= point.x and point.x <= rect.x + rect.width and rect.y <= point.y and point.y <= rect.y + rect.height then
		ret = true
	end

	return ret
end

function cc.rectIntersectsRect(rect1, rect2)
	local intersect = rect1.x <= rect2.x + rect2.width and rect1.x + rect1.width >= rect2.x and rect1.y <= rect2.y + rect2.height and rect1.y + rect1.height >= rect2.y

	return intersect
end

function cc.rectUnion(rect1, rect2)
	local rect = cc.rect(0, 0, 0, 0)
	rect.x = math.min(rect1.x, rect2.x)
	rect.y = math.min(rect1.y, rect2.y)
	rect.width = math.max(rect1.x + rect1.width, rect2.x + rect2.width) - rect.x
	rect.height = math.max(rect1.y + rect1.height, rect2.y + rect2.height) - rect.y

	return rect
end

function cc.rectIntersection(rect1, rect2)
	local intersection = cc.rect(math.max(rect1.x, rect2.x), math.max(rect1.y, rect2.y), 0, 0)
	intersection.width = math.min(rect1.x + rect1.width, rect2.x + rect2.width) - intersection.x
	intersection.height = math.min(rect1.y + rect1.height, rect2.y + rect2.height) - intersection.y

	return intersection
end

function cc.c3b(_r, _g, _b)
	return {
		r = _r,
		g = _g,
		b = _b
	}
end

function cc.c4b(_r, _g, _b, _a)
	return {
		r = _r,
		g = _g,
		b = _b,
		a = _a
	}
end

function cc.c4f(_r, _g, _b, _a)
	return {
		r = _r,
		g = _g,
		b = _b,
		a = _a
	}
end

local function isFloatColor(c)
	return c.r <= 1 and c.g <= 1 and c.b <= 1 and (math.ceil(c.r) ~= c.r or math.ceil(c.g) ~= c.g or math.ceil(c.b) ~= c.b)
end

function cc.convertColor(input, typ)
	assert(type(input) == "table" and input.r and input.g and input.b, "cc.convertColor() - invalid input color")

	local ret = nil

	if typ == "3b" then
		if isFloatColor(input) then
			ret = {
				r = math.ceil(input.r * 255),
				g = math.ceil(input.g * 255),
				b = math.ceil(input.b * 255)
			}
		else
			ret = {
				r = input.r,
				g = input.g,
				b = input.b
			}
		end
	elseif typ == "4b" then
		if isFloatColor(input) then
			ret = {
				r = math.ceil(input.r * 255),
				g = math.ceil(input.g * 255),
				b = math.ceil(input.b * 255)
			}
		else
			ret = {
				r = input.r,
				g = input.g,
				b = input.b
			}
		end

		if input.a then
			if math.ceil(input.a) ~= input.a or input.a <= 1 then
				ret.a = input.a * 255
			else
				ret.a = input.a
			end
		else
			ret.a = 255
		end
	elseif typ == "4f" then
		if isFloatColor(input) then
			ret = {
				r = input.r,
				g = input.g,
				b = input.b
			}
		else
			ret = {
				r = input.r / 255,
				g = input.g / 255,
				b = input.b / 255
			}
		end

		if input.a then
			if math.ceil(input.a) ~= input.a or input.a <= 1 then
				ret.a = input.a
			else
				ret.a = input.a / 255
			end
		else
			ret.a = 255
		end
	else
		error(string.format("cc.convertColor() - invalid type %s", typ), 0)
	end

	return ret
end

function cc.vertex2F(_x, _y)
	return {
		x = _x,
		y = _y
	}
end

function cc.Vertex3F(_x, _y, _z)
	return {
		x = _x,
		y = _y,
		z = _z
	}
end

function cc.tex2F(_u, _v)
	return {
		u = _u,
		v = _v
	}
end

function cc.PointSprite(_pos, _color, _size)
	return {
		pos = _pos,
		color = _color,
		size = _size
	}
end

function cc.Quad2(_tl, _tr, _bl, _br)
	return {
		tl = _tl,
		tr = _tr,
		bl = _bl,
		br = _br
	}
end

function cc.Quad3(_tl, _tr, _bl, _br)
	return {
		tl = _tl,
		tr = _tr,
		bl = _bl,
		br = _br
	}
end

function cc.V2F_C4B_T2F(_vertices, _colors, _texCoords)
	return {
		vertices = _vertices,
		colors = _colors,
		texCoords = _texCoords
	}
end

function cc.V2F_C4F_T2F(_vertices, _colors, _texCoords)
	return {
		vertices = _vertices,
		colors = _colors,
		texCoords = _texCoords
	}
end

function cc.V3F_C4B_T2F(_vertices, _colors, _texCoords)
	return {
		vertices = _vertices,
		colors = _colors,
		texCoords = _texCoords
	}
end

function cc.V2F_C4B_T2F_Quad(_bl, _br, _tl, _tr)
	return {
		bl = _bl,
		br = _br,
		tl = _tl,
		tr = _tr
	}
end

function cc.V3F_C4B_T2F_Quad(_tl, _bl, _tr, _br)
	return {
		tl = _tl,
		bl = _bl,
		tr = _tr,
		br = _br
	}
end

function cc.V2F_C4F_T2F_Quad(_bl, _br, _tl, _tr)
	return {
		bl = _bl,
		br = _br,
		tl = _tl,
		tr = _tr
	}
end

function cc.T2F_Quad(_bl, _br, _tl, _tr)
	return {
		bl = _bl,
		br = _br,
		tl = _tl,
		tr = _tr
	}
end

function cc.AnimationFrameData(_texCoords, _delay, _size)
	return {
		texCoords = _texCoords,
		delay = _delay,
		size = _size
	}
end

function cc.PhysicsMaterial(_density, _restitution, _friction)
	return {
		density = _density,
		restitution = _restitution,
		friction = _friction
	}
end

function cc.vec3(_x, _y, _z)
	return {
		x = _x,
		y = _y,
		z = _z
	}
end

function cc.vec4(_x, _y, _z, _w)
	return {
		x = _x,
		y = _y,
		z = _z,
		w = _w
	}
end

function cc.vec3normalize(vec3)
	local n = vec3.x * vec3.x + vec3.y * vec3.y + vec3.z * vec3.z

	if n == 1 then
		return vec3
	end

	n = math.sqrt(n)

	if n < 2e-37 then
		return vec3
	end

	n = 1 / n

	return {
		x = vec3.x * n,
		y = vec3.y * n,
		z = vec3.z * n
	}
end

function cc.quaternion(_x, _y, _z, _w)
	return {
		x = _x,
		y = _y,
		z = _z,
		w = _w
	}
end

function cc.quaternion_createFromAxisAngle(axis, angle)
	local halfAngle = angle * 0.5
	local sinHalfAngle = math.sin(halfAngle)
	local normal = cc.vec3(axis.x, axis.y, axis.z)
	normal = cc.vec3normalize(normal)
	local dst = cc.vec3(0, 0, 0)
	dst.x = normal.x * sinHalfAngle
	dst.y = normal.y * sinHalfAngle
	dst.z = normal.z * sinHalfAngle
	dst.w = math.cos(halfAngle)

	return dst
end

function cc.blendFunc(_src, _dst)
	return {
		src = _src,
		dst = _dst
	}
end

cc.mat4 = cc.mat4 or {}

function cc.mat4.new(...)
	local params = {
		...
	}
	local size = #params
	local obj = {}

	if size == 1 then
		assert(type(params[1]) == "table", "type of input params are wrong to new a mat4 when num of params is 1")

		for i = 1, 16 do
			if params[1][i] ~= nil then
				obj[i] = params[1][i]
			else
				obj[i] = 0
			end
		end
	elseif size == 16 then
		for i = 1, 16 do
			obj[i] = params[i]
		end
	end

	setmetatable(obj, {
		__index = cc.mat4
	})

	return obj
end

function cc.mat4:getInversed()
	return mat4_getInversed(self)
end

function cc.mat4:transformVector(vector, dst)
	return mat4_transformVector(self, vector, dst)
end

function cc.mat4:multiply(mat)
	return mat4_multiply(self, mat)
end

function cc.mat4:decompose(scale, rotation, translation)
	return mat4_decompose(self, scale, rotation, translation)
end

function cc.mat4.createIdentity()
	return cc.mat4.new(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1)
end

function cc.mat4.createTranslation(translation, dst)
	assert(type(translation) == "table" and type(dst) == "table", "The type of input parameters should be table")

	dst = cc.mat4.createIdentity()
	dst[13] = translation.x
	dst[14] = translation.y
	dst[15] = translation.z

	return dst
end

function cc.mat4.createRotation(q, dst)
	assert(type(q) == "table" and type(dst) == "table", "The type of input parameters should be table")

	local x2 = q.x + q.x
	local y2 = q.y + q.y
	local z2 = q.z + q.z
	local xx2 = q.x * x2
	local yy2 = q.y * y2
	local zz2 = q.z * z2
	local xy2 = q.x * y2
	local xz2 = q.x * z2
	local yz2 = q.y * z2
	local wx2 = q.w * x2
	local wy2 = q.w * y2
	local wz2 = q.w * z2
	dst[1] = 1 - yy2 - zz2
	dst[2] = xy2 + wz2
	dst[3] = xz2 - wy2
	dst[4] = 0
	dst[5] = xy2 - wz2
	dst[6] = 1 - xx2 - zz2
	dst[7] = yz2 + wx2
	dst[8] = 0
	dst[9] = xz2 + wy2
	dst[10] = yz2 - wx2
	dst[11] = 1 - xx2 - yy2
	dst[12] = 0
	dst[13] = 0
	dst[14] = 0
	dst[15] = 0
	dst[16] = 1

	return dst
end

function cc.mat4:translate(vec3)
	return mat4_translate(self, vec3)
end

function cc.mat4:createRotationZ(angle)
	return mat4_createRotationZ(self, angle)
end

function cc.mat4:setIdentity()
	return mat4_setIdentity(self)
end

function cc.mat4.createTranslation(...)
	return mat4_createTranslation(...)
end

function cc.mat4.createRotation(...)
	return mat4_createRotation(...)
end
