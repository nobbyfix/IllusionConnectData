HeroSortFuncs = HeroSortFuncs or {}
local kHeroPartyOrder = {
	[GalleryPartyType.kBSNCT] = 400,
	[GalleryPartyType.kXD] = 500,
	[GalleryPartyType.kMNJH] = 200,
	[GalleryPartyType.kDWH] = 300,
	[GalleryPartyType.kWNSXJ] = 600,
	[GalleryPartyType.kSSZS] = 100
}
local kHeroSortType = {
	SortByCombat = 1,
	SortByOccupation = 4,
	SortByCost = 5,
	SortByQuality = 9,
	SortByLoveLevel = 8,
	SortByStar = 3,
	SortByLevel = 7,
	SortByRareity = 2,
	SortByParty = 6
}
local kHeroOccupationSorts = {
	Aoe = 9,
	Attack = 10,
	Support = 5,
	Curse = 4,
	Defense = 8,
	Summon = 6,
	Cure = 7
}
HeroSortFuncs.SortFunc = {
	[kHeroSortType.SortByCombat] = function (a, b)
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
	[kHeroSortType.SortByLevel] = function (a, b)
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
	[kHeroSortType.SortByRareity] = function (a, b)
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
	[kHeroSortType.SortByCost] = function (a, b)
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
	[kHeroSortType.SortByStar] = function (a, b)
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
	[kHeroSortType.SortByLoveLevel] = function (a, b)
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
	[kHeroSortType.SortByParty] = function (a, b)
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
	end,
	[kHeroSortType.SortByOccupation] = function (a, b)
		if kHeroOccupationSorts[a.type] == kHeroOccupationSorts[b.type] then
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
		end

		return kHeroOccupationSorts[b.type] < kHeroOccupationSorts[a.type]
	end,
	[kHeroSortType.SortByQuality] = function (a, b)
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

		return b.quality < a.quality
	end
}
HeroSortFuncs.TowerSortFunc = {
	[kHeroSortType.SortByCombat] = function (a, b)
		if a:getCombat() == b:getCombat() then
			if a:getLevel() == b:getLevel() then
				if a:getRarity() == b:getRarity() then
					if a:getCost() == b:getCost() then
						if a:getStar() == b:getStar() then
							return b:getId() < a:getId()
						end

						return b:getStar() < a:getStar()
					end

					return a:getCost() < b:getCost()
				end

				return b:getRarity() < a:getRarity()
			end

			return b:getLevel() < a:getLevel()
		end

		return b:getCombat() < a:getCombat()
	end,
	[kHeroSortType.SortByLevel] = function (a, b)
		if a:getLevel() == b:getLevel() then
			if a:getCombat() == b:getCombat() then
				if a:getRarity() == b:getRarity() then
					if a:getCost() == b:getCost() then
						if a:getStar() == b:getStar() then
							return b:getId() < a:getId()
						end

						return b:getStar() < a:getStar()
					end

					return a:getCost() < b:getCost()
				end

				return b:getRarity() < a:getRarity()
			end

			return b:getCombat() < a:getCombat()
		end

		return b:getLevel() < a:getLevel()
	end,
	[kHeroSortType.SortByRareity] = function (a, b)
		if a:getRarity() == b:getRarity() then
			if a:getCombat() == b:getCombat() then
				if a:getLevel() == b:getLevel() then
					if a:getCost() == b:getCost() then
						if a:getStar() == b:getStar() then
							return b:getId() < a:getId()
						end

						return b:getStar() < a:getStar()
					end

					return a:getCost() < b:getCost()
				end

				return b:getLevel() < a:getLevel()
			end

			return b:getCombat() < a:getCombat()
		end

		return b:getRarity() < a:getRarity()
	end,
	[kHeroSortType.SortByCost] = function (a, b)
		if a:getCost() == b:getCost() then
			if a:getCombat() == b:getCombat() then
				if a:getLevel() == b:getLevel() then
					if a:getRarity() == b:getRarity() then
						if a:getStar() == b:getStar() then
							return b:getId() < a:getId()
						end

						return b:getStar() < a:getStar()
					end

					return b:getRarity() < a:getRarity()
				end

				return b:getLevel() < a:getLevel()
			end

			return b:getCombat() < a:getCombat()
		end

		return a:getCost() < b:getCost()
	end,
	[kHeroSortType.SortByStar] = function (a, b)
		if a:getStar() == b:getStar() then
			if a:getCombat() == b:getCombat() then
				if a:getLevel() == b:getLevel() then
					if b:getRarity() < a:getRarity() then
						if a:getCost() == b:getCost() then
							return b:getId() < a:getId()
						end

						return a:getCost() < b:getCost()
					end

					return b:getRarity() < a:getRarity()
				end

				return b:getLevel() < a:getLevel()
			end

			return b:getCombat() < a:getCombat()
		end

		return b:getStar() < a:getStar()
	end,
	[kHeroSortType.SortByLoveLevel] = function (a, b)
		if a:getLoveLevel() == b:getLoveLevel() then
			if a:getCombat() == b:getCombat() then
				if a:getRarity() == b:getRarity() then
					if a:getCost() == b:getCost() then
						if a:getStar() == b:getStar() then
							if a:getRarity() == b:getRarity() then
								if a:getLevel() == b:getLevel() then
									return b:getId() < a:getId()
								end

								return b:getLevel() < a:getLevel()
							end

							return b:getRarity() < a:getRarity()
						end

						return b:getStar() < a:getStar()
					end

					return a:getCost() < b:getCost()
				end

				return b:getRarity() < a:getRarity()
			end

			return b:getCombat() < a:getCombat()
		end

		return b:getLoveLevel() < a:getLoveLevel()
	end,
	[kHeroSortType.SortByParty] = function (a, b)
		local partyOrderA = a:getParty() and kHeroPartyOrder[a:getParty()] or 0
		local partyOrderB = b:getParty() and kHeroPartyOrder[b:getParty()] or 0

		if partyOrderA == partyOrderB then
			if a:getRarity() == b:getRarity() then
				if a:getLevel() == b:getLevel() then
					if a:getRarity() == b:getRarity() then
						if a:getCost() == b:getCost() then
							if a:getStar() == b:getStar() then
								if a:getCombat() == b:getCombat() then
									return b:getId() < a:getId()
								end

								return b:getCombat() < a:getCombat()
							end

							return b:getStar() < a:getStar()
						end

						return a:getCost() < b:getCost()
					end

					return b:getRarity() < a:getRarity()
				end

				return b:getLevel() < a:getLevel()
			end

			return b:getRarity() < a:getRarity()
		end

		return partyOrderB < partyOrderA
	end,
	[kHeroSortType.SortByOccupation] = function (a, b)
		if kHeroOccupationSorts[a:getType()] == kHeroOccupationSorts[b:getType()] then
			if a:getCombat() == b:getCombat() then
				if a:getLevel() == b:getLevel() then
					if a:getRarity() == b:getRarity() then
						if a:getCost() == b:getCost() then
							if a:getStar() == b:getStar() then
								return b:getId() < a:getId()
							end

							return b:getStar() < a:getStar()
						end

						return a:getCost() < b:getCost()
					end

					return b:getRarity() < a:getRarity()
				end

				return b:getLevel() < a:getLevel()
			end

			return b:getCombat() < a:getCombat()
		end

		return kHeroOccupationSorts[b:getType()] < kHeroOccupationSorts[a:getType()]
	end,
	[kHeroSortType.SortByQuality] = function (a, b)
		if a:getRarity() == b:getRarity() then
			if a:getLevel() == b:getLevel() then
				if a:getRarity() == b:getRarity() then
					if a:getCost() == b:getCost() then
						if a:getStar() == b:getStar() then
							if a:getCombat() == b:getCombat() then
								return a:getId() < b:getId()
							end

							return a:getCombat() < b:getCombat()
						end

						return a:getStar() < b:getStar()
					end

					return a:getCost() < b:getCost()
				end

				return a:getRarity() < b:getRarity()
			end

			return a:getLevel() < b:getLevel()
		end

		return b:getRarity() < a:getRarity()
	end
}
