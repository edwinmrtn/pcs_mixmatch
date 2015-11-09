
--Public class MenuList
MenuList = newclass("MenuList")
MenuList.MenuList     = ArrayList.Create()

--Constructors
function MenuList:init(Id,Titre)
	self.Id      = Id 
end

--Methods
--[[
	Getters - Setters 
]]
function MenuList:getId()
    return self.Id
end
function MenuList:getMenuList()
    return self.MenuList
end
--[[
	addMenu(Menu Menu)
		Add a menu to the list of menu
]]
function MenuList:addMenu(Menu)
    self:getMenuList():Add(Menu)
end 
--[[
	NumbersMenus(void)
		Return the number of Menu this MenuList have.
		>>used in "for" iterration 
]]
function MenuList:NumbersMenus()
    return self:getMenuList():Size()
end
--[[
	tostring(void)
		Name of the object
]]
function MenuList:__tostring()
    return "I am a MenuList"
end

