CurrencyIdKind = {
	kCrusadeEnergy = "IR_Crusade_Energy",
	kSurface = "IR_Surface",
	kActivityHolidayPower = "IR_HolidayStamina",
	kDiamondDrawExItem = "IM_DiamondDrawEX",
	kPve = "IR_Pve",
	kGoldDrawItem = "IM_GoldDraw",
	kActivityFemalePower = "IR_FemaleStamina",
	kActivityPurewhite = "IR_PurewhiteStamina",
	kDiamondDrawURItem = "IM_DiamondDraw_UR",
	kActivityStoryBookPower = "IR_StoryBookStamina",
	kActivityMusicPower = "IR_MusicFestivalStamina",
	kActivityDetectivePower = "IR_DetectiveStamina",
	kActivityReZeroPower = "IR_ReZeroStamina",
	kClub = "IR_Club",
	kActivityFireWorksPower = "IR_FireWorksStamina",
	kActivityTerrorPower = "IR_TerrorStamina",
	kGold = "IR_Gold",
	kAcitvityHalloweenPowerRe = "IR_HalloweenStamina_Re",
	kActivityRiddlePower = "IR_RiddleStamina",
	kActivityDuskPower = "IR_DuskStamina",
	kActivityDramaPower = "IR_DramaStamina",
	kCrystal = "IR_Crystal",
	kTECH = "IR_TECH",
	kActivitySilentNightPower = "IR_SilentNightStamina",
	kAcitvitySnowPower = "IR_SnowflakeStamina",
	kTrial = "IR_Tower",
	kActivityRiddlePowerRe = "IR_RiddleStamina_Re",
	kMazeGold = "IR_PansLab",
	kEquip13 = "IR_Equip13",
	kMazeNormalGold = "IR_PansLabGOLD",
	kEquip14 = "IR_Equip14",
	kDiamondDrawItem = "IM_DiamondDraw",
	kActivityFemalePowerRe = "IR_FemaleStamina_Re",
	kAcitvityHalloweenPower = "IR_HalloweenStamina",
	kMazeInfinityGold = "IR_PansLabInfGOLD",
	kActivityKnightPower = "IR_KnightStamina",
	kActivitySunflowerPower = "IR_SunflowerStamina",
	kEquipPiece = "IR_Equip",
	kActivityDeepSeaPowerRe = "IR_DeepSeaStamina_Re",
	kPetRace = "IR_KON",
	kAcitvityZuoHePower = "IR_ZuoHeAcitvityStamina",
	kAcitvitySummerPower = "IR_SummerAcitvityStamina",
	KMasterStage_Exp = "IM_MasterStage_Exp",
	kActivityBakingPower = "IR_BakingStamina",
	kStageArenaPower = "IR_StageArena",
	kActivityFirePower = "IR_FireStamina",
	kAcitvityWxhPower = "IR_WuXiuHuiAcitvityStamina",
	kPower = "IR_Power",
	kActivityDeepSeaPower = "IR_DeepSeaStamina",
	kFragment = "IR_Fragment",
	kHonor = "IR_Arena",
	kActivityAnimalPower = "IR_AnimalStamina",
	kStageArenaOldCoin = "IM_StageArena",
	kDiamond = "IR_Diamond",
	kAcitvityStaminaPower = "IR_AcitvityStamina",
	kActivitySummerRePower = "IR_SummerReStamina",
	kDiamondDrawReZeroItem = "IM_DiamondDraw_ReZero",
	kActivityCollapsedPower = "IR_CollapsedStamina"
}
CurrencyType = {
	kGold = 0,
	kPve = 6,
	kCrystal = 4,
	kArena = 7,
	kActionPoint = 3,
	kDiamond = 1,
	kExp = 5,
	kClub = 8,
	kGiftDiamond = 2
}
SpecialEffectDesId = {
	GoldOreElevate = "SpEftDesc_Production10",
	ExpOreElevate = "SpEftDesc_Production12",
	CrystalOreProduction = "SpEftDesc_Production5",
	GoldOreProduction = "SpEftDesc_Production4",
	GoldStorage = "SpEftDesc_Production7",
	CrystalOreElevate = "SpEftDesc_Production11",
	DeckCost = "SpEftDesc_Production1",
	ExpOreProduction = "SpEftDesc_Production6",
	ExpStorage = "SpEftDesc_Production9",
	DeckCardNum = "SpEftDesc_Production2",
	CrystalStorage = "SpEftDesc_Production8",
	Energy = "SpEftDesc_Production3"
}
SpecialEffectIconId = {
	DeckCost = function ()
		local _img = ccui.ImageView:create("icon_bg_ka_xiyoudi_new.png", ccui.TextureResType.plistType)

		_img:setScale(0.45)
		_img:setPosition(cc.p(3, 0))

		return _img
	end,
	GoldOreProduction = function ()
		local _img = ccui.ImageView:create("icon_jinbi_1.png", ccui.TextureResType.plistType)

		_img:setScale(0.63)
		_img:setPosition(cc.p(0, 1))

		return _img
	end,
	CrystalOreProduction = function ()
		local _img = ccui.ImageView:create("icon_shuijing_1.png", ccui.TextureResType.plistType)

		_img:setScale(0.63)
		_img:setPosition(cc.p(-0.8, 1))

		return _img
	end,
	ExpOreProduction = function ()
		local _img = ccui.ImageView:create("asset/items/item_200021.png", ccui.TextureResType.localType)

		_img:setScale(0.63)
		_img:setPosition(cc.p(0, 1))

		return _img
	end
}
SelectItemType = {
	kForUse = 2,
	kForSell = 1,
	kInvalid = -1
}
BagItemShowType = {
	kCompose = "COMPOSE",
	kStuff = "STUFF",
	kFragament = "FRAGMENT",
	kEquip = "EQUIP",
	kConsumable = "CONSUMABLE",
	kOther = "OTHER",
	kAll = "ALL"
}
rewardShowType = {
	firstBig = "firstBig",
	normal = "normal"
}
TaskStatus = {
	kUnfinish = 0,
	kGet = 2,
	kFinishNotGet = 1,
	kInvalid = -1
}
TimeRecordType = {
	kDrawDiamondFree = "drawDiamondFree",
	kBuyAcceTimes = "idleBuyAccelerate",
	kDrawDiamondAll = "drawDiamondAll",
	kDrawEquipAll = "drawEquipAll",
	kBuyStamina = "buyStamina",
	kDrawGoldFree = "drawGoldFree",
	kAcceTimes = "idleDefaultAccelerateTimes",
	kBuyExp = "buyExp",
	kBuyGold = "buyGold",
	kMapDailyRewardTimes = "mapDailyReward",
	kHeroStoryTotalNum = "heroStoryTotalNum",
	kBuyCrystal = "buyCrystal",
	kChangeName = "changeNickname"
}
StageTeamType = {
	ARENA_DEF = "ARENA_DEF",
	ARENA_ATK = "ARENA_ATK",
	CRUSADE = "CRUSADE",
	STAGE_SKILL1 = "SKILL_1_STAGE",
	STAGE_ARENA_3 = "STAGE_ARENA_3",
	STAGE_SKILL2 = "SKILL_2_STAGE",
	STAGE_NORMAL = "STAGE_NORMAL",
	CRYSTAL_STAGE = "CRYSTAL_STAGE",
	RTPK = "RTPK",
	DREAM = "DREAM",
	STAGE_ELITE = "ELITE",
	CHESS_ARENA_DEF = "CHESS_ARENA_DEF",
	GOLD_STAGE = "GOLD_STAGE",
	STAGE_EQUIP = "EQUIPMENT_STAGE",
	HOUSE = "HOUSE",
	STAGE_SKILL3 = "SKILL_3_STAGE",
	STAGE_ARENA_2 = "STAGE_ARENA_2",
	CHESS_ARENA_ATK = "CHESS_ARENA_ATK",
	STAGE_ARENA_1 = "STAGE_ARENA_1",
	EXP_STAGE = "EXP_STAGE",
	WORLD_MAP = "WORLD_MAP",
	COOPERATE_BOSS = "COOPERATE_BOSS",
	PRACTICE = "PRACTICE"
}
StageAttrAddType = {
	HERO_TYPE = "HERO_TYPE",
	HERO_AWAKE = "HERO_AWAKE",
	HERO_BUFF = "HERO_BUFF",
	HERO_FULL_STAR = "HERO_FULL_STAR",
	HERO = "HERO",
	HERO_SKILL = "HERO_SKILL"
}
SceneCombatsType = {
	kMAP = "MAP",
	kCRYSTALSTAGE = "CRYSTALSTAGE",
	kARENA = "ARENA",
	kPANSLAB = "PANSLAB",
	kCRUSADE = "CRUSADE",
	kTOWER = "TOWER",
	kAll = "ALL",
	kEXPSTAGE = "EXPSTAGE",
	kTOURNAMENT = "TOURNAMENT",
	kELITE = "ELITE",
	kGOLDSTAGE = "GOLDSTAGE"
}
HeroStarCountMax = ConfigReader:getRecordById("ConfigValue", "Hero_Maxstar").content
AttrTypeImage = {
	SPEED = "zhujue_bg_shuxing_4.png",
	UNHURTRATE = "zhujue_bg_shuxing_9.png",
	HP = "zhujue_bg_shuxing_3.png",
	ATK = "zhujue_bg_shuxing_1.png",
	UNBLOCKRATE = "zhujue_bg_shuxing_10.png",
	REFLECTION = "zhujue_bg_shuxing_13.png",
	BLOCKSTRG = "zhujue_bg_shuxing_7.png",
	CRITSTRG = "zhujue_bg_shuxing_12.png",
	HURTRATE = "zhujue_bg_shuxing_11.png",
	DEF = "zhujue_bg_shuxing_2.png",
	BLOCKRATE = "zhujue_bg_shuxing_6.png",
	UNCRITRATE = "zhujue_bg_shuxing_8.png",
	ABSORPTION = "zhujue_bg_shuxing_14.png",
	CRITRATE = "zhujue_bg_shuxing_5.png"
}
RoleModelType = {
	kHero = "Hero",
	kPortrait = "Portrait",
	kEnemyHero = "EnemyHero",
	kEnemyMaster = "EnemyMaster",
	kSummoned = "Summoned",
	kMaster = "Master"
}
CustomDataKey = {
	kHeroGalleryPast = "HeroGalleryPast",
	kShopFragment = "ShopFragment",
	kExploreBeforeStory = "ExploreBeforeStory",
	kExploreBuff = "ExploreBuff",
	kExploreFinish = "ExploreFinish",
	kHeroSound = "HeroSound",
	kHeroEvolution = "HeroEvolution"
}
HeroEquipType = {
	kStarItem = "StarItem",
	kShoes = "Shoes",
	kWeapon = "Weapon",
	kTops = "Tops",
	kDecoration = "Decoration"
}
EquipPositionToType = {
	HeroEquipType.kWeapon,
	HeroEquipType.kTops,
	HeroEquipType.kShoes,
	HeroEquipType.kDecoration
}
EquipStrengthenConsumeNum = 5
ExploreTypeCfgInfo = {
	blockGridSize = cc.size(10, 10),
	mapSize = cc.size(9600, 9600)
}
ExploreTypeCfgInfo.blockGridNumSize = cc.size(ExploreTypeCfgInfo.mapSize.width / ExploreTypeCfgInfo.blockGridSize.width, ExploreTypeCfgInfo.mapSize.height / ExploreTypeCfgInfo.blockGridSize.height)
GalleryPartyType = {
	kBSNCT = "BSNCT",
	kWNSXJ = "WNSXJ",
	kUNKNOWN = "UNKNOWN",
	kMNJH = "MNJH",
	kDWH = "DWH",
	kXD = "XD",
	kSSZS = "SSZS"
}
AlertResponse = {
	kClose = "close",
	kCancel = "cancel",
	kOK = "ok"
}
ItemTipsDirection = {
	kRight = 4,
	kLeft = 3,
	kDown = 2,
	kCenter = 5,
	kUp = 1
}
SurfaceType = {
	kOther = 4,
	kShop = 2,
	kActivity = 3,
	kDefault = 1,
	kAwake = 5
}
ActivityType = {
	KTPURCHASE = "TPURCHASE",
	kDRAWCARDOPEN = "DRAWCARDOPEN",
	KTASKHEROCOLLECT = "TASKHEROCOLLECT",
	KLOGINTIME = "LOGINTIME",
	KTASKCOLLECT = "TASKCOLLECT",
	kActivityBlockEgg = "ActivityBlockEgg",
	KActivityBlock = "ActivityBlock",
	KColourEgg = "COLOUREGG",
	KKuaiShouApp = "KuaiShouApp",
	KActivityBlockMap = "ActivityBlockMap",
	kBLOCKSPOPEN = "BLOCKSPOPEN",
	kBLOCKSPEXTRA = "BLOCKSPEXTRA",
	KTASKCHOICE = "TaskChoice",
	KActivitySupport = "ActivitySupport",
	KReturn = "RETURN",
	KReturnCarnival = "RETURNCARNIVAL",
	KActivityBlockMapNew = "ActivityBlockMap_New",
	KCooperateBoss = "COOPERATEBOSS",
	KDrawCardFeedbackActivity = "REWARDPOINTS",
	kDRAWCARDSP = "DRAWCARDSP",
	kTASK = "TASK",
	kDRAWCARDUR = "DRAWCARDUR",
	KActivityMail = "PreMail",
	KAZhanApp = "AZhanApp",
	KTASKCOLLECTSTAR = "TASKCOLLECTSTAR",
	KEXCHANGE = "EXCHANGE",
	KMiniGame = "MINIGAME",
	KMonsterShop = "MONSTERSHOP",
	KEightLogin = "EightLogin",
	KTASKMONTHCARD = "TASKMONTHCARD",
	KTASKCOMMON = "TASKCOMMON",
	KLetter = "LETTER",
	KTASKSTAGESTAR = "TASKSTAGESTAR",
	kActivityZero = "ActivityMonop",
	KPuzzleGame = "Puzzle",
	KEightLoginCommon = "EightLoginCommon",
	KRechargeActivity = "Gashapon",
	KTASKMONTHCARDSTAGE = "TASKMONTHCARDSTAGE",
	KActivityPass = "BattlePass",
	KActivityClubBoss = "ActivityClubBoss"
}
ActivityId = {
	kActivityBlock = "ActivityBlock",
	kActivityBlockZuoHe2 = "ActivityBlock_ZuoHe02_Support",
	kActivityWxh = "ActivityBlock_WuXiuHui_New_Support",
	kActivityBlockZuoHe = "ActivityBlock_ZuoHe_Support",
	kActivityBlockSummer = "ActivityBlock_Summer"
}
ActivityComplexId = {
	kActivityBlock = "ActivityBlock",
	kActivityWxh = "ActivityBlock_WuXiuHui_New_Support",
	kActivityBlockWsj = "ActivityBlock_Halloween",
	kActivityBlockZuoHe = "ActivityBlock_ZuoHe_Support",
	KActivityBlockDetetive = "ActivityBlock_Detective",
	kActivityBlockSummer = "ActivityBlock_Summer"
}
ActivityType_UI = {
	kActivityBlock = "ACTIVITYBLOCKGOLDEGG",
	kActivityReZero = "ACTIVITYREZERO",
	kActivityBlockSummer = "ACTIVITYSUMMER",
	KActivityDusk = "ACTIVITYDUSK",
	KActivitySummerRe = "ACTIVITYSUMMERRE",
	KActivityBlockDetetive = "ACTIVITYDETECTIVE",
	KActivityDeepSea = "ACTIVITYDEEPSEA",
	KActivityBlockBaking = "ACTIVITYBAKING",
	KActivitySupportHoliday = "ACTIVITYSUPPORTHOLIDAY",
	KActivityStoryBook = "ACTIVITYSTORYBOOK",
	KActivitySunflower = "ACTIVITYSUNFLOWER",
	KActivityKnight = "ACTIVITYKNIGHT",
	KActivityCollapsed = "ACTIVITYCOLLAPSED",
	kActivityZero = "ACTIVITYREZERO",
	KLOGINTIME = "LOGINTIME",
	KActivityBlockMusic = "ACTIVITYMUSICFESTIVAL",
	KActivityRiddle = "ACTIVITYRIDDLE",
	KActivityFire = "ACTIVITYFIRE",
	kActivityBlockWsj = "ACTIVITYHALLOWEEN",
	KActivityFireWorks = "ACTIVITYFIREWORKS",
	kActivityBlockZuoHe = "ACTIVITYSUPPORT",
	kActivityPassShop = "BattlePassShop",
	KTASKSTAGESTAR = "TASKSTAGESTAR",
	KActivityDrama = "ACTIVITYDRAMA",
	KActivityFemale = "ACTIVITYFEMALE",
	KActivityAnimal = "ACTIVITYANIMAL",
	kActivityWxh = "ACTIVITYWUXIUHUI",
	kActivityPass = "BattlePass",
	KActivityTerror = "ACTIVITYTERROR",
	KActivitySilentNight = "ACTIVITYSILENTNIGHT",
	KActivityBlockSnowflake = "ACTIVITYSNOWFLAKE",
	KActivityBlockHoliday = "ACTIVITYHOLIDAY"
}
ResetMode = {
	kMonth1 = "MONTH",
	kMonth = "Month",
	kCD = "CD",
	kWeek = "Week",
	kCircle = "CIRCLE",
	kWeek1 = "WEEK"
}
ExPackCgf = {
	scene_150 = 64,
	heros_150 = 32,
	sound_150 = 256,
	explore_150 = 16,
	Spine_Portrait = 4,
	animi_150 = 8,
	Music_Expand = 2,
	Sound_CV = 1,
	items_150 = 128
}
SoundVolumeMax = 1
UserDefaultKey = {
	kSpinePortraitDownloadStartKey = "spine_portrait_download_star",
	kRoleEffectVolumeKey = "setting_role_effect_volume",
	kEffectOffKey = "setting_effect",
	kGetNewHeroRed = "new_hero_red",
	kPackageDownloadKey = "package_download_over",
	KLeadStageAreanaNewSeasonKey = "leadStageAreana_new_season",
	kEffectVolumeKey = "setting_effect_volume",
	KNewArenaSeasonIsNewTip = "KNewArenaSeasonIsNewTip",
	kExploreSpeedKey = "explore_speed",
	kCrusadeViewRedByPower = "kCrusadeViewRedByPower",
	kCrusadeFloorNum = "kCrusadeFloorNum",
	kMusicOffKey = "setting_music",
	kEquipQuickSelectKey = "equip_star_quick_select",
	kHeroQuickSelectKey = "hero_star_quick_select",
	kCurSeasonForIsShowView = "kCurSeasonForIsShowView",
	kSoundCVDownloadStartKey = "sound_cv_download_start",
	KLeadStageAreanaTishiState = "leadStageAreana_tishi_state",
	kRTPKNewSeasonKey = "rtpk_new_season",
	KLeadStageAreanaRankState = "leadStageAreana_rank_state",
	kClubBossRedKey = "clubBoss_red",
	kMusicVolumeKey = "setting_music_volume",
	kPackageDownloadStartKey = "package_download_start",
	KURExchangeRedPoint = "KURExchangeRedPoint",
	kAutoDownloadKey = "auto_download_over",
	kRoleEffectOffKey = "setting_role_effect",
	KURMapCountKey = "KURMapCountKey",
	kSoundCVDownloadKey = "sound_cv_download_over",
	KNewArenaSeasonIsNew = "KNewArenaSeasonIsNew",
	kSpStageRedKey = "spstage_red",
	KSetBoardMovePos = "KSetBoardMovePos",
	kSpinePortraitDownloadKey = "spine_portrait_download_over",
	kBag_Compose_Show = "bag_compose_show"
}
CommonRewardType = {
	kSoundDownload = "SOUND_DOWNLOAD",
	kPortraitDownload = "PICTURE_DOWNLOAD"
}
DownloadPackType = {
	kSmallPackage = 2,
	kMediumPackage = 1,
	kNoPackage = 0
}
GalleryMemoryType = {
	ACTIVI = "ACTIVI",
	HERO = "HERO",
	STORY = "STORY"
}
GalleryMemoryPackType = {
	ACTIVI = "ACTIVILIST",
	HERO = "HEROLIST",
	STORY = "STORYLIST"
}
LoadingType = {
	KStageNormal = "StageNormal",
	KStagePractice = "StagePractice",
	KMapExplore = "MapExplore",
	KActivity = "Activity",
	KStageCrystal = "StageCrystal",
	KMaze = "Maze",
	KStageExp = "StageExp",
	KStageElite = "StageElite",
	KArena = "Arena",
	KClubBoss = "ClubBoss",
	KKOF = "KOF",
	KFriendPK = "FriendPK",
	kHouse = "kHouse",
	kChessArena = "ChessArena",
	KStageGold = "StageGold",
	kRTPK = "RTPK",
	kCooperate = "Cooperate",
	kDream = "DreamChallenge",
	KTower1 = "Tower1",
	KCrusade = "Crusade",
	kLeadStageArena = "StageArena"
}
kStoreRoomName = "StoreRoom"
litTypeMap = {
	HARD = "Hard",
	NORMAL = "Normal",
	ELITE = "Elite"
}
kMasterState = {
	Forbidden = 2,
	Locked = 1,
	Normal = 3
}
PowerConfigMap = {
	IM_HalloweenBossStamina = {
		tips = "ACTIVITY_Halloween_NOT_ENOUGH_1",
		func = "getItemCount"
	},
	IM_HalloweenBossStamina_Re = {
		tips = "ACTIVITY_Halloween_NOT_ENOUGH_1",
		func = "getItemCount"
	},
	IM_SummerBossStamina = {
		tips = "ACTIVITY_ENERGY_NOT_ENOUGH2_Summer",
		func = "getItemCount"
	},
	IM_WuXiuHuiBossStamina = {
		tips = "ACTIVITY_ENERGY_NOT_ENOUGH2_WXH",
		func = "getItemCount"
	},
	IM_ZuoHeBossStamina = {
		tips = "ACTIVITY_ENERGY_NOT_ENOUGH2_ZUOHE",
		func = "getItemCount"
	},
	IM_BossJindan = {
		tips = "ACTIVITY_ENERGY_NOT_ENOUGH2",
		func = "getItemCount"
	},
	[CurrencyIdKind.kPower] = {
		all = "Power_RecAll",
		perMin = "Power_RecPerMin",
		next = "Power_RecNext",
		configId = "3",
		tableName = "Reset"
	},
	[CurrencyIdKind.kAcitvityStaminaPower] = {
		all = "Act_Power_RecAll",
		perMin = "Act_Power_RecPerMin",
		next = "Act_Power_RecNext",
		func = "getPowerByCurrencyId",
		configId = "AcitvityStamina_Reset",
		tips = "ACTIVITY_ENERGY_NOT_ENOUGH",
		tableName = "Reset"
	},
	[CurrencyIdKind.kAcitvitySnowPower] = {
		all = "Act_Snowflake_Power_RecAll",
		perMin = "Act_Snowflake_Power_RecPerMin",
		next = "Act_Snowflake_Power_RecNext",
		func = "getPowerByCurrencyId",
		configId = "AcitvitySnowflakeStamina_Reset",
		tips = "ACTIVITY_Snowflake_NOT_ENOUGH_1",
		tableName = "Reset"
	},
	[CurrencyIdKind.kAcitvityZuoHePower] = {
		all = "Act_ZuoHe_Power_RecAll",
		perMin = "Act_ZuoHe_Power_RecPerMin",
		next = "Act_ZuoHe_Power_RecNext",
		func = "getPowerByCurrencyId",
		configId = "AcitvityZuoHeStamina_Reset",
		tips = "ACTIVITY_ENERGY_NOT_ENOUGH3_ZUOHE",
		tableName = "Reset"
	},
	[CurrencyIdKind.kAcitvityWxhPower] = {
		all = "Act_Wxh_Power_RecAll",
		perMin = "Act_Wxh_Power_RecPerMin",
		next = "Act_Wxh_Power_RecNext",
		func = "getPowerByCurrencyId",
		configId = "AcitvityWuXiuHuiStamina_Reset",
		tips = "ACTIVITY_ENERGY_NOT_ENOUGH3_WXH",
		tableName = "Reset"
	},
	[CurrencyIdKind.kAcitvitySummerPower] = {
		all = "Act_Summer_Power_RecAll",
		perMin = "Act_Summer_Power_RecPerMin",
		next = "Act_Summer_Power_RecNext",
		func = "getPowerByCurrencyId",
		configId = "AcitvitySummerStamina_Reset",
		tips = "ACTIVITY_ENERGY_NOT_ENOUGH2_Summer",
		tableName = "Reset"
	},
	[CurrencyIdKind.kAcitvityHalloweenPower] = {
		all = "Act_Halloween_Power_RecAll",
		perMin = "Act_Halloween_Power_RecPerMin",
		next = "Act_Halloween_Power_RecNext",
		func = "getPowerByCurrencyId",
		configId = "AcitvityHalloweenStamina_Reset",
		tips = "ACTIVITY_Halloween_NOT_ENOUGH_2",
		tableName = "Reset"
	},
	[CurrencyIdKind.kAcitvityHalloweenPowerRe] = {
		all = "Act_Halloween_Power_RecAll",
		perMin = "Act_Halloween_Power_RecPerMin",
		next = "Act_Halloween_Power_RecNext",
		func = "getPowerByCurrencyId",
		configId = "AcitvityHalloweenStamina_Reset",
		tips = "ACTIVITY_Halloween_NOT_ENOUGH_2",
		tableName = "Reset"
	},
	[CurrencyIdKind.kActivityHolidayPower] = {
		all = "Act_NewYear_Power_RecAll",
		perMin = "Act_NewYear_Power_RecPerMin",
		next = "Act_NewYear_Power_RecNext",
		func = "getPowerByCurrencyId",
		configId = "AcitvityHolidayStamina_Reset",
		tips = "IR_NewyearStaminaWarning",
		tableName = "Reset"
	},
	[CurrencyIdKind.kActivityDetectivePower] = {
		all = "Act_Detective_Power_RecAll",
		perMin = "Act_Detective_Power_RecPerMin",
		next = "Act_Detective_Power_RecNext",
		func = "getPowerByCurrencyId",
		configId = "AcitvityDetectiveStamina_Reset",
		tips = "ACTIVITY_Detective_ENERGY_NOT_ENOUGH",
		tableName = "Reset"
	},
	[CurrencyIdKind.kActivityMusicPower] = {
		all = "Act_MusicFestival_Power_RecAll",
		perMin = "Act_MusicFestival_Power_RecPerMin",
		next = "Act_MusicFestival_Power_RecNext",
		func = "getPowerByCurrencyId",
		configId = "AcitvityMusicFestivalStamina_Reset",
		tips = "ACTIVITY_MusicFestival_NOT_ENOUGH_1",
		tableName = "Reset"
	},
	[CurrencyIdKind.kActivityBakingPower] = {
		all = "Act_Baking_Power_RecAll",
		perMin = "Act_Baking_Power_RecPerMin",
		next = "Act_Baking_Power_RecNext",
		func = "getPowerByCurrencyId",
		configId = "AcitvityBakingStamina_Reset",
		tips = "ACTIVITY_Baking_ENERGY_NOT_ENOUGH",
		tableName = "Reset"
	},
	[CurrencyIdKind.kActivityCollapsedPower] = {
		all = "Act_Collapsed_Power_RecAll",
		perMin = "Act_Collapsed_Power_RecPerMin",
		next = "Act_Collapsed_Power_RecNext",
		func = "getPowerByCurrencyId",
		configId = "AcitvityCollapsedStamina_Reset",
		tips = "ACTIVITY_Collapsed_ENERGY_NOT_ENOUGH",
		tableName = "Reset"
	},
	[CurrencyIdKind.kActivityKnightPower] = {
		all = "Act_Knight_Power_RecAll",
		perMin = "Act_Knight_Power_RecPerMin",
		next = "Act_Knight_Power_RecNext",
		func = "getPowerByCurrencyId",
		configId = "AcitvityKnightStamina_Reset",
		tips = "ACTIVITY_Knight_NOT_ENOUGH_1",
		tableName = "Reset"
	},
	[CurrencyIdKind.kActivitySunflowerPower] = {
		all = "Act_Sunflower_Power_RecAll",
		perMin = "Act_Sunflower_Power_RecPerMin",
		next = "Act_Sunflower_Power_RecNext",
		func = "getPowerByCurrencyId",
		configId = "AcitvitySunflowerStamina_Reset",
		tips = "ACTIVITY_Sunflower_ENERGY_NOT_ENOUGH",
		tableName = "Reset"
	},
	[CurrencyIdKind.kActivityFirePower] = {
		all = "Act_Fire_Power_RecAll",
		perMin = "Act_Fire_Power_RecPerMin",
		next = "Act_Fire_Power_RecNext",
		func = "getPowerByCurrencyId",
		configId = "AcitvityFireStamina_Reset",
		tips = "ACTIVITY_Fire_NOT_ENOUGH_1",
		tableName = "Reset"
	},
	[CurrencyIdKind.kActivityPurewhite] = {
		all = "Act_PureWhite_Power_RecAll",
		perMin = "Act_PureWhite_Power_RecPerMin",
		next = "Act_PureWhite_Power_RecNext",
		func = "getPowerByCurrencyId",
		configId = "AcitvityPurewhiteStamina_Reset",
		tips = "ACTIVITY_PureWhite_NOT_ENOUGH_1",
		tableName = "Reset"
	},
	[CurrencyIdKind.kStageArenaPower] = {
		all = "StageArena_MainUI35",
		perMin = "StageArena_MainUI33",
		next = "StageArena_MainUI34",
		func = "getPowerByCurrencyId",
		configId = "StageArenaStamina_Reset",
		tips = "StageArena_MainUI31",
		tableName = "Reset"
	},
	[CurrencyIdKind.kActivityFemalePower] = {
		all = "Act_Female_Power_RecAll",
		perMin = "Act_Female_Power_RecPerMin",
		next = "Act_Female_Power_RecNext",
		func = "getPowerByCurrencyId",
		configId = "AcitvityFemaleStamina_Reset",
		tips = "ACTIVITY_Female_NOT_ENOUGH_1",
		tableName = "Reset"
	},
	[CurrencyIdKind.kActivityFemalePowerRe] = {
		all = "Act_Female_Power_RecAll",
		perMin = "Act_Female_Power_RecPerMin",
		next = "Act_Female_Power_RecNext",
		func = "getPowerByCurrencyId",
		configId = "AcitvityFemaleStamina_Reset",
		tips = "ACTIVITY_Female_NOT_ENOUGH_1",
		tableName = "Reset"
	},
	[CurrencyIdKind.kActivitySummerRePower] = {
		all = "Act_SummerRe_Power_RecAll",
		perMin = "Act_SummerRe_Power_RecPerMin",
		next = "Act_SummerRe_Power_RecNext",
		func = "getPowerByCurrencyId",
		configId = "AcitvitySummerReStamina_Reset",
		tips = "ACTIVITY_Female_NOT_ENOUGH_1",
		tableName = "Reset"
	},
	[CurrencyIdKind.kActivityStoryBookPower] = {
		all = "Act_StoryBook_Power_RecAll",
		perMin = "Act_StoryBook_Power_RecPerMin",
		next = "Act_StoryBook_Power_RecNext",
		func = "getPowerByCurrencyId",
		configId = "AcitvityStoryBookStamina_Reset",
		tips = "ACTIVITY_StoryBook_NOT_ENOUGH_1",
		tableName = "Reset"
	},
	[CurrencyIdKind.kActivityReZeroPower] = {
		all = "Act_ReZero_Power_RecAll",
		perMin = "Act_ReZero_Power_RecPerMin",
		next = "Act_ReZero_Power_RecNext",
		func = "getPowerByCurrencyId",
		configId = "AcitvityReZeroStamina_Reset",
		tips = "ACTIVITY_ReZero_NOT_ENOUGH_1",
		tableName = "Reset"
	},
	[CurrencyIdKind.kActivityDeepSeaPower] = {
		all = "Act_DeepSea_Power_RecAll",
		perMin = "Act_DeepSea_Power_RecPerMin",
		next = "Act_DeepSea_Power_RecNext",
		func = "getPowerByCurrencyId",
		configId = "AcitvityDeepSeaStamina_Reset",
		tips = "ACTIVITY_DeepSea_NOT_ENOUGH_1",
		tableName = "Reset"
	},
	[CurrencyIdKind.kActivityFireWorksPower] = {
		all = "Act_FireWorks_Power_RecAll",
		perMin = "Act_FireWorks_Power_RecPerMin",
		next = "Act_FireWorks_Power_RecNext",
		func = "getPowerByCurrencyId",
		configId = "AcitvityFireWorksStamina_Reset",
		tips = "ACTIVITY_FireWorks_NOT_ENOUGH_1",
		tableName = "Reset"
	},
	[CurrencyIdKind.kActivityTerrorPower] = {
		all = "Act_Terror_Power_RecAll",
		perMin = "Act_Terror_Power_RecPerMin",
		next = "Act_Terror_Power_RecNext",
		func = "getPowerByCurrencyId",
		configId = "AcitvityTerrorStamina_Reset",
		tips = "ACTIVITY_Terror_NOT_ENOUGH_1",
		tableName = "Reset"
	},
	[CurrencyIdKind.kActivityRiddlePower] = {
		all = "Act_Riddle_Power_RecAll",
		perMin = "Act_Riddle_Power_RecPerMin",
		next = "Act_Riddle_Power_RecNext",
		func = "getPowerByCurrencyId",
		configId = "AcitvityRiddleStamina_Reset",
		tips = "ACTIVITY_Riddle_NOT_ENOUGH_1",
		tableName = "Reset"
	},
	[CurrencyIdKind.kActivityAnimalPower] = {
		all = "Act_Animal_Power_RecAll",
		perMin = "Act_Animal_Power_RecPerMin",
		next = "Act_Animal_Power_RecNext",
		func = "getPowerByCurrencyId",
		configId = "AcitvityAnimalStamina_Reset",
		tips = "ACTIVITY_Animal_NOT_ENOUGH_1",
		tableName = "Reset"
	},
	[CurrencyIdKind.kActivityDuskPower] = {
		all = "Act_Dusk_Power_RecAll",
		perMin = "Act_Dusk_Power_RecPerMin",
		next = "Act_Dusk_Power_RecNext",
		func = "getPowerByCurrencyId",
		configId = "AcitvityDuskStamina_Reset",
		tips = "ACTIVITY_Dusk_NOT_ENOUGH_1",
		tableName = "Reset"
	},
	[CurrencyIdKind.kActivityRiddlePowerRe] = {
		all = "Act_Riddle_Power_RecAll",
		perMin = "Act_Riddle_Power_RecPerMin",
		next = "Act_Riddle_Power_RecNext",
		func = "getPowerByCurrencyId",
		configId = "AcitvityRiddleStamina_Re_Reset",
		tips = "ACTIVITY_Riddle_NOT_ENOUGH_1",
		tableName = "Reset"
	},
	[CurrencyIdKind.kActivitySilentNightPower] = {
		all = "Act_SilentNight_Power_RecAll",
		perMin = "Act_SilentNight_Power_RecPerMin",
		next = "Act_SilentNight_Power_RecNext",
		func = "getPowerByCurrencyId",
		configId = "AcitvitySilentNightStamina_Reset",
		tips = "ACTIVITY_SilentNight_NOT_ENOUGH_1",
		tableName = "Reset"
	},
	[CurrencyIdKind.kActivityDeepSeaPowerRe] = {
		all = "Act_DeepSea_Power_RecAll",
		perMin = "Act_DeepSea_Power_RecPerMin",
		next = "Act_DeepSea_Power_RecNext",
		func = "getPowerByCurrencyId",
		configId = "AcitvityDeepSeaStamina_Reset_Re",
		tips = "ACTIVITY_DeepSea_NOT_ENOUGH_1",
		tableName = "Reset"
	},
	[CurrencyIdKind.kActivityDramaPower] = {
		all = "Act_Drama_Power_RecAll",
		perMin = "Act_Drama_Power_RecPerMin",
		next = "Act_Drama_Power_RecNext",
		func = "getPowerByCurrencyId",
		configId = "AcitvityDramaStamina_Reset",
		tips = "ACTIVITY_Drama_NOT_ENOUGH_1",
		tableName = "Reset"
	},
	TEST = {
		tips = "ACTIVITY_ENERGY_NOT_ENOUGH",
		func = "getPowerByCurrencyId"
	}
}
MailType = {
	kVersion = 2,
	kNormal = 0
}
RareityStringToNumber = {
	SR = 13,
	SSR = 14,
	R = 12,
	SP = 15
}
