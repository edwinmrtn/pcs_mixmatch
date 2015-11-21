-----------
-- Class MixList
-- @classmod MixList
--Public class MixList
MixList = newclass("MixList")
MixList.MixList     = ArrayList.Create()


---Constructors
--@param id id of the MixList
function MixList:init(Id)
self.Id               = Id
end

--Methods
---Getters - Setters 
function MixList:getId()
    return self.Id
end

---Getters - Setters 
function MixList:getMixList()
    return self.MixList
end

---Getters - Setters 
function MixList:addMix(Mix)
    self:getMixList():Add(Mix)
end

---Getters - Setters 
function MixList:removeMix(Mix)
    self:getMixList():Remove(Mix)
end  

---Getters - Setters 
function MixList:NumbersMixs()
    return self:getMixList():Size()
end

---saveData
--save the list mix in a .txt 
function MixList:saveData()
	local tempTable = {}
	for i=1, self:NumbersMixs() do
		tempTable[i] = {}
		tempTable[i]["id"]=self:getMixList():Get(i):getId()
		tempTable[i]["rounds"]=self:getMixList():Get(i):getRounds()
		tempTable[i]["nbrPlayers"]=self:getMixList():Get(i):getNomberPlayers()
		tempTable[i]["map"]=self:getMixList():Get(i):getMap()
		tempTable[i]["KnifeRound"]=self:getMixList():Get(i):getKnifeRound()
		tempTable[i]["Fire"]=self:getMixList():Get(i):getFire()
		tempTable[i]["Sniper"]=self:getMixList():Get(i):getSniper()
		tempTable[i]["State"]=self:getMixList():Get(i):getState()
		
		for j=1, self:getMixList():Get(i):getNumberRegist() do
			tempTable[i][j] = {}
			msg(self:getMixList():Get(i):getNumberRegist())
			msg(self:getMixList():Get(i):getRegistPlayers():Get(j):getId())
			tempTable[i][j]["id"]=self:getMixList():Get(i):getRegistPlayers():Get(j):getId()
			msg(tempTable[i][j]["id"])
			tempTable[i][j]["usgn"]=self:getMixList():Get(i):getRegistPlayers():Get(j):getUSGN()
			tempTable[i][j]["rank"]=self:getMixList():Get(i):getRegistPlayers():Get(j):getRank()
			tempTable[i][j]["name"]=self:getMixList():Get(i):getRegistPlayers():Get(j):getName()
			tempTable[i][j]["ip"]=self:getMixList():Get(i):getRegistPlayers():Get(j):getIP()
		end 
	end
    table.save(tempTable,"sys/lua/pcs_mixmatch/model/mixes.txt")
end


---loadData
--load the .txt
function MixList:loadData()
	local tempTable = table.load("sys/lua/pcs_mixmatch/model/mixes.txt")
	if tempTable ~= nil then
		for i=1, #tempTable do
			local aMix = Mix(tempTable[i]["id"],tempTable[i]["rounds"],tempTable[i]["nbrPlayers"],tempTable[i]["map"],tempTable[i]["KnifeRound"],tempTable[i]["Fire"],tempTable[i]["Sniper"])
			aMix:setState(tempTable[i]["State"])
			for j=1,#tempTable[i] do
				if(tempTable[i][j] ~= nil) then
					local aPlayer = Player(tempTable[i][j]["id"],tempTable[i][j]["usgn"],tempTable[i][j]["rank"],tempTable[i][j]["name"],tempTable[i][j]["ip"])
					aMix:addRegistPlayer(aPlayer)
				end
			end
			self:addMix(aMix) 
		end
	end
end  

function MixList:__tostring()
    return "I am a MixList"
end
