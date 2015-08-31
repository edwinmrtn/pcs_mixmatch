dofile("sys/lua/pcs_mixmatch/model/player.lua")
dofile("sys/lua/pcs_mixmatch/model/team.lua")
dofile("sys/lua/pcs_mixmatch/model/mix.lua")
dofile("sys/lua/pcs_mixmatch/model/arrayList.lua")
addhook("join","onJoin");

function onJoin(id)

--new player 
local Player1 = Player(player(id,"usgn"),12);
local Player2 = Player(player(id,"usgn"),25);

parse("msg "..Player1:getRank());
parse("msg "..Player2:getRank());


--new team

local Teamtt = Team("tt");
local Teamct = Team("ct");

parse("msg "..Teamtt:getName());
parse("msg "..Teamct:getName());

parse("msg "..tostring(Teamct:getPlayers()));
parse("msg "..tostring(Teamtt:getPlayers()));



parse("msg "..tostring(Teamct))

Teamct:addPlayer(Player1)
Teamtt:addPlayer(Player2)

--new mix
local aMix = Mix(0,2,4,de_dust,false,true);
aMix:addTeam(Teamct)
aMix:addTeam(Teamtt)
aMix:start()


end 

