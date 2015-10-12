-- dofile("sys/lua/pcs_mixmatch/model/player.lua")
-- dofile("sys/lua/pcs_mixmatch/model/team.lua")
-- dofile("sys/lua/pcs_mixmatch/model/mix.lua")
-- dofile("sys/lua/pcs_mixmatch/model/mixList.lua")
-- dofile("sys/lua/pcs_mixmatch/model/playerList.lua")
-- dofile("sys/lua/pcs_mixmatch/model/arrayList.lua")
function onStartMixBouton(id)

--new team
local Teamtt = Team("t");
local Teamct = Team("ct");

Teamct:addPlayer(Player1)

--new mix
local aMix = Mix(0,2,4,"de_dust",false,true);

--new mixList
local aMixList = MixList(0);
aMixList:addMix(aMix);


aMix:addTeam(Teamct)
aMix:addTeam(Teamtt)
aMix:start()


end

function onSwitchTeam(id)
	local aMixList = MixList(0);
	for i=1,aMixList:NumbersMixs() do
		aMixList:getMixList():Get(i):SwitchTeams()
	end
end 
function onTestLoad(id)
	local aMixList = MixList(0);
	aMixList:loadData()
end