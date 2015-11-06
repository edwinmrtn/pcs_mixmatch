
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
function Team:ClearTeam()
	self:getPlayers():Clear()
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


function Team:NumbersPlayers()
	return self:getPlayers():Size()
end
function Team:putinTeam()
	if(self:getName() == "t") then
		for i=1, self:NumbersPlayers() do
				parse("maket "..self:getPlayers():Get(i):getId())
		end
	elseif(self:getName() == "ct")then
		for i=1, self:NumbersPlayers() do
				parse("makect "..self:getPlayers():Get(i):getId())
		end
	end

end

function Team:__tostring()
    return "I am a team"
end

