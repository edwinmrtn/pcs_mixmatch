dofile("sys/lua/pcs_mixmatch/Model/mixList.lua")
addhook("endround", "onEndround")
function onEndround(mode)
   local aMixList = MixList(0);
	for i=1,aMixList:NumbersMixs() do
			if (aMixList:getMixList():Get(i):getState() == "kniferound") then
				if(mode == 1) then --terrorist win
					aMixList:getMixList():Get(i):setState("side1")
				elseif(mode == 2) then  --counter win
					aMixList:getMixList():Get(i):setState("side1")
				end 		
			
			elseif (aMixList:getMixList():Get(i):getState() == "side1") then
					aMixList:getMixList():Get(i):setcptRounds(aMixList:getMixList():Get(i):getcptRounds()+1)		
			
			elseif (aMixList:getMixList():Get(i):getState() == "side2") then
				aMixList:getMixList():Get(i):setcptRounds(aMixList:getMixList():Get(i):getcptRounds()+1)		

			end  
	end
end