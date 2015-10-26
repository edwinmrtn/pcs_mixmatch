
--Public class PlayerList
PlayerList = newclass("PlayerList")
PlayerList.PlayerList     = ArrayList.Create()

--Constructors

function PlayerList:init(Id,Titre)
	self.Id      = Id 
end

--Methods
function PlayerList:getId()
    return self.Id
end
function PlayerList:getPlayerList()
    return self.PlayerList
end
function PlayerList:addplayer(Player)
    self:getPlayerList():Add(Player)
end 
function PlayerList:NumbersPlayers()
    return self:getPlayerList():Size()
end

function PlayerList:__tostring()
    return "I am a PlayerList"
end

