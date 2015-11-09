
--Public class SeparateVertiLayout
SeparateVertiLayout = newclass("SeparateVertiLayout")

--Constructors
function SeparateVertiLayout:init(Id,bg,width,space)
	self.Id         = Id
    self.bg         = bg
    self.width      = width
    self.space      = space
end
function SeparateVertiLayout:getWidth()
    return self.width
end
function SeparateVertiLayout:getBg()
    return self.bg
end
function SeparateVertiLayout:getNbrContainer()
    return 2
end
function SeparateVertiLayout:calculDimX1()
    return self:getWidth()
end
function SeparateVertiLayout:calculDimX2(dimx)
    return dimx-self:getWidth()
end
function SeparateVertiLayout:calculDimY(dimy)
    return dimy
end
function SeparateVertiLayout:getSpace()
    return self.space
end
--Methods
function SeparateVertiLayout:fabric(id,Containers,dimx,dimy,x,y,compt)
    local pointerX = x
    local pointerY = y
    local containers = ArrayList.Create()

        acontainer1 = Container(1,nil,self:calculDimX1(dimx),self:calculDimY(dimy),pointerX,pointerY,nil)
        containers:Add(acontainer1)
        pointerX = pointerX +self:calculDimX1()+self:getSpace() 
        acontainer2 = Container(2,self:getBg(),self:calculDimX2(dimx),self:calculDimY(dimy),pointerX,pointerY,nil)
        containers:Add(acontainer2)
    return containers,compt
end
function SeparateVertiLayout:__tostring()
    return "I am a SeparateVertiLayout"
end