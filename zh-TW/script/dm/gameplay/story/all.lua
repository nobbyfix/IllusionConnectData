local __FILE__ = select(1, ...) or ""
local __PACKAGE__ = string.gsub(__FILE__, "[^.]+$", "")

require(__PACKAGE__ .. "sandbox")
require(__PACKAGE__ .. "StoryEvents")
require(__PACKAGE__ .. "StoryAgent")
require(__PACKAGE__ .. "StoryDirector")
require(__PACKAGE__ .. "service.StoryService")
require(__PACKAGE__ .. "StoryContext")
require(__PACKAGE__ .. "widgets.OptionWidget")
require(__PACKAGE__ .. "widgets.PortraitOptionWidget")
require(__PACKAGE__ .. "widgets.LoopWidget")
require(__PACKAGE__ .. "widgets.NormalDialogueWidget")
require(__PACKAGE__ .. "widgets.DialogueChooseShowWidget")
require(__PACKAGE__ .. "widgets.PrinterEffectDialogWidget")
require(__PACKAGE__ .. "widgets.ChapterDialogWidget")
require(__PACKAGE__ .. "widgets.ReviewDialogueWidget")
require(__PACKAGE__ .. "widgets.RenameDialogWidget")
require(__PACKAGE__ .. "widgets.StoryNewsWidget")
require(__PACKAGE__ .. "widgets.StoryChooseDialogWidget")
require(__PACKAGE__ .. "behaviors.FlowControl")
require(__PACKAGE__ .. "behaviors.StoryActions")
require(__PACKAGE__ .. "behaviors.CCActionWrapper")
require(__PACKAGE__ .. "behaviors.AnimationAction")
require(__PACKAGE__ .. "behaviors.TextAction")
require(__PACKAGE__ .. "behaviors.StageNodeActions")
require(__PACKAGE__ .. "behaviors.RoleNodeActions")
require(__PACKAGE__ .. "behaviors.DialogueActions")
require(__PACKAGE__ .. "behaviors.CameraActions")
require(__PACKAGE__ .. "behaviors.EventActions")
require(__PACKAGE__ .. "behaviors.AudioActions")
require(__PACKAGE__ .. "behaviors.GuideActions")
require(__PACKAGE__ .. "behaviors.LoopNodeActions")
require(__PACKAGE__ .. "behaviors.VideoPlayerAction")
require(__PACKAGE__ .. "nodes.StageNodeFactory")
require(__PACKAGE__ .. "nodes.StageNode")
require(__PACKAGE__ .. "nodes.RootNode")
require(__PACKAGE__ .. "nodes.RenderableNode")
require(__PACKAGE__ .. "nodes.TextNode")
require(__PACKAGE__ .. "nodes.AnimationNode")
require(__PACKAGE__ .. "nodes.AudioNode")
require(__PACKAGE__ .. "nodes.GuideNode")
require(__PACKAGE__ .. "nodes.LoopNode")
require(__PACKAGE__ .. "nodes.VideoPlayerNode")
