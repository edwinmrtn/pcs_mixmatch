dofile("sys/lua/pcs_mixmatch/model/object.lua")
dofile("sys/lua/pcs_mixmatch/model/arrayList.lua")




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

function MixList:__tostring()
    return "I am a MixList"
end
