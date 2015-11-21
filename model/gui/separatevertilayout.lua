--------
--@classmod GUI.SeparateVertiLayout
--This is a SeparateVertiLayout
--
--Public class SeparateVertiLayout
SeparateVertiLayout = newclass("SeparateVertiLayout")

---Constructors
--@param id id of the layout
--@param bg background object image 
--@param width  width of each container part returned
--@param space space separating the different container returned
function SeparateVertiLayout:init(Id,bg,width,space)
	self.Id         = Id
    self.bg         = bg
    self.width      = width
    self.space      = space
end

---getWidth
-- get the width of each container part returned
--@return width width of each container part returne
function SeparateVertiLayout:getWidth()
    return self.width
end


---getBg
-- get the background image of all the container returned
--@return bg the background image of all the container returned
function SeparateVertiLayout:getBg()
    return self.bg
end

---getNbrContainer
-- get the nomber of container make with this layout, depending on the option
--@param dimy height of the parent container
--@return the nomber of container make with this layout, depending on the option
function SeparateVertiLayout:getNbrContainer()
    return 2
end

---calculDimX1
--calcul the dimention X of the first container
function SeparateVertiLayout:calculDimX1()
    return self:getWidth()
end

---calculDimX2
--calcul the dimention X of the second container
function SeparateVertiLayout:calculDimX2(dimx)
    return dimx-self:getWidth()
end

---calculDimY
--calcul the dimention Y of both container
function SeparateVertiLayout:calculDimY(dimy)
    return dimy
end

---getSpace
--the space between the differents container
--@return space the space between the differents container
function SeparateVertiLayout:getSpace()
    return self.space
end

---fabric
--create and return containers
--@param id id player
--@param Containers not used ? 
--@param dimx dimension x
--@param dimy dimension y
--@param compt idtext
--@return create and return containers
function SeparateVertiLayout:fabric(id,Containers,dimx,dimy,x,y,compt)
    local pointerX = x
    local pointerY = y
    local containers = ArrayList.Create()

        acontainer1 = Container(1,nil,self:calculDimX1(dimx),self:calculDimY(dimy),pointerX,pointerY,mysetting[id].color)
        containers:Add(acontainer1)
        pointerX = pointerX +self:calculDimX1()+self:getSpace() 
        acontainer2 = Container(2,self:getBg(),self:calculDimX2(dimx),self:calculDimY(dimy),pointerX,pointerY,mysetting[id].color)
        containers:Add(acontainer2)
    return containers,compt
end
function SeparateVertiLayout:__tostring()
    return "I am a SeparateVertiLayout"
end