-- dofile("sys/lua/pcs_mixmatch/Model/mixList.lua")
-- dofile("sys/lua/pcs_mixmatch/Model/mix.lua")
addhook("startround", "onStartround")
function onStartround(mode)
--   local aPlayerList = PlayerList(0);
	for i=1,aPlayerList:NumbersPlayers() do
		aPlayerList:getPlayerList():Get(i):setDomage(0)
	end



	-- for i=1,aPlayerList:NumbersPlayers() do
	-- 						local playert=player(0,"team1")
	-- 						for _,id in pairs(playert) do
	-- 				   			if id == aPlayerList:getPlayerList():Get(i):getId() then
	-- 				   				msg(aPlayerList:getPlayerList():Get(i):rankCalculation())
	-- 				   				aPlayerList:getPlayerList():Get(i):setRank(2,aPlayerList:getPlayerList():Get(i):rankCalculation())
	-- 				   				table.save(aPlayerList:getPlayerList():Get(i):getRank(),"sys/lua/pcs_mixmatch/rank/"..aPlayerList:getPlayerList():Get(i):getUSGN())
	-- 				   			end 
	-- 						end
	-- 						local playerct=player(0,"team2")
	-- 						for _,id in pairs(playerct) do
	-- 				   			if id == aPlayerList:getPlayerList():Get(i):getId() then
	-- 				   				aPlayerList:getPlayerList():Get(i):setRank(aMixList:getMixList():Get(i):getNomberPlayers()/2,aPlayerList:getPlayerList():Get(i):rankCalculation())
	-- 				   				table.save(aPlayerList:getPlayerList():Get(i):getRank(),"sys/lua/pcs_mixmatch/rank/"..aPlayerList:getPlayerList():Get(i):getUSGN())
	-- 				   			end 
	-- 						end  
	-- end
   
	for i=1,aMixList:NumbersMixs() do
		    if (aMixList:getMixList():Get(i):getState() == "chooseside") then
		    		aMixList:getMixList():Get(i):getObjectChooseside():start(mode)
		    end
			if (aMixList:getMixList():Get(i):getState() == "side1") then
					msg("\169100255100SIDE 1@C")
					if(aMixList:getMixList():Get(i):getRoundsRemain() == 0)then
						 aMixList:getMixList():Get(i):setState("side2")
						 msg("\169100255100SIDE 2@C")
						 aMixList:getMixList():Get(i):setcptRounds(0)
						 aMixList:getMixList():Get(i):SwitchTeams()
					end 
			end

			if (aMixList:getMixList():Get(i):getState() == "side2") then
					if(aMixList:getMixList():Get(i):getRoundsRemain() == 0)then
						msg("\169100255100END@C")
						for i=1,aPlayerList:NumbersPlayers() do
							aPlayerList:getPlayerList():Get(i):setTotalDomage(0)
						end

						for i=1,aPlayerList:NumbersPlayers() do
							local playert=player(0,"team1")
							for _,id in pairs(playert) do
					   			if id == aPlayerList:getPlayerList():Get(i):getId() then
					   				aPlayerList:getPlayerList():Get(i):setRank(aMixList:getMixList():Get(i):getNomberPlayers()/2,aPlayerList:getPlayerList():Get(i):rankCalculation())
					   				table.save(aPlayerList:getPlayerList():Get(i):getRank(),"sys/lua/pcs_mixmatch/rank/"..aPlayerList:getPlayerList():Get(i):getUSGN())
					   			end 
							end
							local playerct=player(0,"team2")
							for _,id in pairs(playerct) do
					   			if id == aPlayerList:getPlayerList():Get(i):getId() then
					   				aPlayerList:getPlayerList():Get(i):setRank(aMixList:getMixList():Get(i):getNomberPlayers()/2,aPlayerList:getPlayerList():Get(i):rankCalculation())
					   				table.save(aPlayerList:getPlayerList():Get(i):getRank(),"sys/lua/pcs_mixmatch/rank/"..aPlayerList:getPlayerList():Get(i):getUSGN())
					   			end 
							end  
						end

						
					end 
			end 
	end
end