dofile("sys/lua/pcs_mixmatch/model/player.lua")
dofile("sys/lua/pcs_mixmatch/model/team.lua")
dofile("sys/lua/pcs_mixmatch/model/mix.lua")
addhook("join","onJoin");

function onJoin(id)

--new player 
local aPlayer = Player(player(id,"usgn"));
parse("msg "..aPlayer:getUSGN())

--new team
local aTeam = Team("ct")
aTeam:addPlayer(aPlayer)
parse("msg "..tostring(aTeam:String()))

--new mix
local aMix = Mix(0,2,4,de_dust,false,true);
aMix:start()


end 

