IProcessRecorder = interface("IProcessRecorder")

function IProcessRecorder:beginSkillAction(actionEnv, actor, target)
end

function IProcessRecorder:endSkillAction(actionEnv, reason)
end

function IProcessRecorder:beginActionFragment(actionEnv)
end

function IProcessRecorder:endActionFragment(actionEnv)
end

function IProcessRecorder:newObjectTimeline(objId, typeName, workId)
end

function IProcessRecorder:recordObjectEvent(objId, event, detail, workId)
end
