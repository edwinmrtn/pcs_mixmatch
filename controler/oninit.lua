     


       
          --new menuList
        theMenuList    = MenuList(0);
        --new player list
        aPlayerList = PlayerList(0);
        --new Mix List
        aMixList = MixList(0);

----------------------------------------------------------------------------
        --load all mixs
        aMixList:loadData()
        table.save({},"sys/lua/pcs_mixmatch/model/mixes.txt")
----------------------------------------------------------------------------
function changeMapInit()
  msg("jepassavant samere")
  for i=1,aMixList:NumbersMixs() do
          if (aMixList:getMixList():Get(i):getState() == "mapchanged") then
              parse("restart 5")
              local Teamtt = Team("t");
              local Teamct = Team("ct");
              aMixList:getMixList():Get(i):addTeam(Teamtt)
              aMixList:getMixList():Get(i):addTeam(Teamct)

              aMixList:getMixList():Get(i):makeTeams(Teamtt,Teamct)
              Teamtt:putinTeam()
              Teamct:putinTeam()

            if(aMixList:getMixList():Get(i):getKnifeRound()) then
                  aMixList:getMixList():Get(i):setState("kniferound")
              else 
                  aMixList:getMixList():Get(i):setState("side1")
                  msg("\169100255100SIDE 1@C")
                  parse("mp_startmoney 800")
                  parse("mp_roundtime 2")
                
            end
          end
  end
end
-------------------------------------------------------------------
function changeMapCheckPlayer()
  msg("jechangeMapCheckPlayer")
    for i=1,aMixList:NumbersMixs() do
          if (aMixList:getMixList():Get(i):getState() == "mapchanged") then
              local j = 1
              while j=1 <= aMixList:getMixList():Get(i):getNumberRegist() do
                if(aPlayerList:exist(aMixList:getMixList():Get(i):getRegistPlayers():Get(j))) then 
                 msg("player exist")
                else
                  aMixList:getMixList():Get(i):removeRegistPlayer(aMixList:getMixList():Get(i):getRegistPlayers():Get(j))
                  msg("player nexiste pas")
                end
                j = j + 1  
              end
              if(tonumber(aMixList:getMixList():Get(i):getNumberRegist())>=tonumber(aMixList:getMixList():Get(i):getNomberPlayers()))then
                changeMapInit()
              end
          end
    end 
                 
end 
-------------------------------------------------------------------
        for i=1,aMixList:NumbersMixs() do
          msg("k : "..aMixList:getMixList():Get(i):getState())
          if (aMixList:getMixList():Get(i):getState() == "mapchanged") then
               msg("jeTIMER")
              timer(20000,"changeMapCheckPlayer")
          end
        end

