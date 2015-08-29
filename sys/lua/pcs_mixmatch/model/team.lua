local o = dofile("sys/lua/pcs_mixmatch/model/ObjectModel.lua")
dofile("sys/lua/pcs_mixmatch/model/arrayList.lua")
dofile("sys/lua/pcs_mixmatch/model/Player.lua")

--Public class Team
Team = o.class()

--Attributs
Team.Name    = ''
Team.Players = ArrayList.Create()

--Constructors
function Team:constructor(Name,Players)
	Team.Name    = Name
	Team.Players = Players
end

function Team:constructor(Name)
	Team.Name    = Name
	Team.Players = ArrayList.Create()
end


--Methods

function Team:getName()
    return Team.Name
end

function Team:getPlayers()
    return Team.Players
end
function Team:setName(Name)
	Team.Name    = Name
end
function Team:setPlayers(Player)
	Team.Players = Player
end 

function Team:addPlayer(Player)
	Team:getPlayers():Add(Player)
end 

function Team:Contains(Player)
	return Team:getPlayers():Contains(Player)
end
function Team:String()
	return Team:getPlayers():string()
end

