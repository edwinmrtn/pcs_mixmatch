
function onRegisterMixes(id)
local Player
for i= 1, aPlayerList:NumbersPlayers() do
    if (aPlayerList:getPlayerList():Get(i):getId() == id) then
        Player = aPlayerList:getPlayerList():Get(i)
    end
end
for i=1,theMenuList:NumbersMenus() do
        if("Register Mix" == theMenuList:getMenuList():Get(i):getTitre())then
            theMenuList:getMenuList():Get(i):Refresh()
            if (aMixList:NumbersMixs() == 0)then 
                 parse("msg Error : No mixes found")
            else
                for j=1,aMixList:NumbersMixs() do
                    local mix = aMixList:getMixList():Get(j)
                    local bouton     = Bouton(j,""..aMixList:getMixList():Get(j):showString().." | "..aMixList:getMixList():Get(j):getNumberRegist().."/"..aMixList:getMixList():Get(j):getNomberPlayers().."","","onRegisterMixes",mix,":addRegistPlayer",Player)
                    theMenuList:getMenuList():Get(i):addBouton(bouton)
                end
                theMenuList:getMenuList():Get(i):Show(id)
            end
        end
    end 
end