-----------
-- Class Player
-- @classmod Player
--Public class Player
Player = newclass("Player")

---Constructors
--@param id id of the Player
--@param USGN usgn of the player
--@param Rank  rank of the player
--@param Name  name of the player 
--@param IP IP of the player
function Player:init(Id,USGN,Rank,Name,IP)
	self.Id             = Id
	self.USGN           = USGN
	self.Rank           = Rank
	self.Name           = Name
	self.IP             = IP
  self.Domage         = 0
  self.TotalDomage    = 0
  self.CreateMixArray = {}
  self.RoundsPlayed   = 0
end


--createMixArray.rounds
--createMixArray.nombersplayers
--createMixArray.map
--createMixArray.tillend
--createMixArray.kniferound

--Methods

---Getters - Setters 
function Player:getId()
    return self.Id
end

---Getters - Setters 
function Player:getUSGN()
    return self.USGN
end

---Getters - Setters 
function Player:getCreateMixArray()
  return self.CreateMixArray
end

---Getters - Setters 
function Player:getRank()
    return self.Rank
end

---Getters - Setters 
function Player:setRank(nbr,rank)
    self.Rank[tonumber(nbr)] = self:getRank()[tonumber(nbr)] + tonumber(rank)
end

---Getters - Setters 
function Player:getDomage()
    return self.Domage
end

---Getters - Setters 
function Player:setDomage(Domage)
    self.Domage = Domage
end

---Getters - Setters 
function Player:getTotalDomage()
    return self.TotalDomage
end

---Getters - Setters 
function Player:setTotalDomage(TotalDomage)
    self.TotalDomage = TotalDomage
end

---Getters - Setters 
function Player:getName()
    return self.Name
end

---Getters - Setters 
function Player:getTeam()
    return self.Team
end

---rankCalculation
--@param nbrPlayers nomber of player in the mix
--calculate the rank depending the number of round the player is playing
function Player:rankCalculation(nbrPlayers)
  local moyKill
  msg("nbr player: "..nbrPlayers)
  --particular case for 1v1
  if(tonumber(nbrPlayers) == 2 )then
    moyKill = 50
    local totalmoyKill = moyKill * self:getRoundsPlayed()
    local x=(self:getTotalDomage()-totalmoyKill)

    msg("nbr roundPlayed : "..self:getRoundsPlayed())
    msg("totalmoykill: "..totalmoyKill)
    msg("totaldommage : "..self:getTotalDomage())
    msg("rank :"..x)
    return math.floor(x)
  else 
    moyKill = 100
    local totalmoyKill = moyKill * self:getRoundsPlayed()
    local x=(self:getTotalDomage()-totalmoyKill)

    msg("nbr roundPlayed : "..self:getRoundsPlayed())
    msg("totalmoykill: "..totalmoyKill)
    msg("totaldommage : "..self:getTotalDomage())
    msg("rank :"..x)
    return math.floor(x/10)
  end 
  
end

---dontmove
--set ingame speedmod -100
function Player:dontmove()
  parse("speedmod "..self:getId().." ".."-100")
end 

---Getters - Setter
function Player:getRoundsPlayed()
  return self.RoundsPlayed
end

---Getters - Setter
function Player:setRoundsPlayed(RoundsPlayed)
  self.RoundsPlayed = RoundsPlayed
end

function Player:stripWeapon(weaponid)
	 parse(" strip "..self:getId()..' '..weaponid)
end


function Player:chooseteam()
        for i=1,theMenuList:NumbersMenus() do
          if("Choose your team" == theMenuList:getMenuList():Get(i):getTitre())then
                theMenuList:getMenuList():Get(i):Show(self:getId())
          end
        end
end

---Getters - Setter
function Player:getIP()
    return self.IP
end
function Player:__tostring()
    return "I am a Player"
end

