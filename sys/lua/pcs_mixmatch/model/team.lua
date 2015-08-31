dofile("sys/lua/pcs_mixmatch/model/object.lua")
dofile("sys/lua/pcs_mixmatch/model/arrayList.lua")
dofile("sys/lua/pcs_mixmatch/model/player.lua")

--Public class Team
Team = newclass("Team")


--Constructors

function Team:init(Name)
	self.Name    = Name
	self.Players = ArrayList.Create()
end




--Methods

function Team:getName()
    return self.Name
end

function Team:getPlayers()
    return self.Players
end
function Team:setName(Name)
		  self.Name = Name
end
function Team:setPlayers(Player)
		  self.Players = Player
end 

function Team:addPlayer(Player)
	self:getPlayers():Add(Player)
end 

--function Team:Contains(Player)
--	return Team.getPlayers():Contains(Player)
--end

function Team:NumbersPlayers()
	return self:getPlayers():Size()
end

function Team:__tostring()
    return "I am a team"
end

