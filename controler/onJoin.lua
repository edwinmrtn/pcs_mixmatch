dofile("sys/lua/pcs_mixmatch/model/player.lua")
dofile("sys/lua/pcs_mixmatch/model/playerList.lua")
addhook("join","onJoin");

function onJoin(id)
--new playerList
--local aPlayerList = PlayerList(0);
--new player 
local Player = Player(id,player(id,"usgn"),math.random(1,100),player(id,"name"),'127.0.0.1');
--add all players
aPlayerList:addplayer(Player)
end 

