local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.guide_HeroGiftGiving")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_guideHeroGiftGiving = {
	actions = {}
}
scenes.scene_guideHeroGiftGiving = scene_guideHeroGiftGiving

function scene_guideHeroGiftGiving:stage(args)
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

function scene_guideHeroGiftGiving.actions.guide_HeroGiftGiving(_root, args)
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
		checkGuideView({}),
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
					return _ctx:showNewSystemUnlock("Hero_Gift")
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
					id = "home.photo_btn",
					arrowPos = 4,
					mask = {
						touchMask = true,
						opacity = 0
					},
					textArgs = {
						text = "NewPlayerGuide_210_1",
						position = {
							refpt = {
								x = 0.6,
								y = 0.3
							}
						}
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
					type = "enter_GalleryPartnerMediator",
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
					id = "GalleryPartnerMediator.firstPanel",
					mask = {
						touchMask = true,
						opacity = 0
					},
					offset = {
						x = 0,
						y = 0
					},
					textArgs = {
						text = "NewPlayerGuide_210_2",
						position = {
							refpt = {
								x = 0.8,
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
					type = "enter_GalleryPartnerInfoMediator",
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
					id = "GalleryPartnerInfoMediator.giftBtn",
					arrowPos = 1,
					mask = {
						touchMask = true,
						opacity = 0
					},
					offset = {
						x = 0,
						y = 10
					},
					textArgs = {
						text = "NewPlayerGuide_210_3",
						position = {
							refpt = {
								x = 0.6,
								y = 0.5
							}
						}
					}
				}
			end
		}),
		wait({
			args = function (_ctx)
				return {
					type = "enter_GalleryDateMediator",
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
					id = "GalleryDateMediator.cellOne",
					mask = {
						touchMask = true,
						opacity = 0
					},
					offset = {
						x = 60,
						y = 75
					},
					textArgs = {
						text = "NewPlayerGuide_210_4",
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
		click({
			args = function (_ctx)
				return {
					id = "GalleryDateMediator.giftBtn",
					mask = {
						touchMask = true,
						opacity = 0
					},
					offset = {
						x = 0,
						y = 0
					},
					textArgs = {
						text = "NewPlayerGuide_210_4",
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
					type = "Guide_GALLERY_SEND_GIF_SUC",
					mask = {
						touchMask = true,
						opacity = 0
					}
				}
			end
		})
	})
end

local function guide_HeroGiftGiving(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "guide_HeroGiftGiving",
					scene = scene_guideHeroGiftGiving
				}
			end
		})
	})
end

stories.guide_HeroGiftGiving = guide_HeroGiftGiving

return _M
