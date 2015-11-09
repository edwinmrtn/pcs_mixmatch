
function onRegisterMixes(id,unbutton,menu)
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
                local VIEWcontainer = VIEWlistmix(id)
                bool = false
                if(aMixList:NumbersMixs()>=4)then
                            bool = false
                    else
                            bool = true
                end
                local mix
                local spacebuttons
                local aconfirbutton=nil
                for j=1,aMixList:NumbersMixs() do
                    
                    local abutton
                   if(menu:getTitre()=="Register Mix")then
                        
                        if (unbutton == j)then
                            mix          = aMixList:getMixList():Get(j)
                            local arrayOb = {{VIEWcontainer,":off",id}}
                            abutton      = button(j,"("..aMixList:getMixList():Get(j):getMap().." | "..aMixList:getMixList():Get(j):getNumberRegist().."/"..aMixList:getMixList():Get(j):getNomberPlayers()..")","","onRegisterMixes",arrayOb)
                        else
                            local arrayOb = {{VIEWcontainer,":off",id}}
                            abutton     = button(j,""..aMixList:getMixList():Get(j):getMap().." | "..aMixList:getMixList():Get(j):getNumberRegist().."/"..aMixList:getMixList():Get(j):getNomberPlayers().."","","onRegisterMixes",arrayOb)
                        end
                        theMenuList:getMenuList():Get(i):addButton(abutton)

                    else
                    local arrayOb = {{VIEWcontainer,":off",id}}
                    abutton     = button(j,""..aMixList:getMixList():Get(j):getMap().." | "..aMixList:getMixList():Get(j):getNumberRegist().."/"..aMixList:getMixList():Get(j):getNomberPlayers().."","","onRegisterMixes",arrayOb)
                    theMenuList:getMenuList():Get(i):addButton(abutton)
                    end

                    if(menu:getTitre()=="Register Mix" and mix ~= nil)then
                            if(bool == false)then
                                    if(4 == j) then
                                    spacebutton       = button(5,"","","",nil) 
                                    local arrayOb = {{VIEWcontainer,":off",id},{mix,":addRegistPlayer",Player},{mix,":checkStartMix",id}}
                                    aconfirbutton     = button(6,"confirmer","","onRegisterMixes",arrayOb)  
                                    theMenuList:getMenuList():Get(i):addButton(spacebutton)
                                    theMenuList:getMenuList():Get(i):addButton(aconfirbutton)
                                    end
                            end
                    end
                
                end

                    if(menu:getTitre()=="Register Mix" and mix ~= nil)then
                        if(bool) then
                            local arrayOb = {{VIEWcontainer,":off",id},{mix,":addRegistPlayer",Player},{mix,":checkStartMix",id}}
                            spacebutton       = button(aMixList:NumbersMixs()+1,"","","",nil)  
                            aconfirbutton     = button(aMixList:NumbersMixs()+2,"confirmer","","onRegisterMixes",arrayOb)
                            theMenuList:getMenuList():Get(i):addButton(spacebutton)
                            theMenuList:getMenuList():Get(i):addButton(aconfirbutton)
                        end
                    end
                local arrayOb = {{VIEWcontainer,":off",id}}
                cancelbutton     = button(0,"","","",arrayOb)
                theMenuList:getMenuList():Get(i):addButton(cancelbutton)
                theMenuList:getMenuList():Get(i):Show(id)
            end
        end
    end 
end