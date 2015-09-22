
dofile("sys/lua/pcs_mixmatch/model/mix.lua")
dofile("sys/lua/pcs_mixmatch/model/mixList.lua")
dofile("sys/lua/pcs_mixmatch/model/arrayList.lua")
function onListMixes(id)
	--new menu
    local menu_action1 = Menu(1,"List Mix")
    --new menuList
    local theMenuList    = MenuList(0);
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
    for i=1,aMixList:NumbersMixs() do
	    --new Bouton	
	    local bouton     = Bouton(1,"("..aMixList:getMixList():Get(i):showString().." | "..aMixList:getMixList():Get(i):getNumberRegist().."/"..aMixList:getMixList():Get(i):getNomberPlayers()..")","","")
	    menu_action1:addBouton(bouton)
	end
	menu(id,menu_action1:Show())
	
		
	
end