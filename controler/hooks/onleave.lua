--------
--Executed script on every leave
--@module hooks.onLeave
--
--


addhook("leave","onLeave");

---onLeave
--delete all the session a player have on the server
--
--the player is deleted from all mixes he is registered
--@param id id of the player joinned
function onLeave(id)
	local i = 1
	while i <= aPlayerList:NumbersPlayers() do
		if id == aPlayerList:getPlayerList():Get(i):getId() then
			local j = 1
			while j <= aMixList:NumbersMixs() do
				if (aMixList:getMixList():Get(j):getState() ~= "preparation") then
					aPlayerList:getPlayerList():Get(i):setRank(aMixList:getMixList():Get(j):getNomberPlayers()/2,aPlayerList:getPlayerList():Get(i):rankCalculation(aMixList:getMixList():Get(j):getNomberPlayers()))
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
	i = i + 1					   		
	end
end 

