dofile("sys/lua/pcs_mixmatch/model/object.lua")
dofile("sys/lua/pcs_mixmatch/model/kniferound.lua")
dofile("sys/lua/pcs_mixmatch/model/arrayList.lua")
dofile("sys/lua/pcs_mixmatch/model/team.lua")




--Public class Mix
Mix = newclass("Mix")

--Constructors
function Mix:init(Id,Rounds,NomberPlayers,Map,TillEnd,KnifeRound)
self.Id            = Id
self.Rounds        = Rounds
self.NomberPlayers = NomberPlayers
self.Map           = Map
self.TillEnd       = TillEnd
self.KnifeRound    = KnifeRound
self.State         = "preparation"
self.Teams         = ArrayList.Create()
self.ObKniferound  = Kniferound("Kniferound");
self.Obchooseside  = Chooseside(0,0)
self.cptRounds     = 0
end

--Methods

function Mix:getId()
    return self.Id
end
function Mix:getState()
    return self.State
end
function Mix:getObjectKniferound()
    return self.ObKniferound
end
function Mix:getObjectChooseside()
    return self.Obchooseside
end
function Mix:setState(state)
     self.State = state 
end
function Mix:getcptRounds()
    return self.cptRounds
end
function Mix:setcptRounds(cptRounds)
    self.cptRounds = cptRounds
end
function Mix:getRounds()
    return self.Rounds
end

function Mix:getNomberPlayers()
    return self.NomberPlayers
end

function Mix:getMap()
    return self.Map
end

function Mix:getTillEnd()
    return self.TillEnd
end
function Mix:getKnifeRound()
    return self.KnifeRound
end
function Mix:getTeams()
    return self.Teams
end 
function Mix:addTeam(Team)
    self:getTeams():Add(Team)
end 
function Mix:NumbersTeams()
    return self:getTeams():Size()
end
function Mix:SwitchTeams()
         local Teamtmp = Team("tmp");
        --temp Team get Teamct players
        for i=1,self:getTeams():Get(1):NumbersPlayers() do
            Teamtmp:addPlayer(self:getTeams():Get(1):getPlayers():Get(i))
        end
       
        --in game switch 
       for i=1,self:getTeams():Get(1):NumbersPlayers() do
            parse("maket "..self:getTeams():Get(1):getPlayers():Get(i):getId())
       end
        --in game switch
       for i=1,self:getTeams():Get(2):NumbersPlayers() do
            parse("makect "..self:getTeams():Get(2):getPlayers():Get(i):getId())
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
   
end

function Mix:getRoundsRemain()
    if (self:getState() == "kniferound") then 
        return 0
    elseif (self:getState() == "side1") then
        return self:getRounds()/2 - self.cptRounds
    elseif (self:getState() == "side2") then
        return self:getRounds()/2 - self.cptRounds
    end 
end
function Mix:start()
    parse("restart")
	if(self:getKnifeRound()) then
		--new knifeRound
        self:setState("kniferound")
        self:getObjectKniferound():start();
	end
end
function Mix:showString()
    local string = tostring(self:getId()).." "..tostring(self:getRounds()).." "..tostring(self:getNomberPlayers()).." "..tostring(self:getMap()).." "..tostring(self:getTillEnd()).." "..tostring(self:getKnifeRound())
    return string 
end 
function Mix:__tostring()
    return "I am a Mix"
end
