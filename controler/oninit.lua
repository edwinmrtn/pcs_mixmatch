---------------------------------------------------
--All the action which are made when the server start
--
--create the 4 globals list 
--
--create the different static menu
--
--     
        --new menuList
        theMenuList    = MenuList(0);
        --new player list
        aPlayerList = PlayerList(0);
        --new Mix List
        aMixList = MixList(0);
        --new HeadContainerList
        aHeadContainerList = HeadContainerList(0);
        
----------------------------------------------------------------------
function callTimer(id)
  timer(0,"atimer",id)
end
function atimer(id)
--  local theMenuList = MenuList(0)
  for i=1,theMenuList:NumbersMenus() do
     if("Choose your team" == theMenuList:getMenuList():Get(i):getTitre())then 
      theMenuList:getMenuList():Get(i):Show(tonumber(id))
     end
  end
  
end
----------------------------------------------------------------------------
        --load all mixs
        aMixList:loadData()
        table.save({},"sys/lua/pcs_mixmatch/model/mixes.txt")
----------------------------------------------------------------------------


---changeMapInit
--on changemap Load the mixes from the .txt
--
function changeMapInit()
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

---changeMapCheckPlayer
--after a changemap check for each registered mix player if they are on the server
--
function changeMapCheckPlayer()
  msg("jechangeMapCheckPlayer")
    for i=1,aMixList:NumbersMixs() do
          if (aMixList:getMixList():Get(i):getState() == "mapchanged") then
              local j = 1
              while j <= aMixList:getMixList():Get(i):getNumberRegist() do
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
        local bouton_thirty     = button(1,"15-15","30","menuUINumberPlayer",nil)
        local bouton_twentyfour = button(2,"12-12","24","menuUINumberPlayer",nil)
        local bouton_twenty     = button(3,"10-10","20","menuUINumberPlayer",nil)
        local bouton_for        = button(4,"2-2","4","menuUINumberPlayer",nil)
          
          menu_action1:addButton(bouton_thirty)
          menu_action1:addButton(bouton_twentyfour)
          menu_action1:addButton(bouton_twenty)
          menu_action1:addButton(bouton_for)
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
        local bouton_ten     = button(1,"5 vs 5","10","menuUIMap",nil)
        local bouton_eight   = button(2,"4 vs 4","8","menuUIMap",nil)
        local bouton_six     = button(3,"3 vs 3","6","menuUIMap",nil)
        local bouton_four    = button(4,"2 vs 2","4","menuUIMap",nil)
        local bouton_two     = button(5,"1 vs 1","2","menuUIMap",nil)
          
          menu_action1:addButton(bouton_ten)
          menu_action1:addButton(bouton_eight)
          menu_action1:addButton(bouton_six)
          menu_action1:addButton(bouton_four)
          menu_action1:addButton(bouton_two)
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
                 bouton_map     = button(6,string.sub(maps,0,-5),string.sub(maps,0,-5),"menuUITillEnd",nil)

              else 
      
                 bouton_map     = button(cptmap%6,string.sub(maps,0,-5),string.sub(maps,0,-5),"menuUITillEnd",nil)
              end 
              menu_action1:addButton(bouton_map)
              cptmap = cptmap + 1 
            end
            if cptmap%6 == 0 then
              bouton_espace    = button(6,"","",nil,nil) --sur onstartmixbutton
            else
              bouton_espace    = button(cptmap%6,"","",nil,nil) --sur onstartmixbutton
            end 
              cptmap = cptmap + 1
            if cptmap%6 == 0 then
              local arrayOb={{menu_action1,":Show","id"}}
               bouton_retour    = button(6,"Back","",nil,arrayOb) --sur onstartmixbutton
            else
              local arrayOb={{menu_action1,":Show","id"}}
               bouton_retour    = button(cptmap%6,"Back","",nil,arrayOb)
            end
            menu_action1:addButton(bouton_espace)
            menu_action1:addButton(bouton_retour)

        elseif BinaryFormat == "so" then --linux
          --msg("jepass")
            local cptmap = 1
            for maps in io.popen('ls ./maps/*.map | xargs -n 1 basename'):lines() do
              if cptmap%6 == 0 then
                 bouton_map     = button(6,string.sub(maps,0,-5),string.sub(maps,0,-5),"menuUITillEnd",nil)
              else  
                 bouton_map     = button(cptmap%6,string.sub(maps,0,-5),string.sub(maps,0,-5),"menuUITillEnd",nil)
              end 
              menu_action1:addButton(bouton_map)
              cptmap = cptmap + 1 
            end
            if cptmap%6 == 0 then
              bouton_espace    = button(6,"","",nil,nil) --sur onstartmixbutton
            else
              bouton_espace    = button(cptmap%6,"","",nil,nil) --sur onstartmixbutton
            end 
              cptmap = cptmap + 1
            if cptmap%6 == 0 then
               local arrayOb={{menu_action1,":Show","id"}}
               bouton_retour    = button(6,"Back","",nil,arrayOb) --sur onstartmixbutton
            else
               local arrayOb={{menu_action1,":Show","id"}}
               bouton_retour    = button(cptmap%6,"Back","",nil,arrayOb)
            end
            menu_action1:addButton(bouton_espace)
            menu_action1:addButton(bouton_retour)
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
          --new button  
        local bouton_yes     = button(1,"Yes",true,"menuUIKnifeRound",nil)
        local bouton_no      = button(2,"No",false,"menuUIKnifeRound",nil)
          
          menu_action1:addButton(bouton_yes)
          menu_action1:addButton(bouton_no)

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
          --new button  
        local bouton_yes     = button(1,"Yes",true,"menuSummary",nil)
        local bouton_no      = button(2,"No",false,"menuSummary",nil)
          
          menu_action1:addButton(bouton_yes)
          menu_action1:addButton(bouton_no)

--------------------------------------------------------------------------------
 
          local menu_chooseteam = Menu(2,"Choose your team")
           theMenuList:addMenu(menu_chooseteam);

            --new button    
          local bouton_voteterro = button(1,"Terrorists","Terrorists","voteforterro",nil)
          local bouton_votecounter = button(2,"Counter-Terrorists","Counter-Terrorists","voteforcounter",nil)

          local bouton_cancel = button(0,"","","callTimer",nil,nil,nil)

          menu_chooseteam:addButton(bouton_voteterro)
          menu_chooseteam:addButton(bouton_votecounter)
          menu_chooseteam:addButton(bouton_cancel)

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
      local bouton_info  = button(1,"Info","","menuSummary",nil)
      menu_action1:addButton(bouton_info)
------------------------------------------------------------------------------------------------------

