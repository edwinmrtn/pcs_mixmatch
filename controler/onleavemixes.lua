
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
                            local bouton     = Bouton(cptMixPlayerIn,""..aMixList:getMixList():Get(j):showString().." | "..aMixList:getMixList():Get(j):getNumberRegist().."/"..aMixList:getMixList():Get(j):getNomberPlayers().."","","onLeaveMixes",mix,":playerLeave",id)
                            theMenuList:getMenuList():Get(i):addBouton(bouton)
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