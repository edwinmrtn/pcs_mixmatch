
--Public class MenuList
MenuList = newclass("MenuList")
MenuList.MenuList     = ArrayList.Create()

--Constructors

function MenuList:init(Id,Titre)
	self.Id      = Id 
end

--Methods
function MenuList:getId()
    return self.Id
end
function MenuList:getMenuList()
    return self.MenuList
end
function MenuList:addMenu(Menu)
    self:getMenuList():Add(Menu)
end 
function MenuList:NumbersMenus()
    return self:getMenuList():Size()
end

function MenuList:__tostring()
    return "I am a MenuList"
end

