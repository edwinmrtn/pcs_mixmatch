

--Public class Player
Player = newclass("Player")

--Constructors
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
function Player:getId()
    return self.Id
end
function Player:getUSGN()
    return self.USGN
end
function Player:getCreateMixArray()
  return self.CreateMixArray
end

function Player:getRank()
    return self.Rank
end
function Player:setRank(nbr,rank)
    self.Rank[tonumber(nbr)] = self:getRank()[tonumber(nbr)] + tonumber(rank)
end
function Player:getDomage()
    return self.Domage
end
function Player:setDomage(Domage)
    self.Domage = Domage
end
function Player:getTotalDomage()
    return self.TotalDomage
end
function Player:setTotalDomage(TotalDomage)
    self.TotalDomage = TotalDomage
end
function Player:getName()
    return self.Name
end

function Player:getTeam()
    return self.Team
end
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
function Player:dontmove()
  parse("speedmod "..self:getId().." ".."-100")
end 
function Player:getRoundsPlayed()
  return self.RoundsPlayed
end
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

function Player:getIP()
    return self.IP
end
function Player:__tostring()
    return "I am a Player"
end

