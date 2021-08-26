local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.guide_RTPK")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_guideRTPK = {
	actions = {}
}
scenes.scene_guideRTPK = scene_guideRTPK

function scene_guideRTPK:stage(args)
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

function scene_guideRTPK.actions.guide_RTPK_Action(_root, args)
	return sequential({
		guideShow({
			args = function (_ctx)
				return {
					mask = {
						touchMask = true,
						opacity = 0.4
					},
					textArgs = {
						text = "RTPK_Guideinfo_Text01",
						position = {
							refpt = {
								x = 0.5,
								y = 0.5
							}
						}
					}
				}
			end
		}),
		guideShow({
			args = function (_ctx)
				return {
					id = "RTPKMainMediator.guide_panel_1",
					maskRes = "asset/story/zhandou_mask10.png",
					mask = {
						touchMask = true,
						opacity = 0.4
					},
					textArgs = {
						text = "RTPK_Guideinfo_Text02",
						position = {
							refpt = {
								x = 0.5,
								y = 0.5
							}
						}
					},
					maskSize = {
						w = 331,
						h = 474
					},
					offset = {
						x = 0,
						y = 0
					}
				}
			end
		}),
		guideShow({
			args = function (_ctx)
				return {
					id = "RTPKMainMediator.guide_panel_2",
					maskRes = "asset/story/zhandou_mask10.png",
					mask = {
						touchMask = true,
						opacity = 0.4
					},
					textArgs = {
						text = "RTPK_Guideinfo_Text03",
						position = {
							refpt = {
								x = 0.5,
								y = 0.5
							}
						}
					},
					maskSize = {
						w = 57,
						h = 62
					},
					offset = {
						x = 0,
						y = 0
					}
				}
			end
		})
	})
end

local function guide_RTPK(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "guide_RTPK_Action",
					scene = scene_guideRTPK
				}
			end
		})
	})
end

stories.guide_RTPK = guide_RTPK

return _M
