-- dofile("sys/lua/pcs_mixmatch/Model/mixList.lua")
-- dofile("sys/lua/pcs_mixmatch/Model/mix.lua")
addhook("startround", "onStartround")
function onStartround(mode)
	local j = 1
	while j <= aMixList:NumbersMixs() do
		if (aMixList:getMixList():Get(j):getState() ~= "preparation") then
			for i=1,aPlayerList:NumbersPlayers() do
				--msg("get round played  :" ..aPlayerList:getPlayerList():Get(i):getRoundsPlayed())
				msg("player : "..aPlayerList:getPlayerList():Get(i):getName().." rank calcul : "..aPlayerList:getPlayerList():Get(i):rankCalculation(aMixList:getMixList():Get(j):getNomberPlayers()))
				msg("__________________")
				aPlayerList:getPlayerList():Get(i):setDomage(0)
			end
		end
		j = j + 1
	end
   
	for i=1,aMixList:NumbersMixs() do

			msg("remiain: "..aMixList:getMixList():Get(i):getRoundsRemain())
		  	
		  	if (aMixList:getMixList():Get(i):getState() == "kniferound") then
		    		aMixList:getMixList():Get(i):getObjectKniferound():start();
		    --end
		 
		    elseif (aMixList:getMixList():Get(i):getState() == "chooseside") then
		    		aMixList:getMixList():Get(i):getObjectChooseside():start(mode)
		    --end
			elseif (aMixList:getMixList():Get(i):getState() == "side1") then
					if(aMixList:getMixList():Get(i):getRoundsRemain() == 0)then
				
						 aMixList:getMixList():Get(i):SwitchTeams()
						 aMixList:getMixList():Get(i):setcptRounds(0)
						 aMixList:getMixList():Get(i):setState("side2")
						 msg("\169100255100SIDE 2@C")
					end 
			--end

			elseif (aMixList:getMixList():Get(i):getState() == "side2") then
					if(aMixList:getMixList():Get(i):getRoundsRemain() == 0)then
						msg("\169100255100END@C")
						for j=1,aPlayerList:NumbersPlayers() do
							local playert=player(0,"team1")
							for _,id in pairs(playert) do
					   			if id == aPlayerList:getPlayerList():Get(j):getId() then
					   			msg("player : "..aPlayerList:getPlayerList():Get(i):getName().." rank calcul : "..aPlayerList:getPlayerList():Get(i):rankCalculation(aMixList:getMixList():Get(i):getNomberPlayers()))
								msg("__________________")
					   				aPlayerList:getPlayerList():Get(j):setRank(aMixList:getMixList():Get(i):getNomberPlayers()/2,aPlayerList:getPlayerList():Get(j):rankCalculation(aMixList:getMixList():Get(i):getNomberPlayers()))
					   				table.save(aPlayerList:getPlayerList():Get(j):getRank(),"sys/lua/pcs_mixmatch/rank/"..aPlayerList:getPlayerList():Get(j):getUSGN())
					   			end 
							end
							local playerct=player(0,"team2")
							for _,id in pairs(playerct) do
					   			if id == aPlayerList:getPlayerList():Get(j):getId() then
					   				msg("player : "..aPlayerList:getPlayerList():Get(i):getName().." rank calcul : "..aPlayerList:getPlayerList():Get(i):rankCalculation(aMixList:getMixList():Get(i):getNomberPlayers()))
									msg("__________________")
					   				aPlayerList:getPlayerList():Get(j):setRank(aMixList:getMixList():Get(i):getNomberPlayers()/2,aPlayerList:getPlayerList():Get(j):rankCalculation(aMixList:getMixList():Get(i):getNomberPlayers()))
					   				table.save(aPlayerList:getPlayerList():Get(j):getRank(),"sys/lua/pcs_mixmatch/rank/"..aPlayerList:getPlayerList():Get(j):getUSGN())
					   			end 
							end  
						end
						for i=1,aPlayerList:NumbersPlayers() do
							aPlayerList:getPlayerList():Get(i):setTotalDomage(0)
						end
						aMixList:removeMix(aMixList:getMixList():Get(i))
					end 
			end 
	end
end