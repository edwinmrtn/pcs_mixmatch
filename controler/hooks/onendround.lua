--------
--Executed script every endround
--@module hooks.onEndround
--
--




addhook("endround", "onEndround")

---initRoundPlayed
--set the nomber of round played for all player to 0
--
function initRoundPlayed()
	for i=1,aPlayerList:NumbersPlayers() do
		local playert=player(0,"team1")
		for _,id in pairs(playert) do
   			if id == aPlayerList:getPlayerList():Get(i):getId() then
   				aPlayerList:getPlayerList():Get(i):setRoundsPlayed(0)
   			end 
		end
		local playerct=player(0,"team2")
		for _,id in pairs(playerct) do
   			if id == aPlayerList:getPlayerList():Get(i):getId() then
   				aPlayerList:getPlayerList():Get(i):setRoundsPlayed(0)
   			end 
		end  
	end
end

---setRoundPlayed
--set the nomber of round played for all player to num
--
--@param num nomber of round played 
function setRoundPlayed(num)
	for i=1,aPlayerList:NumbersPlayers() do
		local playert=player(0,"team1")
		for _,id in pairs(playert) do
   			if id == aPlayerList:getPlayerList():Get(i):getId() then
   				aPlayerList:getPlayerList():Get(i):setRoundsPlayed(num)
   			end 
		end
		local playerct=player(0,"team2")
		for _,id in pairs(playerct) do
   			if id == aPlayerList:getPlayerList():Get(i):getId() then
   				aPlayerList:getPlayerList():Get(i):setRoundsPlayed(num)
   			end 
		end  
	end
end 

---addRoundPlayed
--add a round for all player
--
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

---removeRoundPlayed
--remove a round for all player
--
function removeRoundPlayed()
	for i=1,aPlayerList:NumbersPlayers() do
		local playert=player(0,"team1")
		for _,id in pairs(playert) do
   			if id == aPlayerList:getPlayerList():Get(i):getId() then
   				aPlayerList:getPlayerList():Get(i):setRoundsPlayed(aPlayerList:getPlayerList():Get(i):getRoundsPlayed()-1)
   			end 
		end
		local playerct=player(0,"team2")
		for _,id in pairs(playerct) do
   			if id == aPlayerList:getPlayerList():Get(i):getId() then
   				aPlayerList:getPlayerList():Get(i):setRoundsPlayed(aPlayerList:getPlayerList():Get(i):getRoundsPlayed()-1)
   			end 
		end  
	end
end 

---onEndround
--main script called on end round
--
--@param mode defined how the previews rounds have been won.
function onEndround(mode)
	for i=1,aMixList:NumbersMixs() do
			if (aMixList:getMixList():Get(i):getState() == "kniferound") then
				initRoundPlayed()
				addRoundPlayed()
				scoremvp(mode)
				if(mode == 1) then --terrorist win
					aMixList:getMixList():Get(i):setState("chooseside")
				elseif(mode == 2) then  --counter win
					aMixList:getMixList():Get(i):setState("chooseside")
				end 		
			elseif (aMixList:getMixList():Get(i):getState() == "chooseside") then
					aMixList:getMixList():Get(i):setState("side1")
			elseif (aMixList:getMixList():Get(i):getState() == "side1") then
					scoremvp(mode)
					aMixList:getMixList():Get(i):setcptRounds(aMixList:getMixList():Get(i):getcptRounds()+1)		
					addRoundPlayed()
			elseif (aMixList:getMixList():Get(i):getState() == "side2") then
					scoremvp(mode)
					aMixList:getMixList():Get(i):setcptRounds(aMixList:getMixList():Get(i):getcptRounds()+1)		
					addRoundPlayed()
			end  
	end

end

---scoremvp
--print the number domage made from all player
--
--@param mode defined how the previews rounds have been won.
function scoremvp(mode) 
	local max_domage
	local max_player
	if (aPlayerList:getPlayerList():Get(1)) then 
		max_domage = aPlayerList:getPlayerList():Get(1):getDomage()
		max_player = aPlayerList:getPlayerList():Get(1):getName()
	else
		max_domage = 0
		max_player = 0
	end 
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
   				---TEAMWORK
   				if mode>=10 and mode<=61 and mode%2 == 0 then --terro
					    aPlayerList:getPlayerList():Get(i):setTotalDomage(aPlayerList:getPlayerList():Get(i):getTotalDomage()+100)
				end
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
				---TEAMWORK
   				if mode>=10 and mode<=61 and mode%2 == 1 then --terro
					    aPlayerList:getPlayerList():Get(i):setTotalDomage(aPlayerList:getPlayerList():Get(i):getTotalDomage()+100)
				end
   				aPlayerList:getPlayerList():Get(i):setTotalDomage(aPlayerList:getPlayerList():Get(i):getTotalDomage()+aPlayerList:getPlayerList():Get(i):getDomage())
			    if aPlayerList:getPlayerList():Get(i):getTotalDomage()>0 then
			      msg2(aPlayerList:getPlayerList():Get(i):getId(),"\169188319720[DAMAGE]:\169255255255 in this round "..aPlayerList:getPlayerList():Get(i):getDomage().." HP")
			      msg2(aPlayerList:getPlayerList():Get(i):getId(),"\169188319720[DAMAGE]:\169255255255 in total "..aPlayerList:getPlayerList():Get(i):getTotalDomage().." HP")
			    end
   			end 
		end

	    
	end
end