-----------
-- Class Chooseside
-- @classmod Chooseside
--Public class Chooseside
Chooseside = newclass("Chooseside")


---Constructors
--@param votett number of vote for tero
--@param votect number of vote for counter
function Chooseside:init(votett,votect)
	self.votett = votett
	self.votect = votect
	self.mode   = 0
end

---Getters - Setters 
function Chooseside:getMode()
	return self.mode
end

---Getters - Setters 
function Chooseside:setMode(mode)
	self.mode = mode
end 

---Getters - Setters 
function Chooseside:getvotett()
    return self.votett
end

---Getters - Setters 
function Chooseside:increvotett()
	self.votett = self:getvotett()+1
end 

---Getters - Setters 
function Chooseside:increvotect() 
	self.votect = self:getvotect()+1
end 

---Getters - Setters 
function Chooseside:getvotect()
    return self.votect
end

---start
--start the round chooseside, set the different ingame settings
function Chooseside:start(mode) --1 == terro win // 2== ct win
				self:setMode(mode)
				parse("mp_startmoney 0")
				parse("mp_roundtime 1")
				parse("mp_freezetime 0")
				msg("\169100255100CHOOSE SIDE@C")
-- 	local aMixList = MixList(0);
	for i=1,aMixList:NumbersMixs() do
			if aMixList:getMixList():Get(i):getState() == "chooseside" then
				for j=1,aMixList:getMixList():Get(i):getTeams():Get(mode):NumbersPlayers()do --Team winner
					aMixList:getMixList():Get(i):getTeams():Get(mode):getPlayers():Get(j):chooseteam()
				end
				for j=1,aMixList:getMixList():Get(i):getTeams():Get(1):NumbersPlayers()do --Team winner
					aMixList:getMixList():Get(i):getTeams():Get(1):getPlayers():Get(j):dontmove()
				end
				for j=1,aMixList:getMixList():Get(i):getTeams():Get(2):NumbersPlayers()do --Team winner
					aMixList:getMixList():Get(i):getTeams():Get(2):getPlayers():Get(j):dontmove()
				end
			end
			
	end

end

---majorite
--define which team have been choosed
function Chooseside:majorite()
--		local aMixList = MixList(0);
	for i=1,aMixList:NumbersMixs() do
			if aMixList:getMixList():Get(i):getState() == "chooseside" then
				if aMixList:getMixList():Get(i):getObjectChooseside():getvotett() >= aMixList:getMixList():Get(i):getNomberPlayers()/4 or aMixList:getMixList():Get(i):getObjectChooseside():getvotect() >= aMixList:getMixList():Get(i):getNomberPlayers()/4 then	
		            msg("\169100255100SIDE 1@C")
		            parse("mp_startmoney 800")
		            parse("mp_freezetime 7")
		            parse("mp_roundtime 2")
		            aMixList:getMixList():Get(i):setcptRounds(-1)
		            setRoundPlayed(0)
		            aMixList:getMixList():Get(i):setState("side1")
					if aMixList:getMixList():Get(i):getObjectChooseside():getvotett() >= aMixList:getMixList():Get(i):getNomberPlayers()/4 and self:getMode() == 1 then
						parse("restart 5")
					elseif aMixList:getMixList():Get(i):getObjectChooseside():getvotect() >= aMixList:getMixList():Get(i):getNomberPlayers()/4 and self:getMode() == 2 then	
						parse("restart 5")
					else
						aMixList:getMixList():Get(i):SwitchTeams()
					end
				else 
				end
			end
			
	end
end

---voteforcounter
--a vote for counter - isn't in the class
function voteforcounter(id)
--		local aMixList = MixList(0);
	for i=1,aMixList:NumbersMixs() do
			if aMixList:getMixList():Get(i):getState() == "chooseside" then
				parse("msg "..id.." a vote ct")
				aMixList:getMixList():Get(i):getObjectChooseside():increvotect()
				aMixList:getMixList():Get(i):getObjectChooseside():majorite()
			end
			
	end

end

---voteforterro
--a vote for terro - isn't in the classs
function voteforterro(id)
--		local aMixList = MixList(0);
		for i=1,aMixList:NumbersMixs() do
			if aMixList:getMixList():Get(i):getState() == "chooseside" then
				parse("msg "..id.." a vote tt")
				aMixList:getMixList():Get(i):getObjectChooseside():increvotett()
				aMixList:getMixList():Get(i):getObjectChooseside():majorite()
			end
			
	end
end




