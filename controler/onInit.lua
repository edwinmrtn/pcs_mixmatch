
dofile("sys/lua/pcs_mixmatch/controler/onStartMixBouton.lua")
dofile("sys/lua/pcs_mixmatch/controler/onCreateMixBouton.lua")
dofile("sys/lua/pcs_mixmatch/controler/onListMixes.lua")
dofile("sys/lua/pcs_mixmatch/controler/onRegisterMixes.lua")

    --new menu
        local menu_action1 = Menu(1,"PCS Mix option ")
          --new menuList
        theMenuList    = MenuList(0);
        --new player list
        aPlayerList = PlayerList(0);

        theMenuList:addMenu(menu_action1);
        
          --new Bouton  
        --local bouton_startmix      = Bouton(4,"Start mix","","onStartMixBouton")
        local bouton_createmix     = Bouton(1,"Create","","onCreateMixBouton",nil,nil)
        local bouton_listmix       = Bouton(2,"list all mixes","","onListMixes",nil,nil)
        local bouton_registermix   = Bouton(3,"Register mixes","","onRegisterMixes",nil,nil)
        local bouton_switchteams   = Bouton(4,"Switch Team","","onSwitchTeam",nil,nil) --sur onStartMixBouton
        -- local bouton_testload      = Bouton(5,"Test Load","","onTestLoad",nil,nil) --sur onStartMixBouton
        -- local bouton_retour        = Bouton(5,"Retour","","Show",menu_action1,"PCS Mix option ") --sur onStartMixBouton
      
          --menu_action1:addBouton(bouton_startmix)
          menu_action1:addBouton(bouton_createmix)
          menu_action1:addBouton(bouton_listmix)
          menu_action1:addBouton(bouton_registermix)
          menu_action1:addBouton(bouton_switchteams)
          -- menu_action1:addBouton(bouton_retour)
-------------------------------------------------------------
        -- body
        --new menu
        local menu_action1 = Menu(1,"Create Mix - Rounds")
          --new menuList
        --local theMenuList    = MenuList(0);
        
        local bool = true
        for i=1,theMenuList:NumbersMenus() do
          if("Create Mix - Rounds" == theMenuList:getMenuList():Get(i):getTitre())then
               bool = false
          end
        end
        if (bool) then
          theMenuList:addMenu(menu_action1);
        end
          --new Bouton  
        local bouton_thirty     = Bouton(1,"15-15","30","menuUINumberPlayer",nil,nil)
        local bouton_twentyfour = Bouton(2,"12-12","24","menuUINumberPlayer",nil,nil)
        local bouton_twenty     = Bouton(3,"10-10","20","menuUINumberPlayer",nil,nil)
          
          menu_action1:addBouton(bouton_thirty)
          menu_action1:addBouton(bouton_twentyfour)
          menu_action1:addBouton(bouton_twenty)
-----------------------------------------------------------------------



    -- body
      --new menu
        local menu_action1 = Menu(1,"Create Mix - Nombers of player")
            --new menuList
        --local theMenuList    = MenuList(0);
        
        local bool = true
        for i=1,theMenuList:NumbersMenus() do
          if("Create Mix - Nombers of player" == theMenuList:getMenuList():Get(i):getTitre())then
               bool = false
          end
        end
        if (bool) then
          theMenuList:addMenu(menu_action1);
        end
          --new Bouton  
        local bouton_ten     = Bouton(1,"5 vs 5","10","menuUIMap",nil,nil)
        local bouton_eight   = Bouton(2,"4 vs 4","8","menuUIMap",nil,nil)
        local bouton_six     = Bouton(3,"3 vs 3","6","menuUIMap",nil,nil)
        local bouton_four    = Bouton(4,"2 vs 2","4","menuUIMap",nil,nil)
        local bouton_two     = Bouton(5,"1 vs 1","2","menuUIMap",nil,nil)
          
          menu_action1:addBouton(bouton_ten)
          menu_action1:addBouton(bouton_eight)
          menu_action1:addBouton(bouton_six)
          menu_action1:addBouton(bouton_four)
          menu_action1:addBouton(bouton_two)
