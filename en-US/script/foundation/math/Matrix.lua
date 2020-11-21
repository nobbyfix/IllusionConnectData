local matrix4x4 = {}

function matrix4x4.transformPoint(m, pt)
	local px = pt.x or 0
	local py = pt.y or 0
	local pz = pt.z or 0
	local pw = pt.w or 1

	return {
		x = px * m[1] + py * m[5] + pz * m[9] + pw * m[13],
		y = px * m[2] + py * m[6] + pz * m[10] + pw * m[14],
		z = px * m[3] + py * m[7] + pz * m[11] + pw * m[15],
		w = px * m[4] + py * m[8] + pz * m[12] + pw * m[16]
	}
end

function matrix4x4.transformVector(m, vec)
	local v1 = vec[1]
	local v2 = vec[2]
	local v3 = vec[3]
	local v4 = vec[4]

	return {
		v1 * m[1] + v2 * m[5] + v3 * m[9] + v4 * m[13],
		v1 * m[2] + v2 * m[6] + v3 * m[10] + v4 * m[14],
		v1 * m[3] + v2 * m[7] + v3 * m[11] + v4 * m[15],
		v1 * m[4] + v2 * m[8] + v3 * m[12] + v4 * m[16]
	}
end

mat4 = matrix4x4
