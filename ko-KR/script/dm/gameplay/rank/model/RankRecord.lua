BaseRankRecord = class("BaseRankRecord", objectlua.Object, _M)

BaseRankRecord:has("_player", {
	is = "rw"
})
BaseRankRecord:has("_rank", {
	is = "rw"
})
BaseRankRecord:has("_rankType", {
	is = "rw"
})
BaseRankRecord:has("_name", {
	is = "rw"
})
BaseRankRecord:has("_heroes", {
	is = "rw"
})
BaseRankRecord:has("_master", {
	is = "rw"
})
BaseRankRecord:has("_headId", {
	is = "rw"
})
BaseRankRecord:has("_headFrame", {
	is = "rw"
})
BaseRankRecord:has("_vipLevel", {
	is = "rw"
})
BaseRankRecord:has("_level", {
	is = "rw"
})
BaseRankRecord:has("_combat", {
	is = "rw"
})
BaseRankRecord:has("_slogan", {
	is = "rw"
})
BaseRankRecord:has("_nickName", {
	is = "r"
})
BaseRankRecord:has("_rid", {
	is = "r"
})
BaseRankRecord:has("_isFriend", {
	is = "rw"
})
BaseRankRecord:has("_online", {
	is = "r"
})
BaseRankRecord:has("_lastOfflineTime", {
	is = "r"
})
BaseRankRecord:has("_changeNum", {
	is = "r"
})
BaseRankRecord:has("_clubName", {
	is = "r"
})
BaseRankRecord:has("_familiarity", {
	is = "r"
})
BaseRankRecord:has("_new", {
	is = "r"
})
BaseRankRecord:has("_change", {
	is = "r"
})
BaseRankRecord:has("_retains", {
	is = "r"
})
BaseRankRecord:has("_gender", {
	is = "rw"
})
BaseRankRecord:has("_birthday", {
	is = "rw"
})
BaseRankRecord:has("_city", {
	is = "rw"
})
BaseRankRecord:has("_tags", {
	is = "rw"
})
BaseRankRecord:has("_block", {
	is = "rw"
})
BaseRankRecord:has("_leadStageId", {
	is = "rw"
})
BaseRankRecord:has("_leadStageLevel", {
	is = "rw"
})

function BaseRankRecord:initialize()
	super.initialize(self)

	self._player = nil
	self._rank = 0
	self._heroes = {}
	self._master = {}
	self._headId = 0
	self._vipLevel = 0
	self._combat = 0
	self._new = false
	self._change = 0
	self._retains = 0
	self._headFrame = ""
	self._board = "ZTXChang"
	self._surfaceId = nil
end

function BaseRankRecord:synchronize(data)
	if data then
		self._rank = data.rank
		self._vipLevel = data.vipLevel
		self._rid = data.rid
		self._name = data.nickname
		self._level = data.level
		self._headId = data.headImage
		self._headFrame = data.headFrame
		self._board = data.board
		self._surfaceId = data.surfaceId
		self._combat = data.combat
		self._slogan = Strings:get(data.slogan) or ""
		self._heroes = data.heroes
		self._master = data.master
		self._value = data.value
		self._nickName = data.nickname
		self._isFriend = data.isFriend
		self._online = data.online
		self._changeNum = data.change or 0
		self._new = data.new or false
		self._change = data.change or 0
		self._retains = data.retains or 0

		if data.offlineTime then
			self._lastOfflineTime = data.offlineTime
		elseif data.lastOfflineTime then
			self._lastOfflineTime = data.lastOfflineTime
		elseif data.lastOffTime then
			self._lastOfflineTime = data.lastOffTime
		end

		self._clubName = data.clubName
		self._familiarity = data.close
		self._gender = data.gender
		self._birthday = data.birthday
		self._city = data.city
		self._tags = data.tags
		self._block = data.block
		self._leadStageId = data.leadStageId or ""
		self._leadStageLevel = data.leadStageLevel or 0
	end
end

CombatRankRecord = class("CombatRankRecord", BaseRankRecord, _M)

CombatRankRecord:has("_maxCombat", {
	is = "r"
})

function CombatRankRecord:initialize()
	super.initialize(self)

	self._rankType = RankType.kCombat
end

function CombatRankRecord:synchronize(data)
	super.synchronize(self, data)

	self._maxCombat = data.value or 0
end

BlockRankRecord = class("BlockRankRecord", BaseRankRecord, _M)

BlockRankRecord:has("_star", {
	is = "r"
})

function BlockRankRecord:initialize()
	super.initialize(self)

	self._rankType = RankType.kBlockStar
	self._star = 0
end

function BlockRankRecord:synchronize(data)
	super.synchronize(self, data)

	self._star = data.value or 0
end

HeroRankRecord = class("HeroRankRecord", BaseRankRecord, _M)

