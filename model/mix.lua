-----------
-- Class Mix
-- @classmod Mix
--Public class Mix
Mix = newclass("Mix")

---Constructors
--@param id id of the layout
--@param Rounds number of round this mix have 
--@param NomberPlayers  nnomber of player this mix have
--@param Map  name of the map 
--@param KnifeRound boolean for kniferound
function Mix:init(Id,Rounds,NomberPlayers,Map,KnifeRound,Fire,Sniper)
self.Id            = Id
self.Rounds        = Rounds
self.NomberPlayers = NomberPlayers
self.Map           = Map
self.Fire          = Fire
self.Sniper        = Sniper
self.KnifeRound    = KnifeRound
self.RegistPlayers = ArrayList.Create()
self.State         = "preparation"
self.Teams         = ArrayList.Create()
self.ObKniferound  = Kniferound("Kniferound");
self.Obchooseside  = Chooseside(0,0)
self.cptRounds     = 0
end

--Methods
---Getters - Setters 
function Mix:getId()
    return self.Id
end

---Getters - Setters 
function Mix:getState()
    return self.State
end

---Getters - Setters 
function Mix:getRegistPlayers()
    return self.RegistPlayers
end

---Getters - Setters 
function Mix:getNumberRegist()
    return self:getRegistPlayers():Size()
end

---addRegistPlayer
--add a player to the registrated list 
--@param Player add a player to the registrated list 
function Mix:addRegistPlayer(Player)
    self:getRegistPlayers():Add(Player)
end

---existPlayerRegist
-- check if the player is in the registrated list
--@param Player check if the player is in the registrated list 
function Mix:existPlayerRegist(Player)
    local bool = false
    for i=1, self:getNumberRegist() do
        if (Player:getUSGN() == self:getRegistPlayers():Get(i):getUSGN()) then
            bool = true
            if bool then
                return bool
            end 
        end
    end
    return bool
end

---getPlayerRegist
--get the player in the registrated list 
--@param Player get the player in the registrated list 
function Mix:getPlayerRegist(Player)
    if self:existPlayerRegist(Player) then
        for i=1, self:getNumberRegist() do
            if (Player:getUSGN() == self:getRegistPlayers():Get(i):getUSGN()) then
                return self:getRegistPlayers():Get(i)
            end
        end
    else
        return nil
    end 
end

---checkStartMix
--check if the mix can be started
function Mix:checkStartMix()
    if (tonumber(self:getNomberPlayers()) == tonumber(self:getNumberRegist())) then
        self:start()
    end 
end

---removeRegistPlayer
--remove the player in the registrated list 
--@param Player remove the player in the registrated list 
function Mix:removeRegistPlayer(Player)
    self:getRegistPlayers():Remove(Player)
end

---Getters - Setters   
function Mix:getObjectKniferound()
    return self.ObKniferound
end

---Getters - Setters 
function Mix:getObjectChooseside()
    return self.Obchooseside
end

---Getters - Setters 
function Mix:setState(state)
     self.State = state 
end

---Getters - Setters 
function Mix:getcptRounds()
    return self.cptRounds
end

---Getters - Setters 
function Mix:setcptRounds(cptRounds)
    self.cptRounds = cptRounds
end

---Getters - Setters 
function Mix:getRounds()
    return self.Rounds
end

---Getters - Setters 
function Mix:getNomberPlayers()
    return self.NomberPlayers
end

---Getters - Setters 
function Mix:getMap()
    return self.Map
end

---Getters - Setters 
function Mix:getFire()
    return self.Fire
end

---Getters - Setters 
function Mix:getSniper()
    return self.Sniper
end
---Getters - Setters 
function Mix:getKnifeRound()
    return self.KnifeRound
end

---Getters - Setters 
function Mix:getTeams()
    return self.Teams
end 

---Getters - Setters 
function Mix:addTeam(Team)
    self:getTeams():Add(Team)
end

---Getters - Setters  
function Mix:NumbersTeams()
    return self:getTeams():Size()
end

---SwitchTeams 
--switch teams
function Mix:SwitchTeams()
    parse("restart")
    removeRoundPlayed()
         local Teamtmp = Team("tmp");
        --temp Team get Teamct players
        for i=1,self:getTeams():Get(1):NumbersPlayers() do
            Teamtmp:addPlayer(self:getTeams():Get(1):getPlayers():Get(i))
        end
       
        --clear Teamct 
        self:getTeams():Get(1):ClearTeam()

        --All Teamtt players goes to Teamct
        for i=1,self:getTeams():Get(2):NumbersPlayers() do
            self:getTeams():Get(1):addPlayer(self:getTeams():Get(2):getPlayers():Get(i))
        end
        --Clear Teamtt
        self:getTeams():Get(2):ClearTeam()
        --Temp_Team(ct) goes to Teamtt
        for i=1,Teamtmp:NumbersPlayers() do
            self:getTeams():Get(2):addPlayer(Teamtmp:getPlayers():Get(i))
        end
        
        --in game switch 
       for i=1,self:getTeams():Get(1):NumbersPlayers() do
            parse("maket "..self:getTeams():Get(1):getPlayers():Get(i):getId())
       end
        --in game switch
       for i=1,self:getTeams():Get(2):NumbersPlayers() do
            parse("makect "..self:getTeams():Get(2):getPlayers():Get(i):getId())
       end
   
