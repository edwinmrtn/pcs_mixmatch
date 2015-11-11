--------
--Executed script on every hit 
--@module hooks.onHit
--
--


addhook("hit","onHit");
---onHit
--add the domage made by a player
--
--@param id id of the player hitted
--@param source id of the player who makes domages
--@param weapon name of the weapon 
--@param hpdmg nomber of hp lost
function onHit(id,source,weapon,hpdmg)
	for i=1,aPlayerList:NumbersPlayers() do

		if aPlayerList:getPlayerList():Get(i):getId() == source then
			aPlayerList:getPlayerList():Get(i):setDomage(aPlayerList:getPlayerList():Get(i):getDomage()+hpdmg)
		end 

	end
end 

