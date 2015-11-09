
--Public class Image
Image = newclass("Image")

--Constructors
function Image:init(Id,pathImage,dimx,dimy,resize)
	self.Id          = Id
    self.pathImage   = pathImage
    self.dimx        = dimx
    self.dimy        = dimy
    self.Resize      = resize
end

--Methods
function Image:getId()
    return self.Id
end
function Image:getPathImage()
    return self.pathImage
end
function Image:getDimX()
    return self.dimx
end
function Image:getDimY()
    return self.dimy
end
function Image:getResize()
    return self.Resize
end

function Image:__tostring()
    return "I am an Image"
end

