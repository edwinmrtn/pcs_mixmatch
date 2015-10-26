
addhook("endround", "onEndround")
function addRoundPlayed()
	for i=1,aPlayerList:NumbersPlayers() do
		local playert=player(0,"team1")
		for _,id in pairs(playert) do
   			if id == aPlayerList:getPlayerList():Get(i):getId() then
   				aPlayerList:getPlayerList():Get(i):setRoundsPlayed(aPlayerList:getPlayerList():Get(i):getRoundsPlayed()+1)
   			end 
		end
		local playerct=player(0,"team2")
		for _,id in pairs(playerct) do
   			if id == aPlayerList:getPlayerList():Get(i):getId() then
   				aPlayerList:getPlayerList():Get(i):setRoundsPlayed(aPlayerList:getPlayerList():Get(i):getRoundsPlayed()+1)
   			end 
		end  
	end
end 
function onEndround(mode)
--   local aMixList = MixList(0);
	for i=1,aMixList:NumbersMixs() do
			if (aMixList:getMixList():Get(i):getState() == "kniferound") then
				if(mode == 1) then --terrorist win
					aMixList:getMixList():Get(i):setState("chooseside")
				elseif(mode == 2) then  --counter win
					aMixList:getMixList():Get(i):setState("chooseside")
				end 		
			elseif (aMixList:getMixList():Get(i):getState() == "chooseside") then
				aMixList:getMixList():Get(i):setState("side1")
			elseif (aMixList:getMixList():Get(i):getState() == "side1") then
					aMixList:getMixList():Get(i):setcptRounds(aMixList:getMixList():Get(i):getcptRounds()+1)		
					addRoundPlayed()
			elseif (aMixList:getMixList():Get(i):getState() == "side2") then
				aMixList:getMixList():Get(i):setcptRounds(aMixList:getMixList():Get(i):getcptRounds()+1)		
					addRoundPlayed()
			end  
	end
	
	if mode>=3 and mode<=5 then
	    for i=1,aPlayerList:NumbersPlayers() do 
	      	aPlayerList:getPlayerList():Get(i):setTotalDomage(0)
	    end
	end




	local max_domage = aPlayerList:getPlayerList():Get(1):getDomage()
	local max_player = aPlayerList:getPlayerList():Get(1):getName()
	for i=2,aPlayerList:NumbersPlayers() do
	    if aPlayerList:getPlayerList():Get(i):getDomage()>max_domage then
	        max_domage = aPlayerList:getPlayerList():Get(i):getDomage()
	        max_player = aPlayerList:getPlayerList():Get(i):getName()
	    end
	end
	if max_domage>0 then
	    msg("\169188319720[DAMAGE]:\169255255255 "..max_player.." is MVP "..max_domage.." HP")
    end
	for i=1,aPlayerList:NumbersPlayers() do
		local playert=player(0,"team1")
		for _,id in pairs(playert) do
   			if id == aPlayerList:getPlayerList():Get(i):getId() then
   				aPlayerList:getPlayerList():Get(i):setTotalDomage(aPlayerList:getPlayerList():Get(i):getTotalDomage()+aPlayerList:getPlayerList():Get(i):getDomage())
			    if aPlayerList:getPlayerList():Get(i):getTotalDomage()>0 then
			      msg2(aPlayerList:getPlayerList():Get(i):getId(),"\169188319720[DAMAGE]:\169255255255 in this round "..aPlayerList:getPlayerList():Get(i):getDomage().." HP")
			      msg2(aPlayerList:getPlayerList():Get(i):getId(),"\169188319720[DAMAGE]:\169255255255 in total "..aPlayerList:getPlayerList():Get(i):getTotalDomage().." HP")
			    end
   			end 
		end
		local playerct=player(0,"team2")
		for _,id in pairs(playerct) do
   			if id == aPlayerList:getPlayerList():Get(i):getId() then
   				aPlayerList:getPlayerList():Get(i):setTotalDomage(aPlayerList:getPlayerList():Get(i):getTotalDomage()+aPlayerList:getPlayerList():Get(i):getDomage())
			    if aPlayerList:getPlayerList():Get(i):getTotalDomage()>0 then
			      msg2(aPlayerList:getPlayerList():Get(i):getId(),"\169188319720[DAMAGE]:\169255255255 in this round "..aPlayerList:getPlayerList():Get(i):getDomage().." HP")
			      msg2(aPlayerList:getPlayerList():Get(i):getId(),"\169188319720[DAMAGE]:\169255255255 in total "..aPlayerList:getPlayerList():Get(i):getTotalDomage().." HP")
			    end
   			end 
		end
	    
	end

end