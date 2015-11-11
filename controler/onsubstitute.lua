
function onSubstitute(id)
	setspec(id)
	local team = searchTeam() -- TODO
end

function setspec(id)
	for i=1,aPlayerList:NumbersPlayers() do
		local playert=player(0,"team1")
		for _,id in pairs(playert) do
   			if id == aPlayerList:getPlayerList():Get(i):getId() then
   				parse("makespec "..id)
   				aPlayerList:getPlayerList():Get(i).getTeam().removePlayer(aPlayerList:getPlayerList():Get(i))
   				return
   			end 
		end
		local playerct=player(0,"team2")
		for _,id in pairs(playerct) do
   			if id == aPlayerList:getPlayerList():Get(i):getId() then
   				parse("makespec "..id)
   				aPlayerList:getPlayerList():Get(i).getTeam().removePlayer(aPlayerList:getPlayerList():Get(i))
   				return
   			end 
		end  
	end
end

function searchTeam()
	for i = 1, MixList:NumbersMixs() do
		if(MixList:get(i):getState() == "preparation") then
			for j = 1, 2 do
				local playerPerTeam = math.floor(MixList:get(i):getTeams():get(j):getNomberPlayers() / 2)
				if(MixList:get(i):getTeams():get(j):NumbersPlayers() < playerPerTeam) then
					return MixList:get(i):getTeams():get(j)
				end
			end
		end
	end
end