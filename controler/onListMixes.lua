
function onListMixes(id)
	for i=1,theMenuList:NumbersMenus() do
        if("List Mix" == theMenuList:getMenuList():Get(i):getTitre())then
            theMenuList:getMenuList():Get(i):Refresh()
            if (aMixList:NumbersMixs() == 0)then 
                 parse("msg Error : No mixes found")
            else
                for j=1,aMixList:NumbersMixs() do
                    local bouton     = Bouton(1,"("..aMixList:getMixList():Get(j):showString().." | "..aMixList:getMixList():Get(j):getNumberRegist().."/"..aMixList:getMixList():Get(j):getNomberPlayers()..")","",nil,nil,nil)
                    theMenuList:getMenuList():Get(i):addBouton(bouton)
                end
                theMenuList:getMenuList():Get(i):Show(id)
            end
        end
    end	
end