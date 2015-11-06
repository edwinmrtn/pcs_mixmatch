
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
function PlayerList:exist(Player)
	local bool = false
    msg("fonction "..tostring(Player))
	for i=1, self:NumbersPlayers() do
    	if (Player:getUSGN() == self:getPlayerList():Get(i):getUSGN()) then
    		bool = true
    		if bool then
    			return bool
    		end 
    	end
	end
	return bool
end
function PlayerList:getPlayer(Player)
    if self:exist(Player) then
        for i=1, self:NumbersPlayers() do
            if (Player:getUSGN() == self:getPlayerList():Get(i):getUSGN()) then
                return self:getPlayerList():Get(i)
            end
        end
    else
        return nil
    end 
end

function PlayerList:getPlayerList()
    return self.PlayerList
end
function PlayerList:addplayer(Player)
    self:getPlayerList():Add(Player)
end
function PlayerList:removePlayer(Player)
    self:getPlayerList():Remove(Player)
end   
function PlayerList:NumbersPlayers()
    return self:getPlayerList():Size()
end

function PlayerList:__tostring()
    return "I am a PlayerList"
end

