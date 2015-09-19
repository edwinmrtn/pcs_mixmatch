dofile("sys/lua/pcs_mixmatch/model/player.lua")
dofile("sys/lua/pcs_mixmatch/model/team.lua")
dofile("sys/lua/pcs_mixmatch/model/mix.lua")
dofile("sys/lua/pcs_mixmatch/model/mixList.lua")
dofile("sys/lua/pcs_mixmatch/model/arrayList.lua")
function onStartMixBouton(id)

--new player 
local Player1 = Player(id,player(id,"usgn"),12,player(id,"name"),'127.0.0.1');
local Player2 = Player(id,player(id,"usgn"),25,player(id,"name"),'127.0.0.1');
local Player3 = Player(id,player(id,"usgn"),26,player(id,"name"),'127.0.0.1');


--new team

local Teamtt = Team("tt");
local Teamct = Team("ct");

parse("msg "..Teamtt:getName());
parse("msg "..Teamct:getName());



Teamct:addPlayer(Player1)
Teamtt:addPlayer(Player2)
Teamtt:addPlayer(Player3)

--parse("msg "..tostring(Teamct:getPlayers():Get(1):getRank()));
parse("msg "..tostring(Teamtt:getPlayers()));
parse("msg "..tostring(Teamct:getPlayers()));



--new mix
local aMix = Mix(0,2,4,de_dust,false,true);

--new mixList
local aMixList = MixList(0);
parse("msg 123"..tostring(aMixList:getMixList()));
aMixList:addMix(aMix);


aMix:addTeam(Teamct)
aMix:addTeam(Teamtt)
aMix:start()


end