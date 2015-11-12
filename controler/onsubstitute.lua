
function onSubstitute(id)
    local team = setspec(id)
    for k=1, aMixList:NumbersMixs() do
        if(aMixList:getMixList():Get(k):getState() ~= "preparation") then
            compareList(aMixList:getMixList():Get(k):getRegistPlayers(), listchoosed())
         end 
    end

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

function compareList(liste1, liste2)
  for i = 1, liste1:Size() do
    local found = false
    for j = 1, liste2:Size() do
      if(liste1:Get(i):getId() == liste2:Get(j):getId()) then
        found = true
        break
      end
    end
    if(found ~= true) then
      liste2:Add(liste1:Get(i))
    end
  end
end

function listchoosed()
    for k=1, aMixList:NumbersMixs() do
        if(aMixList:getMixList():Get(k):getState() ~= "preparation") then
            local list = aMixList:getMixList():Get(k):getTeams():Get(2)
            for i=1, aMixList:getMixList():Get(k):getTeams():Get(1):NumbersPlayers() do
                 list:Add(aMixList:getMixList():Get(k):getTeams():Get(1):getPlayers():Get(i))
            end
            return list
        end 
    end 
end