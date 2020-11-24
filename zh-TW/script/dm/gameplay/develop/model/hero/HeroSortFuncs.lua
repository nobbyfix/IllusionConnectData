HeroSortFuncs = HeroSortFuncs or {}
local kHeroPartyOrder = {
	[GalleryPartyType.kBSNCT] = 400,
	[GalleryPartyType.kXD] = 500,
	[GalleryPartyType.kMNJH] = 200,
	[GalleryPartyType.kDWH] = 300,
	[GalleryPartyType.kWNSXJ] = 600,
	[GalleryPartyType.kSSZS] = 100
}
HeroSortFuncs.SortFunc = {
	function (a, b)
		if a.combat == b.combat then
			if a.level == b.level then
				if a.rareity == b.rareity then
					if a.cost == b.cost then
						if a.star == b.star then
							return b.id < a.id
						end

						return b.star < a.star
					end

					return a.cost < b.cost
				end

				return b.rareity < a.rareity
			end

			return b.level < a.level
		end

		return b.combat < a.combat
	end,
	function (a, b)
		if a.level == b.level then
			if a.combat == b.combat then
				if a.rareity == b.rareity then
					if a.cost == b.cost then
						if a.star == b.star then
							return b.id < a.id
						end

						return b.star < a.star
					end

					return a.cost < b.cost
				end

				return b.rareity < a.rareity
			end

			return b.combat < a.combat
		end

		return b.level < a.level
	end,
	function (a, b)
		if a.rareity == b.rareity then
			if a.combat == b.combat then
				if a.level == b.level then
					if a.cost == b.cost then
						if a.star == b.star then
							return b.id < a.id
						end

						return b.star < a.star
					end

					return a.cost < b.cost
				end

				return b.level < a.level
			end

			return b.combat < a.combat
		end

		return b.rareity < a.rareity
	end,
	function (a, b)
		if a.cost == b.cost then
			if a.combat == b.combat then
				if a.level == b.level then
					if a.rareity == b.rareity then
						if a.star == b.star then
							return b.id < a.id
						end

						return b.star < a.star
					end

					return b.rareity < a.rareity
				end

				return b.level < a.level
			end

			return b.combat < a.combat
		end

		return a.cost < b.cost
	end,
	function (a, b)
		if a.star == b.star then
			if a.combat == b.combat then
				if a.level == b.level then
					if b.rareity < a.rareity then
						if a.cost == b.cost then
							return b.id < a.id
						end

						return a.cost < b.cost
					end

					return b.rareity < a.rareity
				end

				return b.level < a.level
			end

			return b.combat < a.combat
		end

		return b.star < a.star
	end,
	function (a, b)
		if a.loveLevel == b.loveLevel then
			if a.combat == b.combat then
				if a.rareity == b.rareity then
					if a.cost == b.cost then
						if a.star == b.star then
							if a.quality == b.quality then
								if a.level == b.level then
									return b.id < a.id
								end

								return b.level < a.level
							end

							return b.quality < a.quality
						end

						return b.star < a.star
					end

					return a.cost < b.cost
				end

				return b.rareity < a.rareity
			end

			return b.combat < a.combat
		end

		return b.loveLevel < a.loveLevel
	end,
	function (a, b)
		local partyOrderA = a.party and kHeroPartyOrder[a.party] or 0
		local partyOrderB = b.party and kHeroPartyOrder[b.party] or 0

		if partyOrderA == partyOrderB then
			if a.quality == b.quality then
				if a.level == b.level then
					if a.rareity == b.rareity then
						if a.cost == b.cost then
							if a.star == b.star then
								if a.combat == b.combat then
									return b.id < a.id
								end

								return b.combat < a.combat
							end

							return b.star < a.star
						end

						return a.cost < b.cost
					end

					return b.rareity < a.rareity
				end

				return b.level < a.level
			end

			return b.quality < a.quality
		end

		return partyOrderB < partyOrderA
	end
}
HeroSortFuncs.SortFunc1 = {
	function (a, b)
		if a.quality == b.quality then
			if a.level == b.level then
				if a.rareity == b.rareity then
					if a.cost == b.cost then
						if a.star == b.star then
							if a.combat == b.combat then
								return a.id < b.id
							end

							return a.combat < b.combat
						end

						return a.star < b.star
					end

					return a.cost < b.cost
				end

				return a.rareity < b.rareity
			end

			return a.level < b.level
		end

		return a.quality < b.quality
	end,
	function (a, b)
		if a.rareity == b.rareity then
			if a.cost == b.cost then
				if a.star == b.star then
					if a.quality == b.quality then
						if a.level == b.level then
							if a.combat == b.combat then
								return a.id < b.id
							end

							return a.combat < b.combat
						end

						return a.level < b.level
					end

					return a.quality < b.quality
				end

				return a.star < b.star
			end

			return a.cost < b.cost
		end

		return a.rareity < b.rareity
	end,
	function (a, b)
		if a.cost == b.cost then
			if a.rareity == b.rareity then
				if a.star == b.star then
					if a.quality == b.quality then
						if a.level == b.level then
							if a.combat == b.combat then
								return a.id < b.id
							end

							return a.combat < b.combat
						end

						return a.level < b.level
					end

					return a.quality < b.quality
				end

				return a.star < b.star
			end

			return a.rareity < b.rareity
		end

		return a.cost < b.cost
	end,
	function (a, b)
		if a.star == b.star then
			if a.rareity == b.rareity then
				if a.cost == b.cost then
					if a.quality == b.quality then
						if a.level == b.level then
							if a.combat == b.combat then
								return a.id < b.id
							end

							return a.combat < b.combat
						end

						return a.level < b.level
					end

					return a.quality < b.quality
				end

				return a.cost < b.cost
			end

			return a.rareity < b.rareity
		end

		return a.star < b.star
	end,
	function (a, b)
		if a.combat == b.combat then
			if a.rareity == b.rareity then
				if a.cost == b.cost then
					if a.star == b.star then
						if a.quality == b.quality then
							if a.level == b.level then
								return a.id < b.id
							end

							return a.level < b.level
						end

						return a.quality < b.quality
					end

					return a.star < b.star
				end

				return a.cost < b.cost
			end

			return a.rareity < b.rareity
		end

		return a.combat < b.combat
	end,
	function (a, b)
		if a.loveLevel == b.loveLevel then
			if a.combat == b.combat then
				if a.rareity == b.rareity then
					if a.cost == b.cost then
						if a.star == b.star then
							if a.quality == b.quality then
								if a.level == b.level then
									return a.id < b.id
								end

								return a.level < b.level
							end

							return a.quality < b.quality
						end

						return a.star < b.star
					end

					return a.cost < b.cost
				end

				return a.rareity < b.rareity
			end

			return a.combat < b.combat
		end

		return a.loveLevel < b.loveLevel
	end,
	function (a, b)
		local partyOrderA = a.party and kHeroPartyOrder[a.party] or 0
		local partyOrderB = b.party and kHeroPartyOrder[b.party] or 0

		if partyOrderA == partyOrderB then
			if a.quality == b.quality then
				if a.level == b.level then
					if a.rareity == b.rareity then
						if a.cost == b.cost then
							if a.star == b.star then
								if a.combat == b.combat then
									return a.id < b.id
								end

								return a.combat < b.combat
							end

							return a.star < b.star
						end

						return a.cost < b.cost
					end

					return a.rareity < b.rareity
				end

				return a.level < b.level
			end

			return a.quality < b.quality
		end

		return partyOrderA < partyOrderB
	end
}
