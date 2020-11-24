MazeHero = class("MazeMaster", Master, _M)

function MazeHero:initialize(heroId, player)
	super.initialize(self)
end

function MazeHero:synchronize(data)
	super:synchronize(data)
end
