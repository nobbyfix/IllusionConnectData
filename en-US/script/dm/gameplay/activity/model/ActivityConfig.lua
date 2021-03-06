require("dm.gameplay.activity.model.TaskActivity")
require("dm.gameplay.activity.model.CarnivalActivity")
require("dm.gameplay.activity.model.LoginActivity")
require("dm.gameplay.activity.model.ExchangeActivity")
require("dm.gameplay.activity.model.BannerActivity")
require("dm.gameplay.activity.model.BoardActivity")
require("dm.gameplay.activity.model.FreeStaminaActivity")
require("dm.gameplay.activity.model.QuestionActivity")
require("dm.gameplay.activity.model.ActivityTaskMonthCard")
require("dm.gameplay.activity.model.ActivityTaskStageStar")
require("dm.gameplay.activity.model.ActivityFocusOn")
require("dm.gameplay.activity.model.ActivityHeroCollect")
require("dm.gameplay.activity.model.ActivityFateEncounters")
require("dm.gameplay.activity.model.ActivityBlockActivity")
require("dm.gameplay.activity.model.ActivityEggActivity")
require("dm.gameplay.activity.model.ActivityBlockMapActivity")
require("dm.gameplay.activity.model.ActivitySupport")
require("dm.gameplay.activity.model.ActivityClubBoss")
require("dm.gameplay.activity.model.PassActivity")
require("dm.gameplay.activity.model.RecheargeActivity")
require("dm.gameplay.activity.model.ActivityDrawCardFeedback")
require("dm.gameplay.activity.model.MonsterShopActivity")
require("dm.gameplay.activity.model.ActivityColorEggActivity")
require("dm.gameplay.activity.model.ActivityTpurchase")
require("dm.gameplay.activity.model.MiniGameActivity")

