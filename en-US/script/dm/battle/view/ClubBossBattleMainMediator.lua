require("dm.battle.view.BattleMainMediator")

ClubBossBattleMainMediator = class("ClubBossBattleMainMediator", BattleMainMediator)

function ClubBossBattleMainMediator:initialize()
	super.initialize(self)
end

function ClubBossBattleMainMediator:tryLeaving()
	self._delegate:tryLeaving(function (leave)
		if leave then
			local clubBossSelf = self

			self:sendMessage("leave", {}, function (isOk, _)
				if isOk then
					clubBossSelf:tick(0.1)
					clubBossSelf:stopScheduler()
					clubBossSelf._delegate:onLeavingBattle(self)
				end
			end)
			self:onResume()

			return
		end

		self:onResume()
	end)
end
