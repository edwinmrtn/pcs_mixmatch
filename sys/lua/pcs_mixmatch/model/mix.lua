local o = dofile("sys/lua/pcs_mixmatch/model/ObjectModel.lua")
dofile("sys/lua/pcs_mixmatch/model/Kniferound.lua")

--Public class Mix
Mix = o.class()

--Attributs
Mix.Id            = ''
Mix.Rounds        = ''
Mix.NomberPlayers = ''
Mix.Map           = ''
Mix.TillEnd       = false
Mix.KnifeRound    = true

--Constructors
function Mix:constructor(Id,Rounds,NomberPlayers,Map,TillEnd,KnifeRound)
Mix.Id            = Id
Mix.Rounds        = Rounds
Mix.NomberPlayers = NomberPlayers
Mix.Map           = Map
Mix.TillEnd       = TillEnd
Mix.KnifeRound    = KnifeRound
end

function Mix:constructor(Id)
Mix.Id            = Id
Mix.Rounds        = ''
Mix.NomberPlayers = ''
Mix.Map           = ''
Mix.TillEnd       = false
Mix.KnifeRound    = true
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
function Mix:start()
	if(Mix:getKnifeRound()) then
		--new knifeRound
		Kniferound:startStatic()
	end
end
