

--Public class button
button = newclass("button")


--Constructors

function button:init(Id,Nom,Value,Fonction,arrayObject)
	self.Id            = Id 
	self.Nom           = Nom
	self.Value         = Value
	self.Fonction      = Fonction
	self.arrayObject   = arrayObject
end

--Methods
function button:getId()
    return self.Id
end
function button:getNom()
    return self.Nom
end
function button:getValue()
    return self.Value
end
function button:getFonction()
    return self.Fonction
end
function button:getArrayObject()
    return self.arrayObject
end
function button:setNom(Nom)
		  self.Nom = Nom
end

function button:__tostring()
    return "I am a button"
end

