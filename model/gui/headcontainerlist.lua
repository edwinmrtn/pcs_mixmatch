--------
--@classmod GUI.HeadContainerList
--This is a HeadContainerList
--
--Public class HeadContainerList
HeadContainerList = newclass("HeadContainerList")
HeadContainerList.HeadContainerList     = ArrayList.Create()

---Constructors
--@param id id of the list container
function HeadContainerList:init(Id)
self.Id               = Id
end

---getId
-- get id of the list
--@return id of the list
function HeadContainerList:getId()
    return self.Id
end

---getHeadContainerList
-- get the global list
--@return the global list
function HeadContainerList:getHeadContainerList()
    return self.HeadContainerList
end

---addHeadContainer
-- add a main container to the list
--@param HeadContainer add a main container to the list
function HeadContainerList:addHeadContainer(HeadContainer)
    self:getHeadContainerList():Add(HeadContainer)
end

---removeHeadContainer
-- remove a main container to the list
--@param HeadContainer remove a main container to the list
function HeadContainerList:removeHeadContainer(HeadContainer)
    self:getHeadContainerList():Remove(HeadContainer)
end  

---NumbersHeadContainers
-- get the number of headcontainer the list contains
--@return the number of headcontainer the list contains
function HeadContainerList:NumbersHeadContainers()
    return self:getHeadContainerList():Size()
end

---exist
--@return boolean
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