-------------------------------------------------------------------
        local menu_action1 = Menu(1,"PCS Mix option ")
        theMenuList:addMenu(menu_action1);
       
        
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
        local bouton_thirty     = Bouton(1,"15-15","30","menuUINumberPlayer",nil,nil,nil)
        local bouton_twentyfour = Bouton(2,"12-12","24","menuUINumberPlayer",nil,nil,nil)
        local bouton_twenty     = Bouton(3,"10-10","20","menuUINumberPlayer",nil,nil,nil)
        local bouton_for        = Bouton(4,"2-2","4","menuUINumberPlayer",nil,nil,nil)
          
          menu_action1:addBouton(bouton_thirty)
          menu_action1:addBouton(bouton_twentyfour)
          menu_action1:addBouton(bouton_twenty)
          menu_action1:addBouton(bouton_for)
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
        local bouton_ten     = Bouton(1,"5 vs 5","10","menuUIMap",nil,nil,nil)
        local bouton_eight   = Bouton(2,"4 vs 4","8","menuUIMap",nil,nil,nil)
        local bouton_six     = Bouton(3,"3 vs 3","6","menuUIMap",nil,nil,nil)
        local bouton_four    = Bouton(4,"2 vs 2","4","menuUIMap",nil,nil,nil)
        local bouton_two     = Bouton(5,"1 vs 1","2","menuUIMap",nil,nil,nil)
          
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
        local BinaryFormat = package.cpath:match("%p[\\|/]?%p(%a+)")
        if BinaryFormat == "dll" then --windows
            local cptmap = 1
            local bouton_map = "de_dust"
            local bouton_espace    = nil
            local bouton_retour    = nil

            for maps in io.popen([[dir ".\maps\*map" /b ]]):lines() do
              if cptmap%6 == 0 then
                 bouton_map     = Bouton(6,string.sub(maps,0,-5),string.sub(maps,0,-5),"menuUITillEnd",nil,nil,nil)

              else 
      
                 bouton_map     = Bouton(cptmap%6,string.sub(maps,0,-5),string.sub(maps,0,-5),"menuUITillEnd",nil,nil,nil)
              end 
              menu_action1:addBouton(bouton_map)
              cptmap = cptmap + 1 
            end
            if cptmap%6 == 0 then
              bouton_espace    = Bouton(6,"","",nil,nil,nil) --sur onStartMixBouton
            else
              bouton_espace    = Bouton(cptmap%6,"","",nil,nil,nil) --sur onStartMixBouton
            end 
              cptmap = cptmap + 1
            if cptmap%6 == 0 then
               bouton_retour    = Bouton(6,"Back","",nil,menu_action1,":Show","id") --sur onStartMixBouton
            else
               bouton_retour    = Bouton(cptmap%6,"Back","",nil,menu_action1,":Show","id")
            end
            menu_action1:addBouton(bouton_espace)
            menu_action1:addBouton(bouton_retour)

        elseif BinaryFormat == "so" then --linux
          --msg("jepass")
            local cptmap = 1
            for maps in io.popen('ls ./maps/*.map | xargs -n 1 basename'):lines() do
              if cptmap%6 == 0 then
                 bouton_map     = Bouton(6,string.sub(maps,0,-5),string.sub(maps,0,-5),"menuUITillEnd",nil,nil,nil)
              else  
                 bouton_map     = Bouton(cptmap%6,string.sub(maps,0,-5),string.sub(maps,0,-5),"menuUITillEnd",nil,nil,nil)
              end 
              menu_action1:addBouton(bouton_map)
              cptmap = cptmap + 1 
            end
            if cptmap%6 == 0 then
              bouton_espace    = Bouton(6,"","",nil,nil,nil) --sur onStartMixBouton
            else
              bouton_espace    = Bouton(cptmap%6,"","",nil,nil,nil) --sur onStartMixBouton
            end 
              cptmap = cptmap + 1
            if cptmap%6 == 0 then
               bouton_retour    = Bouton(6,"Back","",nil,menu_action1,":Show","id") --sur onStartMixBouton
            else
               bouton_retour    = Bouton(cptmap%6,"Back","",nil,menu_action1,":Show","id")
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
        local bouton_yes     = Bouton(1,"Yes",true,"menuUIKnifeRound",nil,nil,nil)
        local bouton_no      = Bouton(2,"No",false,"menuUIKnifeRound",nil,nil,nil)
          
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
        local bouton_yes     = Bouton(1,"Yes",true,"menuSummary",nil,nil,nil)
        local bouton_no      = Bouton(2,"No",false,"menuSummary",nil,nil,nil)
          
          menu_action1:addBouton(bouton_yes)
          menu_action1:addBouton(bouton_no)

--------------------------------------------------------------------------------
 
          local menu_chooseteam = Menu(2,"Choose your team")
           theMenuList:addMenu(menu_chooseteam);

            --new Bouton    
          local bouton_voteterro = Bouton(1,"Terrorists","Terrorists","voteforterro",nil,nil,nil)
          local bouton_votecounter = Bouton(2,"Counter-Terrorists","Counter-Terrorists","voteforcounter",nil,nil,nil)

          local bouton_cancel = Bouton(0,"","",nil,nil,nil,nil)

          menu_chooseteam:addBouton(bouton_voteterro)
          menu_chooseteam:addBouton(bouton_votecounter)
          menu_chooseteam:addBouton(bouton_cancel)

------------------------------------------------------------------------------------------------------
      local menu_action1 = Menu(1,"Leave Mixes")
    	theMenuList:addMenu(menu_action1);
------------------------------------------------------------------------------------------------------
      local menu_action1 = Menu(1,"List Mix")
      theMenuList:addMenu(menu_action1);
------------------------------------------------------------------------------------------------------
      local menu_action1 = Menu(1,"Register Mix")
      theMenuList:addMenu(menu_action1);
------------------------------------------------------------------------------------------------------
      local menu_action1 = Menu(1,"My mix")
      theMenuList:addMenu(menu_action1);
      local bouton_info  = Bouton(1,"Info","","menuSummary",nil,nil,nil)
      menu_action1:addBouton(bouton_info)