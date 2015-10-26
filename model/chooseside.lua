

--Public class Chooseside

Chooseside = newclass("Chooseside")

--Constructor
function Chooseside:init(votett,votect)
	self.votett = votett
	self.votect = votect
end

function Chooseside:getvotett()
    return self.votett
end
function Chooseside:increvotett()
	self.votett = self:getvotett()+1
end 
function Chooseside:increvotect() 
	self.votect = self:getvotect()+1
end 
function Chooseside:getvotect()
    return self.votect
end
--Static Method start
function Chooseside:start(mode) --1 == terro win // 2== ct win
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
			end
			
	end

end

function majorite()
--		local aMixList = MixList(0);
	for i=1,aMixList:NumbersMixs() do
			if aMixList:getMixList():Get(i):getState() == "chooseside" then
				if aMixList:getMixList():Get(i):getObjectChooseside():getvotett() >= aMixList:getMixList():Get(i):getNomberPlayers()/4 or aMixList:getMixList():Get(i):getObjectChooseside():getvotect() >= aMixList:getMixList():Get(i):getNomberPlayers()/4 then
					aMixList:getMixList():Get(i):setState("side1")
					aMixList:getMixList():Get(i):SwitchTeams()
				end
			end
			
	end
end

function voteforcounter(id)
--		local aMixList = MixList(0);
	for i=1,aMixList:NumbersMixs() do
			if aMixList:getMixList():Get(i):getState() == "chooseside" then
				parse("msg "..id.." a vote ct")
				aMixList:getMixList():Get(i):getObjectChooseside():increvotect()
				majorite()
			end
			
	end

end
function voteforterro(id)
--		local aMixList = MixList(0);
		for i=1,aMixList:NumbersMixs() do
			if aMixList:getMixList():Get(i):getState() == "chooseside" then
				parse("msg "..id.." a vote tt")
				aMixList:getMixList():Get(i):getObjectChooseside():increvotett()
				majorite()
			end
			
	end
end