HeroRankRecord:has("_heroCombat", {
	is = "r"
})
HeroRankRecord:has("_hero", {
	is = "r"
})

function HeroRankRecord:initialize()
	super.initialize(self)

	self._rankType = RankType.kHeroCombat
	self._hero = {}
	self._heroCombat = 0
end

function HeroRankRecord:synchronize(data)
	super.synchronize(self, data)

	self._heroCombat = data.hCombat or 0
	self._hero = data.hero
end

PetRaceRankRecord = class("PetRaceRankRecord", BaseRankRecord, _M)

PetRaceRankRecord:has("_score", {
	is = "r"
})
PetRaceRankRecord:has("_winNum", {
	is = "r"
})

function PetRaceRankRecord:initialize()
	super.initialize(self)

	self._rankType = RankType.kPetRace
end

function PetRaceRankRecord:synchronize(data)
	super.synchronize(self, data)

	self._score = data.score or 0
	self._winNum = data.winNum or 0
end

SubPetRaceRankRecord = class("SubPetRaceRankRecord", BaseRankRecord, _M)

SubPetRaceRankRecord:has("_score", {
	is = "r"
})
SubPetRaceRankRecord:has("_winNum", {
	is = "r"
})

function SubPetRaceRankRecord:initialize()
	super.initialize(self)

	self._rankType = RankType.kSubPetRace
end

function SubPetRaceRankRecord:synchronize(data)
	super.synchronize(self, data)

	self._score = data.score or 0
	self._winNum = data.winNum or 0
end

PetWorldScoreRankRecord = class("PetWorldScoreRankRecord", BaseRankRecord, _M)

PetWorldScoreRankRecord:has("_score", {
	is = "r"
})
PetWorldScoreRankRecord:has("_winNum", {
	is = "r"
})

function PetWorldScoreRankRecord:initialize()
	super.initialize(self)

	self._rankType = RankType.KPetWorldScore
end

function PetWorldScoreRankRecord:synchronize(data)
	super.synchronize(self, data)

	self._score = data.value or 0
	self._winNum = data.winNum or 0
end

ClubRankRecord = class("ClubRankRecord", BaseRankRecord, _M)

ClubRankRecord:has("_clubName", {
	is = "r"
})
ClubRankRecord:has("_presidentName", {
	is = "r"
})
ClubRankRecord:has("_comatValue", {
	is = "r"
})
ClubRankRecord:has("_clubId", {
	is = "r"
})
ClubRankRecord:has("_clubLevel", {
	is = "r"
})
ClubRankRecord:has("_clubHeadImg", {
	is = "r"
})
ClubRankRecord:has("_playerMax", {
	is = "r"
})
ClubRankRecord:has("_playerCount", {
	is = "r"
})
ClubRankRecord:has("_announce", {
	is = "r"
})

function ClubRankRecord:initialize()
	super.initialize(self)

	self._rankType = RankType.kClub
end

function ClubRankRecord:synchronize(data)
	local clubData = {
		rank = data.rank,
		vipLevel = data.presidentVip,
		rid = data.president,
		nickname = data.presidentName,
		level = data.presidentLevel,
		headImage = data.presidentImg,
		combat = data.presidentCombat,
		slogan = Strings:get(data.presidentSlogan),
		heroes = data.presidentHeroes,
		master = data.presidentMasterId,
		online = data.online,
		change = data.change,
		clubName = data.clubName,
		offlineTime = data.lastOfflineTime
	}

	super.synchronize(self, clubData)

	self._clubName = data.clubName
	self._presidentName = data.presidentName
	self._comatValue = data.value
	self._clubId = data.clubId
	self._clubHeadImg = data.headImg
	self._playerMax = data.playerMax
	self._announce = data.announce
	self._playerCount = data.playerCount
	self._clubLevel = data.level
	self._isApply = data.isApply
end

ClubBossRankRecord = class("ClubBossRankRecord", BaseRankRecord, _M)

ClubBossRankRecord:has("_clubName", {
	is = "r"
})
ClubBossRankRecord:has("_presidentName", {
	is = "r"
})
ClubBossRankRecord:has("_comatValue", {
	is = "r"
})
ClubBossRankRecord:has("_clubId", {
	is = "r"
})
ClubBossRankRecord:has("_clubLevel", {
	is = "r"
})
ClubBossRankRecord:has("_clubHeadImg", {
	is = "r"
})
ClubBossRankRecord:has("_playerMax", {
	is = "r"
})
ClubBossRankRecord:has("_playerCount", {
	is = "r"
})
ClubBossRankRecord:has("_announce", {
	is = "r"
})

function ClubBossRankRecord:initialize()
	super.initialize(self)

	self._rankType = RankType.kClubBoss
end

