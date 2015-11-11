-----------
-- Class Team
-- @classmod Team
--Public class Team
Team = newclass("Team")



---Constructors
--@param Name Name of the Team
--@param Players Players contained in the team
function Team:init(Name)
	self.Name    = Name
	self.Players = ArrayList.Create()
end

--Methods

---Getters - Setters 
function Team:getName()
    return self.Name
end

---Getters - Setters 
function Team:ClearTeam()
	self:getPlayers():Clear()
end

---Getters - Setters 
function Team:getPlayers()
    return self.Players
end

---Getters - Setters 
function Team:setName(Name)
		  self.Name = Name
end

---Getters - Setters 
function Team:setPlayers(Player)
		  self.Players = Player
end 

---Getters - Setters 
function Team:addPlayer(Player)
	self:getPlayers():Add(Player)
end 

---Getters - Setters 
function Team:NumbersPlayers()
	return self:getPlayers():Size()
end

---putinTeam
--makes in ingame teams
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

