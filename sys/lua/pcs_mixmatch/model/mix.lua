dofile("sys/lua/pcs_mixmatch/model/object.lua")
dofile("sys/lua/pcs_mixmatch/model/kniferound.lua")
dofile("sys/lua/pcs_mixmatch/model/arrayList.lua")

--Public class Mix
Mix = newclass("Mix")

--Attributs
Mix.Id            = ''
Mix.Rounds        = ''
Mix.NomberPlayers = ''
Mix.Map           = ''
Mix.TillEnd       = false
Mix.KnifeRound    = true
Mix.Teams         = ArrayList.Create()

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
    return Mix.Id
end

function Mix:getRounds()
    return Mix.Rank
end

function Mix:getNomberPlayers()
    return Mix.NomberPlayers
end

function Mix:getMap()
    return Mix.Map
end

function Mix:getTillEnd()
    return Mix.TillEnd
end
function Mix:getKnifeRound()
    return Mix.KnifeRound
end
function Mix:getTeams()
    return Mix.Teams
end 
function Mix:addTeam(Team)
    Mix.getTeams():Add(Team)
end 
function Mix:start()
	if(Mix:getKnifeRound()) then
		--new knifeRound
		--msgKniferound:startStatic(Mix:getTeams())
	end
end
function Mix:__tostring()
    return "I am a Mix"
end
