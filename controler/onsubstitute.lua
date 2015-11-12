
function onSubstitute(id)
    local team = setspec(id)
end

function setspec(id)
    for k=1, aMixList:NumbersMixs() do
        if(aMixList:getMixList():Get(k):getState() ~= "preparation") then
    		for i=1, aMixList:getMixList():Get(k):getTeams():Get(1):NumbersPlayers() do
       			if id == aMixList:getMixList():Get(k):getTeams():Get(1):getPlayers():Get(i):getId() then
                    parse("makespec "..id)
       				aMixList:getMixList():Get(k):getTeams():Get(1):removePlayer(aMixList:getMixList():Get(k):getTeams():Get(1):getPlayers():Get(i))
       			    return aMixList:getMixList():Get(k):getTeams():Get(1)
                end 
            end
    		for i=1, aMixList:getMixList():Get(k):getTeams():Get(2):NumbersPlayers() do
       			if id == aMixList:getMixList():Get(k):getTeams():Get(2):getPlayers():Get(i):getId() then
                    parse("makespec "..id)
       				aPlayerList:getPlayerList():Get(k):getTeam():removePlayer(aPlayerList:getPlayerList():Get(i))
       				return aMixList:getMixList():Get(k):getTeams():Get(2)
       			end
            end
        end
    end 
end