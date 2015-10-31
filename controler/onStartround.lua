-- dofile("sys/lua/pcs_mixmatch/Model/mixList.lua")
-- dofile("sys/lua/pcs_mixmatch/Model/mix.lua")
addhook("startround", "onStartround")
function onStartround(mode)

	for i=1,aPlayerList:NumbersPlayers() do
		aPlayerList:getPlayerList():Get(i):setDomage(0)
	end
   
	for i=1,aMixList:NumbersMixs() do
		  	if (aMixList:getMixList():Get(i):getState() == "kniferound") then
		    		aMixList:getMixList():Get(i):getObjectKniferound():start();
		    --end
		 
		    elseif (aMixList:getMixList():Get(i):getState() == "chooseside") then
		    		aMixList:getMixList():Get(i):getObjectChooseside():start(mode)
		    --end
			elseif (aMixList:getMixList():Get(i):getState() == "side1") then
					
					if(aMixList:getMixList():Get(i):getRoundsRemain() == 0)then
						 aMixList:getMixList():Get(i):setState("side2")
						 msg("\169100255100SIDE 2@C")
						 aMixList:getMixList():Get(i):setcptRounds(0)
						 aMixList:getMixList():Get(i):SwitchTeams()
					end 
			--end

			elseif (aMixList:getMixList():Get(i):getState() == "side2") then
					if(aMixList:getMixList():Get(i):getRoundsRemain() == 0)then
						msg("\169100255100END@C")
						for i=1,aPlayerList:NumbersPlayers() do
							aPlayerList:getPlayerList():Get(i):setTotalDomage(0)
						end

						for j=1,aPlayerList:NumbersPlayers() do
							local playert=player(0,"team1")
							for _,id in pairs(playert) do
					   			if id == aPlayerList:getPlayerList():Get(j):getId() then
					   				aPlayerList:getPlayerList():Get(j):setRank(aMixList:getMixList():Get(i):getNomberPlayers()/2,aPlayerList:getPlayerList():Get(j):rankCalculation())
					   				table.save(aPlayerList:getPlayerList():Get(j):getRank(),"sys/lua/pcs_mixmatch/rank/"..aPlayerList:getPlayerList():Get(j):getUSGN())
					   			end 
							end
							local playerct=player(0,"team2")
							for _,id in pairs(playerct) do
					   			if id == aPlayerList:getPlayerList():Get(j):getId() then
					   				msg(aPlayerList:getPlayerList():Get(j):rankCalculation())
					   				msg(aMixList:getMixList():Get(i):getNomberPlayers()/2)
					   				aPlayerList:getPlayerList():Get(j):setRank(aMixList:getMixList():Get(i):getNomberPlayers()/2,aPlayerList:getPlayerList():Get(j):rankCalculation())
					   				table.save(aPlayerList:getPlayerList():Get(j):getRank(),"sys/lua/pcs_mixmatch/rank/"..aPlayerList:getPlayerList():Get(j):getUSGN())
					   			end 
							end  
						end

						
					end 
			end 
	end
end