if cc.SimpleAudioEngine == nil then
	return
end

local M = {
	stopAllEffects = function ()
		cc.SimpleAudioEngine:getInstance():stopAllEffects()
	end,
	getMusicVolume = function ()
		return cc.SimpleAudioEngine:getInstance():getMusicVolume()
	end,
	isMusicPlaying = function ()
		return cc.SimpleAudioEngine:getInstance():isMusicPlaying()
	end,
	getEffectsVolume = function ()
		return cc.SimpleAudioEngine:getInstance():getEffectsVolume()
	end,
	setMusicVolume = function (volume)
		cc.SimpleAudioEngine:getInstance():setMusicVolume(volume)
	end,
	stopEffect = function (handle)
		cc.SimpleAudioEngine:getInstance():stopEffect(handle)
	end,
	stopMusic = function (isReleaseData)
		local releaseDataValue = false

		if isReleaseData ~= nil then
			releaseDataValue = isReleaseData
		end

		cc.SimpleAudioEngine:getInstance():stopMusic(releaseDataValue)
	end,
	playMusic = function (filename, isLoop)
		local loopValue = false

		if isLoop ~= nil then
			loopValue = isLoop
		end

		cc.SimpleAudioEngine:getInstance():playMusic(filename, loopValue)
	end,
	pauseAllEffects = function ()
		cc.SimpleAudioEngine:getInstance():pauseAllEffects()
	end,
	preloadMusic = function (filename)
		cc.SimpleAudioEngine:getInstance():preloadMusic(filename)
	end,
	resumeMusic = function ()
		cc.SimpleAudioEngine:getInstance():resumeMusic()
	end,
	playEffect = function (filename, isLoop)
		local loopValue = false

		if isLoop ~= nil then
			loopValue = isLoop
		end

		return cc.SimpleAudioEngine:getInstance():playEffect(filename, loopValue)
	end,
	rewindMusic = function ()
		cc.SimpleAudioEngine:getInstance():rewindMusic()
	end,
	willPlayMusic = function ()
		return cc.SimpleAudioEngine:getInstance():willPlayMusic()
	end,
	unloadEffect = function (filename)
		cc.SimpleAudioEngine:getInstance():unloadEffect(filename)
	end,
	preloadEffect = function (filename)
		cc.SimpleAudioEngine:getInstance():preloadEffect(filename)
	end,
	setEffectsVolume = function (volume)
		cc.SimpleAudioEngine:getInstance():setEffectsVolume(volume)
	end,
	pauseEffect = function (handle)
		cc.SimpleAudioEngine:getInstance():pauseEffect(handle)
	end,
	resumeAllEffects = function (handle)
		cc.SimpleAudioEngine:getInstance():resumeAllEffects()
	end,
	pauseMusic = function ()
		cc.SimpleAudioEngine:getInstance():pauseMusic()
	end,
	resumeEffect = function (handle)
		cc.SimpleAudioEngine:getInstance():resumeEffect(handle)
	end,
	getInstance = function ()
		return cc.SimpleAudioEngine:getInstance()
	end,
	destroyInstance = function ()
		return cc.SimpleAudioEngine:destroyInstance()
	end
}
AudioEngine = M
