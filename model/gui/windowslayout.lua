--------
--@classmod GUI.WindowsLayout
--This is a WindowsLayout
--
--Public class WindowsLayout
WindowsLayout = newclass("WindowsLayout")

---Constructors
--@param id id of the layout
--@param titre title of the container
function WindowsLayout:init(Id,titre)
	self.Id           = Id
    self.titre        = titre
end

---Constructors
--get the title of the container
--@return titre
function WindowsLayout:getTitre()
    return self.titre
end 

---fabric
--create and return containers
--@param id id player
--@param Containers not used ? 
--@param dimx dimension x
--@param dimy dimension y
--@param compt idtext
--@return create and return containers
function WindowsLayout:fabric(id,Containers,dimx,dimy,x,y,compt)
	local pointerX
	local pointerY
    pointerX = x-(dimx/2)+10
	pointerY = y-(dimy/2)
    parse('hudtxt2 '..id..' '..compt..' "©255255255'..self:getTitre()..'" '..pointerX..' '..pointerY..' 0')
    compt = compt +1
    local acontainer = Container(1,nil,dimx-10,dimy-30,pointerX,pointerY+30,nil)
    containers = ArrayList.Create()
    containers:Add(acontainer)
    return containers,compt,self:getTitre()
end
function WindowsLayout:__tostring()
    return "I am a WindowsLayout"
end