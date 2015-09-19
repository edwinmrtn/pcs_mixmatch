dofile("sys/lua/pcs_mixmatch/model/object.lua")
dofile("sys/lua/pcs_mixmatch/model/arrayList.lua")

--Public class Menu
Menu = newclass("Menu")


--Constructors

function Menu:init(Id,Titre)
	self.Id      = Id 
	self.Titre   = Titre
	self.Boutons = ArrayList.Create()
end

--Methods
function Menu:getId()
    return self.Id
end
function Menu:getTitre()
    return self.Titre
end
function Menu:ClearBoutons()
	self:getBoutons():Clear()
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

function Menu:addBouton(Bouton)
	self:getBoutons():Add(Bouton)
end 


function Menu:NumbersBoutons()
	return self:getBoutons():Size()
end
function Menu:Show()
	local command = "" 
	for i=1,self:NumbersBoutons() do
           command = command..','..self:getBoutons():Get(i):getNom()
    end
    	command = self:getTitre()..command
    	return command
end

function Menu:__tostring()
    return "I am a Menu"
end

