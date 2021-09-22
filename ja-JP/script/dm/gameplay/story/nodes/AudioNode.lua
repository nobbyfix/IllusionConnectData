module("story", package.seeall)

AudioNode = class("AudioNode", StageNode)
local acitons = {
	play = PlayAudio,
	stop = StopAudio,
	pause = PauseAudio,
	resume = ResumeAudio,
	elide = ElideAudio,
	notElide = NotElideAudio,
	block = BlockAudio,
	volume = VolumeAudio
}

AudioNode:extendActionsForClass(acitons)

function AudioNode:initialize(config)
	super.initialize(self, config)

	self._fileName = config.fileName
	self._handle = nil
	self._blockId = config.blockId
end

function AudioNode:volumeTo(type, volumebegin, volumeend, targetTimes)
	dump(type, " volumeTo type ")

	local settingModel = DmGame:getInstance()._injector:getInstance(SettingSystem):getSettingModel()
	local volume = 0

	if type == "music" then
		volume = settingModel:getMusicVolume()
	elseif type == "effect" then
		volume = settingModel:getEffectVolume()
	elseif type == "cveffect" then
		volume = settingModel:getRoleEffectVolume()
	end

	if volume <= 0 then
		return
	end

	local targetTimes = targetTimes
	local dis = volumeend - volumebegin
	local per = dis / targetTimes / 10
	local curVolume = volumebegin
	local times = os.time()

	local function setVolume(volume)
		if type == "music" then
			AudioEngine:getInstance():setMusicVolume(volume)
		elseif type == "effect" then
			AudioEngine:getInstance():setEffectsVolume(volume)
		elseif type == "cveffect" then
			AudioEngine:getInstance():setCVEffectsVolume(volume)
		end
	end

	setVolume(volumebegin)

	local function checkTimeFunc()
		local function stop()
			if self["timer" .. type] then
				self["timer" .. type]:stop()

				self["timer" .. type] = nil
			end
		end

		if dis > 0 then
			if volumeend <= curVolume then
				stop()

				return
			end
		elseif curVolume <= volumeend then
			stop()

			return
		end

		curVolume = curVolume + per

		setVolume(curVolume)
	end

	self["timer" .. type] = LuaScheduler:getInstance():schedule(checkTimeFunc, 0.1, false)
end

SoundNode = class("SoundNode", AudioNode)

register_stage_node("Sound", SoundNode)

function SoundNode:initialize(config)
	super.initialize(self, config)
end

function SoundNode:play(isLoop)
	local isElide = AudioEngine:getInstance():getElide()

	if isElide then
		self:notElide()
	end

	local settingModel = DmGame:getInstance()._injector:getInstance(SettingSystem):getSettingModel()

	AudioEngine:getInstance():setEffectsVolume(settingModel:getEffectVolume())

	self._handle = AudioEngine:getInstance():playEffect(self._fileName, isLoop)

	if isElide then
		self:elide()
	end
end

function SoundNode:stop()
	if self._handle then
		AudioEngine:getInstance():stopEffect(self._handle)

		self._handle = nil
	end
end

function SoundNode:resume()
end

function SoundNode:pause()
end

function SoundNode:elide()
	AudioEngine:getInstance():setElide(true)
end

function SoundNode:notElide()
	AudioEngine:getInstance():setElide(false)
end

function SoundNode:setBlock(blockId)
	AudioEngine:getInstance():setBlockIndexByID(nil, blockId)
end

MusicNode = class("MusicNode", AudioNode)

register_stage_node("Music", MusicNode)

function MusicNode:initialize(config)
	super.initialize(self, config)
end

function MusicNode:play(isLoop)
	local isElide = AudioEngine:getInstance():getElide()

	if isElide then
		self:notElide()
	end

	local settingModel = DmGame:getInstance()._injector:getInstance(SettingSystem):getSettingModel()

	AudioEngine:getInstance():setMusicVolume(settingModel:getMusicVolume())

	local handle = AudioEngine:getInstance():playBackgroundMusic(self._fileName)

	if isElide then
		self:elide()
	end
end

function MusicNode:stop()
	AudioEngine:getInstance():stopBackgroundMusic()
end

function MusicNode:resume()
	AudioEngine:getInstance():resumeBackgroundMusic()
end

function MusicNode:pause()
	AudioEngine:getInstance():pauseBackgroundMusic()
end

function MusicNode:elide()
	AudioEngine:getInstance():setElide(true)
end

function MusicNode:notElide()
	AudioEngine:getInstance():setElide(false)
end

function MusicNode:setBlock(blockId)
	if blockId then
		AudioEngine:getInstance():setBlockIndexByID(nil, blockId)

		return
	end

	if self._blockId then
		AudioEngine:getInstance():setBlockIndexByID(nil, self._blockId)
	end
end
