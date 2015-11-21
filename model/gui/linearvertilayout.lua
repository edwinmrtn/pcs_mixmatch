--------
--@classmod GUI.LinearVertiLayout
--This is a LinearVertiLayout
--
--Public class LinearVertiLayout
LinearVertiLayout = newclass("LinearVertiLayout")

---Constructors
--@param id id of the layout
--@param bg background object image 
--@param div  number of vertical division the parent container will be separate 
--@param space space separating the different container returned
function LinearVertiLayout:init(Id,bg,div,space)
	self.Id         = Id
    self.bg         = bg
    self.div        = div
    self.space      = space
end

---getDiv
-- get the number of vertical division the parent container will be separate 
--@return div the number of vertical division the parent container will be separate 
function LinearVertiLayout:getDiv()
    return self.div
end

---getBg
-- get the background image of all the container returned
--@return bg the background image of all the container returned
function LinearVertiLayout:getBg()
    return self.bg
end

---getNbrContainer
-- get the nomber of container make with this layout, depending on the option
--@param dimy height of the parent container
--@return the nomber of container make with this layout, depending on the option
function LinearVertiLayout:getNbrContainer()
    return self:getDiv()
end

---calculDimY
--calcul the dimention Y of the container
function LinearVertiLayout:calculDimY(dimy)
    return dimy

end

---calculDimX
--calcul the dimention X of the container 
function LinearVertiLayout:calculDimX(dimx)
    return math.floor((dimx-(self:getDiv()*self:getSpace()))/self:getDiv())
end

---getSpace
--the space between the differents container
--@return space the space between the differents container
function LinearVertiLayout:getSpace()
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
function LinearVertiLayout:fabric(id,Containers,dimx,dimy,x,y,compt)
    local pointerX = x
    local pointerY = y
    local containers = ArrayList.Create()
    for i= 1, self:getNbrContainer() do
        acontainer = Container(i,self:getBg(),self:calculDimX(dimx),self:calculDimY(dimy),pointerX,pointerY,mysetting[id].color)
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