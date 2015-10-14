
addhook("hit","onHit");
function onHit(id,source,weapon,hpdmg)
	for i=1,aPlayerList:NumbersPlayers() do

		if aPlayerList:getPlayerList():Get(i):getId() == source then
			aPlayerList:getPlayerList():Get(i):setDomage(aPlayerList:getPlayerList():Get(i):getDomage()+hpdmg)
		end 

	end
end 

