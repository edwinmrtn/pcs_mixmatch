dofile("sys/lua/pcs_mixmatch/model/object.lua")

--Public class Player
Player = newclass("Player")

--Constructors
function Player:init(USGN,Rank,Name,Team,IP)
	self.USGN = USGN
	self.Rank = Rank
	self.Name = Name
	self.Team = Team
	self.IP   = IP
end


function Player:init(USGN,Rank)
	self.USGN = USGN
	self.Rank = Rank
	self.Name = ''
	self.Team = ''
	self.IP   = ''
end


--Methods
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

function Player:getIP()
    return self.IP
end
function Player:__tostring()
    return "I am a Player"
end

