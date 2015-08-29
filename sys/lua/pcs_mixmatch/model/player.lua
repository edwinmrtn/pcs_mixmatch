local o = dofile("sys/lua/pcs_mixmatch/model/ObjectModel.lua")

--Public class Player
Player = o.class()

--Attributs
Player.USGN = ''
Player.Rank = ''
Player.Name = ''
Player.Team = ''
Player.IP   = ''

--Constructors
function Player:constructor(USGN,Rank,Name,Team,IP)
	Player.USGN = USGN
	Player.Rank = Rank
	Player.Name = Name
	Player.Team = Team
	Player.IP   = IP
end

function Player:constructor(USGN)
	Player.USGN = USGN
	Player.Rank = ''
	Player.Name = ''
	Player.Team = ''
	Player.IP   = ''
end


--Methods
function Player:getUSGN()
    return Player.USGN
end

function Player:getRank()
    return Player.Rank
end

function Player:getName()
    return Player.Name
end

function Player:getTeam()
    return Player.Team
end

function Player:getIP()
    return Player.IP
end

