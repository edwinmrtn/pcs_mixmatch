
function onListMixes(id)
	--new menu
    local menu_action1 = Menu(1,"List Mix")
    --new menuList
    --local theMenuList    = MenuList(0);
    local bool = true
    for i=1,theMenuList:NumbersMenus() do
        if("List Mix" == theMenuList:getMenuList():Get(i):getTitre())then
    	        bool = false
        end
    end
    if (bool) then
        theMenuList:addMenu(menu_action1);
    end
    local aMixList    = MixList(0);
    
    if (aMixList:NumbersMixs() == 0)then 
        parse("msg Error : No mixes found")
    else
        for i=1,aMixList:NumbersMixs() do
    	    --new Bouton	
    	    local bouton     = Bouton(1,"("..aMixList:getMixList():Get(i):showString().." | "..aMixList:getMixList():Get(i):getNumberRegist().."/"..aMixList:getMixList():Get(i):getNomberPlayers()..")","","",nil,nil)
    	    menu_action1:addBouton(bouton)
    	end
	menu_action1:Show(id)
	end
		
	
end