local __FILE__ = select(1, ...) or ""
local __PACKAGE__ = string.gsub(__FILE__, "[^.]+$", "")
DebugBoxMainIndex = {
	getMainIndex = function (self)
		local mainIndex = {
			{
				"战斗记录",
				{
					"保存战斗记录",
					"清除战斗记录",
					"播放战斗记录",
					"播放战斗记录文件",
					"上传战斗记录",
					"上传战斗记录文件",
					"播放战斗校验客户端Rep",
					"播放战斗校验服务器Rep",
					"自定义战斗数据",
					"自动闯关"
				}
			},
			{
				"战斗DUMP",
				{
					"保存战斗DUMP",
					"清除战斗DUMP",
					"播放战斗DUMP文件",
					"上传战斗DUMP",
					"上传战斗DUMP文件",
					"播放主线校验错误",
					"播放战斗校验客户端Dump",
					"对比校验数值"
				}
			},
			{
				"战斗技能检查",
				{
					"技能Args检查",
					"技能文本崩溃检查",
					"战斗加速",
					"战斗加速按钮开启"
				}
			},
			{
				"战斗设置",
				{
					"开启/关闭战斗开始loading",
					"设置血量增加倍数",
					"开启/关闭打印实时属性",
					"开启/关闭顺序出牌",
					"开启/关闭AI权重显示"
				}
			},
			{
				"数值表",
				{
					"数值表查询",
					"Translate表查询"
				}
			},
			{
				"代码性能分析",
				{
					"startProfiler",
					"endProfiler"
				}
			},
			{
				"dev",
				{
					"打开测试面板",
					"修改服务器时间",
					"调cross和游戏服时间",
					"设置DEBUG模式",
					"开启ldebug"
				}
			},
			{
				"RTPK",
				{
					"增加积分(可负)",
					"增加排行榜",
					"清除数据",
					"增加次数",
					"修改跨服时间",
					"数据上报",
					"n场内不能匹配相同对手"
				}
			},
			{
				"无限充值",
				{
					"无限充值开启"
				}
			},
			{
				"玩家",
				{
					"玩家等级",
					"加核心",
					"加装备",
					"强化装备至满级",
					"我要装备！",
					"加头像框"
				}
			},
			{
				"英魂、主角养成",
				{
					"一键变强",
					"主角养成",
					"增加英魂",
					"一键无敌",
					"添加皮肤",
					"语音检测",
					"一键装备",
					"一键卸下装备",
					"一键觉醒",
					"一键最佳装备"
				}
			},
			{
				"背包",
				{
					"加道具",
					"加所有道具",
					"清空背包",
					"加某款皮肤"
				}
			},
			{
				"源阶",
				{
					"增加源阶",
					"增加古币",
					"增加源阶体力",
					"增加源阶排行榜",
					"清除全部赛季数据",
					"清除服务器分组"
				}
			},
			{
				"城建",
				{
					"清除队列"
				}
			},
			{
				"副本",
				{
					"通关至指定普通关卡",
					"通关至指定精英关卡",
					"重置英魂副本挑战次数",
					"关卡一键速达",
					"通关所有活动本",
					"通关指定梦境塔",
					"通关所有新活动本"
				}
			},
			{
				"资源本",
				{
					"重置挑战次数",
					"增加挑战次数",
					"清空挑战或探索次数",
					"一键跳过关卡",
					"重置资源本额外奖励次数"
				}
			},
			{
				"训练本",
				{
					"全部通关",
					"通关到指定关卡"
				}
			},
			{
				"新爬塔",
				{
					"增加爬塔次数100次",
					"增加爬塔复活次数100次",
					"给玩家加buff"
				}
			},
			{
				"梦境远征",
				{
					"通关指定数量的关卡",
					"重置远征到下一周"
				}
			},
			{
				"竞技场",
				{
					"增加本周荣誉值",
					"赛季BUFF测试"
				}
			},
			{
				"探索",
				{
					"修改指定地图DP值",
					"增加道具到大地图临时背包",
					"开启debug模式",
					"恢复探索次数最大值",
					"恢复每日推荐次数",
					"解锁所有探索地图",
					"刷新一次性物件",
					"修改移动速度",
					"清空挑战或探索次数"
				}
			},
			{
				"迷宫",
				{
					"添加宝物",
					"修改主角等级",
					"跳过页签",
					"跳过章节",
					"添加DP值"
				}
			},
			{
				"签到",
				{}
			},
			{
				"商店",
				{
					"钻石"
				}
			},
			{
				"邮箱",
				{
					"发送邮件"
				}
			},
			{
				"活动",
				{
					"梦幻回馈"
				}
			},
			{
				"新手引导",
				{
					"所有引导关闭",
					"1-4引导关闭",
					"跑关卡后的引导",
					"新手引导重置"
				}
			},
			{
				"剧情编辑",
				{
					"进入剧情编辑",
					"清除剧情保存数据",
					"清除序章数据",
					"就爱看剧情"
				}
			},
			{
				"相册",
				{
					"所有英魂好感度",
					"增加好感度",
					"增加约会次数",
					"清除已约会过的英魂数据"
				}
			},
			{
				"任务",
				{
					"一键完成梦之轨迹"
				}
			},
			{
				"链接争霸",
				{
					"立刻开启比赛",
					"链接争霸无敌开启",
					"输入id，立刻开启比赛",
					"跳至下一个状态"
				}
			},
			{
				"好友",
				{}
			},
			{
				"社团",
				{
					"添加X个假社团",
					"清空所有的社团数据",
					"清空非本社团的社团数据",
					"添加个社团申请",
					"添加X个社团成员",
					"增加社团捐献次数",
					"设置本社团的等级",
					"设置本社团的经验",
					"设置自己为社长",
					"增加boss挑战次数",
					"挑战boss",
					"社团Boss通关到",
					"清空单日疲劳英雄",
					"开启社团打榜活动"
				}
			},
			{
				"聊天",
				{}
			},
			{
				"奖励添加",
				{
					"发送指定次数的奖励"
				}
			},
			{
				"小游戏",
				{
					"投飞镖：设置关卡"
				}
			},
			{
				"BOSS共斗",
				{
					"触发BOSS共斗",
					"增加共斗BOSS挑战次数"
				}
			},
			{
				"通用后端命令",
				{
					"触发后端命令"
				}
			},
			{
				"bust展示",
				{
					"设置bust",
					"显示主角",
					"显示伙伴",
					"主角和伙伴",
					"特殊bust",
					"不裁切主角",
					"不裁切主角伙伴",
					"未觉醒伙伴"
				}
			},
			{
				"属性计算",
				{
					"属性计算展示"
				}
			},
			{
				"音频测试",
				{
					"战斗音频",
					"其他音频"
				}
			}
		}

		return mainIndex
	end,
	getSubIndex = function (self)
		local subIndex = {
			{
				"加道具",
				"AddGoodsDV"
			},
			{
				"加所有道具",
				"AddAllItems"
			},
			{
				"加某款皮肤",
				"AddSkin"
			},
			{
				"钻石",
				"DiamondDV"
			},
			{
				"一键变强",
				"OnekeyStrengthen"
			},
			{
				"修改服务器时间",
				"changeServerTime"
			},
			{
				"调cross和游戏服时间",
				"changeTagetServerTime"
			},
			{
				"开启ldebug",
				"openLdebug"
			},
			{
				"无限充值开启",
				"FreeRecharge"
			},
			{
				"加核心",
				"AddKernel"
			},
			{
				"加装备",
				"AddEquip"
			},
			{
				"强化装备至满级",
				"OneKeyStrengthenEquip"
			},
			{
				"我要装备！",
				"AddMyEquip"
			},
			{
				"属性计算展示",
				"AttrInfoView"
			},
			{
				"立刻开启比赛",
				"StartPetRace"
			},
			{
				"添加宝物",
				"AddTreasure"
			},
			{
				"修改主角等级",
				"ModifyMazeMaserLv"
			},
			{
				"跳过页签",
				"SkipMazeOption"
			},
			{
				"跳过章节",
				"SkipMazeChapter"
			},
			{
				"添加DP值",
				"AddMazeDp"
			},
			{
				"主角养成",
				"OnekeyMaster"
			},
			{
				"添加皮肤",
				"AddSurface"
			},
			{
				"语音检测",
				"TestSound"
			},
			{
				"一键装备",
				"OneKeyEquip"
			},
			{
				"一键卸下装备",
				"OneKeyDownEquip"
			},
			{
				"一键觉醒",
				"OneKeyAwake"
			},
			{
				"一键最佳装备",
				"OneKeyBestEquip"
			},
			{
				"进入剧情编辑",
				"StoryEditor"
			},
			{
				"清除剧情保存数据",
				"StorySaveClear"
			},
			{
				"清除序章数据",
				"ClearPrologue"
			},
			{
				"保存战斗记录",
				"SaveBattleRecordBox"
			},
			{
				"清除战斗记录",
				"ClearBattleRecordBox"
			},
			{
				"播放战斗记录",
				"ReplayBattleRecordBox"
			},
			{
				"播放战斗记录文件",
				"ReplayBattleRecordFileBox"
			},
			{
				"上传战斗记录",
				"UploadBattleRecordBox"
			},
			{
				"上传战斗记录文件",
				"UploadBattleRecordFileBox"
			},
			{
				"播放已上传记录",
				"ReplayBattleRecordPhpBox"
			},
			{
				"增加宠物",
				"AddPet"
			},
			{
				"增加好感度",
				"AddHeroLove"
			},
			{
				"所有英魂好感度",
				"AddAllHeroLove"
			},
			{
				"赛季BUFF测试",
				"SetSeasonTeamInfo"
			},
			{
				"添加X个假社团",
				"AddClub"
			},
			{
				"清空所有的社团数据",
				"ClearAllClub"
			},
			{
				"清空非本社团的社团数据",
				"ClearAllClubExceptMine"
			},
			{
				"添加X个社团申请",
				"AddClubApply"
			},
			{
				"添加X个社团成员",
				"AddFakePlayerToClub"
			},
			{
				"增加社团捐献次数",
				"SetDonationCount"
			},
			{
				"添加某成员今日贡献",
				"AddPlayerContribution"
			},
			{
				"设置本社团的等级",
				"SetClubLevel"
			},
			{
				"设置本社团的经验",
				"SetClubExp"
			},
			{
				"设置自己为社长",
				"SetMeToPresident"
			},
			{
				"增加boss挑战次数",
				"AddClubBossTimes"
			},
			{
				"清空单日疲劳英雄",
				"ClearClubBossTiredHeros"
			},
			{
				"挑战boss",
				"StartClubBoss"
			},
			{
				"社团Boss通关到",
				"PassClubBoss"
			},
			{
				"清空挑战或探索次数",
				"ClearExploreOrBlockSpTimes"
			},
			{
				"重置挑战次数",
				"BlockSpResetTimes"
			},
			{
				"增加挑战次数",
				"BlockSpAddTimes"
			},
			{
				"开启社团打榜活动",
				"ClubResourcesBattleStart"
			},
			{
				"一键跳过关卡",
				"BlockSpOnekeyFinish"
			},
			{
				"重置资源本额外奖励次数",
				"BlockSpRewardTimes"
			},
			{
				"修改hp值",
				"ExploreResetHp"
			},
			{
				"开启debug模式",
				"ExploreOpenDebug"
			},
			{
				"startProfiler",
				"StartProfiler"
			},
			{
				"endProfiler",
				"EndProfiler"
			},
			{
				"打开测试面板",
				"TestBox"
			},
			{
				"通关至指定普通关卡",
				"StageOneKeyFinish"
			},
			{
				"关卡一键速达",
				"PointOneKeyFinish"
			},
			{
				"通关至指定精英关卡",
				"EliteStageOneKeyFinish"
			},
			{
				"通关到指定关卡",
				"PracticleToPoint"
			},
			{
				"通关所有活动本",
				"ActivityStageFinish"
			},
			{
				"通关指定梦境塔",
				"DreamChallengeFinish"
			},
			{
				"通关所有新活动本",
				"NewActivityStageFinish"
			},
			{
				"增加本周荣誉值",
				"ArenaAddHonor"
			},
			{
				"所有引导关闭",
				"GuideChangeClose"
			},
			{
				"1-4引导关闭",
				"ChapterChangeClose"
			},
			{
				"新手引导重置",
				"GuideReset"
			},
			{
				"跑关卡后的引导",
				"GuideEndBattle"
			},
			{
				"就爱看剧情",
				"TestPlayStory"
			},
			{
				"一键无敌",
				"OnekeyInvincible"
			},
			{
				"保存战斗DUMP",
				"SaveBattleDumpBox"
			},
			{
				"清除战斗DUMP",
				"ClearBattleDumpBox"
			},
			{
				"播放战斗DUMP文件",
				"ReplayBattleDumpFileBox"
			},
			{
				"上传战斗DUMP",
				"UploadBattleDumpBox"
			},
			{
				"上传战斗DUMP文件",
				"UploadBattleDumpFileBox"
			},
			{
				"玩家等级",
				"ChangeLevelDV"
			},
			{
				"全部通关",
				"FullStarFinishPracticle"
			},
			{
				"修改指定地图DP值",
				"ExploreResetDp"
			},
			{
				"增加道具到大地图临时背包",
				"ExploreAddBagItem"
			},
			{
				"恢复探索次数最大值",
				"ExploreAddTimes"
			},
			{
				"恢复每日推荐次数",
				"ExploreResetDailyTimes"
			},
			{
				"解锁所有探索地图",
				"ExploreUnlockAll"
			},
			{
				"刷新一次性物件",
				"ExploreRefreshItem"
			},
			{
				"修改移动速度",
				"ExploreChangeMoveRate"
			},
			{
				"梦幻回馈",
				"DrawCardFeedback"
			},
			{
				"发送邮件",
				"SendTestMailDV"
			},
			{
				"清空背包",
				"ClearBagDV"
			},
			{
				"链接争霸无敌开启",
				"StartPetRaceInvincible"
			},
			{
				"输入id，立刻开启比赛",
				"StartPetRaceWithID"
			},
			{
				"跳至下一个状态",
				"PetRaceJumpTo"
			},
			{
				"清除队列",
				"ResetBuildQueueEvent"
			},
			{
				"增加约会次数",
				"AddDateCount"
			},
			{
				"清除已约会过的英魂数据",
				"ResetDateHeroes"
			},
			{
				"发送指定次数的奖励",
				"AddRewards"
			},
			{
				"重置英魂副本挑战次数",
				"ResetHeroStoryCount"
			},
			{
				"增加爬塔次数100次",
				"AddTowerMissionsCount"
			},
			{
				"增加爬塔复活次数100次",
				"AddTowerRelifeCount"
			},
			{
				"给玩家加buff",
				"AddTowerBuffToPlayer"
			},
			{
				"通关指定数量的关卡",
				"CrusadeBlockCount"
			},
			{
				"重置远征到下一周",
				"CrusadeReset"
			},
			{
				"投飞镖：设置关卡",
				"ChangeDartsLevel"
			},
			{
				"触发BOSS共斗",
				"CooperateBossTrigger"
			},
			{
				"增加共斗BOSS挑战次数",
				"AddCopperateBossTime"
			},
			{
				"触发后端命令",
				"CooperateBossCommand"
			},
			{
				"设置bust",
				"DebugShowBustAni"
			},
			{
				"显示主角",
				"DebugShowBustAniMaster"
			},
			{
				"显示伙伴",
				"DebugShowBustAniHero"
			},
			{
				"主角和伙伴",
				"DebugShowBustAniAll"
			},
			{
				"特殊bust",
				"DebugShowBustAniSpe"
			},
			{
				"不裁切主角",
				"DebugShowBustAniNoStencil"
			},
			{
				"不裁切主角伙伴",
				"DebugShowBustAniNoStencil2"
			},
			{
				"未觉醒伙伴",
				"DebugShowBustAniNoStencil3"
			},
			{
				"增加源阶",
				"DebugAddLeadStageLevel"
			},
			{
				"增加古币",
				"DebugAddStageArenaOldCoin"
			},
			{
				"增加源阶体力",
				"DebugAddStageArenaPower"
			},
			{
				"增加源阶排行榜",
				"DebugAddStageArenaRank"
			},
			{
				"清除全部赛季数据",
				"DebugClearStageArenaData"
			},
			{
				"清除服务器分组",
				"DebugClearServerGroup"
			},
			{
				"增加积分(可负)",
				"DebugRTPKScore"
			},
			{
				"增加排行榜",
				"DebugRTPKAddRank"
			},
			{
				"清除数据",
				"DebugRTPKClearAll"
			},
			{
				"增加次数",
				"DebugRTPKAddCount"
			},
			{
				"修改跨服时间",
				"RTPKChangeServerTime"
			},
			{
				"数据上报",
				"RTPKServerMatch"
			},
			{
				"n场内不能匹配相同对手",
				"RTPKMatchSwitch"
			},
			{
				"设置DEBUG模式",
				"ChangeDEBUGValue"
			},
			{
				"一键完成梦之轨迹",
				"OnekeyStageTask"
			},
			{
				"加头像框",
				"AddHeadFrame"
			},
			{
				"技能Args检查",
				"CheckSkillArgsBox"
			},
			{
				"技能文本崩溃检查",
				"CheckSkillTextBox"
			},
			{
				"战斗加速",
				"AddBattleSpeedBox"
			},
			{
				"战斗加速按钮开启",
				"OpenBattleSpeedButtonBox"
			},
			{
				"开启/关闭战斗开始loading",
				"BattleLoadingBox"
			},
			{
				"设置血量增加倍数",
				"HealthMultiBox"
			},
			{
				"战斗音频",
				"BattleSoundBox"
			},
			{
				"其他音频",
				"OtherSoundBox"
			},
			{
				"开启/关闭打印实时属性",
				"DumpUnitPropertiesBox"
			},
			{
				"开启/关闭顺序出牌",
				"NoAiSetBox"
			},
			{
				"开启/关闭AI权重显示",
				"ShowAiWeightBox"
			},
			{
				"播放主线校验错误",
				"ReplayBattleCheckResultBox"
			},
			{
				"播放战斗校验客户端Dump",
				"ReplayBCFailClientDumpBox"
			},
			{
				"播放战斗校验客户端Rep",
				"ReplayBCFailClientTimelineBox"
			},
			{
				"播放战斗校验服务器Rep",
				"ReplayBCFailServerTimelineBox"
			},
			{
				"对比校验数值",
				"CompareDataBattleCheckResultBox"
			},
			{
				"自定义战斗数据",
				"CustomBattle"
			},
			{
				"自动闯关",
				"AutoBattle"
			},
			{
				"数值表查询",
				"CheckConfigBox"
			},
			{
				"Translate表查询",
				"CheckTranslateConfig"
			}
		}
		local requireNameMap = {
			"AddGoodsDV",
			"AddAllItems",
			"DiamondDV",
			"ClearBagDV",
			"ChangeCountDV",
			"VIPDV",
			"ChangeLevelDV",
			"SendTestMailDV",
			"ActivityDebug",
			"OnekeyStrengthen",
			"changeServerTime",
			"AddKernel",
			"AddEquip",
			"OneKeyStrengthenEquip",
			"AddMyEquip",
			"AttrInfoView",
			"AddTreasure",
			"ModifyMazeMaserLv",
			"SkipMazeOption",
			"SkipMazeChapter",
			"AddMazeDp",
			"OnekeyMaster",
			"AddSurface",
			"StoryEditor",
			"BattleRecordBox",
			"BattleDumpBox",
			"StartPetRace",
			"StartPetRaceInvincible",
			"StartPetRaceWithID",
			"PetRaceJumpTo",
			"AddPet",
			"AddHeroLove",
			"AddAllHeroLove",
			"SetSeasonTeamInfo",
			"AddClub",
			"ClearAllClub",
			"ClearAllClubExceptMine",
			"AddClubApply",
			"AddFakePlayerToClub",
			"SetDonationCount",
			"AddPlayerContribution",
			"SetClubLevel",
			"SetClubExp",
			"SetMeToPresident",
			"BlockSpResetTimes",
			"BlockSpAddTimes",
			"BlockSpOnekeyFinish",
			"BlockSpRewardTimes",
			"TestBox",
			"ProfilerBox",
			"explore.ExploreResetDp",
			"explore.ExploreAddBagItem",
			"explore.ExploreAddTimes",
			"explore.ExploreResetDailyTimes",
			"explore.ExploreUnlockAll",
			"explore.ExploreRefreshItem",
			"explore.ExploreChangeMoveRate",
			"explore.ExploreOpenDebug",
			"StageOneKeyFinish",
			"EliteStageOneKeyFinish",
			"FullStarFinishPracticle",
			"PracticleToPoint",
			"ArenaAddHonor",
			"GuideChange",
			"ResetRobotEvent",
			"AddDateCount",
			"ResetDateHeroes",
			"AddRewards",
			"CheckSkill",
			"ResetHeroStoryCount",
			"GuideReset",
			"GuideEndBattle",
			"TestPlayStory",
			"TestSound",
			"CheckConfigBox",
			"CheckTranslateConfig",
			"OnekeyInvincible",
			"AddTowerRelifeCount",
			"AddTowerBuffToPlayer",
			"AddTowerMissionsCount",
			"CrusadeBlockCount",
			"CrusadeReset",
			"ClearExploreOrBlockSpTimes",
			"ClubBoss",
			"BattleSettingBox",
			"FreeRecharge",
			"BattleExtend",
			"ChangeMiniGame",
			"CooperateBossTest",
			"DebugShowBustAni",
			"DebugAddLeadStageLevel",
			"DebugRTPKScore",
			"ChangeTask"
		}

		for k, v in pairs(requireNameMap) do
			require(__PACKAGE__ .. "view." .. v)
		end

		return subIndex
	end
}
