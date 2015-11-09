
--Public class LinearVertiLayout
LinearVertiLayout = newclass("LinearVertiLayout")

--Constructors
function LinearVertiLayout:init(Id,bg,div,space)
	self.Id         = Id
    self.bg         = bg
    self.div        = div
    self.space      = space
end
function LinearVertiLayout:getDiv()
    return self.div
end
function LinearVertiLayout:getBg()
    return self.bg
end
function LinearVertiLayout:getNbrContainer()
    return self:getDiv()
end
function LinearVertiLayout:calculDimY(dimy)
    return dimy

end 
function LinearVertiLayout:calculDimX(dimx)
    return math.floor((dimx-(self:getDiv()*self:getSpace()))/self:getDiv())
end
function LinearVertiLayout:getSpace()
    return self.space
end
--Methods
function LinearVertiLayout:fabric(id,Containers,dimx,dimy,x,y,compt)
    local pointerX = x
    local pointerY = y
    local containers = ArrayList.Create()
    for i= 1, self:getNbrContainer() do
        acontainer = Container(i,self:getBg(),self:calculDimX(dimx),self:calculDimY(dimy),pointerX,pointerY,nil)
        containers:Add(acontainer)
        pointerX = pointerX +self:calculDimX(dimx)+self:getSpace()
      
           -- pointerY = pointerY +self:calculDimY(dimy)+self:getSpace()
            --pointerX = x
    end 
    return containers,compt
end
function LinearVertiLayout:__tostring()
    return "I am a LinearVertiLayout"
end