-----------
-- Class MixList
-- @classmod MixList
--Public class MixList
PlayerList = newclass("PlayerList")
PlayerList.PlayerList     = ArrayList.Create()

---Constructors
--@param id id of the PlayerList
function PlayerList:init(Id,Titre)
	self.Id      = Id 
end

--Methods

---Getters - Setters 
function PlayerList:getId()
    return self.Id
end

---Getters - Setters 
function PlayerList:exist(Player)
	local bool = false
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

---Getters - Setters 
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

---Getters - Setters 
function PlayerList:getPlayerList()
    return self.PlayerList
end

---Getters - Setters 
function PlayerList:addplayer(Player)
    self:getPlayerList():Add(Player)
end

---Getters - Setters 
function PlayerList:removePlayer(Player)
    self:getPlayerList():Remove(Player)
end   

---Getters - Setters 
function PlayerList:NumbersPlayers()
    return self:getPlayerList():Size()
end

function PlayerList:__tostring()
    return "I am a PlayerList"
end

