addhook("spawn", "onSpawn")
function onSpawn(id)
--	local aMixList = MixList(0);
	for i=1,aMixList:NumbersMixs() do
			if (aMixList:getMixList():Get(i):getState() == "kniferound" or aMixList:getMixList():Get(i):getState() == "chooseside") then
				parse("strip "..id.." 1")
				parse("strip "..id.." 2")
			end 
	end
end