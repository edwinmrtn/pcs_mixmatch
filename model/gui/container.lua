
--Public class Container
Container = newclass("Container")

--Constructors
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

--Methods
function Container:getTitre()
    return self.Titre
end
function Container:setTitre(titre)
    self.Titre = titre
end
function Container:getIdText()
    return self.idText
end
function Container:setIdText(idText)
    self.idText = idText
end
function Container:getIdImage()
    return self.idImage
end
function Container:setIdImage(idimage)
    self.idImage = idimage
end
function Container:getId()
    return self.Id
end
function Container:getImage()
    return self.Image
end
function Container:getDimX()
    return self.dimx
end
function Container:getDimY()
    return self.dimy
end
function Container:getX()
    return self.x
end
function Container:getY()
    return self.y
end

function Container:getContainers()
    return self.Containers
end
function Container:setContainers(Container)
    self.Containers = Container
end
function Container:NumbersContainers()
    return self:getContainers():Size()
end

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
function Container:coorYtitle()
    local coord=self:getY()-(self:getImage():getdimY()/2)
    return coord
end
function Container:coorXtitle()
    local coord=self:getX()-(self:getImage():getdimX()/2)
    return coord + 10
end  
function Container:NumbersElements()
    return self:getElements():Size()
end
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

function Container:__tostring()
    return "I am a Container"
end

