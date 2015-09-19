dofile("sys/lua/pcs_mixmatch/Model/mixList.lua")
dofile("sys/lua/pcs_mixmatch/Model/mix.lua")
addhook("startround", "onStartround")
function onStartround(mode)

   local aMixList = MixList(0);
	for i=1,aMixList:NumbersMixs() do
		    if (aMixList:getMixList():Get(i):getState() == "chooseside") then
		    		aMixList:getMixList():Get(i):getObjectChooseside():start(mode)
		    end
			if (aMixList:getMixList():Get(i):getState() == "side1") then
					if(aMixList:getMixList():Get(i):getRoundsRemain() == 0)then
						 aMixList:getMixList():Get(i):setState("side2")
						 aMixList:getMixList():Get(i):setcptRounds(0)
						 aMixList:getMixList():Get(i):SwitchTeams()

					end 
			end
			--parse("msg state "..aMixList:getMixList():Get(i):getState())
			--parse("msg cptrounds "..aMixList:getMixList():Get(i):getcptRounds())
			--parse("msg remain "..aMixList:getMixList():Get(i):getRoundsRemain())

			if (aMixList:getMixList():Get(i):getState() == "side2") then
					if(aMixList:getMixList():Get(i):getRoundsRemain() == 0)then
						 parse("msg gg well played")
					end 
			end 
	end
end