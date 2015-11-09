--Public class HeadContainerList
HeadContainerList = newclass("HeadContainerList")
HeadContainerList.HeadContainerList     = ArrayList.Create()

--Constructors
function HeadContainerList:init(Id)
self.Id               = Id
end

--Methods

function HeadContainerList:getId()
    return self.Id
end
function HeadContainerList:getHeadContainerList()
    return self.HeadContainerList
end
function HeadContainerList:addHeadContainer(HeadContainer)
    self:getHeadContainerList():Add(HeadContainer)
end
function HeadContainerList:removeHeadContainer(HeadContainer)
    self:getHeadContainerList():Remove(HeadContainer)
end  
function HeadContainerList:NumbersHeadContainers()
    return self:getHeadContainerList():Size()
end
function HeadContainerList:exist(title)
	local bool = false
	for i=1, self:NumbersHeadContainers() do
		if(self:getHeadContainerList():Get(i):getTitre()==title)then
			bool = true
		end
	end
	return bool
end

function HeadContainerList:__tostring()
    return "I am a HeadContainerList"
end
