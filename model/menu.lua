

--Public class Menu
Menu = newclass("Menu")


--Constructors

function Menu:init(Id,Titre)
	self.Id      = Id 
	self.Titre   = Titre
	self.Numero  = 1
	self.Boutons = ArrayList.Create()
end

--Methods
function Menu:getId()
    return self.Id
end
function Menu:getTitre()
    return self.Titre
end
function Menu:getNumero()
    return self.Numero
end
function Menu:setNumero(Numero)
    self.Numero = Numero
end
function Menu:ClearBoutons()
	self:getBoutons():Clear()
end
function Menu:Refresh()
	self:ClearBoutons()
end
function Menu:getBoutons()
    return self.Boutons
end
function Menu:setTitre(Titre)
		  self.Titre = Titre
end
function Menu:setBoutons(Boutons)
		  self.Boutons = Boutons
end 

function Menu:addBouton(unBouton)
	--msg(tostring(unBouton:getValue()))
	
 		if self:NumbersBoutons() == 6 then
 			--msg("je passe ==5")
 			--msg(self:getTitre())
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
 			menu_multiple:addBouton(unBouton)

 			local bouton_menuSaut   = Bouton(7,"","",nil,nil,nil)
 			local bouton_menuNext   = Bouton(8,"Next","",nil,menu_multiple,":Show","id")
			self:getBoutons():Add(bouton_menuSaut)
			self:getBoutons():Add(bouton_menuNext)


				--new menuList
--    	    local theMenuList    = MenuList(0);
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
				local bouton_menuPrev   = Bouton(9,"Previous","",nil,preMenuObject,":Show","id")
			    self:getBoutons():Add(bouton_menuPrev)
			end 
			--msg("num:" ..self:getNumero()+1)
 			

 			
	    elseif self:NumbersBoutons() > 6 then
	    	--msg("je passe >5")
	    	--msg(self:getTitre())
	    	local number = string.match(self:getTitre(), "%d+")
 			local titre
 			--msg(number)
 			if number ~= "" then
 				titre = string.gsub(self:getTitre(),number,"")
 			else 
 				titre = self:getTitre()
 			end
-- 			local theMenuList    = MenuList(0);
 			
	    	for i=1,theMenuList:NumbersMenus() do
	    		--msg(titre..self:getNumero()+1)
	    		--msg(theMenuList:getMenuList():Get(i):getTitre())
	    		if(titre..self:getNumero()+1 == theMenuList:getMenuList():Get(i):getTitre())then
	    	  		theMenuList:getMenuList():Get(i):addBouton(unBouton)	
	    	  	
	    	  	end 
	    	end
 		else
			--msg(tostring(unBouton:getValue()))
			self:getBoutons():Add(unBouton)
			
			--msg(self:getTitre())
		end  
end 


function Menu:NumbersBoutons()
	return self:getBoutons():Size()
end
function Menu:Show(id)
	local command = ""
		for i=1,self:NumbersBoutons() do
	           command = command..','..self:getBoutons():Get(i):getNom()
	    end
	    	command = self:getTitre()..command
	    	menu(id,command)
end

function Menu:__tostring()
    return "I am a Menu"
end

