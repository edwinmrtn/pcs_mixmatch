addhook("leave","onLeave");

function onLeave(id)
	for i=1,aPlayerList:NumbersPlayers() do
		if id == aPlayerList:getPlayerList():Get(i):getId() then
			for i=1,aMixList:NumbersMixs() do
				if (aMixList:getMixList():Get(i):getState() ~= "preparation") then
					aPlayerList:getPlayerList():Get(i):setRank(aMixList:getMixList():Get(i):getNomberPlayers()/2,aPlayerList:getPlayerList():Get(i):rankCalculation())
					table.save(aPlayerList:getPlayerList():Get(i):getRank(),"sys/lua/pcs_mixmatch/rank/"..aPlayerList:getPlayerList():Get(i):getUSGN())
				end 
			end 
		end					   		
	end
end 

