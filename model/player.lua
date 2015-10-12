dofile("sys/lua/pcs_mixmatch/model/object.lua")
dofile("sys/lua/pcs_mixmatch/model/menu.lua")
dofile("sys/lua/pcs_mixmatch/model/bouton.lua")
dofile("sys/lua/pcs_mixmatch/model/menuList.lua")

--Public class Player
Player = newclass("Player")

--Constructors
function Player:init(Id,USGN,Rank,Name,IP)
	self.Id             = Id
	self.USGN           = USGN
	self.Rank           = Rank
	self.Name           = Name
	self.IP             = IP
  self.CreateMixArray = {}
end


--createMixArray.rounds
--createMixArray.nombersplayers
--createMixArray.map
--createMixArray.tillend
--createMixArray.kniferound

--Methods
function Player:getId()
    return self.Id
end
function Player:getUSGN()
    return self.USGN
end
function Player:getCreateMixArray()
  return self.CreateMixArray
end

function Player:getRank()
    return self.Rank
end

function Player:getName()
    return self.Name
end

function Player:getTeam()
    return self.Team
end

function Player:stripWeapon(weaponid)
	 parse(" strip "..self:getId()..' '..weaponid)
end
function Player:chooseteam()
            --new menu
          local menu_chooseteam = Menu(2,"Choose your team")
            --new menuList
--          local themenuList    = MenuList(0);
           themenuList:addMenu(menu_chooseteam);

            --new Bouton    
          local bouton_voteterro = Bouton(1,"Terrorists","voteforterro",nil,nil)
          local bouton_votecounter = Bouton(2,"Counter-Terrorists","voteforcounter",nil,nil)

          local bouton_cancel = Bouton(0,"","",nil,nil)

          menu_chooseteam:addBouton(bouton_voteterro)
          menu_chooseteam:addBouton(bouton_votecounter)
          menu_chooseteam:addBouton(bouton_cancel)

          menu_chooseteam:Show(self:getId())
end

function Player:getIP()
    return self.IP
end
function Player:__tostring()
    return "I am a Player"
end

