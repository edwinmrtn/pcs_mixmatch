---------------------------------------------------
--Event on the "Leavemix" Button from main menu 
--
--Does print a menu with the different mix the player is registered in
--
--Return a message if the player isn't registered in any mix or if these if 0 mixes
--
--

---onLeaveMixes
--Does print a menu with the different mix the player is registered in
--Return a message if the player isn't registered in any mix or if these if 0 mixes
--@param id of the player
function onLeaveMixes(id)
    for i=1,theMenuList:NumbersMenus() do
        if("Leave Mixes" == theMenuList:getMenuList():Get(i):getTitre())then
    	    theMenuList:getMenuList():Get(i):Refresh()
            if (aMixList:NumbersMixs() == 0)then 
                 parse("msg Error : No mixes found")
            else
                local cptMixPlayerIn=0
                for j=1,aMixList:NumbersMixs() do
                    for k=1, aMixList:getMixList():Get(j):getNumberRegist() do
                        if (id == aMixList:getMixList():Get(j):getRegistPlayers():Get(k):getId()) then
                            cptMixPlayerIn=cptMixPlayerIn+1
                            local mix = aMixList:getMixList():Get(j)
                            local arrayOb = {{mix,":playerLeave",id}}
                            local button     = button(cptMixPlayerIn,""..aMixList:getMixList():Get(j):showString().." | "..aMixList:getMixList():Get(j):getNumberRegist().."/"..aMixList:getMixList():Get(j):getNomberPlayers().."","","onLeaveMixes",arrayOb)
                            theMenuList:getMenuList():Get(i):addButton(button)
                        end
                    end 
                end
                if (cptMixPlayerIn>0) then
                    theMenuList:getMenuList():Get(i):Show(id)
                    
                else
                    parse("msg Error : You are not registered in any mixes")
                end
            end
        end
    end
end