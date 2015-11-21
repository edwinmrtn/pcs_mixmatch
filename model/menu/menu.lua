-----------
-- Class Menu
-- @classmod Menu
--This is a Menu
Menu = newclass("Menu")


---Constructors
--@param id id of the menu
--@param titre title of the menu
function Menu:init(Id,Titre)
	self.Id      = Id 
	self.Titre   = Titre
	self.Numero  = 1
	self.buttons = ArrayList.Create()
end

---	Getters - Setters 
function Menu:getId()
    return self.Id
end
---	Getters - Setters 
function Menu:getTitre()
    return self.Titre
end
---	Getters - Setters 
function Menu:getNumero()
    return self.Numero
end
---	Getters - Setters 
function Menu:setNumero(Numero)
    self.Numero = Numero
end

---ClearButtons
--remove  all button contained in the menu
function Menu:ClearButtons()
	self:getButtons():Clear()
end

---Refresh
--remove  all button contained in the menu
function Menu:Refresh()
	self:ClearButtons()
end
---	Getters - Setters 
function Menu:getButtons()
    return self.buttons
end
function Menu:setTitre(Titre)
		  self.Titre = Titre
end
function Menu:setButtons(buttons)
		  self.buttons = buttons
end 

---	addButton(button unButton)
--@param id is the id of player
--This Show the menu to the id player. 
function Menu:addButton(unButton)
	
 		if self:NumbersButtons() == 6 then
 			local number = string.match(self:getTitre(), "%d+")
 			local titre
 			if number ~= "" and number ~= nil then
 				titre = string.gsub(self:getTitre(),number,"")
 				self:setTitre(titre..self:getNumero())
 			else 
 				titre = self:getTitre()
 				self:setTitre(titre..""..self:getNumero())
 			end 

 			local menu_multiple = Menu(1,titre..""..self:getNumero()+1)
 			menu_multiple:setNumero(self:getNumero()+1)
 			menu_multiple:addButton(unButton)

 			local bouton_menuSaut   = button(7,"","",nil,nil)
 			local arrayOb ={{menu_multiple,":Show","id"}}
 			local bouton_menuNext   = button(8,"Next","",nil,arrayOb)
			self:getButtons():Add(bouton_menuSaut)
			self:getButtons():Add(bouton_menuNext)

	 		local bool = true
	        for i=1,theMenuList:NumbersMenus() do
	          if(titre..""..self:getNumero()+1 == theMenuList:getMenuList():Get(i):getTitre())then
	    	         bool = false
	          end
	        end
	        if (bool) then
	          theMenuList:addMenu(menu_multiple);
	        end

			if(self:getNumero() ~= 1) then
				local preMenuObject
				for i=1,theMenuList:NumbersMenus() do
	          		if(titre..""..self:getNumero()-1 == theMenuList:getMenuList():Get(i):getTitre())then
	    	         	preMenuObject = theMenuList:getMenuList():Get(i)
	          		end
	        	end
	        	local arrayOb = {{preMenuObject,":Show","id"}}
				local bouton_menuPrev   = button(9,"Previous","",nil,arrayOb)
			    self:getButtons():Add(bouton_menuPrev)
			end 
 			
	    elseif self:NumbersButtons() > 6 then
	    	local number = string.match(self:getTitre(), "%d+")
 			local titre
 			if number ~= "" then
 				titre = string.gsub(self:getTitre(),number,"")
 			else 
 				titre = self:getTitre()
 			end
 			
	    	for i=1,theMenuList:NumbersMenus() do
	       		if(titre..self:getNumero()+1 == theMenuList:getMenuList():Get(i):getTitre())then
	    	  		theMenuList:getMenuList():Get(i):addButton(unButton)	
	    	  	
	    	  	end 
	    	end
 		else
			self:getButtons():Add(unButton)
		end  
end 


---NumbersButtons(void)
--used in "for" iterration 
--@return the number of button this menu have.
function Menu:NumbersButtons()
	return self:getButtons():Size()
end

---Show(int id)
--This Show the menu to the id player. 
--@param id is the id of player
function Menu:Show(id)
	local command = ""
		for i=1,self:NumbersButtons() do
	           command = command..','..self:getButtons():Get(i):getNom()
	    end
	    	command = self:getTitre()..command
	    	menu(id,command)
end

function Menu:ExistButton(name)
	local bool = false
	for i=1,self:NumbersButtons() do
          if(name == self:getButtons():Get(i):getNom())then
               bool = true
          end
    end
    return bool 
end 
--[[
	tostring(void)
		Name of the object
]]
function Menu:__tostring()
    return "I am a Menu"
end

