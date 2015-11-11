--------
--Executed script everytime a player spawn
--@module hooks.onSpawn
--
--

addhook("spawn", "onSpawn")

---onSpawn
--check if it's the kniferound time and strip glock or usp
--@param id of the player
function onSpawn(id)
--	local aMixList = MixList(0);
	for i=1,aMixList:NumbersMixs() do
			if (aMixList:getMixList():Get(i):getState() == "kniferound" or aMixList:getMixList():Get(i):getState() == "chooseside") then
				parse("strip "..id.." 1")
				parse("strip "..id.." 2")
			end 
	end
end