-----------------------------------------------------------------------------



  -- body
      --new menu
        local menu_action1 = Menu(1,"Create Mix - Map")
            --new menuList
        --local theMenuList    = MenuList(0);
        
        local bool = true
        for i=1,theMenuList:NumbersMenus() do
          if("Create Mix - Map" == theMenuList:getMenuList():Get(i):getTitre())then
               bool = false
          end
        end
        if (bool) then
          theMenuList:addMenu(menu_action1);
        end
          --new Bouton  
        -- local bouton_dust     = Bouton(1,"de_dust","de_dust","menuUITillEnd",nil,nil)
        -- local bouton_office   = Bouton(2,"de_office","de_office","menuUITillEnd",nil,nil)
          
       --    menu_action1:addBouton(bouton_dust)
       --    menu_action1:addBouton(bouton_office)
        local BinaryFormat = package.cpath:match("%p[\\|/]?%p(%a+)")
        if BinaryFormat == "dll" then --windows
            local cptmap = 1
            local bouton_map = "de_dust"
            local bouton_espace    = nil
            local bouton_retour    = nil

            for maps in io.popen([[dir ".\maps\*map" /b ]]):lines() do
              if cptmap%6 == 0 then
                 bouton_map     = Bouton(6,string.sub(maps,0,-5),string.sub(maps,0,-5),"menuUITillEnd",nil,nil)
              else  
                 bouton_map     = Bouton(cptmap%6,string.sub(maps,0,-5),string.sub(maps,0,-5),"menuUITillEnd",nil,nil)
              end 
              menu_action1:addBouton(bouton_map)
              cptmap = cptmap + 1 
            end
            if cptmap%6 == 0 then
              bouton_espace    = Bouton(6,"","","",nil,nil) --sur onStartMixBouton
            else
              bouton_espace    = Bouton(cptmap%6,"","","",nil,nil) --sur onStartMixBouton
            end 
              cptmap = cptmap + 1
            if cptmap%6 == 0 then
               bouton_retour    = Bouton(6,"Back","","Show",menu_action1,"Create Mix - Map1") --sur onStartMixBouton
            else
               bouton_retour    = Bouton(cptmap%6,"Back","","Show",menu_action1,"Create Mix - Map1")
            end
            menu_action1:addBouton(bouton_espace)
            menu_action1:addBouton(bouton_retour)

        elseif BinaryFormat == "so" then --linux
            local cptmap = 1
            for maps in io.popen('ls "./maps/*map"'):lines() do
              if cptmap%6 == 0 then
                 bouton_map     = Bouton(6,string.sub(maps,0,-5),string.sub(maps,0,-5),"menuUITillEnd",nil,nil)
              else  
                 bouton_map     = Bouton(cptmap%6,string.sub(maps,0,-5),string.sub(maps,0,-5),"menuUITillEnd",nil,nil)
              end 
              menu_action1:addBouton(bouton_map)
              cptmap = cptmap + 1 
            end
            if cptmap%6 == 0 then
              bouton_espace    = Bouton(6,"","","",nil,nil) --sur onStartMixBouton
            else
              bouton_espace    = Bouton(cptmap%6,"","","",nil,nil) --sur onStartMixBouton
            end 
              cptmap = cptmap + 1
            if cptmap%6 == 0 then
               bouton_retour    = Bouton(6,"Back","","Show",menu_action1,"Create Mix - Map1") --sur onStartMixBouton
            else
               bouton_retour    = Bouton(cptmap%6,"Back","","Show",menu_action1,"Create Mix - Map1")
            end
            menu_action1:addBouton(bouton_espace)
            menu_action1:addBouton(bouton_retour)
        end
        BinaryFormat = nil

------------------------------------------------------------------------

   
  -- body
      --new menu
        local menu_action1 = Menu(1,"Create Mix - Till End?")
            --new menuList
        --local theMenuList    = MenuList(0);
        
        local bool = true
        for i=1,theMenuList:NumbersMenus() do
          if("Create Mix - Till End?" == theMenuList:getMenuList():Get(i):getTitre())then
               bool = false
          end
        end
        if (bool) then
          theMenuList:addMenu(menu_action1);
        end
          --new Bouton  
        local bouton_yes     = Bouton(1,"Yes",true,"menuUIKnifeRound",nil,nil)
        local bouton_no      = Bouton(2,"No",false,"menuUIKnifeRound",nil,nil)
          
          menu_action1:addBouton(bouton_yes)
          menu_action1:addBouton(bouton_no)

--------------------------------------------------------------------------------
   
  -- body
      --new menu
        local menu_action1 = Menu(1,"Create Mix - Knife round?")
            --new menuList
        --local theMenuList    = MenuList(0);
        
        local bool = true
        for i=1,theMenuList:NumbersMenus() do
          if("Create Mix - Knife round?" == theMenuList:getMenuList():Get(i):getTitre())then
               bool = false
          end
        end
        if (bool) then
          theMenuList:addMenu(menu_action1);
        end
          --new Bouton  
        local bouton_yes     = Bouton(1,"Yes",true,"menuSummary",nil,nil)
        local bouton_no      = Bouton(2,"No",false,"menuSummary",nil,nil)
          
          menu_action1:addBouton(bouton_yes)
          menu_action1:addBouton(bouton_no)

--------------------------------------------------------------------------------
 
  

------------------------------------------------------------------------------------------------------
    
    	



