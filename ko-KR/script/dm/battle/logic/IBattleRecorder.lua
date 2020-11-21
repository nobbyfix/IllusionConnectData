IBattleRecorder = interface("IBattleRecorder")

function IBattleRecorder:gotoFrame(frame)
end

function IBattleRecorder:getCurrentFrame()
end

function IBattleRecorder:newTimeline(objId, typeName)
end

function IBattleRecorder:recordEvent(objId, evt, data)
end

function IBattleRecorder:startRecording()
end

function IBattleRecorder:endRecording()
end
