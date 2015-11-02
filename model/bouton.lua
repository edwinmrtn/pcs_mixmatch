

--Public class Bouton
Bouton = newclass("Bouton")


--Constructors

function Bouton:init(Id,Nom,Value,Fonction,Object,FoncObject,ParamOb)
	self.Id            = Id 
	self.Nom           = Nom
	self.Value         = Value
	self.Fonction      = Fonction
	self.Object        = Object
	self.FoncObject    = FoncObject
	self.ParamObject   = ParamOb
end

--Methods
function Bouton:getId()
    return self.Id
end
function Bouton:getNom()
    return self.Nom
end
function Bouton:getValue()
    return self.Value
end
function Bouton:getFonction()
    return self.Fonction
end
function Bouton:getObject()
    return self.Object
end
function Bouton:getFoncObject()
    return self.FoncObject
end
function Bouton:getParamObject()
    return self.ParamObject
end
function Bouton:setNom(Nom)
		  self.Nom = Nom
end

function Bouton:__tostring()
    return "I am a Bouton"
end