end

---getRoundsRemain
--calculate the number of round remained before setting an other state to the mix
-- note : mix should have started
function Mix:getRoundsRemain()
    if (self:getState() == "kniferound") then
        return 0
    elseif (self:getState() == "chooseside") then
        return 0
    elseif (self:getState() == "side1") then
        return self:getRounds()/2 - self:getcptRounds()
    elseif (self:getState() == "side2") then
        return self:getRounds()/2 - self:getcptRounds()
    end 
end

---start
--start the mix; change in game settings
function Mix:start()

    if(map("name") ~= self:getMap()) then
        self:setState("mapchanged") 
        parse("map "..self:getMap())
    else 
        parse("restart 5")
        --new team
        local Teamtt = Team("t");
        local Teamct = Team("ct");
        self:addTeam(Teamtt)
        self:addTeam(Teamct)
      

        self:makeTeams(Teamtt,Teamct)
        Teamtt:putinTeam()
        Teamct:putinTeam()

    	if(self:getKnifeRound()) then
            self:setState("kniferound")
        else 
            self:setState("side1")
            msg("\169100255100SIDE 1@C")
            parse("mp_freezetime 7")
            parse("mp_startmoney 800")
            parse("mp_roundtime 2")
          
    	end
    end
end

---showString
--still used to concat all the info of a mix into a string
--note : should be devaluated to the GUI
function Mix:showString()
    local string = tostring(self:getId()).." "..tostring(self:getRounds()).." "..tostring(self:getNomberPlayers()).." "..tostring(self:getMap()).." "..tostring(self:getKnifeRound()).." "..tostring(self:getFire()).." "..tostring(self:getSniper())
    return string 
end 
function Mix:__tostring()
    return "I am a Mix"
end

---makeTeams
--makes team regarding the ranks of registrated players
function Mix:makeTeams(Teamtt,Teamct)
    local totalRank = 0
    local moyRank = 0
    local max = 0
    local choosedPlayers = ArrayList.Create()
    for i=1, self:getNomberPlayers() do
        choosedPlayers:Add(self:getRegistPlayers():Get(i))
        totalRank      = totalRank + self:getRegistPlayers():Get(i):getRank()[self:getNomberPlayers()/2]
    end
    if totalRank > 0 then 
        moyRankct = math.floor(totalRank/2) 
        moyRanktt = math.floor(totalRank/2)
    else
        moyRankct = 0
        moyRanktt = 0
    end 
    for i=1, self:getNomberPlayers() do 
            if(Teamtt:NumbersPlayers() < Teamct:NumbersPlayers() and moyRanktt >= moyRankct)then
                local rank
                local row
                rank, row = self:getMaxRank(choosedPlayers)
                Teamtt:addPlayer(choosedPlayers:Get(row))
                moyRanktt = moyRanktt-rank

                choosedPlayers:Remove(row,true)--delete the max
            else
                local rank
                local row
                rank, row = self:getMaxRank(choosedPlayers)
                Teamct:addPlayer(choosedPlayers:Get(row))
                moyRankct = moyRankct-rank

                choosedPlayers:Remove(row,true)--delete the max 
            end
    end
end

---getMaxRank
--get the max rank from this list
--@param choosedPlayers list of choosed played from the registrated player list
function Mix:getMaxRank(choosedPlayers)
    -- body
    local rankMax = 0
    local rowMax  = 1
    for i = 1, choosedPlayers:Size() do
        if choosedPlayers:Get(i):getRank()[self:getNomberPlayers()/2] > rankMax  then
            rankMax = choosedPlayers:Get(i):getRank()[self:getNomberPlayers()/2]
            rowMax  = i
        end 
      
    end
    return rankMax, rowMax
end

---playerLeave
--remove a player from the current mix when he leave the server
--@param id id of the player
function Mix:playerLeave(id)
    local i = 1
    while i <= self:getNumberRegist() do
        if (id == self:getRegistPlayers():Get(i):getId()) then
            self:removeRegistPlayer(self:getRegistPlayers():Get(i))
            i=i-1
        end
        i=i+1
    end
    return self:testEmply()
end

---testEmply
--remove a mix if this mix got no player
function Mix:testEmply()
    if(self:getNumberRegist() == 0) then
        aMixList:removeMix(self)
        return true
    else 
        return false
    end

end 