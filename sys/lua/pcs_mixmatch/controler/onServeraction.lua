
dofile("sys/lua/pcs_mixmatch/model/menu.lua")
dofile("sys/lua/pcs_mixmatch/model/bouton.lua")
dofile("sys/lua/pcs_mixmatch/model/arrayList.lua")
dofile("sys/lua/pcs_mixmatch/model/menuList.lua")
dofile("sys/lua/pcs_mixmatch/controler/onStartMixBouton.lua")
dofile("sys/lua/pcs_mixmatch/controler/onCreateMixBouton.lua")
dofile("sys/lua/pcs_mixmatch/controler/onListMixes.lua")
dofile("sys/lua/pcs_mixmatch/controler/onRegisterMixes.lua")

addhook("serveraction", "onServeraction")
function onServeraction(id, action)
    if (action == 1) then
        
    		--new menu
    	  local menu_action1 = Menu(1,"PCS Mix option")
    	  	--new menuList
    	  local theMenuList    = MenuList(0);

        local bool = true
        for i=1,theMenuList:NumbersMenus() do
          if("PCS Mix option" == theMenuList:getMenuList():Get(i):getTitre())then
    	         bool = false
          end
        end
        if (bool) then
          theMenuList:addMenu(menu_action1);
        end
        
    	    --new Bouton	
    	 -- local bouton_startmix      = Bouton(4,"Start mix","","onStartMixBouton")
    	  local bouton_createmix     = Bouton(1,"Create","","onCreateMixBouton")
        local bouton_listmix       = Bouton(2,"list all mixes","","onListMixes")
        local bouton_registermix   = Bouton(3,"Register mixes","","onRegisterMixes")
        local bouton_switchteams   = Bouton(4,"Switch Team","","onSwitchTeam") --sur onStartMixBouton
        
         -- menu_action1:addBouton(bouton_startmix)
          menu_action1:addBouton(bouton_createmix)
          menu_action1:addBouton(bouton_listmix)
          menu_action1:addBouton(bouton_registermix)
          menu_action1:addBouton(bouton_switchteams)
    	  menu(id,menu_action1:Show())
     end
end