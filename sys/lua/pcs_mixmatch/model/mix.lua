dofile("sys/lua/pcs_mixmatch/model/object.lua")
dofile("sys/lua/pcs_mixmatch/model/kniferound.lua")
dofile("sys/lua/pcs_mixmatch/model/arrayList.lua")

--Public class Mix
Mix = newclass("Mix")


--Constructors
function Mix:init(Id,Rounds,NomberPlayers,Map,TillEnd,KnifeRound,Teams)
self.Id            = Id
self.Rounds        = Rounds
self.NomberPlayers = NomberPlayers
self.Map           = Map
self.TillEnd       = TillEnd
self.KnifeRound    = KnifeRound
self.Teams         = Teams
end
function Mix:init(Id,Rounds,NomberPlayers,Map,TillEnd,KnifeRound)
self.Id            = Id
self.Rounds        = Rounds
self.NomberPlayers = NomberPlayers
self.Map           = Map
self.TillEnd       = TillEnd
self.KnifeRound    = KnifeRound
self.Teams         = ArrayList.Create()
end

function Mix:init(Id)
self.Id            = Id
self.Rounds        = ''
self.NomberPlayers = ''
self.Map           = ''
self.TillEnd       = false
self.KnifeRound    = true
self.Teams         = ArrayList.Create()
end


--Methods
function Mix:getId()
    return self.Id
end

function Mix:getRounds()
    return self.Rank
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
function Mix:start()
	if(self:getKnifeRound()) then
		--new knifeRound
		--msgKniferound:startStatic(Mix:getTeams())
	end
end
function Mix:__tostring()
    return "I am a Mix"
end
