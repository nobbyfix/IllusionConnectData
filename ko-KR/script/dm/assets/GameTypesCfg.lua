CurrencyIdKind = {
	kAcitvityStaminaPower = "IR_AcitvityStamina",
	kAcitvityHalloweenPower = "IR_HalloweenStamina",
	kGoldDrawItem = "IM_GoldDraw",
	kMazeNormalGold = "IR_PansLabGOLD",
	kPve = "IR_Pve",
	kSurface = "IR_Surface",
	kEquipPiece = "IR_Equip",
	kActivityHolidayPower = "IR_HolidayStamina",
	kAcitvityZuoHePower = "IR_ZuoHeAcitvityStamina",
	kAcitvitySummerPower = "IR_SummerAcitvityStamina",
	kDiamondDrawExItem = "IM_DiamondDrawEX",
	kCrusadeEnergy = "IR_Crusade_Energy",
	kMazeGold = "IR_PansLab",
	kClub = "IR_Club",
	kCrystal = "IR_Crystal",
	kMazeInfinityGold = "IR_PansLabInfGOLD",
	kGold = "IR_Gold",
	kAcitvityWxhPower = "IR_WuXiuHuiAcitvityStamina",
	kTECH = "IR_TECH",
	kPower = "IR_Power",
	kPetRace = "IR_KON",
	kFragment = "IR_Fragment",
	kHonor = "IR_Arena",
	kAcitvitySnowPower = "IR_SnowflakeStamina",
	kTrial = "IR_Tower",
	kDiamond = "IR_Diamond",
	kEquip13 = "IR_Equip13",
	kEquip14 = "IR_Equip14",
	kDiamondDrawItem = "IM_DiamondDraw"
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
	STAGE_EQUIP = "EQUIPMENT_STAGE",
	WORLD_MAP = "WORLD_MAP",
	STAGE_SKILL2 = "SKILL_2_STAGE",
	STAGE_NORMAL = "STAGE_NORMAL",
	DREAM = "DREAM",
	EXP_STAGE = "EXP_STAGE",
	STAGE_ELITE = "ELITE",
	CRYSTAL_STAGE = "CRYSTAL_STAGE",
	GOLD_STAGE = "GOLD_STAGE",
	PRACTICE = "PRACTICE",
	STAGE_SKILL3 = "SKILL_3_STAGE"
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
	kBLOCKSPOPEN = "BLOCKSPOPEN",
	KEightLogin = "EightLogin",
	KTASKHEROCOLLECT = "TASKHEROCOLLECT",
	KTASKMONTHCARD = "TASKMONTHCARD",
	KKuaiShouApp = "KuaiShouApp",
	KTASKCOMMON = "TASKCOMMON",
	KAZhanApp = "AZhanApp",
	KColourEgg = "COLOUREGG",
	KTASKSTAGESTAR = "TASKSTAGESTAR",
	kTASK = "TASK",
	KActivityBlock = "ActivityBlock",
	kBLOCKSPEXTRA = "BLOCKSPEXTRA",
	KTASKCHOICE = "TaskChoice",
	KTASKCOLLECT = "TASKCOLLECT",
	KLOGINTIME = "LOGINTIME",
	kActivityBlockEgg = "ActivityBlockEgg",
	KActivityBlockMap = "ActivityBlockMap",
	KEightLoginCommon = "EightLoginCommon",
	KDrawCardFeedbackActivity = "REWARDPOINTS",
	KRechargeActivity = "Gashapon",
	KExchange = "Exchange",
	KActivitySupport = "ActivitySupport",
	kDRAWCARDOPEN = "DRAWCARDOPEN",
	KMonsterShop = "MONSTERSHOP",
	KTASKMONTHCARDSTAGE = "TASKMONTHCARDSTAGE",
	KTPURCHASE = "TPURCHASE",
	KTASKCOLLECTSTAR = "TASKCOLLECTSTAR",
	KActivityPass = "BattlePass",
	KEXCHANGE = "EXCHANGE",
	KActivityClubBoss = "ActivityClubBoss",
	KMiniGame = "MINIGAME"
}
ActivityId = {
	kActivityBlock = "ActivityBlock",
	kActivityBlockZuoHe = "ActivityBlock_ZuoHe_Support",
	kActivityBlockSummer = "ActivityBlock_Summer",
	kActivityWxh = "ActivityBlock_WuXiuHui_Support"
}
ActivityComplexId = {
	kActivityBlock = "ActivityBlock",
	kActivityWxh = "ActivityBlock_WuXiuHui_Support",
	kActivityBlockWsj = "ActivityBlock_Halloween",
	kActivityBlockZuoHe = "ActivityBlock_ZuoHe_Support",
	kActivityBlockSummer = "ActivityBlock_Summer"
}
ActivityType_UI = {
	kActivityWxh = "ACTIVITYWUXIUHUI",
	kActivityBlockSummer = "ACTIVITYSUMMER",
	kActivityBlockWsj = "ACTIVITYHALLOWEEN",
	kActivityBlock = "ACTIVITYBLOCKGOLDEGG",
	kActivityBlockZuoHe = "ACTIVITYSUPPORT",
	kActivityPassShop = "BattlePassShop",
	KActivityBlockSnowflake = "ACTIVITYSNOWFLAKE",
	KActivitySupportHoliday = "ACTIVITYSUPPORTHOLIDAY",
	kActivityPass = "BattlePass",
	KLOGINTIME = "LOGINTIME",
	KActivityBlockHoliday = "ACTIVITYHOLIDAY"
}
ResetMode = {
	kMonth1 = "MONTH",
	kMonth = "Month",
	kCD = "CD",
	kWeek = "Week",
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
	kSoundCVDownloadKey = "sound_cv_download_over",
	kEffectVolumeKey = "setting_effect_volume",
	kSpStageRedKey = "spstage_red",
	kExploreSpeedKey = "explore_speed",
	kCrusadeViewRedByPower = "kCrusadeViewRedByPower",
	kCrusadeFloorNum = "kCrusadeFloorNum",
	kMusicOffKey = "setting_music",
	kEquipQuickSelectKey = "equip_star_quick_select",
	kHeroQuickSelectKey = "hero_star_quick_select",
	kCurSeasonForIsShowView = "kCurSeasonForIsShowView",
	kSoundCVDownloadStartKey = "sound_cv_download_start",
	kBag_Compose_Show = "bag_compose_show",
	kClubBossRedKey = "clubBoss_red",
	kMusicVolumeKey = "setting_music_volume",
	kPackageDownloadStartKey = "package_download_start",
	kAutoDownloadKey = "auto_download_over",
	kRoleEffectOffKey = "setting_role_effect",
	kSpinePortraitDownloadKey = "spine_portrait_download_over"
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
	KStageGold = "StageGold",
	KMapExplore = "MapExplore",
	KActivity = "Activity",
	KStageCrystal = "StageCrystal",
	KMaze = "Maze",
	KStageExp = "StageExp",
	KStagePractice = "StagePractice",
	KTower1 = "Tower1",
	KCrusade = "Crusade",
	KStageElite = "StageElite",
	KFriendPK = "FriendPK",
	KKOF = "KOF",
	KArena = "Arena",
	KClubBoss = "ClubBoss",
	kDream = "DreamChallenge"
}
kStoreRoomName = "StoreRoom"
litTypeMap = {
	NORMAL = "Normal",
	ELITE = "Elite"
}
kMasterState = {
	Forbidden = 2,
	Locked = 1,
	Normal = 3
}
