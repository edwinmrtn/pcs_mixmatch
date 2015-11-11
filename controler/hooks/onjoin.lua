--------
--Executed script on every join
--@module hooks.onJoin
--
--



addhook("join","onJoin");

---onJoin
--load the player rank
--add the player to the playerlist
--
--@param id id of the player joinned
function onJoin(id)
local rank = {0,0,0,0,0}
if file_exists("sys/lua/pcs_mixmatch/rank/"..player(id,"usgn")) then
	rank = table.load("sys/lua/pcs_mixmatch/rank/"..player(id,"usgn"))
end 
local Player = Player(id,player(id,"usgn"),rank,player(id,"name"),'127.0.0.1');
msg("Added Player : "..Player:getName())
--add all players
aPlayerList:addplayer(Player)




end 




