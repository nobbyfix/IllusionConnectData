require("dm.gameplay.miniGame.model.gamePoint.MiniPlanePoint")

PlaneWarStage = class("PlaneWarStage", objectlua.Object, _M)

function PlaneWarStage:initialize(config)
	super.initialize(self)
end

function PlaneWarStage:sync(data)
end
