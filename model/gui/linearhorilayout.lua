
--Public class LinearHoriLayout
LinearHoriLayout = newclass("LinearHoriLayout")

--Constructors
function LinearHoriLayout:init(Id,bg,div,space)
	self.Id         = Id
    self.bg         = bg
    self.div        = div
    self.space      = space
end
function LinearHoriLayout:getDiv()
    return self.div
end
function LinearHoriLayout:getBg()
    return self.bg
end
function LinearHoriLayout:getNbrContainer()
    return self:getDiv()
end
function LinearHoriLayout:calculDimY(dimy)
    return math.floor((dimy-(self:getDiv()*self:getSpace()))/self:getDiv())
end 
function LinearHoriLayout:calculDimX(dimx)
    return dimx
end
function LinearHoriLayout:getSpace()
    return self.space
end
--Methods
function LinearHoriLayout:fabric(id,Containers,dimx,dimy,x,y,compt)
    local pointerX = x
    local pointerY = y
    local containers = ArrayList.Create()
    for i= 1, self:getNbrContainer() do
        acontainer = Container(i,self:getBg(),self:calculDimX(dimx),self:calculDimY(dimy),pointerX,pointerY,nil)
        containers:Add(acontainer)
        pointerY = pointerY +self:calculDimY(dimy)+self:getSpace()  
    end 
    return containers,compt
end
function LinearHoriLayout:__tostring()
    return "I am a LinearHoriLayout"
end