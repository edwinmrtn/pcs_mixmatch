



--Public class MixList
MixList = newclass("MixList")
MixList.MixList     = ArrayList.Create()

--Constructors
function MixList:init(Id)
self.Id               = Id
end

--Methods

function MixList:getId()
    return self.Id
end
function MixList:getMixList()
    return self.MixList
end
function MixList:addMix(Mix)
    self:getMixList():Add(Mix)
end 
function MixList:NumbersMixs()
    return self:getMixList():Size()
end

function MixList:saveData()
	local tempTable = {{{}}}
	for i=1, self:NumbersMixs() do 
		tempTable[i]["id"]=self:getMixList():Get(i):getId()
		tempTable[i]["rounds"]=self:getMixList():Get(i):getRounds()
		tempTable[i]["nbrPlayers"]=self:getMixList():Get(i):getNomberPlayers()
		tempTable[i]["map"]=self:getMixList():Get(i):getMap()
		tempTable[i]["tillEnd"]=self:getMixList():Get(i):getTillEnd()
		tempTable[i]["KnifeRound"]=self:getMixList():Get(i):getKnifeRound()
		
		for j=1, self:getMixList():Get(i):getNumberRegist() do
			tempTable[i][j]["id"]=self:getMixList():Get(i):getRegistPlayers():Get(j):getId()
			tempTable[i][j]["usgn"]=self:getMixList():Get(i):getRegistPlayers():Get(j):getUSGN()
			tempTable[i][j]["rank"]=self:getMixList():Get(i):getRegistPlayers():Get(j):getRank()
			tempTable[i][j]["name"]=self:getMixList():Get(i):getRegistPlayers():Get(j):getName()
			tempTable[i][j]["ip"]=self:getMixList():Get(i):getRegistPlayers():Get(j):getIP()
		end 
	end
    table.save(tempTable,"sys/lua/pcs_mixmatch/model/mixes.txt")
end

function MixList:loadData()
	local tempTable = table.load("sys/lua/pcs_mixmatch/model/mixes.txt")
	for i=1, #tempTable do
		local aMix = Mix(tempTable[i]["id"],tempTable[i]["rounds"],tempTable[i]["nbrPlayers"],tempTable[i]["map"],tempTable[i]["tillEnd"],tempTable[i]["KnifeRound"])
		for j=1,#tempTable[i] do
			if(tempTable[i][j] ~= nil) then
				local aPlayer = Player(tempTable[i][j]["id"],tempTable[i][j]["usgn"],tempTable[i][j]["rank"],tempTable[i][j]["name"],tempTable[i][j]["ip"])
				aMix:addRegistPlayer(aPlayer)
			end
		end
		self:addMix(aMix) 
	end
end  

function MixList:__tostring()
    return "I am a MixList"
end
