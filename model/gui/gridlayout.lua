--------
--@classmod GUI.GridLayout
--This is a GridLayout
--
--Public class GridLayout
GridLayout = newclass("GridLayout")

---Constructors
--@param id id of the layout
--@param bg background object image 
--@param div  number of vertical division the parent container will be separate 
--@param height  height of each container part returned
--@param space space separating the different container returned
function GridLayout:init(Id,bg,div,height,space)
	self.Id         = Id
    self.bg         = bg
    self.div        = div
    self.height     = height
    self.space      = space
end

---getDiv
-- get the number of vertical division the parent container will be separate 
--@return div the number of vertical division the parent container will be separate 
function GridLayout:getDiv()
    return self.div
end

---getBg
-- get the background image of all the container returned
--@return bg the background image of all the container returned
function GridLayout:getBg()
    return self.bg
end

---getHeight
-- get the height of each container part returned
--@return height height of each container part returned
function GridLayout:getHeight()
    return self.height
end

---getAjustementSpace
-- get the right position depending the space between the differents container
--@param dimy height of the parent container
--@return the right position depending the space between the differents container
function GridLayout:getAjustementSpace(dimy)
    return  (math.floor(dimy/self:getHeight())/self:getDiv())*self:getSpace()
end

---getNbrContainer
-- get the nomber of container make with this layout, depending on the option
--@param dimy height of the parent container
--@return the nomber of container make with this layout, depending on the option
function GridLayout:getNbrContainer(dimy)
    return self:getDiv()*math.floor((dimy-self:getAjustementSpace(dimy))/self:getHeight())
end

---calculDimY
--calcul the dimention Y of the container
function GridLayout:calculDimY()
    return self:getHeight()
end 

---calculDimX
--calcul the dimention X of the container
function GridLayout:calculDimX(dimx)
    return math.floor(dimx/self:getDiv())
end

---getSpace
--the space between the differents container
--@return space the space between the differents container
function GridLayout:getSpace()
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