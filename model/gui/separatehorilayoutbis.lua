
--Public class SeparateHoriLayoutbis
SeparateHoriLayoutbis = newclass("SeparateHoriLayoutbis")

--Constructors
function SeparateHoriLayoutbis:init(Id,bg,height,space)
	self.Id         = Id
    self.bg         = bg
    self.height     = height
    self.space      = space
end
function SeparateHoriLayoutbis:getBg()
    return self.bg
end
function SeparateHoriLayoutbis:getHeight()
    return self.height
end
function SeparateHoriLayoutbis:getNbrContainer()
    return 2
end
function SeparateHoriLayoutbis:calculDimY2()
    return self:getHeight()
end
function SeparateHoriLayoutbis:calculDimY1(dimy)
    return dimy-self:getHeight()
end
function SeparateHoriLayoutbis:calculDimX(dimx)
    return dimx
end
function SeparateHoriLayoutbis:getSpace()
    return self.space
end
--Methods
function SeparateHoriLayoutbis:fabric(id,Containers,dimx,dimy,x,y,compt)
    local pointerX = x
    local pointerY = y
    local containers = ArrayList.Create()
        msg(tostring(self:getBg()))
        acontainer1 = Container(1,self:getBg(),self:calculDimX(dimx),self:calculDimY1(dimy),pointerX,pointerY,nil)
        containers:Add(acontainer1)
        pointerY = pointerY +self:calculDimY1(dimy)+self:getSpace() 
        acontainer2 = Container(2,nil,self:calculDimX(dimx),self:calculDimY2(dimy),pointerX,pointerY,nil)
        containers:Add(acontainer2)
         
    
    return containers,compt
end
function SeparateHoriLayoutbis:__tostring()
    return "I am a SeparateHoriLayoutbis"
end