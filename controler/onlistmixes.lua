--------
--Event on the "Listmix" Button from main menu 
--
--Does print a menu with the different mix which exist
--
--Return a message if there is no mixes
--

---onListMixes
--Does print a menu with the different mix which exist
--Return a message if there is no mixes
--@param id of the player
function onListMixes(id)
	for i=1,theMenuList:NumbersMenus() do
        if("List Mix" == theMenuList:getMenuList():Get(i):getTitre())then
            theMenuList:getMenuList():Get(i):Refresh()
            if (aMixList:NumbersMixs() == 0)then 
                 parse("msg Error : No mixes found")
            else
                for j=1,aMixList:NumbersMixs() do
                    local button     = button(1,"("..aMixList:getMixList():Get(j):showString().." | "..aMixList:getMixList():Get(j):getNumberRegist().."/"..aMixList:getMixList():Get(j):getNomberPlayers()..")","",nil)
                    theMenuList:getMenuList():Get(i):addButton(button)
                end
                theMenuList:getMenuList():Get(i):Show(id)
            end
        end
    end	
end