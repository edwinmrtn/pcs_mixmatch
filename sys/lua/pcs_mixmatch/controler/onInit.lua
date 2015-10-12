
dofile("sys/lua/pcs_mixmatch/controler/onStartMixBouton.lua")
dofile("sys/lua/pcs_mixmatch/controler/onCreateMixBouton.lua")
dofile("sys/lua/pcs_mixmatch/controler/onListMixes.lua")
dofile("sys/lua/pcs_mixmatch/controler/onRegisterMixes.lua")

    --new menu
        local menu_action1 = Menu(1,"PCS Mix option ")
          --new menuList
        theMenuList    = MenuList(0);

        theMenuList:addMenu(menu_action1);
        msg(theMenuList:NumbersMenus())
        
          --new Bouton  
       -- local bouton_startmix      = Bouton(4,"Start mix","","onStartMixBouton")
        local bouton_createmix     = Bouton(1,"Create","","onCreateMixBouton",nil,nil)
        local bouton_listmix       = Bouton(2,"list all mixes","","onListMixes",nil,nil)
        local bouton_registermix   = Bouton(3,"Register mixes","","onRegisterMixes",nil,nil)
        local bouton_switchteams   = Bouton(4,"Switch Team","","onSwitchTeam",nil,nil) --sur onStartMixBouton
        local bouton_testload      = Bouton(5,"Test Load","","onTestLoad",nil,nil) --sur onStartMixBouton
        local bouton_retour        = Bouton(5,"Retour","","Show",menu_action1,"PCS Mix option ") --sur onStartMixBouton
      
         -- menu_action1:addBouton(bouton_startmix)
          menu_action1:addBouton(bouton_createmix)
          menu_action1:addBouton(bouton_listmix)
          menu_action1:addBouton(bouton_registermix)
          menu_action1:addBouton(bouton_switchteams)
          menu_action1:addBouton(bouton_testload)
          menu_action1:addBouton(bouton_testload)
          menu_action1:addBouton(bouton_testload)
          menu_action1:addBouton(bouton_testload)
          menu_action1:addBouton(bouton_testload)
          menu_action1:addBouton(bouton_testload)
          menu_action1:addBouton(bouton_testload)
          menu_action1:addBouton(bouton_testload)
          menu_action1:addBouton(bouton_testload)
          menu_action1:addBouton(bouton_testload)
          menu_action1:addBouton(bouton_testload)
          menu_action1:addBouton(bouton_testload)
          menu_action1:addBouton(bouton_retour)

    	

-- addhook("ms100","ms")
-- function ms()
--   msg(theMenuList:NumbersMenus())
-- end

