--------
--@classmod GUI.LinearHoriLayout
--This is a LinearHoriLayout
--
--Public class LinearHoriLayout
LinearHoriLayout = newclass("LinearHoriLayout")

---Constructors
--@param id id of the layout
--@param bg background object image 
--@param div  number of vertical division the parent container will be separate 
--@param space space separating the different container returned
function LinearHoriLayout:init(Id,bg,div,space)
	self.Id         = Id
    self.bg         = bg
    self.div        = div
    self.space      = space
end

---getDiv
-- get the number of vertical division the parent container will be separate 
--@return div the number of vertical division the parent container will be separate 
function LinearHoriLayout:getDiv()
    return self.div
end

---getBg
-- get the background image of all the container returned
--@return bg the background image of all the container returned
function LinearHoriLayout:getBg()
    return self.bg
end

---getNbrContainer
-- get the nomber of container make with this layout, depending on the option
--@param dimy height of the parent container
--@return the nomber of container make with this layout, depending on the option
function LinearHoriLayout:getNbrContainer()
    return self:getDiv()
end

---calculDimY
--calcul the dimention Y of the container
function LinearHoriLayout:calculDimY(dimy)
    return math.floor((dimy-(self:getDiv()*self:getSpace()))/self:getDiv())
end 

---calculDimX
--calcul the dimention X of the container
function LinearHoriLayout:calculDimX(dimx)
    return dimx
end

---getSpace
--the space between the differents container
--@return space the space between the differents container
function LinearHoriLayout:getSpace()
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
function LinearHoriLayout:fabric(id,Containers,dimx,dimy,x,y,compt)
    local pointerX = x
    local pointerY = y
    local containers = ArrayList.Create()
    for i= 1, self:getNbrContainer() do
        acontainer = Container(i,self:getBg(),self:calculDimX(dimx),self:calculDimY(dimy),pointerX,pointerY,nil)
        containers:Add(acontainer)
        pointerY = pointerY +self:calculDimY(dimy)+self:getSpace()  
    end 
    return containers,compt
end
function LinearHoriLayout:__tostring()
    return "I am a LinearHoriLayout"
end