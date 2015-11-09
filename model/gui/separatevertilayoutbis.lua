
--Public class SeparateVertiLayoutbis
SeparateVertiLayoutbis = newclass("SeparateVertiLayoutbis")

--Constructors
function SeparateVertiLayoutbis:init(Id,bg,width,space)
	self.Id         = Id
    self.bg         = bg
    self.width      = width
    self.space      = space
end
function SeparateVertiLayoutbis:getWidth()
    return self.width
end
function SeparateVertiLayoutbis:getBg()
    return self.bg
end
function SeparateVertiLayoutbis:getNbrContainer()
    return 2
end
function SeparateVertiLayoutbis:calculDimX2()
    return self:getWidth()
end
function SeparateVertiLayoutbis:calculDimX1(dimx)
    return dimx-self:getWidth()
end
function SeparateVertiLayoutbis:calculDimY(dimy)
    return dimy
end
function SeparateVertiLayoutbis:getSpace()
    return self.space
end
--Methods
function SeparateVertiLayoutbis:fabric(id,Containers,dimx,dimy,x,y,compt)
    local pointerX = x
    local pointerY = y
    local containers = ArrayList.Create()

        acontainer1 = Container(1,self:getBg(),self:calculDimX1(dimx),self:calculDimY(dimy),pointerX,pointerY,nil)
        containers:Add(acontainer1)
        pointerX = pointerX +self:getWidth()+self:getSpace() 
        acontainer2 = Container(2,nil,self:calculDimX2(dimx),self:calculDimY(dimy),pointerX,pointerY,nil)
        containers:Add(acontainer2)
    return containers,compt
end
function SeparateVertiLayoutbis:__tostring()
    return "I am a SeparateVertiLayoutbis"
end