function ClubBossRankRecord:synchronize(data)
	local clubData = {
		rank = data.rank,
		vipLevel = data.presidentVip,
		rid = data.president,
		nickname = data.presidentName,
		level = data.presidentLevel,
		headImage = data.presidentImg,
		combat = data.presidentCombat,
		slogan = Strings:get(data.presidentSlogan),
		heroes = data.presidentHeroes,
		master = data.presidentMasterId,
		online = data.online,
		change = data.change,
		clubName = data.clubName,
		offlineTime = data.lastOfflineTime
	}

	super.synchronize(self, clubData)

	self._clubName = data.clubName
	self._presidentName = data.presidentName
	self._comatValue = data.value
	self._clubId = data.clubId
	self._clubHeadImg = data.headImg
	self._playerMax = data.playerMax
	self._announce = data.announce
	self._playerCount = data.playerCount
	self._clubLevel = data.level
	self._isApply = data.isApply
end

SpGoldRankRecord = class("SpGoldRankRecord", BaseRankRecord, _M)

SpGoldRankRecord:has("_damage", {
	is = "r"
})

function SpGoldRankRecord:initialize()
	super.initialize(self)

	self._rankType = RankType.kGold
end

function SpGoldRankRecord:synchronize(data)
	super.synchronize(self, data)

	self._damage = data.combat or 0
end

SpExpRankRecord = class("SpExpRankRecord", BaseRankRecord, _M)

SpExpRankRecord:has("_damage", {
	is = "r"
})

function SpExpRankRecord:initialize()
	super.initialize(self)

	self._rankType = RankType.kExp
end

function SpExpRankRecord:synchronize(data)
	super.synchronize(self, data)

	self._damage = data.combat or 0
end

SpCrystalRankRecord = class("SpCrystalRankRecord", BaseRankRecord, _M)

SpCrystalRankRecord:has("_damage", {
	is = "r"
})

function SpCrystalRankRecord:initialize()
	super.initialize(self)

	self._rankType = RankType.kCrystal
end

function SpCrystalRankRecord:synchronize(data)
	super.synchronize(self, data)

	self._damage = data.combat or 0
end

MapRankRecord = class("MapRankRecord", BaseRankRecord, _M)

MapRankRecord:has("_dp", {
	is = "r"
})

function MapRankRecord:initialize()
	super.initialize(self)

	self._rankType = RankType.kMap
	self._dp = 0
end

function MapRankRecord:synchronize(data)
	super.synchronize(self, data)

	self._dp = data.value or 0
end

MazeRankRecord = class("MazeRankRecord", BaseRankRecord, _M)

MazeRankRecord:has("_chapterCount", {
	is = "r"
})

function MazeRankRecord:initialize()
	super.initialize(self)

	self._rankType = RankType.kMaze
	self._chapterCount = 0
end

function MazeRankRecord:synchronize(data)
	super.synchronize(self, data)

	self._chapterCount = data.chapterCount or 0
end

ArenaRankRecord = class("ArenaRankRecord", BaseRankRecord, _M)

ArenaRankRecord:has("_score", {
	is = "r"
})

function ArenaRankRecord:initialize()
	super.initialize(self)

	self._rankType = RankType.kArena
	self._score = 0
end

function ArenaRankRecord:synchronize(data)
	super.synchronize(self, data)

	self._score = data.value or 0
end

CrusadeRankRecord = class("CrusadeRankRecord", BaseRankRecord, _M)

CrusadeRankRecord:has("_point", {
	is = "r"
})

function CrusadeRankRecord:initialize()
	super.initialize(self)

	self._rankType = RankType.kCrusade
	self._point = 0
end

function CrusadeRankRecord:synchronize(data)
	super.synchronize(self, data)

	self._point = data.value or 0
end

MiniGameRankRecord = class("MiniGameRankRecord", BaseRankRecord, _M)

MiniGameRankRecord:has("_score", {
	is = "r"
})

function MiniGameRankRecord:initialize()
	super.initialize(self)

	self._rankType = RankType.kMiniGame
	self._score = 0
end

function MiniGameRankRecord:synchronize(data)
	super.synchronize(self, data)

	self._score = data.value or 0
end

RTPKRankRecord = class("RTPKRankRecord", BaseRankRecord, _M)

RTPKRankRecord:has("_score", {
	is = "r"
})

function RTPKRankRecord:initialize()
	super.initialize(self)

	self._rankType = RankType.KRTPK
	self._score = 0
end

function RTPKRankRecord:synchronize(data)
	super.synchronize(self, data)

	self._rank = data.rank
	self._rid = data.r or data.rid
	self._headId = data.h or data.headImage
	self._name = data.n or data.nickname
	self._level = data.l or data.level
	self._headFrame = data.f or data.headFrame
	self._board = data.s or data.board
	self._combat = data.c or data.combat
	self._nickName = data.n or data.nickname
	self._score = data.p or data.value
end
