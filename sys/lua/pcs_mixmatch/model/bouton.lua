dofile("sys/lua/pcs_mixmatch/model/object.lua")
dofile("sys/lua/pcs_mixmatch/model/arrayList.lua")

--Public class Bouton
Bouton = newclass("Bouton")


--Constructors

function Bouton:init(Id,Nom,Fonction)
	self.Id       = Id 
	self.Nom      = Nom
	self.Fonction = Fonction
end

--Methods
function Bouton:getId()
    return self.Id
end
function Bouton:getNom()
    return self.Nom
end
function Bouton:getFonction()
    return self.Fonction
end

function Bouton:setNom(Nom)
		  self.Nom = Nom
end

function Bouton:__tostring()
    return "I am a Bouton"
end

