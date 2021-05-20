module(...)

local mappings = {
	EVT_REQUEST_LOGIN_SUCC = {
		url = "dm.launch.login.LoginSystem",
		name = "EVT_REQUEST_LOGIN_SUCC",
		type = "@V"
	},
	UnBindMediator = {
		url = "dm.launch.login.view.UnBindMediator",
		name = "UnBindMediator",
		type = "@C"
	},
	LoginQueueMediator = {
		url = "dm.launch.login.view.LoginQueueMediator",
		name = "LoginQueueMediator",
		type = "@C"
	},
	GameProvisionMediator = {
		url = "dm.launch.login.view.GameProvisionMediator",
		name = "GameProvisionMediator",
		type = "@C"
	},
	EVT_RTPK_STARTMATCH = {
		url = "dm.gameplay.rtpk.controller.RTPKSystem",
		name = "EVT_RTPK_STARTMATCH",
		type = "@V"
	},
	EVT_RTPK_UPDATEINFO = {
		url = "dm.gameplay.rtpk.controller.RTPKSystem",
		name = "EVT_RTPK_UPDATEINFO",
		type = "@V"
	},
	EVT_RTPK_CANCELMATCH = {
		url = "dm.gameplay.rtpk.controller.RTPKSystem",
		name = "EVT_RTPK_CANCELMATCH",
		type = "@V"
	},
	EVT_RTPK_MATCHSUCC = {
		url = "dm.gameplay.rtpk.controller.RTPKSystem",
		name = "EVT_RTPK_MATCHSUCC",
		type = "@V"
	},
	RTPKRankViewMediator = {
		url = "dm.gameplay.rtpk.view.RTPKRankViewMediator",
		name = "RTPKRankViewMediator",
		type = "@C"
	},
	RTPKResultMediator = {
		url = "dm.gameplay.rtpk.view.RTPKResultMediator",
		name = "RTPKResultMediator",
		type = "@C"
	},
	RTPKRewardViewMediator = {
		url = "dm.gameplay.rtpk.view.RTPKRewardViewMediator",
		name = "RTPKRewardViewMediator",
		type = "@C"
	},
	RTPKMatchMediator = {
		url = "dm.gameplay.rtpk.view.RTPKMatchMediator",
		name = "RTPKMatchMediator",
		type = "@C"
	},
	RTPKNewSeasonTipsMediator = {
		url = "dm.gameplay.rtpk.view.RTPKNewSeasonTipsMediator",
		name = "RTPKNewSeasonTipsMediator",
		type = "@C"
	},
	RTPKBuffDetailMediator = {
		url = "dm.gameplay.rtpk.view.RTPKBuffDetailMediator",
		name = "RTPKBuffDetailMediator",
		type = "@C"
	},
	RTPKTeamMediator = {
		url = "dm.gameplay.rtpk.view.RTPKTeamMediator",
		name = "RTPKTeamMediator",
		type = "@C"
	},
	RTPKMainMediator = {
		url = "dm.gameplay.rtpk.view.RTPKMainMediator",
		name = "RTPKMainMediator",
		type = "@C"
	},
	RTPKReportViewMediator = {
		url = "dm.gameplay.rtpk.view.RTPKReportViewMediator",
		name = "RTPKReportViewMediator",
		type = "@C"
	},
	ClubBossShowBattleResultMediator = {
		url = "dm.gameplay.club.view.ClubBossShowBattleResultMediator",
		name = "ClubBossShowBattleResultMediator",
		type = "@C"
	},
	ClubMemberInfoTipMediator = {
		url = "dm.gameplay.club.view.ClubMemberInfoTipMediator",
		name = "ClubMemberInfoTipMediator",
		type = "@C"
	},
	ClubBossGainRewardMediator = {
		url = "dm.gameplay.club.view.ClubBossGainRewardMediator",
		name = "ClubBossGainRewardMediator",
		type = "@C"
	},
	ClubNewInfoMediator = {
		url = "dm.gameplay.club.view.ClubNewInfoMediator",
		name = "ClubNewInfoMediator",
		type = "@C"
	},
	ClubTechnologyMediator = {
		url = "dm.gameplay.club.view.ClubTechnologyMediator",
		name = "ClubTechnologyMediator",
		type = "@C"
	},
	ClubBasicInfoMediator = {
		url = "dm.gameplay.club.view.ClubBasicInfoMediator",
		name = "ClubBasicInfoMediator",
		type = "@C"
	},
	CreateClubTipMediator = {
		url = "dm.gameplay.club.view.CreateClubTipMediator",
		name = "CreateClubTipMediator",
		type = "@C"
	},
	ClubBattleUIMediator = {
		url = "dm.gameplay.club.view.ClubBattleUIMediator",
		name = "ClubBattleUIMediator",
		type = "@C"
	},
	ClubApplyMediator = {
		url = "dm.gameplay.club.view.ClubApplyMediator",
		name = "ClubApplyMediator",
		type = "@C"
	},
	ClubRankMediator = {
		url = "dm.gameplay.club.view.ClubRankMediator",
		name = "ClubRankMediator",
		type = "@C"
	},
	ClubBossTeamMediator = {
		url = "dm.gameplay.club.view.ClubBossTeamMediator",
		name = "ClubBossTeamMediator",
		type = "@C"
	},
	ClubBossShowRewardMediator = {
		url = "dm.gameplay.club.view.ClubBossShowRewardMediator",
		name = "ClubBossShowRewardMediator",
		type = "@C"
	},
	ClubIconSelectTipMediator = {
		url = "dm.gameplay.club.view.ClubIconSelectTipMediator",
		name = "ClubIconSelectTipMediator",
		type = "@C"
	},
	ClubAuditLimitTipMediator = {
		url = "dm.gameplay.club.view.ClubAuditLimitTipMediator",
		name = "ClubAuditLimitTipMediator",
		type = "@C"
	},
	ClubNewHallMediator = {
		url = "dm.gameplay.club.view.ClubNewHallMediator",
		name = "ClubNewHallMediator",
		type = "@C"
	},
	ClubAuditMediator = {
		url = "dm.gameplay.club.view.ClubAuditMediator",
		name = "ClubAuditMediator",
		type = "@C"
	},
	ClubSNSTipMediator = {
		url = "dm.gameplay.club.view.ClubSNSTipMediator",
		name = "ClubSNSTipMediator",
		type = "@C"
	},
	ClubMailTipMediator = {
		url = "dm.gameplay.club.view.ClubMailTipMediator",
		name = "ClubMailTipMediator",
		type = "@C"
	},
	ClubBossMediator = {
		url = "dm.gameplay.club.view.ClubBossMediator",
		name = "ClubBossMediator",
		type = "@C"
	},
	ClubHallMediator = {
		url = "dm.gameplay.club.view.ClubHallMediator",
		name = "ClubHallMediator",
		type = "@C"
	},
	ClubChangeNameTipMediator = {
		url = "dm.gameplay.club.view.ClubChangeNameTipMediator",
		name = "ClubChangeNameTipMediator",
		type = "@C"
	},
	ClubResourcesBattleGainRewardMediator = {
		url = "dm.gameplay.club.view.ClubResourcesBattleGainRewardMediator",
		name = "ClubResourcesBattleGainRewardMediator",
		type = "@C"
	},
	ClubBossShowAllBossMediator = {
		url = "dm.gameplay.club.view.ClubBossShowAllBossMediator",
		name = "ClubBossShowAllBossMediator",
		type = "@C"
	},
	ClubResourcesBattleMediator = {
		url = "dm.gameplay.club.view.ClubResourcesBattleMediator",
		name = "ClubResourcesBattleMediator",
		type = "@C"
	},
	ClubInfoTipMediator = {
		url = "dm.gameplay.club.view.ClubInfoTipMediator",
		name = "ClubInfoTipMediator",
		type = "@C"
	},
	ClubDonationMediator = {
		url = "dm.gameplay.club.view.ClubDonationMediator",
		name = "ClubDonationMediator",
		type = "@C"
	},
	ClubWelcomeTipMediator = {
		url = "dm.gameplay.club.view.ClubWelcomeTipMediator",
		name = "ClubWelcomeTipMediator",
		type = "@C"
	},
	ClubLogMediator = {
		url = "dm.gameplay.club.view.ClubLogMediator",
		name = "ClubLogMediator",
		type = "@C"
	},
	ClubWaringTipMediator = {
		url = "dm.gameplay.club.view.ClubWaringTipMediator",
		name = "ClubWaringTipMediator",
		type = "@C"
	},
	ClubBossActivityScoreMediator = {
		url = "dm.gameplay.club.view.ClubBossActivityScoreMediator",
		name = "ClubBossActivityScoreMediator",
		type = "@C"
	},
	ClubBossRecordMediator = {
		url = "dm.gameplay.club.view.ClubBossRecordMediator",
		name = "ClubBossRecordMediator",
		type = "@C"
	},
	ClubNewTechnologyMediator = {
		url = "dm.gameplay.club.view.ClubNewTechnologyMediator",
		name = "ClubNewTechnologyMediator",
		type = "@C"
	},
	ClubMapViewMediator = {
		url = "dm.gameplay.club.view.ClubMapViewMediator",
		name = "ClubMapViewMediator",
		type = "@C"
	},
	ClubMediator = {
		url = "dm.gameplay.club.view.ClubMediator",
		name = "ClubMediator",
		type = "@C"
	},
	ClubPositionManageTipMediator = {
		url = "dm.gameplay.club.view.ClubPositionManageTipMediator",
		name = "ClubPositionManageTipMediator",
		type = "@C"
	},
	ClubTextMediator = {
		url = "dm.gameplay.club.view.ClubTextMediator",
		name = "ClubTextMediator",
		type = "@C"
	},
	HomeMediator = {
		url = "dm.gameplay.home.view.HomeMediator",
		name = "HomeMediator",
		type = "@C"
	},
	SetHomeBgPopMediator = {
		url = "dm.gameplay.home.view.SetHomeBgPopMediator",
		name = "SetHomeBgPopMediator",
		type = "@C"
	},
	DailyGiftViewMediator = {
		url = "dm.gameplay.home.view.DailyGiftViewMediator",
		name = "DailyGiftViewMediator",
		type = "@C"
	},
	HeroInteractionViewMediator = {
		url = "dm.gameplay.home.view.HeroInteractionViewMediator",
		name = "HeroInteractionViewMediator",
		type = "@C"
	},
	SetBoardHeroPopMediator = {
		url = "dm.gameplay.home.view.SetBoardHeroPopMediator",
		name = "SetBoardHeroPopMediator",
		type = "@C"
	},
	EVT_RECRUIT_SUCC = {
		url = "dm.gameplay.recruit.controller.RecruitSystem",
		name = "EVT_RECRUIT_SUCC",
		type = "@V"
	},
	EVT_RECRUIT_BOX_GET_SUCC = {
		url = "dm.gameplay.recruit.controller.RecruitSystem",
		name = "EVT_RECRUIT_BOX_GET_SUCC",
		type = "@V"
	},
	EVT_RECRUIT_FAIL = {
		url = "dm.gameplay.recruit.controller.RecruitSystem",
		name = "EVT_RECRUIT_FAIL",
		type = "@V"
	},
	RecruitBuyCardMediator = {
		url = "dm.gameplay.recruit.view.RecruitBuyCardMediator",
		name = "RecruitBuyCardMediator",
		type = "@C"
	},
	RecruitCommonPreviewMediator = {
		url = "dm.gameplay.recruit.view.RecruitCommonPreviewMediator",
		name = "RecruitCommonPreviewMediator",
		type = "@C"
	},
	RecruitHeroBoxDetailMediator = {
		url = "dm.gameplay.recruit.view.RecruitHeroBoxDetailMediator",
		name = "RecruitHeroBoxDetailMediator",
		type = "@C"
	},
	RecruitTipMediator = {
		url = "dm.gameplay.recruit.view.RecruitTipMediator",
		name = "RecruitTipMediator",
		type = "@C"
	},
	RecruitRewardMediator = {
		url = "dm.gameplay.recruit.view.RecruitRewardMediator",
		name = "RecruitRewardMediator",
		type = "@C"
	},
	RecruitHeroPreviewMediator = {
		url = "dm.gameplay.recruit.view.RecruitHeroPreviewMediator",
		name = "RecruitHeroPreviewMediator",
		type = "@C"
	},
	RecruitHeroBoxMediator = {
		url = "dm.gameplay.recruit.view.RecruitHeroBoxMediator",
		name = "RecruitHeroBoxMediator",
		type = "@C"
	},
	RecruitMainMediator = {
		url = "dm.gameplay.recruit.view.RecruitMainMediator",
		name = "RecruitMainMediator",
		type = "@C"
	},
	EquipTipsMediator = {
		url = "dm.gameplay.popup.EquipTipsMediator",
		name = "EquipTipsMediator",
		type = "@C"
	},
	ItemBuffTipsMediator = {
		url = "dm.gameplay.popup.ItemBuffTipsMediator",
		name = "ItemBuffTipsMediator",
		type = "@C"
	},
	FunctionEntranceMediator = {
		url = "dm.gameplay.popup.FunctionEntranceMediator",
		name = "FunctionEntranceMediator",
		type = "@C"
	},
	PlayerLevelUpTipMediator = {
		url = "dm.gameplay.popup.PlayerLevelUpTipMediator",
		name = "PlayerLevelUpTipMediator",
		type = "@C"
	},
	ItemShowTipsMediator = {
		url = "dm.gameplay.popup.ItemShowTipsMediator",
		name = "ItemShowTipsMediator",
		type = "@C"
	},
	NewHeroMediator = {
		url = "dm.gameplay.popup.NewHeroMediator",
		name = "NewHeroMediator",
		type = "@C"
	},
	BaseRewardBoxMediator = {
		url = "dm.gameplay.popup.BaseRewardBoxMediator",
		name = "BaseRewardBoxMediator",
		type = "@C"
	},
	ShowSomeWordTipsMediator = {
		url = "dm.gameplay.popup.ShowSomeWordTipsMediator",
		name = "ShowSomeWordTipsMediator",
		type = "@C"
	},
	GetRewardMediator = {
		url = "dm.gameplay.popup.GetRewardMediator",
		name = "GetRewardMediator",
		type = "@C"
	},
	EntranceGodhandMediator = {
		url = "dm.gameplay.popup.EntranceGodhandMediator",
		name = "EntranceGodhandMediator",
		type = "@C"
	},
	NativeWebViewMediator = {
		url = "dm.gameplay.popup.NativeWebViewMediator",
		name = "NativeWebViewMediator",
		type = "@C"
	},
	AlertMediator = {
		url = "dm.gameplay.popup.AlertMediator",
		name = "AlertMediator",
		type = "@C"
	},
	SourceMediator = {
		url = "dm.gameplay.popup.SourceMediator",
		name = "SourceMediator",
		type = "@C"
	},
	NewSystemUnlockMediator = {
		url = "dm.gameplay.popup.NewSystemUnlockMediator",
		name = "NewSystemUnlockMediator",
		type = "@C"
	},
	BuffTipsMediator = {
		url = "dm.gameplay.popup.BuffTipsMediator",
		name = "BuffTipsMediator",
		type = "@C"
	},
	ItemTipsMediator = {
		url = "dm.gameplay.popup.ItemTipsMediator",
		name = "ItemTipsMediator",
		type = "@C"
	},
	FriendFindMediator = {
		url = "dm.gameplay.friend.view.FriendFindMediator",
		name = "FriendFindMediator",
		type = "@C"
	},
	FriendInfoPopMediator = {
		url = "dm.gameplay.friend.view.FriendInfoPopMediator",
		name = "FriendInfoPopMediator",
		type = "@C"
	},
	FriendAddPopMediator = {
		url = "dm.gameplay.friend.view.FriendAddPopMediator",
		name = "FriendAddPopMediator",
		type = "@C"
	},
	FriendMainMediator = {
		url = "dm.gameplay.friend.view.FriendMainMediator",
		name = "FriendMainMediator",
		type = "@C"
	},
	FriendApplyMediator = {
		url = "dm.gameplay.friend.view.FriendApplyMediator",
		name = "FriendApplyMediator",
		type = "@C"
	},
	FriendListMediator = {
		url = "dm.gameplay.friend.view.FriendListMediator",
		name = "FriendListMediator",
		type = "@C"
	},
	FriendBlackMediator = {
		url = "dm.gameplay.friend.view.FriendBlackMediator",
		name = "FriendBlackMediator",
		type = "@C"
	},
	EVT_FRIEND_GETFRIENDSLIST_SUCC = {
		url = "dm.gameplay.friend.service.FriendService",
		name = "EVT_FRIEND_GETFRIENDSLIST_SUCC",
		type = "@V"
	},
	EVT_FRIEND_GETRECOMMENDLIST_SUCC = {
		url = "dm.gameplay.friend.service.FriendService",
		name = "EVT_FRIEND_GETRECOMMENDLIST_SUCC",
		type = "@V"
	},
	EVT_FRIEND_ADD_SUCC = {
		url = "dm.gameplay.friend.service.FriendService",
		name = "EVT_FRIEND_ADD_SUCC",
		type = "@V"
	},
	EVT_FRIEND_GETAPPLYLIST_SUCC = {
		url = "dm.gameplay.friend.service.FriendService",
		name = "EVT_FRIEND_GETAPPLYLIST_SUCC",
		type = "@V"
	},
	EVT_FRIEND_AGREEORREFUSE_SUCC = {
		url = "dm.gameplay.friend.service.FriendService",
		name = "EVT_FRIEND_AGREEORREFUSE_SUCC",
		type = "@V"
	},
	EVT_FRIEND_GERPOWER_SUCC = {
		url = "dm.gameplay.friend.service.FriendService",
		name = "EVT_FRIEND_GERPOWER_SUCC",
		type = "@V"
	},
	EVT_FRIEND_SENDPOWER_SUCC = {
		url = "dm.gameplay.friend.service.FriendService",
		name = "EVT_FRIEND_SENDPOWER_SUCC",
		type = "@V"
	},
	EVT_FRIEND_DELECT_SUCC = {
		url = "dm.gameplay.friend.service.FriendService",
		name = "EVT_FRIEND_DELECT_SUCC",
		type = "@V"
	},
	EVT_PETRACE_STATE_CHANGE = {
		url = "dm.gameplay.petRace.controller.PetRaceSystem",
		name = "EVT_PETRACE_STATE_CHANGE",
		type = "@V"
	},
	EVT_PETRACE_KNOCKOUTNUM_CHANGE = {
		url = "dm.gameplay.petRace.controller.PetRaceSystem",
		name = "EVT_PETRACE_KNOCKOUTNUM_CHANGE",
		type = "@V"
	},
	EVT_PETRACE_BATTLEINFO_PUSH = {
		url = "dm.gameplay.petRace.controller.PetRaceSystem",
		name = "EVT_PETRACE_BATTLEINFO_PUSH",
		type = "@V"
	},
	EVT_PETRACE_SHOUT_PUSH = {
		url = "dm.gameplay.petRace.controller.PetRaceSystem",
		name = "EVT_PETRACE_SHOUT_PUSH",
		type = "@V"
	},
	EVT_PETRACE_ADJUSTTEAMORDER = {
		url = "dm.gameplay.petRace.controller.PetRaceSystem",
		name = "EVT_PETRACE_ADJUSTTEAMORDER",
		type = "@V"
	},
	PetRaceRankMediator = {
		url = "dm.gameplay.petRace.view.PetRaceRankMediator",
		name = "PetRaceRankMediator",
		type = "@C"
	},
	PetRaceBattleUIMediator = {
		url = "dm.gameplay.petRace.view.PetRaceBattleUIMediator",
		name = "PetRaceBattleUIMediator",
		type = "@C"
	},
	PetRaceEmBattleForScheduleMediator = {
		url = "dm.gameplay.petRace.view.PetRaceEmBattleForScheduleMediator",
		name = "PetRaceEmBattleForScheduleMediator",
		type = "@C"
	},
	PetraceAwardMediator = {
		url = "dm.gameplay.petRace.view.PetraceAwardMediator",
		name = "PetraceAwardMediator",
		type = "@C"
	},
	PetRaceFinalSquadMediator = {
		url = "dm.gameplay.petRace.view.PetRaceFinalSquadMediator",
		name = "PetRaceFinalSquadMediator",
		type = "@C"
	},
	PetRaceEmbattleForRegistMediator = {
		url = "dm.gameplay.petRace.view.PetRaceEmbattleForRegistMediator",
		name = "PetRaceEmbattleForRegistMediator",
		type = "@C"
	},
	PetRaceMediator = {
		url = "dm.gameplay.petRace.view.PetRaceMediator",
		name = "PetRaceMediator",
		type = "@C"
	},
	PetRaceMainScheduleMediator = {
		url = "dm.gameplay.petRace.view.PetRaceMainScheduleMediator",
		name = "PetRaceMainScheduleMediator",
		type = "@C"
	},
	PetRaceSquadMediator = {
		url = "dm.gameplay.petRace.view.PetRaceSquadMediator",
		name = "PetRaceSquadMediator",
		type = "@C"
	},
	PetRaceAllTeamEmBattleForScheduleMediator = {
		url = "dm.gameplay.petRace.view.PetRaceAllTeamEmBattleForScheduleMediator",
		name = "PetRaceAllTeamEmBattleForScheduleMediator",
		type = "@C"
	},
	PetRaceScheduleMediator = {
		url = "dm.gameplay.petRace.view.PetRaceScheduleMediator",
		name = "PetRaceScheduleMediator",
		type = "@C"
	},
	PetRaceShoutMediator = {
		url = "dm.gameplay.petRace.view.PetRaceShoutMediator",
		name = "PetRaceShoutMediator",
		type = "@C"
	},
	PetRaceReportMediator = {
		url = "dm.gameplay.petRace.view.PetRaceReportMediator",
		name = "PetRaceReportMediator",
		type = "@C"
	},
	PetRaceRuleMediator = {
		url = "dm.gameplay.petRace.view.PetRaceRuleMediator",
		name = "PetRaceRuleMediator",
		type = "@C"
	},
	DiffCommand = {
		url = "dm.gameplay.develop.controller.DiffCommand",
		name = "DiffCommand",
		type = "@C"
	},
	HeroShowListMediator = {
		url = "dm.gameplay.develop.view.heroshow.HeroShowListMediator",
		name = "HeroShowListMediator",
		type = "@C"
	},
	HeroShowNotOwnMediator = {
		url = "dm.gameplay.develop.view.heroshow.HeroShowNotOwnMediator",
		name = "HeroShowNotOwnMediator",
		type = "@C"
	},
	HeroRarityTipMediator = {
		url = "dm.gameplay.develop.view.heroshow.HeroRarityTipMediator",
		name = "HeroRarityTipMediator",
		type = "@C"
	},
	HeroShowOwnMediator = {
		url = "dm.gameplay.develop.view.heroshow.HeroShowOwnMediator",
		name = "HeroShowOwnMediator",
		type = "@C"
	},
	HeroShowDetailsMediator = {
		url = "dm.gameplay.develop.view.heroshow.HeroShowDetailsMediator",
		name = "HeroShowDetailsMediator",
		type = "@C"
	},
	HeroShowMainMediator = {
		url = "dm.gameplay.develop.view.heroshow.HeroShowMainMediator",
		name = "HeroShowMainMediator",
		type = "@C"
	},
	HeroInfoMediator = {
		url = "dm.gameplay.develop.view.heroshow.HeroInfoMediator",
		name = "HeroInfoMediator",
		type = "@C"
	},
	HeroCardDescMediator = {
		url = "dm.gameplay.develop.view.heroshow.HeroCardDescMediator",
		name = "HeroCardDescMediator",
		type = "@C"
	},
	HeroShowHeroPicMediator = {
		url = "dm.gameplay.develop.view.heroshow.HeroShowHeroPicMediator",
		name = "HeroShowHeroPicMediator",
		type = "@C"
	},
	EquipResolveMediator = {
		url = "dm.gameplay.develop.view.equip.EquipResolveMediator",
		name = "EquipResolveMediator",
		type = "@C"
	},
	EquipAllUpdateMediator = {
		url = "dm.gameplay.develop.view.equip.EquipAllUpdateMediator",
		name = "EquipAllUpdateMediator",
		type = "@C"
	},
	EquipStarItemSelectMediator = {
		url = "dm.gameplay.develop.view.equip.EquipStarItemSelectMediator",
		name = "EquipStarItemSelectMediator",
		type = "@C"
	},
	EquipStrengthenMediator = {
		url = "dm.gameplay.develop.view.equip.EquipStrengthenMediator",
		name = "EquipStrengthenMediator",
		type = "@C"
	},
	EquipSkillUpMediator = {
		url = "dm.gameplay.develop.view.equip.EquipSkillUpMediator",
		name = "EquipSkillUpMediator",
		type = "@C"
	},
	EquipStarMediator = {
		url = "dm.gameplay.develop.view.equip.EquipStarMediator",
		name = "EquipStarMediator",
		type = "@C"
	},
	EquipMainMediator = {
		url = "dm.gameplay.develop.view.equip.EquipMainMediator",
		name = "EquipMainMediator",
		type = "@C"
	},
	EquipStarUpMediator = {
		url = "dm.gameplay.develop.view.equip.EquipStarUpMediator",
		name = "EquipStarUpMediator",
		type = "@C"
	},
	EquipStarLevelMediator = {
		url = "dm.gameplay.develop.view.equip.EquipStarLevelMediator",
		name = "EquipStarLevelMediator",
		type = "@C"
	},
	EquipStarBreakMediator = {
		url = "dm.gameplay.develop.view.equip.EquipStarBreakMediator",
		name = "EquipStarBreakMediator",
		type = "@C"
	},
	MasterUpstarAniMediator = {
		url = "dm.gameplay.develop.view.master.MasterUpstarAniMediator",
		name = "MasterUpstarAniMediator",
		type = "@C"
	},
	MasterLeadStageDetailMediator = {
		url = "dm.gameplay.develop.view.master.MasterLeadStageDetailMediator",
		name = "MasterLeadStageDetailMediator",
		type = "@C"
	},
	MasterDebrisChangeTipMediator = {
		url = "dm.gameplay.develop.view.master.MasterDebrisChangeTipMediator",
		name = "MasterDebrisChangeTipMediator",
		type = "@C"
	},
	MasterBuyAuraItemMediator = {
		url = "dm.gameplay.develop.view.master.MasterBuyAuraItemMediator",
		name = "MasterBuyAuraItemMediator",
		type = "@C"
	},
	MasterLeaderSkillMediator = {
		url = "dm.gameplay.develop.view.master.MasterLeaderSkillMediator",
		name = "MasterLeaderSkillMediator",
		type = "@C"
	},
	MasterCutInMediator = {
		url = "dm.gameplay.develop.view.master.MasterCutInMediator",
		name = "MasterCutInMediator",
		type = "@C"
	},
	MasterEmblemQualityUpMediator = {
		url = "dm.gameplay.develop.view.master.MasterEmblemQualityUpMediator",
		name = "MasterEmblemQualityUpMediator",
		type = "@C"
	},
	MasterSkillMediator = {
		url = "dm.gameplay.develop.view.master.MasterSkillMediator",
		name = "MasterSkillMediator",
		type = "@C"
	},
	MasterStarMediator = {
		url = "dm.gameplay.develop.view.master.MasterStarMediator",
		name = "MasterStarMediator",
		type = "@C"
	},
	MasterEmblemMediator = {
		url = "dm.gameplay.develop.view.master.MasterEmblemMediator",
		name = "MasterEmblemMediator",
		type = "@C"
	},
	MasterCultivateMediator = {
		url = "dm.gameplay.develop.view.master.MasterCultivateMediator",
		name = "MasterCultivateMediator",
		type = "@C"
	},
	NewMasterMediator = {
		url = "dm.gameplay.develop.view.master.NewMasterMediator",
		name = "NewMasterMediator",
		type = "@C"
	},
	MasterMainMediator = {
		url = "dm.gameplay.develop.view.master.MasterMainMediator",
		name = "MasterMainMediator",
		type = "@C"
	},
	MasterEnterMediator = {
		url = "dm.gameplay.develop.view.master.MasterEnterMediator",
		name = "MasterEnterMediator",
		type = "@C"
	},
	MasterLeadStageMediator = {
		url = "dm.gameplay.develop.view.master.MasterLeadStageMediator",
		name = "MasterLeadStageMediator",
		type = "@C"
	},
	HeroSoulDimondUpTipMediator = {
		url = "dm.gameplay.develop.view.herostrength.HeroSoulDimondUpTipMediator",
		name = "HeroSoulDimondUpTipMediator",
		type = "@C"
	},
	HeroSoulUpMediator = {
		url = "dm.gameplay.develop.view.herostrength.HeroSoulUpMediator",
		name = "HeroSoulUpMediator",
		type = "@C"
	},
	HeroRelationMediator = {
		url = "dm.gameplay.develop.view.herostrength.HeroRelationMediator",
		name = "HeroRelationMediator",
		type = "@C"
	},
	HeroSoundMediator = {
		url = "dm.gameplay.develop.view.herostrength.HeroSoundMediator",
		name = "HeroSoundMediator",
		type = "@C"
	},
	HeroStarUpTipMediator = {
		url = "dm.gameplay.develop.view.herostrength.HeroStarUpTipMediator",
		name = "HeroStarUpTipMediator",
		type = "@C"
	},
	HeroStrengthAwakenMediator = {
		url = "dm.gameplay.develop.view.herostrength.HeroStrengthAwakenMediator",
		name = "HeroStrengthAwakenMediator",
		type = "@C"
	},
	HeroStrengthEquipMediator = {
		url = "dm.gameplay.develop.view.herostrength.HeroStrengthEquipMediator",
		name = "HeroStrengthEquipMediator",
		type = "@C"
	},
	HeroStrengthStarMediator = {
		url = "dm.gameplay.develop.view.herostrength.HeroStrengthStarMediator",
		name = "HeroStrengthStarMediator",
		type = "@C"
	},
	HeroRelationChatMediator = {
		url = "dm.gameplay.develop.view.herostrength.HeroRelationChatMediator",
		name = "HeroRelationChatMediator",
		type = "@C"
	},
	HeroEvolutionUpTipMediator = {
		url = "dm.gameplay.develop.view.herostrength.HeroEvolutionUpTipMediator",
		name = "HeroEvolutionUpTipMediator",
		type = "@C"
	},
	DebrisChangeTipMediator = {
		url = "dm.gameplay.develop.view.herostrength.DebrisChangeTipMediator",
		name = "DebrisChangeTipMediator",
		type = "@C"
	},
	HeroStrengthAwakenDetailMediator = {
		url = "dm.gameplay.develop.view.herostrength.HeroStrengthAwakenDetailMediator",
		name = "HeroStrengthAwakenDetailMediator",
		type = "@C"
	},
	HeroStrengthAwakenSuccessMediator = {
		url = "dm.gameplay.develop.view.herostrength.HeroStrengthAwakenSuccessMediator",
		name = "HeroStrengthAwakenSuccessMediator",
		type = "@C"
	},
	BuyEatItemTipMediator = {
		url = "dm.gameplay.develop.view.herostrength.BuyEatItemTipMediator",
		name = "BuyEatItemTipMediator",
		type = "@C"
	},
	StrengthenSoulMediator = {
		url = "dm.gameplay.develop.view.herostrength.StrengthenSoulMediator",
		name = "StrengthenSoulMediator",
		type = "@C"
	},
	HeroSoulInfoTipMediator = {
		url = "dm.gameplay.develop.view.herostrength.HeroSoulInfoTipMediator",
		name = "HeroSoulInfoTipMediator",
		type = "@C"
	},
	HeroStarBoxMediator = {
		url = "dm.gameplay.develop.view.herostrength.HeroStarBoxMediator",
		name = "HeroStarBoxMediator",
		type = "@C"
	},
	HeroStarLevelMediator = {
		url = "dm.gameplay.develop.view.herostrength.HeroStarLevelMediator",
		name = "HeroStarLevelMediator",
		type = "@C"
	},
	HeroLevelUpTipMediator = {
		url = "dm.gameplay.develop.view.herostrength.HeroLevelUpTipMediator",
		name = "HeroLevelUpTipMediator",
		type = "@C"
	},
	HeroGeneralFragmentMeditor = {
		url = "dm.gameplay.develop.view.herostrength.HeroGeneralFragmentMeditor",
		name = "HeroGeneralFragmentMeditor",
		type = "@C"
	},
	HeroStarItemSelectMediator = {
		url = "dm.gameplay.develop.view.herostrength.HeroStarItemSelectMediator",
		name = "HeroStarItemSelectMediator",
		type = "@C"
	},
	HeroStarSkillMediator = {
		url = "dm.gameplay.develop.view.herostrength.HeroStarSkillMediator",
		name = "HeroStarSkillMediator",
		type = "@C"
	},
	HeroStrengthLevelMediator = {
		url = "dm.gameplay.develop.view.herostrength.HeroStrengthLevelMediator",
		name = "HeroStrengthLevelMediator",
		type = "@C"
	},
	SkillShowTipMediator = {
		url = "dm.gameplay.develop.view.herostrength.SkillShowTipMediator",
		name = "SkillShowTipMediator",
		type = "@C"
	},
	HeroEquipDressedMediator = {
		url = "dm.gameplay.develop.view.herostrength.HeroEquipDressedMediator",
		name = "HeroEquipDressedMediator",
		type = "@C"
	},
	RelationInfoTipMediator = {
		url = "dm.gameplay.develop.view.herostrength.RelationInfoTipMediator",
		name = "RelationInfoTipMediator",
		type = "@C"
	},
	HeroStrengthEvolutionMediator = {
		url = "dm.gameplay.develop.view.herostrength.HeroStrengthEvolutionMediator",
		name = "HeroStrengthEvolutionMediator",
		type = "@C"
	},
	HeroStrengthSkillMediator = {
		url = "dm.gameplay.develop.view.herostrength.HeroStrengthSkillMediator",
		name = "HeroStrengthSkillMediator",
		type = "@C"
	},
	BagSelectMaterialMediator = {
		url = "dm.gameplay.develop.view.bag.BagSelectMaterialMediator",
		name = "BagSelectMaterialMediator",
		type = "@C"
	},
	BagGiftChooseOneMediator = {
		url = "dm.gameplay.develop.view.bag.BagGiftChooseOneMediator",
		name = "BagGiftChooseOneMediator",
		type = "@C"
	},
	BagUseScrollMediator = {
		url = "dm.gameplay.develop.view.bag.BagUseScrollMediator",
		name = "BagUseScrollMediator",
		type = "@C"
	},
	BagBatchUseSellMediator = {
		url = "dm.gameplay.develop.view.bag.BagBatchUseSellMediator",
		name = "BagBatchUseSellMediator",
		type = "@C"
	},
	BagMediator = {
		url = "dm.gameplay.develop.view.bag.BagMediator",
		name = "BagMediator",
		type = "@C"
	},
	EVT_CHAT_NEW_MESSAGE = {
		url = "dm.gameplay.chat.ChatSystem",
		name = "EVT_CHAT_NEW_MESSAGE",
		type = "@V"
	},
	EVT_CHAT_SEND_MESSAGE_SUCC = {
		url = "dm.gameplay.chat.ChatSystem",
		name = "EVT_CHAT_SEND_MESSAGE_SUCC",
		type = "@V"
	},
	ChatMainMediator = {
		url = "dm.gameplay.chat.view.ChatMainMediator",
		name = "ChatMainMediator",
		type = "@C"
	},
	SmallChatMediator = {
		url = "dm.gameplay.chat.view.SmallChatMediator",
		name = "SmallChatMediator",
		type = "@C"
	},
	TowerSystem = {
		url = "dm.gameplay.tower.controller.TowerSystem",
		name = "TowerSystem",
		type = "@C"
	},
	TowerMainMediator = {
		url = "dm.gameplay.tower.view.TowerMainMediator",
		name = "TowerMainMediator",
		type = "@C"
	},
	TowerEnemyMediator = {
		url = "dm.gameplay.tower.view.TowerEnemyMediator",
		name = "TowerEnemyMediator",
		type = "@C"
	},
	TowerStrengthEndTipMediator = {
		url = "dm.gameplay.tower.view.TowerStrengthEndTipMediator",
		name = "TowerStrengthEndTipMediator",
		type = "@C"
	},
	TowerStrengthAwardMediator = {
		url = "dm.gameplay.tower.view.TowerStrengthAwardMediator",
		name = "TowerStrengthAwardMediator",
		type = "@C"
	},
	TowerGetHeroBuffMediator = {
		url = "dm.gameplay.tower.view.TowerGetHeroBuffMediator",
		name = "TowerGetHeroBuffMediator",
		type = "@C"
	},
	TowerChallengeEndMediator = {
		url = "dm.gameplay.tower.view.TowerChallengeEndMediator",
		name = "TowerChallengeEndMediator",
		type = "@C"
	},
	TowerTeamMediator = {
		url = "dm.gameplay.tower.view.TowerTeamMediator",
		name = "TowerTeamMediator",
		type = "@C"
	},
	TowerMasterShowDetailsMediator = {
		url = "dm.gameplay.tower.view.TowerMasterShowDetailsMediator",
		name = "TowerMasterShowDetailsMediator",
		type = "@C"
	},
	TowerChooseRoleMediator = {
		url = "dm.gameplay.tower.view.TowerChooseRoleMediator",
		name = "TowerChooseRoleMediator",
		type = "@C"
	},
	TowerBattleWinMediator = {
		url = "dm.gameplay.tower.view.TowerBattleWinMediator",
		name = "TowerBattleWinMediator",
		type = "@C"
	},
	TowerPartnerSelectMediator = {
		url = "dm.gameplay.tower.view.TowerPartnerSelectMediator",
		name = "TowerPartnerSelectMediator",
		type = "@C"
	},
	TowerAwardMediator = {
		url = "dm.gameplay.tower.view.TowerAwardMediator",
		name = "TowerAwardMediator",
		type = "@C"
	},
	TowerBuffMediator = {
		url = "dm.gameplay.tower.view.TowerBuffMediator",
		name = "TowerBuffMediator",
		type = "@C"
	},
	TowerPointMediator = {
		url = "dm.gameplay.tower.view.TowerPointMediator",
		name = "TowerPointMediator",
		type = "@C"
	},
	TowerBeginMediator = {
		url = "dm.gameplay.tower.view.TowerBeginMediator",
		name = "TowerBeginMediator",
		type = "@C"
	},
	TowerStrengthMediator = {
		url = "dm.gameplay.tower.view.TowerStrengthMediator",
		name = "TowerStrengthMediator",
		type = "@C"
	},
	TowerBuffChooseMediator = {
		url = "dm.gameplay.tower.view.TowerBuffChooseMediator",
		name = "TowerBuffChooseMediator",
		type = "@C"
	},
	TowerBattleLoseMediator = {
		url = "dm.gameplay.tower.view.TowerBattleLoseMediator",
		name = "TowerBattleLoseMediator",
		type = "@C"
	},
	TowerTeamBattleMediator = {
		url = "dm.gameplay.tower.view.TowerTeamBattleMediator",
		name = "TowerTeamBattleMediator",
		type = "@C"
	},
	TowerHeroShowDetailsMediator = {
		url = "dm.gameplay.tower.view.TowerHeroShowDetailsMediator",
		name = "TowerHeroShowDetailsMediator",
		type = "@C"
	},
	TowerCardsChooseMediator = {
		url = "dm.gameplay.tower.view.TowerCardsChooseMediator",
		name = "TowerCardsChooseMediator",
		type = "@C"
	},
	PassSystem = {
		url = "dm.gameplay.pass.controller.PassSystem",
		name = "PassSystem",
		type = "@C"
	},
	PassExchangeMediator = {
		url = "dm.gameplay.pass.view.PassExchangeMediator",
		name = "PassExchangeMediator",
		type = "@C"
	},
	PassLevelUpMediator = {
		url = "dm.gameplay.pass.view.PassLevelUpMediator",
		name = "PassLevelUpMediator",
		type = "@C"
	},
	PassRewardsPreviewMediator = {
		url = "dm.gameplay.pass.view.PassRewardsPreviewMediator",
		name = "PassRewardsPreviewMediator",
		type = "@C"
	},
	PassBuyMediator = {
		url = "dm.gameplay.pass.view.PassBuyMediator",
		name = "PassBuyMediator",
		type = "@C"
	},
	PassBuyLevelMediator = {
		url = "dm.gameplay.pass.view.PassBuyLevelMediator",
		name = "PassBuyLevelMediator",
		type = "@C"
	},
	PassAwardMediator = {
		url = "dm.gameplay.pass.view.PassAwardMediator",
		name = "PassAwardMediator",
		type = "@C"
	},
	PassDelayExpMediator = {
		url = "dm.gameplay.pass.view.PassDelayExpMediator",
		name = "PassDelayExpMediator",
		type = "@C"
	},
	PassMainMediator = {
		url = "dm.gameplay.pass.view.PassMainMediator",
		name = "PassMainMediator",
		type = "@C"
	},
	PassBuyItemMediator = {
		url = "dm.gameplay.pass.view.PassBuyItemMediator",
		name = "PassBuyItemMediator",
		type = "@C"
	},
	PassTaskMediator = {
		url = "dm.gameplay.pass.view.PassTaskMediator",
		name = "PassTaskMediator",
		type = "@C"
	},
	PassShopMediator = {
		url = "dm.gameplay.pass.view.PassShopMediator",
		name = "PassShopMediator",
		type = "@C"
	},
	EVT_ACTIVITY_RESET = {
		url = "dm.gameplay.activity.controller.ActivitySystem",
		name = "EVT_ACTIVITY_RESET",
		type = "@V"
	},
	EVT_ACTIVITY_REFRESH = {
		url = "dm.gameplay.activity.controller.ActivitySystem",
		name = "EVT_ACTIVITY_REFRESH",
		type = "@V"
	},
	EVT_ACTIVITY_CLOSE = {
		url = "dm.gameplay.activity.controller.ActivitySystem",
		name = "EVT_ACTIVITY_CLOSE",
		type = "@V"
	},
	RechargeActivityMediator = {
		url = "dm.gameplay.activity.view.RechargeActivityMediator",
		name = "RechargeActivityMediator",
		type = "@C"
	},
	ActivityTaskAchievementMediator = {
		url = "dm.gameplay.activity.view.ActivityTaskAchievementMediator",
		name = "ActivityTaskAchievementMediator",
		type = "@C"
	},
	ActivityBlockDectiveMediator = {
		url = "dm.gameplay.activity.view.ActivityBlockDectiveMediator",
		name = "ActivityBlockDectiveMediator",
		type = "@C"
	},
	MonsterShopPopupMediator = {
		url = "dm.gameplay.activity.view.MonsterShopPopupMediator",
		name = "MonsterShopPopupMediator",
		type = "@C"
	},
	ActivityExchangeTipMediator = {
		url = "dm.gameplay.activity.view.ActivityExchangeTipMediator",
		name = "ActivityExchangeTipMediator",
		type = "@C"
	},
	ActivityPointSweepMediator = {
		url = "dm.gameplay.activity.view.ActivityPointSweepMediator",
		name = "ActivityPointSweepMediator",
		type = "@C"
	},
	ExchangeActivityMediator = {
		url = "dm.gameplay.activity.view.ExchangeActivityMediator",
		name = "ExchangeActivityMediator",
		type = "@C"
	},
	ActivityBakingMainMediator = {
		url = "dm.gameplay.activity.view.ActivityBakingMainMediator",
		name = "ActivityBakingMainMediator",
		type = "@C"
	},
	ActivityKnightMainMediator = {
		url = "dm.gameplay.activity.view.ActivityKnightMainMediator",
		name = "ActivityKnightMainMediator",
		type = "@C"
	},
	ActivityEggRewardMediator = {
		url = "dm.gameplay.activity.view.ActivityEggRewardMediator",
		name = "ActivityEggRewardMediator",
		type = "@C"
	},
	ActivityFireMainMediator = {
		url = "dm.gameplay.activity.view.ActivityFireMainMediator",
		name = "ActivityFireMainMediator",
		type = "@C"
	},
	MCInfoPopMediator = {
		url = "dm.gameplay.activity.view.MCInfoPopMediator",
		name = "MCInfoPopMediator",
		type = "@C"
	},
	ActivityReturnLetterMediator = {
		url = "dm.gameplay.activity.view.ActivityReturnLetterMediator",
		name = "ActivityReturnLetterMediator",
		type = "@C"
	},
	EliteTaskActivityMediator = {
		url = "dm.gameplay.activity.view.EliteTaskActivityMediator",
		name = "EliteTaskActivityMediator",
		type = "@C"
	},
	CommonEightDayLoginMediator = {
		url = "dm.gameplay.activity.view.CommonEightDayLoginMediator",
		name = "CommonEightDayLoginMediator",
		type = "@C"
	},
	ActivityBlockSupportMediator = {
		url = "dm.gameplay.activity.view.ActivityBlockSupportMediator",
		name = "ActivityBlockSupportMediator",
		type = "@C"
	},
	ActivitySagaWinMediator = {
		url = "dm.gameplay.activity.view.ActivitySagaWinMediator",
		name = "ActivitySagaWinMediator",
		type = "@C"
	},
	ActivityTaskStageStarMediator = {
		url = "dm.gameplay.activity.view.ActivityTaskStageStarMediator",
		name = "ActivityTaskStageStarMediator",
		type = "@C"
	},
	ActivityTaskCollectStarMediator = {
		url = "dm.gameplay.activity.view.ActivityTaskCollectStarMediator",
		name = "ActivityTaskCollectStarMediator",
		type = "@C"
	},
	BannerActivityMediator = {
		url = "dm.gameplay.activity.view.BannerActivityMediator",
		name = "BannerActivityMediator",
		type = "@C"
	},
	ActivityBlockWsjMediator = {
		url = "dm.gameplay.activity.view.ActivityBlockWsjMediator",
		name = "ActivityBlockWsjMediator",
		type = "@C"
	},
	ActivitySagaSupportRankRewardWxhMediator = {
		url = "dm.gameplay.activity.view.ActivitySagaSupportRankRewardWxhMediator",
		name = "ActivitySagaSupportRankRewardWxhMediator",
		type = "@C"
	},
	ActivitySagaWinWxhMediator = {
		url = "dm.gameplay.activity.view.ActivitySagaWinWxhMediator",
		name = "ActivitySagaWinWxhMediator",
		type = "@C"
	},
	ActivityBoxMediator = {
		url = "dm.gameplay.activity.view.ActivityBoxMediator",
		name = "ActivityBoxMediator",
		type = "@C"
	},
	MonthCardActivityMediator = {
		url = "dm.gameplay.activity.view.MonthCardActivityMediator",
		name = "MonthCardActivityMediator",
		type = "@C"
	},
	BaseActivityMediator = {
		url = "dm.gameplay.activity.view.BaseActivityMediator",
		name = "BaseActivityMediator",
		type = "@C"
	},
	ActivityLogin14CommonMediator = {
		url = "dm.gameplay.activity.view.ActivityLogin14CommonMediator",
		name = "ActivityLogin14CommonMediator",
		type = "@C"
	},
	QuestionActivityMediator = {
		url = "dm.gameplay.activity.view.QuestionActivityMediator",
		name = "QuestionActivityMediator",
		type = "@C"
	},
	ExtraRewardActivityMediator = {
		url = "dm.gameplay.activity.view.ExtraRewardActivityMediator",
		name = "ExtraRewardActivityMediator",
		type = "@C"
	},
	ActivitySunflowerMainMediator = {
		url = "dm.gameplay.activity.view.ActivitySunflowerMainMediator",
		name = "ActivitySunflowerMainMediator",
		type = "@C"
	},
	ActivitySagaSupportRankMediator = {
		url = "dm.gameplay.activity.view.ActivitySagaSupportRankMediator",
		name = "ActivitySagaSupportRankMediator",
		type = "@C"
	},
	ActivitySagaSupportStageMediator = {
		url = "dm.gameplay.activity.view.ActivitySagaSupportStageMediator",
		name = "ActivitySagaSupportStageMediator",
		type = "@C"
	},
	ActivityCommonMainMediator = {
		url = "dm.gameplay.activity.view.ActivityCommonMainMediator",
		name = "ActivityCommonMainMediator",
		type = "@C"
	},
	ActivityBlockMonsterShopMediator = {
		url = "dm.gameplay.activity.view.ActivityBlockMonsterShopMediator",
		name = "ActivityBlockMonsterShopMediator",
		type = "@C"
	},
	ActivityDrawCardFeedbackMediator = {
		url = "dm.gameplay.activity.view.ActivityDrawCardFeedbackMediator",
		name = "ActivityDrawCardFeedbackMediator",
		type = "@C"
	},
	ActivityStageUnFinishMediator = {
		url = "dm.gameplay.activity.view.ActivityStageUnFinishMediator",
		name = "ActivityStageUnFinishMediator",
		type = "@C"
	},
	ReturnActivityTaskReachedMediator = {
		url = "dm.gameplay.activity.view.ReturnActivityTaskReachedMediator",
		name = "ReturnActivityTaskReachedMediator",
		type = "@C"
	},
	ActivityPointDetailMediator = {
		url = "dm.gameplay.activity.view.ActivityPointDetailMediator",
		name = "ActivityPointDetailMediator",
		type = "@C"
	},
	ActivitySupportRankHolidayMediator = {
		url = "dm.gameplay.activity.view.shuangdan.ActivitySupportRankHolidayMediator",
		name = "ActivitySupportRankHolidayMediator",
		type = "@C"
	},
	ActivityBlockFudaiPreviewMeditor = {
		url = "dm.gameplay.activity.view.shuangdan.ActivityBlockFudaiPreviewMeditor",
		name = "ActivityBlockFudaiPreviewMeditor",
		type = "@C"
	},
	ActivitySupportWinHolidayMediator = {
		url = "dm.gameplay.activity.view.shuangdan.ActivitySupportWinHolidayMediator",
		name = "ActivitySupportWinHolidayMediator",
		type = "@C"
	},
	ActivitySupportRewardHolidayMediator = {
		url = "dm.gameplay.activity.view.shuangdan.ActivitySupportRewardHolidayMediator",
		name = "ActivitySupportRewardHolidayMediator",
		type = "@C"
	},
	ActivitySupportPailianHolidayMediator = {
		url = "dm.gameplay.activity.view.shuangdan.ActivitySupportPailianHolidayMediator",
		name = "ActivitySupportPailianHolidayMediator",
		type = "@C"
	},
	ActivityBlockFudaiMediator = {
		url = "dm.gameplay.activity.view.shuangdan.ActivityBlockFudaiMediator",
		name = "ActivityBlockFudaiMediator",
		type = "@C"
	},
	ActivitySupportHolidayMediator = {
		url = "dm.gameplay.activity.view.shuangdan.ActivitySupportHolidayMediator",
		name = "ActivitySupportHolidayMediator",
		type = "@C"
	},
	ActivityBlockHolidayMediator = {
		url = "dm.gameplay.activity.view.shuangdan.ActivityBlockHolidayMediator",
		name = "ActivityBlockHolidayMediator",
		type = "@C"
	},
	ActivitySagaSupportRankRewardMediator = {
		url = "dm.gameplay.activity.view.ActivitySagaSupportRankRewardMediator",
		name = "ActivitySagaSupportRankRewardMediator",
		type = "@C"
	},
	ActivityMediator = {
		url = "dm.gameplay.activity.view.ActivityMediator",
		name = "ActivityMediator",
		type = "@C"
	},
	ActivitySagaSupportStageWxhMediator = {
		url = "dm.gameplay.activity.view.ActivitySagaSupportStageWxhMediator",
		name = "ActivitySagaSupportStageWxhMediator",
		type = "@C"
	},
	ActivitySagaSupportScoreRewardMediator = {
		url = "dm.gameplay.activity.view.ActivitySagaSupportScoreRewardMediator",
		name = "ActivitySagaSupportScoreRewardMediator",
		type = "@C"
	},
	ActivitySagaSupportClubMediator = {
		url = "dm.gameplay.activity.view.ActivitySagaSupportClubMediator",
		name = "ActivitySagaSupportClubMediator",
		type = "@C"
	},
	ImageBoardActivityMediator = {
		url = "dm.gameplay.activity.view.ImageBoardActivityMediator",
		name = "ImageBoardActivityMediator",
		type = "@C"
	},
	ActivityNpcRoleDetailMediator = {
		url = "dm.gameplay.activity.view.ActivityNpcRoleDetailMediator",
		name = "ActivityNpcRoleDetailMediator",
		type = "@C"
	},
	ActivityBlockTeamMediator = {
		url = "dm.gameplay.activity.view.ActivityBlockTeamMediator",
		name = "ActivityBlockTeamMediator",
		type = "@C"
	},
	ActivityReturnLetterRewardMediator = {
		url = "dm.gameplay.activity.view.ActivityReturnLetterRewardMediator",
		name = "ActivityReturnLetterRewardMediator",
		type = "@C"
	},
	RechargeTipMediator = {
		url = "dm.gameplay.activity.view.RechargeTipMediator",
		name = "RechargeTipMediator",
		type = "@C"
	},
	ActivityExchangeMediator = {
		url = "dm.gameplay.activity.view.ActivityExchangeMediator",
		name = "ActivityExchangeMediator",
		type = "@C"
	},
	ActivityFocusOnMediator = {
		url = "dm.gameplay.activity.view.ActivityFocusOnMediator",
		name = "ActivityFocusOnMediator",
		type = "@C"
	},
	ActivitySagaSupportMapMediator = {
		url = "dm.gameplay.activity.view.ActivitySagaSupportMapMediator",
		name = "ActivitySagaSupportMapMediator",
		type = "@C"
	},
	CarnivalMediator = {
		url = "dm.gameplay.activity.view.CarnivalMediator",
		name = "CarnivalMediator",
		type = "@C"
	},
	GameBoardActivityMediator = {
		url = "dm.gameplay.activity.view.GameBoardActivityMediator",
		name = "GameBoardActivityMediator",
		type = "@C"
	},
	ActivityReturnMediator = {
		url = "dm.gameplay.activity.view.ActivityReturnMediator",
		name = "ActivityReturnMediator",
		type = "@C"
	},
	ActivityStageFinishMediator = {
		url = "dm.gameplay.activity.view.ActivityStageFinishMediator",
		name = "ActivityStageFinishMediator",
		type = "@C"
	},
	ActivityEggSuccMediator = {
		url = "dm.gameplay.activity.view.ActivityEggSuccMediator",
		name = "ActivityEggSuccMediator",
		type = "@C"
	},
	ActivityColorEggMediator = {
		url = "dm.gameplay.activity.view.ActivityColorEggMediator",
		name = "ActivityColorEggMediator",
		type = "@C"
	},
	LoginActivityMediator = {
		url = "dm.gameplay.activity.view.LoginActivityMediator",
		name = "LoginActivityMediator",
		type = "@C"
	},
	ActivityBlockTaskMediator = {
		url = "dm.gameplay.activity.view.ActivityBlockTaskMediator",
		name = "ActivityBlockTaskMediator",
		type = "@C"
	},
	ActivityListMediator = {
		url = "dm.gameplay.activity.view.ActivityListMediator",
		name = "ActivityListMediator",
		type = "@C"
	},
	FreeStaminaActivityMediator = {
		url = "dm.gameplay.activity.view.FreeStaminaActivityMediator",
		name = "FreeStaminaActivityMediator",
		type = "@C"
	},
	ActivityBlockMonsterShopBuyItemMediator = {
		url = "dm.gameplay.activity.view.ActivityBlockMonsterShopBuyItemMediator",
		name = "ActivityBlockMonsterShopBuyItemMediator",
		type = "@C"
	},
	ActivityHeroCollectMediator = {
		url = "dm.gameplay.activity.view.ActivityHeroCollectMediator",
		name = "ActivityHeroCollectMediator",
		type = "@C"
	},
	ReturnShopActivityMediator = {
		url = "dm.gameplay.activity.view.ReturnShopActivityMediator",
		name = "ReturnShopActivityMediator",
		type = "@C"
	},
	ActivityLoginLoverMediator = {
		url = "dm.gameplay.activity.view.ActivityLoginLoverMediator",
		name = "ActivityLoginLoverMediator",
		type = "@C"
	},
	ActivityBlockEggMediator = {
		url = "dm.gameplay.activity.view.ActivityBlockEggMediator",
		name = "ActivityBlockEggMediator",
		type = "@C"
	},
	TaskActivityMediator = {
		url = "dm.gameplay.activity.view.TaskActivityMediator",
		name = "TaskActivityMediator",
		type = "@C"
	},
	ActivityTaskReachedMediator = {
		url = "dm.gameplay.activity.view.ActivityTaskReachedMediator",
		name = "ActivityTaskReachedMediator",
		type = "@C"
	},
	ActivityBlockSummerExchangeMediator = {
		url = "dm.gameplay.activity.view.ActivityBlockSummerExchangeMediator",
		name = "ActivityBlockSummerExchangeMediator",
		type = "@C"
	},
	ReturnHeroChangeMediator = {
		url = "dm.gameplay.activity.view.ReturnHeroChangeMediator",
		name = "ReturnHeroChangeMediator",
		type = "@C"
	},
	ActivityBlockMusicMediator = {
		url = "dm.gameplay.activity.view.ActivityBlockMusicMediator",
		name = "ActivityBlockMusicMediator",
		type = "@C"
	},
	ActivityBlockSummerMediator = {
		url = "dm.gameplay.activity.view.ActivityBlockSummerMediator",
		name = "ActivityBlockSummerMediator",
		type = "@C"
	},
	MCBuySuccessMediator = {
		url = "dm.gameplay.activity.view.MCBuySuccessMediator",
		name = "MCBuySuccessMediator",
		type = "@C"
	},
	ActivitySagaBatchUseSellMediator = {
		url = "dm.gameplay.activity.view.ActivitySagaBatchUseSellMediator",
		name = "ActivitySagaBatchUseSellMediator",
		type = "@C"
	},
	LoginActivityWsjMediator = {
		url = "dm.gameplay.activity.view.LoginActivityWsjMediator",
		name = "LoginActivityWsjMediator",
		type = "@C"
	},
	EightDayLoginMediator = {
		url = "dm.gameplay.activity.view.EightDayLoginMediator",
		name = "EightDayLoginMediator",
		type = "@C"
	},
	ActivityTaskMonthCardMediator = {
		url = "dm.gameplay.activity.view.ActivityTaskMonthCardMediator",
		name = "ActivityTaskMonthCardMediator",
		type = "@C"
	},
	TimeLimitShopActivityMediator = {
		url = "dm.gameplay.activity.view.TimeLimitShopActivityMediator",
		name = "TimeLimitShopActivityMediator",
		type = "@C"
	},
	ActivityTaskCollectMediator = {
		url = "dm.gameplay.activity.view.ActivityTaskCollectMediator",
		name = "ActivityTaskCollectMediator",
		type = "@C"
	},
	ActivityFateEncountersMediator = {
		url = "dm.gameplay.activity.view.ActivityFateEncountersMediator",
		name = "ActivityFateEncountersMediator",
		type = "@C"
	},
	ActivityCollapsedMainMediator = {
		url = "dm.gameplay.activity.view.ActivityCollapsedMainMediator",
		name = "ActivityCollapsedMainMediator",
		type = "@C"
	},
	ActivityBlockMediator = {
		url = "dm.gameplay.activity.view.ActivityBlockMediator",
		name = "ActivityBlockMediator",
		type = "@C"
	},
	ReturnActivityLoginMediator = {
		url = "dm.gameplay.activity.view.ReturnActivityLoginMediator",
		name = "ReturnActivityLoginMediator",
		type = "@C"
	},
	ActivitySagaSupportScheduleMediator = {
		url = "dm.gameplay.activity.view.ActivitySagaSupportScheduleMediator",
		name = "ActivitySagaSupportScheduleMediator",
		type = "@C"
	},
	ActivityBlockMapWsjMediator = {
		url = "dm.gameplay.activity.view.ActivityBlockMapWsjMediator",
		name = "ActivityBlockMapWsjMediator",
		type = "@C"
	},
	ActivityTaskDailyMediator = {
		url = "dm.gameplay.activity.view.ActivityTaskDailyMediator",
		name = "ActivityTaskDailyMediator",
		type = "@C"
	},
	EVT_GET_MAIL_LIST_SUCC = {
		url = "dm.gameplay.mail.controller.MailSystem",
		name = "EVT_GET_MAIL_LIST_SUCC",
		type = "@V"
	},
	EVT_READ_MAIL_SUCC = {
		url = "dm.gameplay.mail.controller.MailSystem",
		name = "EVT_READ_MAIL_SUCC",
		type = "@V"
	},
	EVT_MAILBOX_UPDATA_VIEW = {
		url = "dm.gameplay.mail.controller.MailSystem",
		name = "EVT_MAILBOX_UPDATA_VIEW",
		type = "@V"
	},
	EVT_RECEIVE_MAIL_ONEKEY_SUCC = {
		url = "dm.gameplay.mail.controller.MailSystem",
		name = "EVT_RECEIVE_MAIL_ONEKEY_SUCC",
		type = "@V"
	},
	EVT_UPDATA_UNREAD_NUM = {
		url = "dm.gameplay.mail.controller.MailSystem",
		name = "EVT_UPDATA_UNREAD_NUM",
		type = "@V"
	},
	MailTipsMediator = {
		url = "dm.gameplay.mail.view.MailTipsMediator",
		name = "MailTipsMediator",
		type = "@C"
	},
	MailMediator = {
		url = "dm.gameplay.mail.view.MailMediator",
		name = "MailMediator",
		type = "@C"
	},
	GalleryMemoryListMediator = {
		url = "dm.gameplay.gallery.view.GalleryMemoryListMediator",
		name = "GalleryMemoryListMediator",
		type = "@C"
	},
	GalleryLegendInfoMediator = {
		url = "dm.gameplay.gallery.view.GalleryLegendInfoMediator",
		name = "GalleryLegendInfoMediator",
		type = "@C"
	},
	GalleryPartnerMediator = {
		url = "dm.gameplay.gallery.view.GalleryPartnerMediator",
		name = "GalleryPartnerMediator",
		type = "@C"
	},
	GalleryAlbumMediator = {
		url = "dm.gameplay.gallery.view.GalleryAlbumMediator",
		name = "GalleryAlbumMediator",
		type = "@C"
	},
	GalleryMainMediator = {
		url = "dm.gameplay.gallery.view.GalleryMainMediator",
		name = "GalleryMainMediator",
		type = "@C"
	},
	GalleryDateMediator = {
		url = "dm.gameplay.gallery.view.GalleryDateMediator",
		name = "GalleryDateMediator",
		type = "@C"
	},
	GalleryPartnerRewardMediator = {
		url = "dm.gameplay.gallery.view.GalleryPartnerRewardMediator",
		name = "GalleryPartnerRewardMediator",
		type = "@C"
	},
	GalleryPartnerPastMediator = {
		url = "dm.gameplay.gallery.view.GalleryPartnerPastMediator",
		name = "GalleryPartnerPastMediator",
		type = "@C"
	},
	GalleryLegendMediator = {
		url = "dm.gameplay.gallery.view.GalleryLegendMediator",
		name = "GalleryLegendMediator",
		type = "@C"
	},
	GalleryPartnerInfoMediator = {
		url = "dm.gameplay.gallery.view.GalleryPartnerInfoMediator",
		name = "GalleryPartnerInfoMediator",
		type = "@C"
	},
	GalleryMemoryInfoMediator = {
		url = "dm.gameplay.gallery.view.GalleryMemoryInfoMediator",
		name = "GalleryMemoryInfoMediator",
		type = "@C"
	},
	GalleryAlbumShotsMediator = {
		url = "dm.gameplay.gallery.view.GalleryAlbumShotsMediator",
		name = "GalleryAlbumShotsMediator",
		type = "@C"
	},
	GalleryMemoryPackMediator = {
		url = "dm.gameplay.gallery.view.GalleryMemoryPackMediator",
		name = "GalleryMemoryPackMediator",
		type = "@C"
	},
	GalleryMemoryMediator = {
		url = "dm.gameplay.gallery.view.GalleryMemoryMediator",
		name = "GalleryMemoryMediator",
		type = "@C"
	},
	GalleryRewardBoxMediator = {
		url = "dm.gameplay.gallery.view.GalleryRewardBoxMediator",
		name = "GalleryRewardBoxMediator",
		type = "@C"
	},
	GalleryAlbumInfoMediator = {
		url = "dm.gameplay.gallery.view.GalleryAlbumInfoMediator",
		name = "GalleryAlbumInfoMediator",
		type = "@C"
	},
	GalleryLoveUpMediator = {
		url = "dm.gameplay.gallery.view.GalleryLoveUpMediator",
		name = "GalleryLoveUpMediator",
		type = "@C"
	},
	PlayerInfoMediator = {
		url = "dm.gameplay.commonModule.PlayerInfoMediator",
		name = "PlayerInfoMediator",
		type = "@C"
	},
	LoadingMediator = {
		url = "dm.gameplay.commonModule.loading.LoadingMediator",
		name = "LoadingMediator",
		type = "@C"
	},
	CommonLoadingMediator = {
		url = "dm.gameplay.commonModule.loading.CommonLoadingMediator",
		name = "CommonLoadingMediator",
		type = "@C"
	},
	EVT_RESET_DONE = {
		url = "dm.gameplay.reset.ResetSystem",
		name = "EVT_RESET_DONE",
		type = "@V"
	},
	EVT_MONTHSIGNIN_RESET_DONE = {
		url = "dm.gameplay.monthSignIn.controller.MonthSignInSystem",
		name = "EVT_MONTHSIGNIN_RESET_DONE",
		type = "@V"
	},
	MonthSignInMediator = {
		url = "dm.gameplay.monthSignIn.view.MonthSignInMediator",
		name = "MonthSignInMediator",
		type = "@C"
	},
	MSPopRewardBoxMediator = {
		url = "dm.gameplay.monthSignIn.view.MSPopRewardBoxMediator",
		name = "MSPopRewardBoxMediator",
		type = "@C"
	},
	StoryEditorMediator = {
		url = "dm.gameplay.storyeditor.StoryEditorMediator",
		name = "StoryEditorMediator",
		type = "@C"
	},
	DreamChallengeSystem = {
		url = "dm.gameplay.dreamChallenge.controller.DreamChallengeSystem",
		name = "DreamChallengeSystem",
		type = "@C"
	},
	DreamChallengePointMediator = {
		url = "dm.gameplay.dreamChallenge.view.DreamChallengePointMediator",
		name = "DreamChallengePointMediator",
		type = "@C"
	},
	DreamChallengeBuffDetailMediator = {
		url = "dm.gameplay.dreamChallenge.view.DreamChallengeBuffDetailMediator",
		name = "DreamChallengeBuffDetailMediator",
		type = "@C"
	},
	DreamChallengeDetailMediator = {
		url = "dm.gameplay.dreamChallenge.view.DreamChallengeDetailMediator",
		name = "DreamChallengeDetailMediator",
		type = "@C"
	},
	DreamChallengePassMediator = {
		url = "dm.gameplay.dreamChallenge.view.DreamChallengePassMediator",
		name = "DreamChallengePassMediator",
		type = "@C"
	},
	DreamChallengeBattleEndMediator = {
		url = "dm.gameplay.dreamChallenge.view.DreamChallengeBattleEndMediator",
		name = "DreamChallengeBattleEndMediator",
		type = "@C"
	},
	DreamChallengeMainMediator = {
		url = "dm.gameplay.dreamChallenge.view.DreamChallengeMainMediator",
		name = "DreamChallengeMainMediator",
		type = "@C"
	},
	DreamChallengeTeamMediator = {
		url = "dm.gameplay.dreamChallenge.view.DreamChallengeTeamMediator",
		name = "DreamChallengeTeamMediator",
		type = "@C"
	},
	ShopPackageMediator = {
		url = "dm.gameplay.shop.view.ShopPackageMediator",
		name = "ShopPackageMediator",
		type = "@C"
	},
	ShopRechargeMediator = {
		url = "dm.gameplay.shop.view.ShopRechargeMediator",
		name = "ShopRechargeMediator",
		type = "@C"
	},
	ShopMainMediator = {
		url = "dm.gameplay.shop.view.ShopMainMediator",
		name = "ShopMainMediator",
		type = "@C"
	},
	ShopPackageMainMediator = {
		url = "dm.gameplay.shop.view.ShopPackageMainMediator",
		name = "ShopPackageMainMediator",
		type = "@C"
	},
	ShopBuySurfaceMediator = {
		url = "dm.gameplay.shop.view.ShopBuySurfaceMediator",
		name = "ShopBuySurfaceMediator",
		type = "@C"
	},
	ShopDebrisMediator = {
		url = "dm.gameplay.shop.view.ShopDebrisMediator",
		name = "ShopDebrisMediator",
		type = "@C"
	},
	ShopBuyMonthCardMediator = {
		url = "dm.gameplay.shop.view.ShopBuyMonthCardMediator",
		name = "ShopBuyMonthCardMediator",
		type = "@C"
	},
	ShopSurfaceMediator = {
		url = "dm.gameplay.shop.view.ShopSurfaceMediator",
		name = "ShopSurfaceMediator",
		type = "@C"
	},
	ShopBuyPackageMediator = {
		url = "dm.gameplay.shop.view.ShopBuyPackageMediator",
		name = "ShopBuyPackageMediator",
		type = "@C"
	},
	ShopCoopExchangeBuyMediator = {
		url = "dm.gameplay.shop.view.ShopCoopExchangeBuyMediator",
		name = "ShopCoopExchangeBuyMediator",
		type = "@C"
	},
	ShopMonthCardMediator = {
		url = "dm.gameplay.shop.view.ShopMonthCardMediator",
		name = "ShopMonthCardMediator",
		type = "@C"
	},
	ShopBuyNormalMediator = {
		url = "dm.gameplay.shop.view.ShopBuyNormalMediator",
		name = "ShopBuyNormalMediator",
		type = "@C"
	},
	ShopRecommendMediator = {
		url = "dm.gameplay.shop.view.ShopRecommendMediator",
		name = "ShopRecommendMediator",
		type = "@C"
	},
	ShopNormalMediator = {
		url = "dm.gameplay.shop.view.ShopNormalMediator",
		name = "ShopNormalMediator",
		type = "@C"
	},
	RefundDetailMediator = {
		url = "dm.gameplay.shop.view.RefundDetailMediator",
		name = "RefundDetailMediator",
		type = "@C"
	},
	ShopSellMediator = {
		url = "dm.gameplay.shop.view.ShopSellMediator",
		name = "ShopSellMediator",
		type = "@C"
	},
	ShopBuyMediator = {
		url = "dm.gameplay.shop.view.ShopBuyMediator",
		name = "ShopBuyMediator",
		type = "@C"
	},
	ShopRefreshMediator = {
		url = "dm.gameplay.shop.view.ShopRefreshMediator",
		name = "ShopRefreshMediator",
		type = "@C"
	},
	ShopResetMediator = {
		url = "dm.gameplay.shop.view.ShopResetMediator",
		name = "ShopResetMediator",
		type = "@C"
	},
	ShopCoopExchangeMediator = {
		url = "dm.gameplay.shop.view.ShopCoopExchangeMediator",
		name = "ShopCoopExchangeMediator",
		type = "@C"
	},
	ShopBuyMonthCardFMediator = {
		url = "dm.gameplay.shop.view.ShopBuyMonthCardFMediator",
		name = "ShopBuyMonthCardFMediator",
		type = "@C"
	},
	ShopDebrisSellMediator = {
		url = "dm.gameplay.shop.view.ShopDebrisSellMediator",
		name = "ShopDebrisSellMediator",
		type = "@C"
	},
	TestClippingNodeMediator = {
		url = "dm.gameplay.tests.view.TestClippingNodeMediator",
		name = "TestClippingNodeMediator",
		type = "@C"
	},
	TestTempViewMediator = {
		url = "dm.gameplay.tests.view.TestTempViewMediator",
		name = "TestTempViewMediator",
		type = "@C"
	},
	TestLuaProfilerMediator = {
		url = "dm.gameplay.tests.view.TestLuaProfilerMediator",
		name = "TestLuaProfilerMediator",
		type = "@C"
	},
	TestViewMediator = {
		url = "dm.gameplay.tests.view.TestViewMediator",
		name = "TestViewMediator",
		type = "@C"
	},
	TestPageViewUtilMediator = {
		url = "dm.gameplay.tests.view.TestPageViewUtilMediator",
		name = "TestPageViewUtilMediator",
		type = "@C"
	},
	Test_AnnotationMediator = {
		url = "dm.gameplay.tests.view.Test_AnnotationMediator",
		name = "Test_AnnotationMediator",
		type = "@C"
	},
	TestEasyTabMediator = {
		url = "dm.gameplay.tests.view.TestEasyTabMediator",
		name = "TestEasyTabMediator",
		type = "@C"
	},
	TestCollectionViewUtilsMediator = {
		url = "dm.gameplay.tests.view.TestCollectionViewUtilsMediator",
		name = "TestCollectionViewUtilsMediator",
		type = "@C"
	},
	TestMultiCellMediator = {
		url = "dm.gameplay.tests.view.TestMultiCellMediator",
		name = "TestMultiCellMediator",
		type = "@C"
	},
	SurfaceMediator = {
		url = "dm.gameplay.surface.view.SurfaceMediator",
		name = "SurfaceMediator",
		type = "@C"
	},
	GetSurfaceMediator = {
		url = "dm.gameplay.surface.view.GetSurfaceMediator",
		name = "GetSurfaceMediator",
		type = "@C"
	},
	CrusadeSystem = {
		url = "dm.gameplay.crusade.controller.CrusadeSystem",
		name = "CrusadeSystem",
		type = "@C"
	},
	CrusadePowerMediator = {
		url = "dm.gameplay.crusade.view.CrusadePowerMediator",
		name = "CrusadePowerMediator",
		type = "@C"
	},
	CrusadeMainMediator = {
		url = "dm.gameplay.crusade.view.CrusadeMainMediator",
		name = "CrusadeMainMediator",
		type = "@C"
	},
	CrusadePassFloorMediator = {
		url = "dm.gameplay.crusade.view.CrusadePassFloorMediator",
		name = "CrusadePassFloorMediator",
		type = "@C"
	},
	CrusadeSweepTipMediator = {
		url = "dm.gameplay.crusade.view.CrusadeSweepTipMediator",
		name = "CrusadeSweepTipMediator",
		type = "@C"
	},
	CrusadeSweepResultMediator = {
		url = "dm.gameplay.crusade.view.CrusadeSweepResultMediator",
		name = "CrusadeSweepResultMediator",
		type = "@C"
	},
	CrusadeAwardMediator = {
		url = "dm.gameplay.crusade.view.CrusadeAwardMediator",
		name = "CrusadeAwardMediator",
		type = "@C"
	},
	CrusadeBattleWinMediator = {
		url = "dm.gameplay.crusade.view.CrusadeBattleWinMediator",
		name = "CrusadeBattleWinMediator",
		type = "@C"
	},
	EVT_EXPLORE_ADD_OBJ = {
		url = "dm.gameplay.explore.model.ExploreMap",
		name = "EVT_EXPLORE_ADD_OBJ",
		type = "@V"
	},
	EVT_EXPLORE_REMOVE_OBJ = {
		url = "dm.gameplay.explore.model.ExploreMap",
		name = "EVT_EXPLORE_REMOVE_OBJ",
		type = "@V"
	},
	ExploreMapCaseAlertMediator = {
		url = "dm.gameplay.explore.view.ExploreMapCaseAlertMediator",
		name = "ExploreMapCaseAlertMediator",
		type = "@C"
	},
	ExploreShopMediator = {
		url = "dm.gameplay.explore.view.ExploreShopMediator",
		name = "ExploreShopMediator",
		type = "@C"
	},
	ExploreMapAddPowerMediator = {
		url = "dm.gameplay.explore.view.ExploreMapAddPowerMediator",
		name = "ExploreMapAddPowerMediator",
		type = "@C"
	},
	ExploreTeamMediator = {
		url = "dm.gameplay.explore.view.ExploreTeamMediator",
		name = "ExploreTeamMediator",
		type = "@C"
	},
	ExplorePointRuleMediator = {
		url = "dm.gameplay.explore.view.ExplorePointRuleMediator",
		name = "ExplorePointRuleMediator",
		type = "@C"
	},
	ExploreObjectMediator = {
		url = "dm.gameplay.explore.view.component.ExploreObjectMediator",
		name = "ExploreObjectMediator",
		type = "@C"
	},
	ExploreRoleMediator = {
		url = "dm.gameplay.explore.view.component.ExploreRoleMediator",
		name = "ExploreRoleMediator",
		type = "@C"
	},
	ExploreLogMediator = {
		url = "dm.gameplay.explore.view.ExploreLogMediator",
		name = "ExploreLogMediator",
		type = "@C"
	},
	ExplorePointTaskMediator = {
		url = "dm.gameplay.explore.view.ExplorePointTaskMediator",
		name = "ExplorePointTaskMediator",
		type = "@C"
	},
	ExploreMediator = {
		url = "dm.gameplay.explore.view.ExploreMediator",
		name = "ExploreMediator",
		type = "@C"
	},
	ExploreBattleFinishMediator = {
		url = "dm.gameplay.explore.view.ExploreBattleFinishMediator",
		name = "ExploreBattleFinishMediator",
		type = "@C"
	},
	ExploreFinishMediator = {
		url = "dm.gameplay.explore.view.ExploreFinishMediator",
		name = "ExploreFinishMediator",
		type = "@C"
	},
	ExploreMapZombieMediator = {
		url = "dm.gameplay.explore.view.ExploreMapZombieMediator",
		name = "ExploreMapZombieMediator",
		type = "@C"
	},
	ExploreBagMediator = {
		url = "dm.gameplay.explore.view.ExploreBagMediator",
		name = "ExploreBagMediator",
		type = "@C"
	},
	ExploreVictoryMediator = {
		url = "dm.gameplay.explore.view.ExploreVictoryMediator",
		name = "ExploreVictoryMediator",
		type = "@C"
	},
	ExploreTinyMapMediator = {
		url = "dm.gameplay.explore.view.ExploreTinyMapMediator",
		name = "ExploreTinyMapMediator",
		type = "@C"
	},
	ExploreStageMediator = {
		url = "dm.gameplay.explore.view.ExploreStageMediator",
		name = "ExploreStageMediator",
		type = "@C"
	},
	ExplorePointInfoMediator = {
		url = "dm.gameplay.explore.view.ExplorePointInfoMediator",
		name = "ExplorePointInfoMediator",
		type = "@C"
	},
	ExploreMapUIMediator = {
		url = "dm.gameplay.explore.view.ExploreMapUIMediator",
		name = "ExploreMapUIMediator",
		type = "@C"
	},
	ExplorePointBoxMediator = {
		url = "dm.gameplay.explore.view.ExplorePointBoxMediator",
		name = "ExplorePointBoxMediator",
		type = "@C"
	},
	ExploreMapViewMediator = {
		url = "dm.gameplay.explore.view.ExploreMapViewMediator",
		name = "ExploreMapViewMediator",
		type = "@C"
	},
	MazeSuspectVotesMediator = {
		url = "dm.gameplay.maze.view.MazeSuspectVotesMediator",
		name = "MazeSuspectVotesMediator",
		type = "@C"
	},
	MazeEventInfoMediator = {
		url = "dm.gameplay.maze.view.MazeEventInfoMediator",
		name = "MazeEventInfoMediator",
		type = "@C"
	},
	MazeHeroUpMediator = {
		url = "dm.gameplay.maze.view.MazeHeroUpMediator",
		name = "MazeHeroUpMediator",
		type = "@C"
	},
	MazeTreasureBoxMediator = {
		url = "dm.gameplay.maze.view.MazeTreasureBoxMediator",
		name = "MazeTreasureBoxMediator",
		type = "@C"
	},
	MazeHeroBoxMediator = {
		url = "dm.gameplay.maze.view.MazeHeroBoxMediator",
		name = "MazeHeroBoxMediator",
		type = "@C"
	},
	MazeChapteBossMediator = {
		url = "dm.gameplay.maze.view.MazeChapteBossMediator",
		name = "MazeChapteBossMediator",
		type = "@C"
	},
	MazeEnterMediator = {
		url = "dm.gameplay.maze.view.MazeEnterMediator",
		name = "MazeEnterMediator",
		type = "@C"
	},
	MazeTreasureExchangeMediator = {
		url = "dm.gameplay.maze.view.MazeTreasureExchangeMediator",
		name = "MazeTreasureExchangeMediator",
		type = "@C"
	},
	MazeMainMediator = {
		url = "dm.gameplay.maze.view.MazeMainMediator",
		name = "MazeMainMediator",
		type = "@C"
	},
	MazeTreasureShopMediator = {
		url = "dm.gameplay.maze.view.MazeTreasureShopMediator",
		name = "MazeTreasureShopMediator",
		type = "@C"
	},
	MazeTreasureOwnMediator = {
		url = "dm.gameplay.maze.view.MazeTreasureOwnMediator",
		name = "MazeTreasureOwnMediator",
		type = "@C"
	},
	MazeDpMediator = {
		url = "dm.gameplay.maze.view.MazeDpMediator",
		name = "MazeDpMediator",
		type = "@C"
	},
	MazeHeroUpSucMediator = {
		url = "dm.gameplay.maze.view.MazeHeroUpSucMediator",
		name = "MazeHeroUpSucMediator",
		type = "@C"
	},
	MazeMasterBuffMediator = {
		url = "dm.gameplay.maze.view.MazeMasterBuffMediator",
		name = "MazeMasterBuffMediator",
		type = "@C"
	},
	MazeTeamMediator = {
		url = "dm.gameplay.maze.view.MazeTeamMediator",
		name = "MazeTeamMediator",
		type = "@C"
	},
	MazeHeroShopMediator = {
		url = "dm.gameplay.maze.view.MazeHeroShopMediator",
		name = "MazeHeroShopMediator",
		type = "@C"
	},
	MazeTreasureCopyMediator = {
		url = "dm.gameplay.maze.view.MazeTreasureCopyMediator",
		name = "MazeTreasureCopyMediator",
		type = "@C"
	},
	MazeMasterSkillMediator = {
		url = "dm.gameplay.maze.view.MazeMasterSkillMediator",
		name = "MazeMasterSkillMediator",
		type = "@C"
	},
	MazeTreasureGetMediator = {
		url = "dm.gameplay.maze.view.MazeTreasureGetMediator",
		name = "MazeTreasureGetMediator",
		type = "@C"
	},
	MazeSealMediator = {
		url = "dm.gameplay.maze.view.MazeSealMediator",
		name = "MazeSealMediator",
		type = "@C"
	},
	MazeQuestionMediator = {
		url = "dm.gameplay.maze.view.MazeQuestionMediator",
		name = "MazeQuestionMediator",
		type = "@C"
	},
	MazeMasterUpSucMediator = {
		url = "dm.gameplay.maze.view.MazeMasterUpSucMediator",
		name = "MazeMasterUpSucMediator",
		type = "@C"
	},
	MazeTreasureUseSucMediator = {
		url = "dm.gameplay.maze.view.MazeTreasureUseSucMediator",
		name = "MazeTreasureUseSucMediator",
		type = "@C"
	},
	MazeEventMainMediator = {
		url = "dm.gameplay.maze.view.MazeEventMainMediator",
		name = "MazeEventMainMediator",
		type = "@C"
	},
	MazeMasterMediator = {
		url = "dm.gameplay.maze.view.MazeMasterMediator",
		name = "MazeMasterMediator",
		type = "@C"
	},
	EVT_REDPOINT_REFRESH = {
		url = "dm.gameplay.redpoint.RedPointRefreshCommond",
		name = "EVT_REDPOINT_REFRESH",
		type = "@V"
	},
	RedPointRefreshCommond = {
		url = "dm.gameplay.redpoint.RedPointRefreshCommond",
		name = "RedPointRefreshCommond",
		type = "@C"
	},
	EVT_DARTS_PLAYAGAIN = {
		url = "dm.gameplay.miniGame.controller.DartsSystem",
		name = "EVT_DARTS_PLAYAGAIN",
		type = "@V"
	},
	EVT_DARTS_RESULTCLOSE = {
		url = "dm.gameplay.miniGame.controller.DartsSystem",
		name = "EVT_DARTS_RESULTCLOSE",
		type = "@V"
	},
	EVT_DARTS_REWARDCONFIRM = {
		url = "dm.gameplay.miniGame.controller.DartsSystem",
		name = "EVT_DARTS_REWARDCONFIRM",
		type = "@V"
	},
	EVT_DARTS_REWARDCONFIRM_ADD = {
		url = "dm.gameplay.miniGame.controller.DartsSystem",
		name = "EVT_DARTS_REWARDCONFIRM_ADD",
		type = "@V"
	},
	EVT_DARTS_QUIT_SUCC = {
		url = "dm.gameplay.miniGame.controller.DartsSystem",
		name = "EVT_DARTS_QUIT_SUCC",
		type = "@V"
	},
	EVT_DARTS_BACK_SUCC = {
		url = "dm.gameplay.miniGame.controller.DartsSystem",
		name = "EVT_DARTS_BACK_SUCC",
		type = "@V"
	},
	EVT_DARTS_PASSGAME_SUCC = {
		url = "dm.gameplay.miniGame.controller.DartsSystem",
		name = "EVT_DARTS_PASSGAME_SUCC",
		type = "@V"
	},
	EVT_ACTIVITY_MINIGAME_REQUEST_ENTER_SUCCESS = {
		url = "dm.gameplay.miniGame.MiniGameConfig",
		name = "EVT_ACTIVITY_MINIGAME_REQUEST_ENTER_SUCCESS",
		type = "@V"
	},
	EVT_ACTIVITY_MINIGAME_BUYTIMES_SCUESS = {
		url = "dm.gameplay.miniGame.MiniGameConfig",
		name = "EVT_ACTIVITY_MINIGAME_BUYTIMES_SCUESS",
		type = "@V"
	},
	EVT_ACTIVITY_MINIGAME_BEGIN_SCUESS = {
		url = "dm.gameplay.miniGame.MiniGameConfig",
		name = "EVT_ACTIVITY_MINIGAME_BEGIN_SCUESS",
		type = "@V"
	},
	EVT_ACTIVITY_MINIGAME_RESULT_SCUESS = {
		url = "dm.gameplay.miniGame.MiniGameConfig",
		name = "EVT_ACTIVITY_MINIGAME_RESULT_SCUESS",
		type = "@V"
	},
	EVT_CLUB_MINIGAME_RESULT_SCUESS = {
		url = "dm.gameplay.miniGame.MiniGameConfig",
		name = "EVT_CLUB_MINIGAME_RESULT_SCUESS",
		type = "@V"
	},
	EVT_ACTIVITY_MINIGAME_GETREWARD_SCUESS = {
		url = "dm.gameplay.miniGame.MiniGameConfig",
		name = "EVT_ACTIVITY_MINIGAME_GETREWARD_SCUESS",
		type = "@V"
	},
	EVT_ACTIVITY_MINIGAME_BUYTIMESANDBEGIN_SCUESS = {
		url = "dm.gameplay.miniGame.MiniGameConfig",
		name = "EVT_ACTIVITY_MINIGAME_BUYTIMESANDBEGIN_SCUESS",
		type = "@V"
	},
	EVT_CLUB_MINIGAME_BUYTIMESANDBEGIN_SCUESS = {
		url = "dm.gameplay.miniGame.MiniGameConfig",
		name = "EVT_CLUB_MINIGAME_BUYTIMESANDBEGIN_SCUESS",
		type = "@V"
	},
	EVT_CLUB_MINIGAME_BUYTIMES_SCUESS = {
		url = "dm.gameplay.miniGame.MiniGameConfig",
		name = "EVT_CLUB_MINIGAME_BUYTIMES_SCUESS",
		type = "@V"
	},
	EVT_CLUB_MINIGAME_BEGIN_SCUESS = {
		url = "dm.gameplay.miniGame.MiniGameConfig",
		name = "EVT_CLUB_MINIGAME_BEGIN_SCUESS",
		type = "@V"
	},
	EVT_CLUB_MINIGAME_REWARDLIMIT_CONFIRM = {
		url = "dm.gameplay.miniGame.MiniGameConfig",
		name = "EVT_CLUB_MINIGAME_REWARDLIMIT_CONFIRM",
		type = "@V"
	},
	EVT_CLUB_MINIGAME_ASKMAINVIEWSWEEPHIGHEST_CONFIRM = {
		url = "dm.gameplay.miniGame.MiniGameConfig",
		name = "EVT_CLUB_MINIGAME_ASKMAINVIEWSWEEPHIGHEST_CONFIRM",
		type = "@V"
	},
	EVT_CLUB_MINIGAME_ASKMAINVIEWSWEEPSTAGE_CONFIRM = {
		url = "dm.gameplay.miniGame.MiniGameConfig",
		name = "EVT_CLUB_MINIGAME_ASKMAINVIEWSWEEPSTAGE_CONFIRM",
		type = "@V"
	},
	EVT_CLUB_MINIGAME_CLOSERESULT_CONFIRM = {
		url = "dm.gameplay.miniGame.MiniGameConfig",
		name = "EVT_CLUB_MINIGAME_CLOSERESULT_CONFIRM",
		type = "@V"
	},
	EVT_CLUB_MINIGAME_STOPSCENESOUND_CONFIRM = {
		url = "dm.gameplay.miniGame.MiniGameConfig",
		name = "EVT_CLUB_MINIGAME_STOPSCENESOUND_CONFIRM",
		type = "@V"
	},
	EVT_CLUB_MINIGAME_SWEEEP_SCUESS = {
		url = "dm.gameplay.miniGame.MiniGameConfig",
		name = "EVT_CLUB_MINIGAME_SWEEEP_SCUESS",
		type = "@V"
	},
	MiniGameRankMediator = {
		url = "dm.gameplay.miniGame.view.common.MiniGameRankMediator",
		name = "MiniGameRankMediator",
		type = "@C"
	},
	MiniGameRewardTipMediator = {
		url = "dm.gameplay.miniGame.view.common.MiniGameRewardTipMediator",
		name = "MiniGameRewardTipMediator",
		type = "@C"
	},
	MiniGameRewardListMediator = {
		url = "dm.gameplay.miniGame.view.common.MiniGameRewardListMediator",
		name = "MiniGameRewardListMediator",
		type = "@C"
	},
	MiniGameResultMediator = {
		url = "dm.gameplay.miniGame.view.common.MiniGameResultMediator",
		name = "MiniGameResultMediator",
		type = "@C"
	},
	MiniGameQuitConfirmMediator = {
		url = "dm.gameplay.miniGame.view.common.MiniGameQuitConfirmMediator",
		name = "MiniGameQuitConfirmMediator",
		type = "@C"
	},
	DartsMediator = {
		url = "dm.gameplay.miniGame.view.darts.DartsMediator",
		name = "DartsMediator",
		type = "@C"
	},
	MainTeamMediator = {
		url = "dm.gameplay.team.view.MainTeamMediator",
		name = "MainTeamMediator",
		type = "@C"
	},
	StagePracticePointMediator = {
		url = "dm.gameplay.stagePractice.view.StagePracticePointMediator",
		name = "StagePracticePointMediator",
		type = "@C"
	},
	StagePracticeHelpTipMediator = {
		url = "dm.gameplay.stagePractice.view.StagePracticeHelpTipMediator",
		name = "StagePracticeHelpTipMediator",
		type = "@C"
	},
	StagePracticeMediator = {
		url = "dm.gameplay.stagePractice.view.StagePracticeMediator",
		name = "StagePracticeMediator",
		type = "@C"
	},
	StagePracticeGuideTipMediator = {
		url = "dm.gameplay.stagePractice.view.StagePracticeGuideTipMediator",
		name = "StagePracticeGuideTipMediator",
		type = "@C"
	},
	StagePracticeMapMediator = {
		url = "dm.gameplay.stagePractice.view.StagePracticeMapMediator",
		name = "StagePracticeMapMediator",
		type = "@C"
	},
	StagePracticeSpecialRuleMediator = {
		url = "dm.gameplay.stagePractice.view.StagePracticeSpecialRuleMediator",
		name = "StagePracticeSpecialRuleMediator",
		type = "@C"
	},
	StagePracticeRankMediator = {
		url = "dm.gameplay.stagePractice.view.StagePracticeRankMediator",
		name = "StagePracticeRankMediator",
		type = "@C"
	},
	StagePracticeTeamMediator = {
		url = "dm.gameplay.stagePractice.view.StagePracticeTeamMediator",
		name = "StagePracticeTeamMediator",
		type = "@C"
	},
	StagePracticeLoseMediator = {
		url = "dm.gameplay.stagePractice.view.StagePracticeLoseMediator",
		name = "StagePracticeLoseMediator",
		type = "@C"
	},
	StagePracticeBoxTipMediator = {
		url = "dm.gameplay.stagePractice.view.StagePracticeBoxTipMediator",
		name = "StagePracticeBoxTipMediator",
		type = "@C"
	},
	StagePracticeEnterMediator = {
		url = "dm.gameplay.stagePractice.view.StagePracticeEnterMediator",
		name = "StagePracticeEnterMediator",
		type = "@C"
	},
	StagePracticeRestartTipMediator = {
		url = "dm.gameplay.stagePractice.view.StagePracticeRestartTipMediator",
		name = "StagePracticeRestartTipMediator",
		type = "@C"
	},
	StagePracticeResetTipsMediator = {
		url = "dm.gameplay.stagePractice.view.StagePracticeResetTipsMediator",
		name = "StagePracticeResetTipsMediator",
		type = "@C"
	},
	StagePracticeWinMediator = {
		url = "dm.gameplay.stagePractice.view.StagePracticeWinMediator",
		name = "StagePracticeWinMediator",
		type = "@C"
	},
	StagePracticeCommentMediator = {
		url = "dm.gameplay.stagePractice.view.StagePracticeCommentMediator",
		name = "StagePracticeCommentMediator",
		type = "@C"
	},
	EVT_DIAMOND_RECHARGE_SUCC = {
		url = "dm.gameplay.recharge.controller.RechargeAndVipSystem",
		name = "EVT_DIAMOND_RECHARGE_SUCC",
		type = "@V"
	},
	EVT_ONCLICK_CHECKVIP = {
		url = "dm.gameplay.recharge.controller.RechargeAndVipSystem",
		name = "EVT_ONCLICK_CHECKVIP",
		type = "@V"
	},
	EVT_BUY_MONTHCARD_SUCC = {
		url = "dm.gameplay.recharge.controller.RechargeAndVipSystem",
		name = "EVT_BUY_MONTHCARD_SUCC",
		type = "@V"
	},
	EVT_REFRESH_MONTHCARD = {
		url = "dm.gameplay.recharge.controller.RechargeAndVipSystem",
		name = "EVT_REFRESH_MONTHCARD",
		type = "@V"
	},
	FirstRechargeMediator = {
		url = "dm.gameplay.recharge.view.FirstRechargeMediator",
		name = "FirstRechargeMediator",
		type = "@C"
	},
	EVT_TASK_REWARD_SUCC = {
		url = "dm.gameplay.task.controller.TaskEvent",
		name = "EVT_TASK_REWARD_SUCC",
		type = "@V"
	},
	EVT_TASK_REFRESHVIEW = {
		url = "dm.gameplay.task.controller.TaskEvent",
		name = "EVT_TASK_REFRESHVIEW",
		type = "@V"
	},
	EVT_TASK_RESET = {
		url = "dm.gameplay.task.controller.TaskEvent",
		name = "EVT_TASK_RESET",
		type = "@V"
	},
	EVT_TASK_HASGETREWARD = {
		url = "dm.gameplay.task.controller.TaskEvent",
		name = "EVT_TASK_HASGETREWARD",
		type = "@V"
	},
	EVT_BOX_REWARD_SUCC = {
		url = "dm.gameplay.task.controller.TaskEvent",
		name = "EVT_BOX_REWARD_SUCC",
		type = "@V"
	},
	TaskGrowMediator = {
		url = "dm.gameplay.task.view.TaskGrowMediator",
		name = "TaskGrowMediator",
		type = "@C"
	},
	TaskMediator = {
		url = "dm.gameplay.task.view.TaskMediator",
		name = "TaskMediator",
		type = "@C"
	},
	TaskDailyMediator = {
		url = "dm.gameplay.task.view.TaskDailyMediator",
		name = "TaskDailyMediator",
		type = "@C"
	},
	TaskWeekMediator = {
		url = "dm.gameplay.task.view.TaskWeekMediator",
		name = "TaskWeekMediator",
		type = "@C"
	},
	TaskBoxMediator = {
		url = "dm.gameplay.task.view.TaskBoxMediator",
		name = "TaskBoxMediator",
		type = "@C"
	},
	TaskAchieveMediator = {
		url = "dm.gameplay.task.view.TaskAchieveMediator",
		name = "TaskAchieveMediator",
		type = "@C"
	},
	TaskStageMediator = {
		url = "dm.gameplay.task.view.TaskStageMediator",
		name = "TaskStageMediator",
		type = "@C"
	},
	EVT_STAGE_FIGHT_SUCC = {
		url = "dm.gameplay.stage.controller.StageSystem",
		name = "EVT_STAGE_FIGHT_SUCC",
		type = "@V"
	},
	EVT_STAGE_RECEIVE_POINT_REWARD = {
		url = "dm.gameplay.stage.controller.StageSystem",
		name = "EVT_STAGE_RECEIVE_POINT_REWARD",
		type = "@V"
	},
	ChangeTeamMasterMediator = {
		url = "dm.gameplay.stage.view.ChangeTeamMasterMediator",
		name = "ChangeTeamMasterMediator",
		type = "@C"
	},
	CommonStageMainViewMediator = {
		url = "dm.gameplay.stage.view.CommonStageMainViewMediator",
		name = "CommonStageMainViewMediator",
		type = "@C"
	},
	FightLosePopViewMediator = {
		url = "dm.gameplay.stage.view.FightLosePopViewMediator",
		name = "FightLosePopViewMediator",
		type = "@C"
	},
	BattleHeroShowPopMediator = {
		url = "dm.gameplay.stage.view.BattleHeroShowPopMediator",
		name = "BattleHeroShowPopMediator",
		type = "@C"
	},
	StageTeamMediator = {
		url = "dm.gameplay.stage.view.StageTeamMediator",
		name = "StageTeamMediator",
		type = "@C"
	},
	HeroStoryChapterDetailMediator = {
		url = "dm.gameplay.stage.view.HeroStoryChapterDetailMediator",
		name = "HeroStoryChapterDetailMediator",
		type = "@C"
	},
	StageProgressPopMediator = {
		url = "dm.gameplay.stage.view.StageProgressPopMediator",
		name = "StageProgressPopMediator",
		type = "@C"
	},
	HeroStoryWinPopMediator = {
		url = "dm.gameplay.stage.view.HeroStoryWinPopMediator",
		name = "HeroStoryWinPopMediator",
		type = "@C"
	},
	FightStatisticPopMediator = {
		url = "dm.gameplay.stage.view.FightStatisticPopMediator",
		name = "FightStatisticPopMediator",
		type = "@C"
	},
	StatisticTipsMediator = {
		url = "dm.gameplay.stage.view.StatisticTipsMediator",
		name = "StatisticTipsMediator",
		type = "@C"
	},
	HeroStoryPointDetailMediator = {
		url = "dm.gameplay.stage.view.HeroStoryPointDetailMediator",
		name = "HeroStoryPointDetailMediator",
		type = "@C"
	},
	SweepBoxPopMediator = {
		url = "dm.gameplay.stage.view.SweepBoxPopMediator",
		name = "SweepBoxPopMediator",
		type = "@C"
	},
	StageLosePopMediator = {
		url = "dm.gameplay.stage.view.StageLosePopMediator",
		name = "StageLosePopMediator",
		type = "@C"
	},
	ChangeTeamMediator = {
		url = "dm.gameplay.stage.view.ChangeTeamMediator",
		name = "ChangeTeamMediator",
		type = "@C"
	},
	StageWinPopMediator = {
		url = "dm.gameplay.stage.view.StageWinPopMediator",
		name = "StageWinPopMediator",
		type = "@C"
	},
	StagePointDetailMediator = {
		url = "dm.gameplay.stage.view.StagePointDetailMediator",
		name = "StagePointDetailMediator",
		type = "@C"
	},
	StoryStageTeamMediator = {
		url = "dm.gameplay.stage.view.StoryStageTeamMediator",
		name = "StoryStageTeamMediator",
		type = "@C"
	},
	StageResetPopViewMediator = {
		url = "dm.gameplay.stage.view.StageResetPopViewMediator",
		name = "StageResetPopViewMediator",
		type = "@C"
	},
	StageBoxRewardMediator = {
		url = "dm.gameplay.stage.view.StageBoxRewardMediator",
		name = "StageBoxRewardMediator",
		type = "@C"
	},
	ChangeTeamModelMediator = {
		url = "dm.gameplay.stage.view.ChangeTeamModelMediator",
		name = "ChangeTeamModelMediator",
		type = "@C"
	},
	AlertGoStoryPopMediator = {
		url = "dm.gameplay.stage.view.AlertGoStoryPopMediator",
		name = "AlertGoStoryPopMediator",
		type = "@C"
	},
	FightWinPopViewMediator = {
		url = "dm.gameplay.stage.view.FightWinPopViewMediator",
		name = "FightWinPopViewMediator",
		type = "@C"
	},
	CommonStageSweepMediator = {
		url = "dm.gameplay.stage.view.CommonStageSweepMediator",
		name = "CommonStageSweepMediator",
		type = "@C"
	},
	CommonStageChapterDetailMediator = {
		url = "dm.gameplay.stage.view.CommonStageChapterDetailMediator",
		name = "CommonStageChapterDetailMediator",
		type = "@C"
	},
	EVT_ARENA_SYNC_DIFF = {
		url = "dm.gameplay.arena.controller.ArenaSystem",
		name = "EVT_ARENA_SYNC_DIFF",
		type = "@V"
	},
	EVT_ARENA_CHALLENGE_OPPO_ERROR = {
		url = "dm.gameplay.arena.controller.ArenaSystem",
		name = "EVT_ARENA_CHALLENGE_OPPO_ERROR",
		type = "@V"
	},
	EVT_ARENA_GET_REPORT_DETAIL_SUCC = {
		url = "dm.gameplay.arena.controller.ArenaSystem",
		name = "EVT_ARENA_GET_REPORT_DETAIL_SUCC",
		type = "@V"
	},
	EVT_ARENA_BE_CHALLENGED = {
		url = "dm.gameplay.arena.controller.ArenaSystem",
		name = "EVT_ARENA_BE_CHALLENGED",
		type = "@V"
	},
	EVT_ARENA_SHARE_REPORT_SUCC = {
		url = "dm.gameplay.arena.controller.ArenaSystem",
		name = "EVT_ARENA_SHARE_REPORT_SUCC",
		type = "@V"
	},
	EVT_ARENA_REQUEST_RANK_REWARD_SUCC = {
		url = "dm.gameplay.arena.controller.ArenaSystem",
		name = "EVT_ARENA_REQUEST_RANK_REWARD_SUCC",
		type = "@V"
	},
	EVT_ARENA_REQUEST_CHANGE_DECLARE_SUCC = {
		url = "dm.gameplay.arena.controller.ArenaSystem",
		name = "EVT_ARENA_REQUEST_CHANGE_DECLARE_SUCC",
		type = "@V"
	},
	EVT_ARENA_ONEKEY_WORSHIP_SUCC = {
		url = "dm.gameplay.arena.controller.ArenaSystem",
		name = "EVT_ARENA_ONEKEY_WORSHIP_SUCC",
		type = "@V"
	},
	EVT_ARENA_ONEKEY_GETAWARD_SUCC = {
		url = "dm.gameplay.arena.controller.ArenaSystem",
		name = "EVT_ARENA_ONEKEY_GETAWARD_SUCC",
		type = "@V"
	},
	EVT_ARENA_SEASON_OVER = {
		url = "dm.gameplay.arena.controller.ArenaSystem",
		name = "EVT_ARENA_SEASON_OVER",
		type = "@V"
	},
	EVT_ARENA_NEW_SEASON = {
		url = "dm.gameplay.arena.controller.ArenaSystem",
		name = "EVT_ARENA_NEW_SEASON",
		type = "@V"
	},
	ArenaReportMainMediator = {
		url = "dm.gameplay.arena.view.ArenaReportMainMediator",
		name = "ArenaReportMainMediator",
		type = "@C"
	},
	ArenaNewSeasonMediator = {
		url = "dm.gameplay.arena.view.ArenaNewSeasonMediator",
		name = "ArenaNewSeasonMediator",
		type = "@C"
	},
	ArenaTeamListMediator = {
		url = "dm.gameplay.arena.view.ArenaTeamListMediator",
		name = "ArenaTeamListMediator",
		type = "@C"
	},
	ArenaQuickBattleMediator = {
		url = "dm.gameplay.arena.view.ArenaQuickBattleMediator",
		name = "ArenaQuickBattleMediator",
		type = "@C"
	},
	ArenaTeamMediator = {
		url = "dm.gameplay.arena.view.ArenaTeamMediator",
		name = "ArenaTeamMediator",
		type = "@C"
	},
	ArenaRuleMediator = {
		url = "dm.gameplay.arena.view.ArenaRuleMediator",
		name = "ArenaRuleMediator",
		type = "@C"
	},
	ArenaMediator = {
		url = "dm.gameplay.arena.view.ArenaMediator",
		name = "ArenaMediator",
		type = "@C"
	},
	ArenaAwardMediator = {
		url = "dm.gameplay.arena.view.ArenaAwardMediator",
		name = "ArenaAwardMediator",
		type = "@C"
	},
	ArenaVictoryMediator = {
		url = "dm.gameplay.arena.view.ArenaVictoryMediator",
		name = "ArenaVictoryMediator",
		type = "@C"
	},
	ArenaRoleInfoMediator = {
		url = "dm.gameplay.arena.view.ArenaRoleInfoMediator",
		name = "ArenaRoleInfoMediator",
		type = "@C"
	},
	ArenaBoxMediator = {
		url = "dm.gameplay.arena.view.ArenaBoxMediator",
		name = "ArenaBoxMediator",
		type = "@C"
	},
	EVT_FRIENDPVP_DATAUODATA = {
		url = "dm.gameplay.friendPvp.service.FriendPvpService",
		name = "EVT_FRIENDPVP_DATAUODATA",
		type = "@V"
	},
	EVT_FRIENDPVP_INVITELIST_SUCC = {
		url = "dm.gameplay.friendPvp.service.FriendPvpService",
		name = "EVT_FRIENDPVP_INVITELIST_SUCC",
		type = "@V"
	},
	EVT_FRIENDPVP_KICKOUT = {
		url = "dm.gameplay.friendPvp.service.FriendPvpService",
		name = "EVT_FRIENDPVP_KICKOUT",
		type = "@V"
	},
	EVT_FRIENDPVP_ENTERBATTLE = {
		url = "dm.gameplay.friendPvp.service.FriendPvpService",
		name = "EVT_FRIENDPVP_ENTERBATTLE",
		type = "@V"
	},
	EVT_FRIENDPVP_FINISHBATTLE = {
		url = "dm.gameplay.friendPvp.service.FriendPvpService",
		name = "EVT_FRIENDPVP_FINISHBATTLE",
		type = "@V"
	},
	EVT_FRIENDPVP_RECEIVEINVITATION = {
		url = "dm.gameplay.friendPvp.service.FriendPvpService",
		name = "EVT_FRIENDPVP_RECEIVEINVITATION",
		type = "@V"
	},
	EVT_FRIENDPVP_ENTERBATTLE_FAIL = {
		url = "dm.gameplay.friendPvp.service.FriendPvpService",
		name = "EVT_FRIENDPVP_ENTERBATTLE_FAIL",
		type = "@V"
	},
	InitSettingsCommand = {
		url = "dm.gameplay.setting.controller.SettingCommands",
		name = "InitSettingsCommand",
		type = "@C"
	},
	EVT_CHANGEHEADIMG_SUCC = {
		url = "dm.gameplay.setting.controller.SettingSystem",
		name = "EVT_CHANGEHEADIMG_SUCC",
		type = "@V"
	},
	EVT_BUGFEEDBACK_SUCC = {
		url = "dm.gameplay.setting.controller.SettingSystem",
		name = "EVT_BUGFEEDBACK_SUCC",
		type = "@V"
	},
	SetAreaPopMediator = {
		url = "dm.gameplay.setting.view.SetAreaPopMediator",
		name = "SetAreaPopMediator",
		type = "@C"
	},
	ExitGameMediator = {
		url = "dm.gameplay.setting.view.ExitGameMediator",
		name = "ExitGameMediator",
		type = "@C"
	},
	ChangeHeadImgMediator = {
		url = "dm.gameplay.setting.view.ChangeHeadImgMediator",
		name = "ChangeHeadImgMediator",
		type = "@C"
	},
	SetTagsPopMediator = {
		url = "dm.gameplay.setting.view.SetTagsPopMediator",
		name = "SetTagsPopMediator",
		type = "@C"
	},
	SettingCodeExcMediator = {
		url = "dm.gameplay.setting.view.SettingCodeExcMediator",
		name = "SettingCodeExcMediator",
		type = "@C"
	},
	SettingDownloadPackageMediator = {
		url = "dm.gameplay.setting.view.SettingDownloadPackageMediator",
		name = "SettingDownloadPackageMediator",
		type = "@C"
	},
	DownloadAlertMediator = {
		url = "dm.gameplay.setting.view.DownloadAlertMediator",
		name = "DownloadAlertMediator",
		type = "@C"
	},
	ResourceDownloadMediator = {
		url = "dm.gameplay.setting.view.ResourceDownloadMediator",
		name = "ResourceDownloadMediator",
		type = "@C"
	},
	SetBirthdayPopMediator = {
		url = "dm.gameplay.setting.view.SetBirthdayPopMediator",
		name = "SetBirthdayPopMediator",
		type = "@C"
	},
	ChangeNameMediator = {
		url = "dm.gameplay.setting.view.ChangeNameMediator",
		name = "ChangeNameMediator",
		type = "@C"
	},
	SettingDownloadMediator = {
		url = "dm.gameplay.setting.view.SettingDownloadMediator",
		name = "SettingDownloadMediator",
		type = "@C"
	},
	GameValueSetMediator = {
		url = "dm.gameplay.setting.view.GameValueSetMediator",
		name = "GameValueSetMediator",
		type = "@C"
	},
	SetSexPopMediator = {
		url = "dm.gameplay.setting.view.SetSexPopMediator",
		name = "SetSexPopMediator",
		type = "@C"
	},
	SettingMediator = {
		url = "dm.gameplay.setting.view.SettingMediator",
		name = "SettingMediator",
		type = "@C"
	},
	BugFeedbackMediator = {
		url = "dm.gameplay.setting.view.BugFeedbackMediator",
		name = "BugFeedbackMediator",
		type = "@C"
	},
	RankRewardTipsMediator = {
		url = "dm.gameplay.rank.view.RankRewardTipsMediator",
		name = "RankRewardTipsMediator",
		type = "@C"
	},
	RankRewardMediator = {
		url = "dm.gameplay.rank.view.RankRewardMediator",
		name = "RankRewardMediator",
		type = "@C"
	},
	RankMediator = {
		url = "dm.gameplay.rank.view.RankMediator",
		name = "RankMediator",
		type = "@C"
	},
	RankBestMediator = {
		url = "dm.gameplay.rank.view.RankBestMediator",
		name = "RankBestMediator",
		type = "@C"
	},
	NewCurrencyBuyPopMediator = {
		url = "dm.gameplay.currency.view.NewCurrencyBuyPopMediator",
		name = "NewCurrencyBuyPopMediator",
		type = "@C"
	},
	CurrencyBuyPopMediator = {
		url = "dm.gameplay.currency.view.CurrencyBuyPopMediator",
		name = "CurrencyBuyPopMediator",
		type = "@C"
	},
	EVT_BUY_ENERGRY_SUCC = {
		url = "dm.gameplay.currency.CurrencyEvents",
		name = "EVT_BUY_ENERGRY_SUCC",
		type = "@V"
	},
	EVT_BUY_GOLD_SUCC = {
		url = "dm.gameplay.currency.CurrencyEvents",
		name = "EVT_BUY_GOLD_SUCC",
		type = "@V"
	},
	EVT_BUY_CRYSTAL_SUCC = {
		url = "dm.gameplay.currency.CurrencyEvents",
		name = "EVT_BUY_CRYSTAL_SUCC",
		type = "@V"
	},
	RTPVPRobotBattleMediator = {
		url = "dm.gameplay.rtpvp.view.RTPVPRobotBattleMediator",
		name = "RTPVPRobotBattleMediator",
		type = "@C"
	},
	BuildingLvUpSucMediator = {
		url = "dm.gameplay.building.view.BuildingLvUpSucMediator",
		name = "BuildingLvUpSucMediator",
		type = "@C"
	},
	ClubBuildingMediator = {
		url = "dm.gameplay.building.view.club.ClubBuildingMediator",
		name = "ClubBuildingMediator",
		type = "@C"
	},
	BuildingUnlockRoomMediator = {
		url = "dm.gameplay.building.view.BuildingUnlockRoomMediator",
		name = "BuildingUnlockRoomMediator",
		type = "@C"
	},
	BuildingOverviewMediator = {
		url = "dm.gameplay.building.view.BuildingOverviewMediator",
		name = "BuildingOverviewMediator",
		type = "@C"
	},
	BuildingOneKeyGetResMediator = {
		url = "dm.gameplay.building.view.BuildingOneKeyGetResMediator",
		name = "BuildingOneKeyGetResMediator",
		type = "@C"
	},
	BuildingPutHeroMediator = {
		url = "dm.gameplay.building.view.BuildingPutHeroMediator",
		name = "BuildingPutHeroMediator",
		type = "@C"
	},
	BuildingMediator = {
		url = "dm.gameplay.building.view.BuildingMediator",
		name = "BuildingMediator",
		type = "@C"
	},
	BuildingQueueBuyCheckMediator = {
		url = "dm.gameplay.building.view.BuildingQueueBuyCheckMediator",
		name = "BuildingQueueBuyCheckMediator",
		type = "@C"
	},
	BuildingInfoMediator = {
		url = "dm.gameplay.building.view.BuildingInfoMediator",
		name = "BuildingInfoMediator",
		type = "@C"
	},
	BuildingAfkGiftMediator = {
		url = "dm.gameplay.building.view.BuildingAfkGiftMediator",
		name = "BuildingAfkGiftMediator",
		type = "@C"
	},
	BuildingSubOrcInfoMediator = {
		url = "dm.gameplay.building.view.BuildingSubOrcInfoMediator",
		name = "BuildingSubOrcInfoMediator",
		type = "@C"
	},
	BuildingLoveAddMediator = {
		url = "dm.gameplay.building.view.BuildingLoveAddMediator",
		name = "BuildingLoveAddMediator",
		type = "@C"
	},
	BuildingCancelCheckMediator = {
		url = "dm.gameplay.building.view.BuildingCancelCheckMediator",
		name = "BuildingCancelCheckMediator",
		type = "@C"
	},
	BuildingBuildMediator = {
		url = "dm.gameplay.building.view.BuildingBuildMediator",
		name = "BuildingBuildMediator",
		type = "@C"
	},
	BuildingOrcLvUpMediator = {
		url = "dm.gameplay.building.view.BuildingOrcLvUpMediator",
		name = "BuildingOrcLvUpMediator",
		type = "@C"
	},
	BuildingQueueBuyMediator = {
		url = "dm.gameplay.building.view.BuildingQueueBuyMediator",
		name = "BuildingQueueBuyMediator",
		type = "@C"
	},
	BuildingLvUpMediator = {
		url = "dm.gameplay.building.view.BuildingLvUpMediator",
		name = "BuildingLvUpMediator",
		type = "@C"
	},
	MainSceneMediator = {
		url = "dm.gameplay.MainSceneMediator",
		name = "MainSceneMediator",
		type = "@C"
	},
	EVT_LEAVETIME_CHANGE = {
		url = "dm.gameplay.spStage.controller.SpStageSystem",
		name = "EVT_LEAVETIME_CHANGE",
		type = "@V"
	},
	SpStageMainMediator = {
		url = "dm.gameplay.spStage.view.SpStageMainMediator",
		name = "SpStageMainMediator",
		type = "@C"
	},
	SpStageGetBuffMediator = {
		url = "dm.gameplay.spStage.view.SpStageGetBuffMediator",
		name = "SpStageGetBuffMediator",
		type = "@C"
	},
	SpStageTestSceneMediator = {
		url = "dm.gameplay.spStage.view.SpStageTestSceneMediator",
		name = "SpStageTestSceneMediator",
		type = "@C"
	},
	SpStageRuleMediator = {
		url = "dm.gameplay.spStage.view.SpStageRuleMediator",
		name = "SpStageRuleMediator",
		type = "@C"
	},
	SpStageFinishMediator = {
		url = "dm.gameplay.spStage.view.SpStageFinishMediator",
		name = "SpStageFinishMediator",
		type = "@C"
	},
	SpStageRankMediator = {
		url = "dm.gameplay.spStage.view.SpStageRankMediator",
		name = "SpStageRankMediator",
		type = "@C"
	},
	SpStageDftMediator = {
		url = "dm.gameplay.spStage.view.SpStageDftMediator",
		name = "SpStageDftMediator",
		type = "@C"
	},
	SpStageSweepMediator = {
		url = "dm.gameplay.spStage.view.SpStageSweepMediator",
		name = "SpStageSweepMediator",
		type = "@C"
	},
	SpStageBoxMediator = {
		url = "dm.gameplay.spStage.view.SpStageBoxMediator",
		name = "SpStageBoxMediator",
		type = "@C"
	},
	ShareMediator = {
		url = "dm.gameplay.share.view.ShareMediator",
		name = "ShareMediator",
		type = "@C"
	},
	CooperateBossSystem = {
		url = "dm.gameplay.cooperateBoss.controller.CooperateBossSystem",
		name = "CooperateBossSystem",
		type = "@C"
	},
	CooperateBossInviteFriendMediator = {
		url = "dm.gameplay.cooperateBoss.view.CooperateBossInviteFriendMediator",
		name = "CooperateBossInviteFriendMediator",
		type = "@C"
	},
	CooperateBossFightMediator = {
		url = "dm.gameplay.cooperateBoss.view.CooperateBossFightMediator",
		name = "CooperateBossFightMediator",
		type = "@C"
	},
	CooperateBossBattleEndMediator = {
		url = "dm.gameplay.cooperateBoss.view.CooperateBossBattleEndMediator",
		name = "CooperateBossBattleEndMediator",
		type = "@C"
	},
	CooperateBossMainMediator = {
		url = "dm.gameplay.cooperateBoss.view.CooperateBossMainMediator",
		name = "CooperateBossMainMediator",
		type = "@C"
	},
	CooperateBossTeamMediator = {
		url = "dm.gameplay.cooperateBoss.view.CooperateBossTeamMediator",
		name = "CooperateBossTeamMediator",
		type = "@C"
	},
	CooperateBossInviteMediator = {
		url = "dm.gameplay.cooperateBoss.view.CooperateBossInviteMediator",
		name = "CooperateBossInviteMediator",
		type = "@C"
	},
	CooperateBossBuyTimeMediator = {
		url = "dm.gameplay.cooperateBoss.view.CooperateBossBuyTimeMediator",
		name = "CooperateBossBuyTimeMediator",
		type = "@C"
	},
	TestSceneMediator = {
		url = "dm.devutils.TestSceneMediator",
		name = "TestSceneMediator",
		type = "@C"
	},
	EVT_RECONNECTION_SUCC = {
		url = "dm.base.net.GameServerAgent",
		name = "EVT_RECONNECTION_SUCC",
		type = "@V"
	},
	EVT_SYNCHRONIZE_DIFF = {
		url = "dm.base.Service",
		name = "EVT_SYNCHRONIZE_DIFF",
		type = "@V"
	},
	EVT_OPENURL = {
		url = "dm.base.command.OpenUrlCommand",
		name = "EVT_OPENURL",
		type = "@V"
	},
	OpenUrlCommand = {
		url = "dm.base.command.OpenUrlCommand",
		name = "OpenUrlCommand",
		type = "@C"
	},
	DmSwitchViewCommand = {
		url = "dm.base.command.DmViewCommands",
		name = "DmSwitchViewCommand",
		type = "@C"
	},
	DmPushViewCommand = {
		url = "dm.base.command.DmViewCommands",
		name = "DmPushViewCommand",
		type = "@C"
	},
	PopViewCommand = {
		url = "dm.base.command.DmViewCommands",
		name = "PopViewCommand",
		type = "@C"
	},
	DmPopToTargetViewCommand = {
		url = "dm.base.command.DmViewCommands",
		name = "DmPopToTargetViewCommand",
		type = "@C"
	},
	SwitchSceneCommand = {
		url = "dragon.game.command.SceneCommands",
		name = "SwitchSceneCommand",
		type = "@C"
	},
	SwitchViewCommand = {
		url = "dragon.game.command.ViewCommands",
		name = "SwitchViewCommand",
		type = "@C"
	},
	PushViewCommand = {
		url = "dragon.game.command.ViewCommands",
		name = "PushViewCommand",
		type = "@C"
	},
	ShowPopupViewCommand = {
		url = "dragon.game.command.ViewCommands",
		name = "ShowPopupViewCommand",
		type = "@C"
	},
	ShowToastCommand = {
		url = "dragon.game.command.ViewCommands",
		name = "ShowToastCommand",
		type = "@C"
	},
	ShowQueueToastCommand = {
		url = "dragon.game.command.ViewCommands",
		name = "ShowQueueToastCommand",
		type = "@C"
	},
	PlayEffectCommand = {
		url = "dragon.game.command.ViewCommands",
		name = "PlayEffectCommand",
		type = "@C"
	},
	EVT_SWITCH_SCENE = {
		url = "dragon.game.event.ViewEvent",
		name = "EVT_SWITCH_SCENE",
		type = "@V"
	},
	SceneEvent = {
		url = "dragon.game.event.ViewEvent",
		name = "SceneEvent",
		type = "@C"
	},
	EVT_SWITCH_VIEW = {
		url = "dragon.game.event.ViewEvent",
		name = "EVT_SWITCH_VIEW",
		type = "@V"
	},
	EVT_PUSH_VIEW = {
		url = "dragon.game.event.ViewEvent",
		name = "EVT_PUSH_VIEW",
		type = "@V"
	},
	EVT_SHOW_POPUP = {
		url = "dragon.game.event.ViewEvent",
		name = "EVT_SHOW_POPUP",
		type = "@V"
	},
	EVT_POPUP_VIEW = {
		url = "dragon.game.event.ViewEvent",
		name = "EVT_POPUP_VIEW",
		type = "@V"
	},
	EVT_SHOW_TOAST = {
		url = "dragon.game.event.ViewEvent",
		name = "EVT_SHOW_TOAST",
		type = "@V"
	},
	EVT_PLAY_EFFECT = {
		url = "dragon.game.event.ViewEvent",
		name = "EVT_PLAY_EFFECT",
		type = "@V"
	},
	EVT_SHOW_REWARD_TOAST = {
		url = "dragon.game.event.ViewEvent",
		name = "EVT_SHOW_REWARD_TOAST",
		type = "@V"
	},
	ViewEvent = {
		url = "dragon.game.event.ViewEvent",
		name = "ViewEvent",
		type = "@C"
	},
	ToastEvent = {
		url = "dragon.game.event.ViewEvent",
		name = "ToastEvent",
		type = "@C"
	},
	legs = {
		url = "dragon.legs.init",
		name = "legs",
		type = "@P"
	},
	DisposableObject = {
		url = "dragon.basis.DisposableObject",
		name = "DisposableObject",
		type = "@C"
	}
}

return mappings
