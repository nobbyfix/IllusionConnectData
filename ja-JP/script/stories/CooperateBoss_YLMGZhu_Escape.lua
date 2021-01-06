local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.CooperateBoss_YLMGZhu_Escape")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_CooperateBoss_YLMGZhu_Escape = {
	actions = {}
}
scenes.scene_CooperateBoss_YLMGZhu_Escape = scene_CooperateBoss_YLMGZhu_Escape

function scene_CooperateBoss_YLMGZhu_Escape:stage(args)
	return {
		name = "root",
		type = "Stage",
		id = "root",
		position = {
			x = 0,
			y = 0
		},
		size = {
			width = 1386,
			height = 852
		},
		touchEvents = {
			moved = "evt_bg_touch_moved",
			began = "evt_bg_touch_began",
			ended = "evt_bg_touch_ended"
		},
		children = {
			{
				resType = 0,
				name = "hm",
				pathType = "STORY_ROOT",
				type = "Image",
				image = "hm.png",
				opacity = 0.75,
				layoutMode = 1,
				id = "hm",
				scale = 1,
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.5,
						y = 0.5
					}
				}
			}
		},
		__actions__ = self.actions
	}
end

function scene_CooperateBoss_YLMGZhu_Escape.actions.action_CooperateBoss_YLMGZhu_Escape(_root, args)
	return sequential({
		concurrent({
			act({
				action = "activateNode",
				actor = __getnode__(_root, "hm")
			})
		}),
		act({
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					modelId = "Model_YLMGZhu",
					id = "YLMGZhu",
					rotationX = 0,
					scale = 1.09,
					zorder = 10,
					position = {
						x = 0,
						y = -300,
						refpt = {
							x = 0.46,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "YLMGZhu_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "YLMGZhu/YLMGZhu_face_1.png",
							scaleX = 1,
							scaleY = 1,
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "YLMGZhu_face",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = 73.3,
								y = 691.5
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "YLMGZhu"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "YLMGZhu"),
				args = function (_ctx)
					return {
						duration = 0.15
					}
				end
			})
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "HeroBase_Name_YLMGZhu",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YLMGZhu"
					},
					content = {
						"CooperateBoss_YLMGZhu_EscapeBubble"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.25
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "YLMGZhu"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		})
	})
end

local function CooperateBoss_YLMGZhu_Escape(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "action_CooperateBoss_YLMGZhu_Escape",
					scene = scene_CooperateBoss_YLMGZhu_Escape
				}
			end
		})
	})
end

stories.CooperateBoss_YLMGZhu_Escape = CooperateBoss_YLMGZhu_Escape

return _M
