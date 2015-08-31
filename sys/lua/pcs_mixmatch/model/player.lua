dofile("sys/lua/pcs_mixmatch/model/object.lua")

--Public class Player
Player = newclass("Player")

--Constructors
function Player:init(Id,USGN,Rank,Name,IP)
	self.Id   = Id
	self.USGN = USGN
	self.Rank = Rank
	self.Name = Name
	self.IP   = IP
end


--Methods
function Player:getId()
    return self.Id
end
function Player:getUSGN()
    return self.USGN
end

function Player:getRank()
    return self.Rank
end

function Player:getName()
    return self.Name
end

function Player:getTeam()
    return self.Team
end

function Player:stripWeapon(weaponid)
	 parse(" strip "..self:getId()..' '..weaponid)
end

function Player:getIP()
    return self.IP
end
function Player:__tostring()
    return "I am a Player"
end

