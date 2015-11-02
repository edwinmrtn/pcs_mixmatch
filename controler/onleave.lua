addhook("leave","onLeave");

function onLeave(id)
	for i=1,aPlayerList:NumbersPlayers() do
		if id == aPlayerList:getPlayerList():Get(i):getId() then
			local j = 1
			while j <= aMixList:NumbersMixs() do
				if (aMixList:getMixList():Get(j):getState() ~= "preparation") then
					aPlayerList:getPlayerList():Get(i):setRank(aMixList:getMixList():Get(j):getNomberPlayers()/2,aPlayerList:getPlayerList():Get(i):rankCalculation())
					table.save(aPlayerList:getPlayerList():Get(i):getRank(),"sys/lua/pcs_mixmatch/rank/"..aPlayerList:getPlayerList():Get(i):getUSGN())
				end
				local deletedmix= aMixList:getMixList():Get(j):playerLeave(id)
				if (deletedmix) then
				
					j = j - 1
				
				end
				j = j + 1
			end
			aPlayerList:removePlayer(aPlayerList:getPlayerList():Get(i)) 
		end					   		
	end
end 

