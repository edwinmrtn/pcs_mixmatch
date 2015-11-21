--------
--@classmod GUI.SeparateHoriLayoutbis
--This is a SeparateHoriLayoutbis
--
--Public class SeparateHoriLayoutbis
SeparateHoriLayoutbis = newclass("SeparateHoriLayoutbis")

---Constructors
--@param id id of the layout
--@param bg background object image 
--@param height  height of each container part returned
--@param space space separating the different container returned
function SeparateHoriLayoutbis:init(Id,bg,height,space)
	self.Id         = Id
    self.bg         = bg
    self.height     = height
    self.space      = space
end

---getBg
-- get the background image of all the container returned
--@return bg the background image of all the container returned
function SeparateHoriLayoutbis:getBg()
    return self.bg
end


---getHeight
-- get the height of each container part returned
--@return height height of each container part returne
function SeparateHoriLayoutbis:getHeight()
    return self.height
end

---getNbrContainer
-- get the nomber of container make with this layout, depending on the option
--@param dimy height of the parent container
--@return the nomber of container make with this layout, depending on the option
function SeparateHoriLayoutbis:getNbrContainer()
    return 2
end

---calculDimY
--calcul the dimention Y of the first container
function SeparateHoriLayoutbis:calculDimY2()
    return self:getHeight()
end


---calculDimY
--calcul the dimention Y of the second container
function SeparateHoriLayoutbis:calculDimY1(dimy)
    return dimy-self:getHeight()
end

---calculDimX
--calcul the dimention X of both container
function SeparateHoriLayoutbis:calculDimX(dimx)
    return dimx
end

---getSpace
--the space between the differents container
--@return space the space between the differents container
function SeparateHoriLayoutbis:getSpace()
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
function SeparateHoriLayoutbis:fabric(id,Containers,dimx,dimy,x,y,compt)
    local pointerX = x
    local pointerY = y
    local containers = ArrayList.Create()
        acontainer1 = Container(1,self:getBg(),self:calculDimX(dimx),self:calculDimY1(dimy),pointerX,pointerY,mysetting[id].color)
        containers:Add(acontainer1)
        pointerY = pointerY +self:calculDimY1(dimy)+self:getSpace() 
        acontainer2 = Container(2,nil,self:calculDimX(dimx),self:calculDimY2(dimy),pointerX,pointerY,mysetting[id].color)
        containers:Add(acontainer2)
         
    
    return containers,compt
end
function SeparateHoriLayoutbis:__tostring()
    return "I am a SeparateHoriLayoutbis"
end