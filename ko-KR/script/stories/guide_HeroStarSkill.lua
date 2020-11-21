local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.guide_HeroStarSkill")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_guideHeroStarSkill = {
	actions = {}
}
scenes.scene_guideHeroStarSkill = scene_guideHeroStarSkill

function scene_guideHeroStarSkill:stage(args)
	return {
		name = "root",
		type = "Stage",
		id = "root",
		position = {
			x = 0,
			y = 0
		},
		size = {
			width = 1136,
			height = 640
		},
		__actions__ = self.actions
	}
end

function scene_guideHeroStarSkill.actions.guide_HeroStarSkill_enter(_root, args)
	return sequential({
		act({
			action = "updateNode",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					visible = false
				}
			end
		}),
		wait({
			args = function (_ctx)
				return {
					type = "enter_home_view",
					mask = {
						touchMask = true,
						opacity = 0
					}
				}
			end
		}),
		branch({
			{
				cond = function (_ctx)
					return _ctx:isPlayerLevelUp()
				end,
				subnode = sequential({
					wait({
						args = function (_ctx)
							return {
								type = "exit_playerlevelup_view"
							}
						end
					})
				})
			}
		}),
		branch({
			{
				cond = function (_ctx)
					return _ctx:showNewSystemUnlock("Hero_StarUp")
				end,
				subnode = sequential({
					wait({
						args = function (_ctx)
							return {
								type = "exit_newsystem_view"
							}
						end
					})
				})
			}
		}),
		branch({
			{
				cond = function (_ctx)
					return _ctx:showNewSystemUnlock("Hero_Skill")
				end,
				subnode = sequential({
					wait({
						args = function (_ctx)
							return {
								type = "exit_newsystem_view"
							}
						end
					})
				})
			}
		}),
		click({
			args = function (_ctx)
				return {
					id = "home.servant_btn",
					arrowPos = 4,
					mask = {
						touchMask = true,
						opacity = 0
					},
					textArgs = {
						text = "NewPlayerGuide_203_1",
						heroId = "FTLEShi",
						position = {
							refpt = {
								x = 0.35,
								y = 0.4
							}
						}
					},
					clickOffset = {
						x = 0,
						y = 0
					},
					offset = {
						x = 40,
						y = 0
					}
				}
			end
		}),
		wait({
			args = function (_ctx)
				return {
					type = "enter_heroShowList_view",
					mask = {
						touchMask = true,
						opacity = 0
					}
				}
			end
		}),
		click({
			args = function (_ctx)
				return {
					id = "heroShowList.strengthBtn",
					arrowPos = 1,
					mask = {
						touchMask = true,
						opacity = 0
					},
					offset = {
						x = 0,
						y = 5
					},
					clickOffset = {
						x = 0,
						y = 0
					}
				}
			end
		}),
		wait({
			args = function (_ctx)
				return {
					type = "enter_heroShowMain_view",
					mask = {
						touchMask = true,
						opacity = 0
					}
				}
			end
		}),
		branch({
			{
				cond = function (_ctx)
					return _ctx:getUpStarHeroSta()
				end,
				subnode = sequential({
					act({
						action = "updateNode",
						actor = __getnode__(_root, "curtain"),
						args = function (_ctx)
							return {
								visible = false
							}
						end
					}),
					click({
						args = function (_ctx)
							return {
								id = "heroShowMain.tabbtn_3",
								arrowPos = 1,
								mask = {
									touchMask = true,
									opacity = 0
								},
								clickOffset = {
									x = 0,
									y = 0
								}
							}
						end
					}),
					wait({
						args = function (_ctx)
							return {
								type = "enter_heroShowMain_view",
								mask = {
									touchMask = true,
									opacity = 0
								}
							}
						end
					}),
					guideShow({
						args = function (_ctx)
							return {
								id = "heroShowMain.starCostPanel",
								maskRes = "asset/story/zhandou_mask09.png",
								mask = {
									touchMask = true,
									opacity = 0.4
								},
								textArgs = {
									text = "NewPlayerGuide_203_2",
									heroId = "FTLEShi",
									position = {
										refpt = {
											x = 0.45,
											y = 0.65
										}
									}
								},
								offset = {
									x = -20,
									y = 75
								}
							}
						end
					}),
					click({
						args = function (_ctx)
							return {
								id = "heroShowMain.starbtn",
								mask = {
									touchMask = true,
									opacity = 0
								},
								clickOffset = {
									x = 0,
									y = 0
								},
								textArgs = {
									text = "NewPlayerGuide_203_3",
									heroId = "FTLEShi",
									position = {
										refpt = {
											x = 0.5,
											y = 0.4
										}
									}
								}
							}
						end
					}),
					wait({
						args = function (_ctx)
							return {
								type = "exit_HeroStarUpTipMediator"
							}
						end
					})
				})
			}
		}),
		branch({
			{
				cond = function (_ctx)
					return _ctx:getUpSkillHeroSta()
				end,
				subnode = sequential({
					act({
						action = "updateNode",
						actor = __getnode__(_root, "curtain"),
						args = function (_ctx)
							return {
								visible = false
							}
						end
					}),
					click({
						args = function (_ctx)
							return {
								id = "heroShowMain.tabbtn_4",
								arrowPos = 1,
								mask = {
									touchMask = true,
									opacity = 0
								},
								clickOffset = {
									x = 0,
									y = 0
								},
								textArgs = {
									text = "NewPlayerGuide_203_4",
									heroId = "FTLEShi",
									position = {
										refpt = {
											x = 0.5,
											y = 0.4
										}
									}
								}
							}
						end
					}),
					wait({
						args = function (_ctx)
							return {
								type = "enter_heroShowMain_view",
								mask = {
									touchMask = true,
									opacity = 0
								}
							}
						end
					}),
					click({
						args = function (_ctx)
							return {
								id = "heroShowMain.skillLevelBtn",
								mask = {
									touchMask = true,
									opacity = 0
								},
								textArgs = {
									text = "NewPlayerGuide_203_4",
									heroId = "FTLEShi",
									position = {
										refpt = {
											x = 0.35,
											y = 0.3
										}
									}
								}
							}
						end
					}),
					guideShow({
						args = function (_ctx)
							return {
								id = "heroShowMain.skillLevelBtn",
								mask = {
									touchMask = true,
									opacity = 0
								},
								textArgs = {
									text = "NewPlayerGuide_203_5",
									heroId = "FTLEShi",
									position = {
										refpt = {
											x = 0.5,
											y = 0.3
										}
									}
								}
							}
						end
					})
				})
			}
		})
	})
end

local function guide_HeroStarSkill(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "guide_HeroStarSkill_enter",
					scene = scene_guideHeroStarSkill
				}
			end
		})
	})
end

stories.guide_HeroStarSkill = guide_HeroStarSkill

return _M
