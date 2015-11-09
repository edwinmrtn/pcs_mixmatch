
--Public class GridLayout
GridLayout = newclass("GridLayout")

--Constructors
function GridLayout:init(Id,bg,div,height,space)
	self.Id         = Id
    self.bg         = bg
    self.div        = div
    self.height     = height
    self.space      = space
end
function GridLayout:getDiv()
    return self.div
end
function GridLayout:getBg()
    return self.bg
end
function GridLayout:getHeight()
    return self.height
end
function GridLayout:getAjustementSpace(dimy)
    return  (math.floor(dimy/self:getHeight())/self:getDiv())*self:getSpace()
end
function GridLayout:getNbrContainer(dimy)
    return self:getDiv()*math.floor((dimy-self:getAjustementSpace(dimy))/self:getHeight())
end
function GridLayout:calculDimY()
    return self:getHeight()
end 
function GridLayout:calculDimX(dimx)
    return math.floor(dimx/self:getDiv())
end
function GridLayout:getSpace()
    return self.space
end
--Methods
function GridLayout:fabric(id,Containers,dimx,dimy,x,y,compt)
    local pointerX = x
    local pointerY = y
    local containers = ArrayList.Create()
    for i= 1, self:getNbrContainer(dimx) do
        msg("jemapel i "..i)
        acontainer = Container(i,self:getBg(),self:calculDimX(dimx),self:calculDimY(),pointerX,pointerY,nil)
        containers:Add(acontainer)
        pointerX = pointerX +self:calculDimX(dimx)+self:getSpace()
        if(i%self:getDiv() == 0) then
            pointerY = pointerY +self:calculDimY()+self:getSpace()
            pointerX = x
        end
    end 
    return containers,compt
end
function GridLayout:__tostring()
    return "I am a GridLayout"
end