ActivityShowTab = {
	kInAll = 3,
	kNotShow = 0,
	kInActivity = 1,
	kInHome = 2
}
ActivityBannerType = {
	kCooperateBoss = "COOPERATEBOSS",
	kPackageShop = "PackageShop",
	kActivity = "Activity"
}
ActivityTaskStatus = {
	kUnfinish = 0,
	kGet = 2,
	kFinishNotGet = 1,
	kInvalid = -1
}
kTaskStatusPriorityMap = {
	[ActivityTaskStatus.kFinishNotGet] = 1,
	[ActivityTaskStatus.kUnfinish] = 2,
	[ActivityTaskStatus.kGet] = 3
}
ActivityModel = {
	TASK = TaskActivity,
	CarnivalMainland = CarnivalActivity,
	ContinueLogin = LoginActivity,
	BANNER = BannerActivity,
	IMG_BOARD = BoardActivity,
	GAME_BOARD = BoardActivity,
	TEXT_BOARD = BoardActivity,
	FreeStamina = FreeStaminaActivity,
	ExtraReward = BoardActivity,
	Questionnaire = QuestionActivity,
	[ActivityType.KEXCHANGE] = ExchangeActivity,
	[ActivityType.kBLOCKSPOPEN] = BoardActivity,
	[ActivityType.kDRAWCARDOPEN] = BoardActivity,
	[ActivityType.KTASKMONTHCARD] = ActivityTaskMonthCard,
	[ActivityType.KActivityPass] = PassActivity,
	[ActivityType.KTASKMONTHCARDSTAGE] = ActivityTaskMonthCard,
	[ActivityType.KTASKSTAGESTAR] = ActivityTaskStageStar,
	[ActivityType.KKuaiShouApp] = ActivityFocusOn,
	[ActivityType.KAZhanApp] = ActivityFocusOn,
	[ActivityType.KTASKHEROCOLLECT] = ActivityHeroCollect,
	[ActivityType.KTASKCHOICE] = ActivityFateEncounters,
	[ActivityType.KActivityBlock] = ActivityBlockActivity,
	[ActivityType.KActivityBlockMap] = ActivityBlockMapActivity,
	[ActivityType.kActivityBlockEgg] = ActivityEggActivity,
	[ActivityType.KActivityClubBoss] = ActivityClubBoss,
	[ActivityType.KActivitySupport] = ActivitySupport,
	[ActivityType.KRechargeActivity] = RecheargeActivity,
	[ActivityType.KDrawCardFeedbackActivity] = ActivityDrawCardFeedback,
	[ActivityType.KColourEgg] = ActivityColorEggActivity,
	[ActivityType.KMonsterShop] = MonsterShopActivity,
	[ActivityType.KTPURCHASE] = ActivityTpurchase,
	[ActivityType.KMiniGame] = MiniGameActivity
}
ActivityUI = {
	ACTIVITYBLOCKEGG = "ActivityBlockEggView",
	TaskElite = "eliteTaskView",
	Gameboard = "GameBoardActivityView",
	MONSTERSHOPDetective = "ActivityBlockMonsterShopView",
	Exchange = "ActivityExchangeView",
	Login_Halloween = "LoginActivityWsjView",
	Carnival = "CarnivalView",
	Community = "CommunityActivityView",
	Login_Detective = "LoginActivityView",
	Login_Holiday = "LoginActivityView",
	Login_Music = "LoginActivityView",
	Login14 = "ActivityLogin14CommonView",
	Task = "TaskActivityView",
	FreeStamina = "FreeStaminaActivityView",
	ABACHIEVEMENTTASK = "ActivityTaskAchievementView",
	Banner = "BannerActivityView",
	Login = "LoginActivityView",
	Imgboard = "ImageBoardActivityView",
	Questionnaire = "QuestionActivityView",
	ABDAILYTASK = "ActivityTaskDailyView",
	ExtraRewardBoard = "ExtraRewardActivityView",
	[ActivityType.KEightLogin] = "eightDayLoginView",
	[ActivityType.KEightLoginCommon] = "commonEightDayLoginView",
	[ActivityType.KTASKMONTHCARD] = "ActivityTaskMonthCardView",
	[ActivityType.KTASKCOMMON] = "ActivityTaskReachedView",
	[ActivityType.KTASKCOLLECT] = "ActivityTaskCollectView",
	[ActivityType.KTASKCOLLECTSTAR] = "ActivityTaskCollectStarView",
	[ActivityType.KLOGINTIME] = "LoginActivityView",
	[ActivityType.KTASKSTAGESTAR] = "ActivityTaskStageStarView",
	[ActivityType.KTASKMONTHCARDSTAGE] = "ActivityTaskMonthCardView",
	[ActivityType.KKuaiShouApp] = "ActivityFocusOnView",
	[ActivityType.KAZhanApp] = "ActivityFocusOnView",
	[ActivityType.KTASKHEROCOLLECT] = "ActivityHeroCollectView",
	[ActivityType.KTASKCHOICE] = "ActivityFateEncountersView",
	[ActivityType.KRechargeActivity] = "RechargeActivityView",
	[ActivityType.KDrawCardFeedbackActivity] = "ActivityDrawCardFeedbackView",
	[ActivityType.KColourEgg] = "TaskActivityView",
	[ActivityType.KMonsterShop] = "ActivityBlockMonsterShopView"
}
ActivityMark = {
	kWonderful2 = "WONDERFUL2",
	kRecommend = "RECOMMEND",
	kMonday = "MONDAY",
	kWonderful = "WONDERFUL"
}
ActivityMarkImg = {
	[ActivityMark.kWonderful] = "icon_energy_small.png",
	[ActivityMark.kMonday] = "icon_energy_small.png",
	[ActivityMark.kWonderful2] = "icon_energy_small.png",
	[ActivityMark.kRecommend] = "icon_energy_small.png"
}
ActivityComplexUI = {
	tryEnterComplexMainView = {
		[ActivityType_UI.kActivityBlockWsj] = "ActivityBlockWsjView",
		[ActivityType_UI.kActivityWxh] = "ActivityBlockSupportWxhView",
		[ActivityType_UI.kActivityBlockZuoHe] = "ActivityBlockSupportView",
		[ActivityType_UI.kActivityBlockSummer] = "ActivityBlockSummerView",
		[ActivityType_UI.kActivityBlock] = "ActivityBlockView",
		[ActivityType_UI.KActivityBlockSnowflake] = "ActivityBlockView",
		[ActivityType_UI.KActivityBlockHoliday] = "ActivityBlockHolidayView",
		[ActivityType_UI.KActivityBlockHoliday] = "ActivityBlockHolidayView",
		[ActivityType_UI.KActivityBlockDetetive] = "ActivityBlockDetectiveView",
		[ActivityType_UI.KActivityBlockMusic] = "ActivityBlockMusicView",
		[ActivityType_UI.KActivityBlockBaking] = "ActivityBakingMainView",
		[ActivityType_UI.KActivityCollapsed] = "ActivityCollapsedMainView",
		[ActivityType_UI.KActivitySunflower] = "ActivitySunflowerMainView"
	},
	enterBlockMonsterShopView = {
		[ActivityType_UI.kActivityBlockWsj] = "ActivityBlockMonsterShopView",
		[ActivityType_UI.KActivityBlockHoliday] = "ActivityBlockMonsterShopView",
		[ActivityType_UI.KActivityBlockDetetive] = "ActivityBlockMonsterShopView"
	},
	enterSupportStageView = {
		[ActivityType_UI.kActivityWxh] = "ActivitySagaSupportMapView",
		[ActivityType_UI.kActivityBlockZuoHe] = "ActivitySagaSupportMapView",
		[ActivityType_UI.kActivityBlockSummer] = "ActivitySagaSupportMapView",
		[ActivityType_UI.kActivityBlockWsj] = "ActivityBlockMapWsjView",
		[ActivityType_UI.KActivityBlockSnowflake] = "ActivitySagaSupportMapView",
		[ActivityType_UI.kActivityBlock] = "ActivitySagaSupportMapView",
		[ActivityType_UI.KActivityBlockHoliday] = "ActivityBlockMapWsjView",
		[ActivityType_UI.KActivityBlockDetetive] = "ActivitySagaSupportMapView",
		[ActivityType_UI.KActivityBlockMusic] = "ActivitySagaSupportMapView",
		[ActivityType_UI.KActivityBlockBaking] = "ActivitySagaSupportMapView",
		[ActivityType_UI.KActivityCollapsed] = "ActivitySagaSupportMapView",
		[ActivityType_UI.KActivitySunflower] = "ActivitySagaSupportMapView"
	},
	enterSagaSupportStageView = {
		[ActivityType_UI.kActivityWxh] = "ActivitySagaSupportStageWxhView",
		[ActivityType_UI.kActivityBlockZuoHe] = "ActivitySagaSupportStageView",
		[ActivityType_UI.KActivitySupportHoliday] = "ActivitySupportHolidayView"
	},
	enterSagaSupportScheduleView = {
		[ActivityType_UI.kActivityWxh] = "ActivitySagaSupportScheduleWxhView",
		[ActivityType_UI.kActivityBlockZuoHe] = "ActivitySagaSupportScheduleView"
	},
	enterSupportTaskView = {
		[ActivityType_UI.kActivityWxh] = "ActivityBlockTaskView",
		[ActivityType_UI.kActivityBlockZuoHe] = "ActivityBlockTaskView",
		[ActivityType_UI.kActivityBlockSummer] = "ActivityBlockTaskView",
		[ActivityType_UI.kActivityBlockWsj] = "ActivityBlockTaskView",
		[ActivityType_UI.KActivityBlockSnowflake] = "ActivityBlockTaskView",
		[ActivityType_UI.kActivityBlock] = "ActivityBlockTaskView",
		[ActivityType_UI.KActivityBlockHoliday] = "ActivityBlockTaskView",
		[ActivityType_UI.KActivityBlockDetetive] = "ActivityBlockTaskView",
		[ActivityType_UI.KActivityBlockMusic] = "ActivityBlockTaskView",
		[ActivityType_UI.KActivityBlockBaking] = "ActivityBlockTaskView",
		[ActivityType_UI.KActivityCollapsed] = "ActivityBlockTaskView",
		[ActivityType_UI.KActivitySunflower] = "ActivityBlockTaskView"
	},
	enterSagaSupportRankRewardView = {
		[ActivityType_UI.kActivityWxh] = "ActivitySagaSupportRankRewardWxhView",
		[ActivityType_UI.kActivityBlockZuoHe] = "ActivitySagaSupportRankRewardView",
		[ActivityType_UI.KActivitySupportHoliday] = "ActivitySupportRankHolidayView"
	},
	enterSagaWinView = {
		[ActivityType_UI.kActivityWxh] = "ActivitySagaWinWxhView",
		[ActivityType_UI.kActivityBlockZuoHe] = "ActivitySagaWinView",
		[ActivityType_UI.KActivitySupportHoliday] = "ActivitySupportWinHolidayView"
	}
}
ActivityLogin14Config = {
	EightDays_Baking = {
		resFile = "asset/ui/ActivityBakingLogin14.csb",
		textPattern = {
			cc.c4b(255, 254, 249, 255),
			cc.c4b(255, 213, 133, 255)
		}
	},
	EightDays_Collapsed = {
		resFile = "asset/ui/ActivityCollapsedLogin14.csb",
		textPattern = {
			cc.c4b(255, 255, 255, 255),
			cc.c4b(212, 197, 255, 255)
		}
	},
	EightDays_Sunflower = {
		resFile = "asset/ui/ActivitySunflowerLogin14.csb",
		textPattern = {
			cc.c4b(255, 255, 255, 255),
			cc.c4b(176, 228, 254, 255)
		}
	}
}
LimitShopActivityViewType = {
	xige = "TimeLimitShopActivityXigeView",
	valentine = "TimeLimitShopActivityValentineView",
	whiteday = "TimeLimitShopActivityWhiteView"
}
