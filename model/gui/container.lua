--------
--@classmod GUI.Container
--
--

--Public class Container
Container = newclass("Container")

---Constructors
--@param id id of the container
--@param image object image
--@param dimx  width of the container 
--@param diny  height of the container
--@param x horizontal position in pixel of the corner up left of the contaier
--@param y vertical position in pixel of the corner up left of the contaier
function Container:init(Id,image,dimx,dimy,x,y)
	self.Id          = Id
    self.titre       = nil
    self.Image       = image
    self.dimx        = dimx
    self.dimy        = dimy
    self.x           = x
    self.y           = y
    self.Containers  = ArrayList.Create()
    self.idImage     = nil
    self.idText      = nil
end

---getTitre
-- a container have a title only if it's the main container
--@return Titre title of the container - can be nil 
function Container:getTitre()
    return self.Titre
end

---setTitre
--set the title of the container
--@param titre the title of the container 
function Container:setTitre(titre)
    self.Titre = titre
end

---getIdText
-- get the id of the element text if exist
--@return idText id of the element text if exist
function Container:getIdText()
    return self.idText
end


---setIdText
-- set the id of the used text in the container
--@param idText the id of the used text in the container
function Container:setIdText(idText)
    self.idText = idText
end

---getIdImage
-- get the id of the element image if exist
--@return idImage id of the element image if exist
function Container:getIdImage()
    return self.idImage
end

---setIdImage
--set the idimage to save it
--@param idimage id returned when the image cs2d function is called
function Container:setIdImage(idimage)
    self.idImage = idimage
end

---getId
-- get the id of the container 
--@return Id id of the container
function Container:getId()
    return self.Id
end

---getImage
-- get the image of the container - can be nil 
--@return Image Image object 
function Container:getImage()
    return self.Image
end

---getDimX
-- get the width of the container
--@return dimx width of the container
function Container:getDimX()
    return self.dimx
end

---getDimY
--get the height of the container
--@return dimy height container 
function Container:getDimY()
    return self.dimy
end

---getX
--get the horizontal position of cursor 
--@return x position of cursor x 
function Container:getX()
    return self.x
end

---getY
--get the vertical position of cursor
--@return y position of cursor y 
function Container:getY()
    return self.y
end


---getContainers
--get the list of all container inside this container
--@return Containers
function Container:getContainers()
    return self.Containers
end

---setContainers
--get a list of containers inside this container
--@param Container
function Container:setContainers(Container)
    self.Containers = Container
end

---NumbersContainers
--get the the number of contrainers this container have
--@return the number of contrainers this container have
function Container:NumbersContainers()
    return self:getContainers():Size()
end

---addElement
--add an element inside the container, this element can be an image or a text
--@param id id of the player
--@param Element 
--@param cpt
function Container:addElement(id,Element,cpt)

    if(tostring(Element) == "I am an Image")then
        if(Element:getResize()) then
            idimage = image(Element:getPathImage(),self:getX()+(self:getDimX()/Element:getDimX()*Element:getDimX()/2),self:getY()+(self:getDimY()/Element:getDimY()*Element:getDimY()/2),2,id) 
            local coefscaleX= self:getDimX()/Element:getDimX()
            local coefscaleY= self:getDimY()/Element:getDimY()
            imagescale(idimage,coefscaleX,coefscaleY)
            self:setIdImage(idimage)
        else
            idimage = image(Element:getPathImage(),self:getX(),self:getY(),2,id) 
            self:setIdImage(idimage)
        end
    else
        parse('hudtxt2 '..id..' '..cpt..' "©255255255'..Element..'" '..self:getX()..' '..self:getY()..' 0')
        self:setIdText(cpt)
    end 
   
    return cpt+1
end

---coorYtitle
--calcul the coordonate Y of the title - if there are a title
function Container:coorYtitle()
    local coord=self:getY()-(self:getImage():getdimY()/2)
    return coord
end

---coorXtitle
--calcul the coordonate X of the title - if there are a title
function Container:coorXtitle()
    local coord=self:getX()-(self:getImage():getdimX()/2)
    return coord + 10
end 

---NumbersElements
--get the number of elements this container have - note- should/must be == 1 
function Container:NumbersElements()
    return self:getElements():Size()
end

---createLayout
--create containers from layout passed in parametters 
--@param id id of the player
--@param Layout object layout 
--@param cpt cpt is idtext
function Container:createLayout(id,Layout,cpt)
    local dimx
    local dimy
    local pointerY
    local pointerX

    local cpte,titre
    containers,cpte,titre = Layout:fabric(id,self:getContainers(),self:getDimX(),self:getDimY(),self:getX(),self:getY(),cpt)
    self:setContainers(containers)
    self:setIdText(cpte-1)
    self:setTitre(titre)
    if(self:getImage() ~= nil) then
        if(self:getImage():getResize())then 
            idimage = image(self:getImage():getPathImage(),self:getX()+(self:getDimX()/self:getImage():getDimX()*self:getImage():getDimX()/2),self:getY()+(self:getDimY()/self:getImage():getDimY()*self:getImage():getDimY()/2),2,id) 
            local coefscaleX= self:getDimX()/self:getImage():getDimX()
            local coefscaleY= self:getDimY()/self:getImage():getDimY()
            imagescale(idimage,coefscaleX,coefscaleY)
            self:setIdImage(idimage)
        else
            idimage = image(self:getImage():getPathImage(),self:getX(),self:getY(),2,id)
            self:setIdImage(idimage)
        end
    end
    return cpte
end

---off
--recursively delete all the elements from the differents container
--self delete if the container is the main container 
--@param id id of the player
function Container:off(id)

    if(self:getTitre() ~= nil)then
        aHeadContainerList:removeHeadContainer(self)
    end
    if(self:NumbersContainers()==0)then
        if(self:getIdImage() ~= nil)then         
            freeimage(self:getIdImage())
        elseif(self:getIdText() ~= nil)then
            parse('hudtxt2 '..id..' '..self:getIdText())
        end
    end
    for i=1, self:NumbersContainers() do
        if(self:getIdImage() ~= nil)then 
            freeimage(self:getIdImage())
        end
        if(self:getIdText() ~= nil)then
            parse('hudtxt2 '..id..' '..self:getIdText())
        end
        self:getContainers():Get(i):off(id)
    end
end 


---__tostring
--simple basic to string function 
function Container:__tostring()
    return "I am a Container"
end

