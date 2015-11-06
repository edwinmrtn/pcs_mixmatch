
addhook("join","onJoin");

function onJoin(id)
--new playerList
--local aPlayerList = PlayerList(0);
local rank = {0,0,0,0,0}
if file_exists("sys/lua/pcs_mixmatch/rank/"..player(id,"usgn")) then
	rank = table.load("sys/lua/pcs_mixmatch/rank/"..player(id,"usgn"))
end 
--new player 
local Player = Player(id,player(id,"usgn"),rank,player(id,"name"),'127.0.0.1');
msg("Added Player : "..Player:getName())
--add all players
aPlayerList:addplayer(Player)
end 




