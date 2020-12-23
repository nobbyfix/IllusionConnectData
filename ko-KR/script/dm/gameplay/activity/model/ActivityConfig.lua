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
	EXCHANGE = ExchangeActivity,
	IMG_BOARD = BoardActivity,
	GAME_BOARD = BoardActivity,
	TEXT_BOARD = BoardActivity,
	FreeStamina = FreeStaminaActivity,
	ExtraReward = BoardActivity,
	Questionnaire = QuestionActivity,
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
	Login_Halloween = "LoginActivityWsjView",
	Task = "TaskActivityView",
	Gameboard = "GameBoardActivityView",
	Login = "LoginActivityView",
	FreeStamina = "FreeStaminaActivityView",
	ABACHIEVEMENTTASK = "ActivityTaskAchievementView",
	Banner = "BannerActivityView",
	TaskElite = "eliteTaskView",
	Imgboard = "ImageBoardActivityView",
	Questionnaire = "QuestionActivityView",
	ACTIVITYBLOCKEGG = "ActivityBlockEggView",
	ABDAILYTASK = "ActivityTaskDailyView",
	Carnival = "CarnivalView",
	ExtraRewardBoard = "ExtraRewardActivityView",
	Login_Holiday = "LoginActivityView",
	[ActivityType.KEightLogin] = "eightDayLoginView",
	[ActivityType.KEightLoginCommon] = "commonEightDayLoginView",
	[ActivityType.KTASKMONTHCARD] = "ActivityTaskMonthCardView",
	[ActivityType.KTASKCOMMON] = "ActivityTaskReachedView",
	[ActivityType.KTASKCOLLECT] = "ActivityTaskCollectView",
	[ActivityType.KTASKCOLLECTSTAR] = "ActivityTaskCollectStarView",
	[ActivityType.KLOGINTIME] = "LoginActivityView",
	[ActivityType.KExchange] = "ActivityExchangeView",
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
		[ActivityType_UI.KActivityBlockHoliday] = "ActivityBlockHolidayView"
	},
	enterBlockMonsterShopView = {
		[ActivityType_UI.kActivityBlockWsj] = "ActivityBlockMonsterShopView",
		[ActivityType_UI.KActivityBlockHoliday] = "ActivityBlockMonsterShopView"
	},
	enterSupportStageView = {
		[ActivityType_UI.kActivityWxh] = "ActivitySagaSupportMapView",
		[ActivityType_UI.kActivityBlockZuoHe] = "ActivitySagaSupportMapView",
		[ActivityType_UI.kActivityBlockSummer] = "ActivitySagaSupportMapView",
		[ActivityType_UI.kActivityBlockWsj] = "ActivityBlockMapWsjView",
		[ActivityType_UI.KActivityBlockSnowflake] = "ActivitySagaSupportMapView",
		[ActivityType_UI.kActivityBlock] = "ActivitySagaSupportMapView",
		[ActivityType_UI.KActivityBlockHoliday] = "ActivityBlockMapWsjView"
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
		[ActivityType_UI.KActivityBlockHoliday] = "ActivityBlockTaskView"
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
