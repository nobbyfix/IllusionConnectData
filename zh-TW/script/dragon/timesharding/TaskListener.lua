module("timesharding", package.seeall)

TaskListener = class("TaskListener")

function TaskListener:initialize()
	super.initialize(self)
end

function TaskListener:onProgress(task, progress)
end

function TaskListener:onError(task, err, level)
end

function TaskListener:onCompleted(task)
end

function TaskListener:onAbort(task)
end
