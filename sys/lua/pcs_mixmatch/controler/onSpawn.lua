dofile("sys/lua/pcs_mixmatch/Model/mixList.lua")
addhook("spawn", "onSpawn")
function onSpawn(id)
	local aMixList = MixList(0);
	for i=1,aMixList:NumbersMixs() do
			if (aMixList:getMixList():Get(i):getState() == "kniferound") then
				parse("strip "..id.." 1")
				parse("strip "..id.." 2")
			end 
	end
end