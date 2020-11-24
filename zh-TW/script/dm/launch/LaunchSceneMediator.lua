LaunchSceneMediator = class("LaunchSceneMediator", DmSceneMediator, _M)

function LaunchSceneMediator:initialize()
	super.initialize(self)
end

function LaunchSceneMediator:dispose()
	super.dispose(self)
end

function LaunchSceneMediator:onRegister()
	super.onRegister(self)
end

function LaunchSceneMediator:onRemove()
	super.onRemove(self)
end

function LaunchSceneMediator:switchLoginView()
	self:checkUserState()
end

function LaunchSceneMediator:checkUserState()
	self:loadBaseRequires()

	local injector = self:getInjector()
	local loginView = injector:getInstance("loginView")

	self:dispatch(ViewEvent:new(EVT_SWITCH_VIEW, loginView, {}))
end

function LaunchSceneMediator:loadBaseRequires()
	local injector = self:getInjector()
	local gameContext = injector:getInstance("GameContext")

	gameContext:loadModuleByName("login")
end

function LaunchSceneMediator:enterWithData(data)
	require("dm.assets.init")
	require("dm.base.all")
	require("dm.utils.AudioEngine")
	self:switchLoginView()
	self:initLogger()
end

function LaunchSceneMediator:initLogger()
	if GameConfigs.dpsLoggerEnable then
		StatisticSystem:uploadLogs(LogType.kClient)

		if GameConfigs.dpsLoggerConfig.root == nil then
			local fileUtils = cc.FileUtils:getInstance()
			GameConfigs.dpsLoggerConfig.root = fileUtils:getWritablePath() .. "log"

			if not fileUtils:isDirectoryExist(GameConfigs.dpsLoggerConfig.root) then
				fileUtils:createDirectory(GameConfigs.dpsLoggerConfig.root)
			end
		end

		DpsLogger:clear()
		DpsLogger:init(GameConfigs.dpsLoggerConfig.root)
		DpsLogger:enable()

		for _, category in ipairs(GameConfigs.dpsLoggerConfig.category) do
			local appenders = {}

			for _, appender in ipairs(category.appender) do
				if appender == "File" then
					appenders[#appenders + 1] = {
						fmtfunc = FileFormat,
						filename = category.name
					}
				elseif appender == "Stat" then
					appenders[#appenders + 1] = {
						fmtfunc = JsonFormat,
						filename = category.name
					}
					category.pattern = "%message\n"
				else
					appenders[#appenders + 1] = {
						fmtfunc = DumpFormat
					}
				end
			end

			DpsLogger:addLogger(category.name, category.level, appenders, category.pattern)
		end
	end
end

function LaunchSceneMediator:initAnim()
	self._bgAnim = cc.MovieClip:create("zdh_xindenglu")

	self._bgAnim:addTo(self:getView())
	self._bgAnim:setPosition(cc.p(568, 320))
	self._bgAnim:addCallbackAtFrame(90, function ()
		self._bgAnim:gotoAndPlay(0)
	end)
end

function LaunchSceneMediator:removeAnim()
	if self._bgAnim then
		self._bgAnim:removeFromParent()
	end
end
