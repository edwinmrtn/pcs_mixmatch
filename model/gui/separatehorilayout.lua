
--Public class SeparateHoriLayout
SeparateHoriLayout = newclass("LinearHoriLayout")

--Constructors
function SeparateHoriLayout:init(Id,bg,height,space)
	self.Id         = Id
    self.bg         = bg
    self.height     = height
    self.space      = space
end
function SeparateHoriLayout:getBg()
    return self.bg
end
function SeparateHoriLayout:getHeight()
    return self.height
end
function SeparateHoriLayout:getNbrContainer()
    return 2
end
function SeparateHoriLayout:calculDimY1()
    return self:getHeight()
end
function SeparateHoriLayout:calculDimY2(dimy)
    return dimy-self:getHeight()
end
function SeparateHoriLayout:calculDimX(dimx)
    return dimx
end
function SeparateHoriLayout:getSpace()
    return self.space
end
--Methods
function SeparateHoriLayout:fabric(id,Containers,dimx,dimy,x,y,compt)
    local pointerX = x
    local pointerY = y
    local containers = ArrayList.Create()

        acontainer1 = Container(1,nil,self:calculDimX(dimx),self:calculDimY1(),pointerX,pointerY,nil)
        containers:Add(acontainer1)
        pointerY = pointerY +self:calculDimY1()+self:getSpace() 
        acontainer2 = Container(2,self:getBg(),self:calculDimX(dimx),self:calculDimY2(dimy),pointerX,pointerY,nil)
        containers:Add(acontainer2)
         
    
    return containers,compt
end
function SeparateHoriLayout:__tostring()
    return "I am a SeparateHoriLayout"
end