--------
--Event on the "createmix" button from main menu 
--
--Does print 5 differents menu to get different info
-- from the user about the mix he wants to create
--
--

---onCreateMixButton
--call the Menu rounds
--@param id of the player
function onCreateMixButton(id)
  for i=1,aPlayerList:NumbersPlayers() do
    if id == aPlayerList:getPlayerList():Get(i):getId() then
       aPlayerList:getPlayerList():Get(i):ClearCreateMixArray()
    end
  end
	menuUIRounds(id)
end

---menuUIRounds
--show the Menu rounds
--call the menu number of player and send the info of the rounds 
--@param id of the player
function menuUIRounds(id)
  local PlayerChoices = {}
		 -------VIEW-------
        for i=1, aHeadContainerList:NumbersHeadContainers() do
          aHeadContainerList:getHeadContainerList():Get(i):off(id)
        end
        aHeadContainerList:RemoveAll()

        if aHeadContainerList:NumbersHeadContainers() == 0 then
          VIEWcreate(id,PlayerChoices)
        end
    ------------------
    	for i=1,theMenuList:NumbersMenus() do
        if("Create Mix - Rounds" == theMenuList:getMenuList():Get(i):getTitre())then
              if theMenuList:getMenuList():Get(i):ExistButton("") ~= true then
                local arrayOb = {{getContainerCreate(),":off","id"}}
                local bouton_close       = button(0,"","",nil,arrayOb)
                theMenuList:getMenuList():Get(i):addButton(bouton_close)
              end
              theMenuList:getMenuList():Get(i):Show(id)
        end
      end
end

---menuUINumberPlayer
--show the Menu Number Player
--save the info of rounds, get the info of the number of player
--and call the Menu Map 
--@param id of the player
--@param idbutton the button id pressed from the previus menu
--@param object the previus menu 
function menuUINumberPlayer(id,idbutton,object)
  -- save result of past entry
  local PlayerChoices
  for j=1,object:NumbersButtons() do
      if idbutton == object:getButtons():Get(j):getId() then
         for i=1,aPlayerList:NumbersPlayers() do
          if id == aPlayerList:getPlayerList():Get(i):getId() then
            aPlayerList:getPlayerList():Get(i):getCreateMixArray().rounds     = object:getButtons():Get(j):getValue()
            aPlayerList:getPlayerList():Get(i):getCreateMixArray().roundsVIEW = object:getButtons():Get(j):getNom()
            PlayerChoices = aPlayerList:getPlayerList():Get(i):getCreateMixArray()
          end
         end
      end
    end
		for i=1,theMenuList:NumbersMenus() do
        if("Create Mix - Nombers of player" == theMenuList:getMenuList():Get(i):getTitre())then
              if theMenuList:getMenuList():Get(i):ExistButton("") ~= true then
                local arrayOb = {{getContainerCreate(),":off","id"}}
                local bouton_close       = button(0,"","",nil,arrayOb)
                theMenuList:getMenuList():Get(i):addButton(bouton_close)
              end
            theMenuList:getMenuList():Get(i):Show(id)
        end
    end
    -------VIEW-------
        for i=1, aHeadContainerList:NumbersHeadContainers() do
          aHeadContainerList:getHeadContainerList():Get(i):off(id)
        end
        aHeadContainerList:RemoveAll()

        if aHeadContainerList:NumbersHeadContainers() == 0 then
          VIEWcreate(id,PlayerChoices)
        end
    ------------------
 		
end

---menuUIMap
--show the Menu Map
--save the info of Number of player, get the info of the Map
--and call the Menu Till end
--@param id of the player
--@param idbutton the button id pressed from the previus menu
--@param object the previus menu 
function menuUIMap(id,idbutton,object)
  -- save result of past entry
   
    for j=1,object:NumbersButtons() do
      if idbutton == object:getButtons():Get(j):getId() then
         for i=1,aPlayerList:NumbersPlayers() do
          if id == aPlayerList:getPlayerList():Get(i):getId() then
            aPlayerList:getPlayerList():Get(i):getCreateMixArray().nombersplayers     = object:getButtons():Get(j):getValue()
            aPlayerList:getPlayerList():Get(i):getCreateMixArray().nombersplayersVIEW = object:getButtons():Get(j):getNom()
            PlayerChoices = aPlayerList:getPlayerList():Get(i):getCreateMixArray()
          end
         end
      end
    end
	for i=1,theMenuList:NumbersMenus() do
        if("Create Mix - Map" == theMenuList:getMenuList():Get(i):getTitre() or "Create Mix - Map1" == theMenuList:getMenuList():Get(i):getTitre())then
              if theMenuList:getMenuList():Get(i):ExistButton("") ~= true then
                local arrayOb = {{getContainerCreate(),":off","id"}}
                local bouton_close       = button(0,"","",nil,arrayOb)
                theMenuList:getMenuList():Get(i):addButton(bouton_close)
              end
              theMenuList:getMenuList():Get(i):Show(id)
        end
  end
   -------VIEW-------
        for i=1, aHeadContainerList:NumbersHeadContainers() do
          aHeadContainerList:getHeadContainerList():Get(i):off(id)
        end
        aHeadContainerList:RemoveAll()

        if aHeadContainerList:NumbersHeadContainers() == 0 then
          VIEWcreate(id,PlayerChoices)
        end
    ------------------
end
---menuUIKnifeRound
--show the Menu Knife round
--save the info for till end, get the info for the kniferound 
--and call the Menu Summary
--@param id of the player
--@param idbutton the button id pressed from the previus menu
--@param object the previus menu
function menuUIKnifeRound(id,idbutton,object)
   -- save result of past entry
 
    for j=1,object:NumbersButtons() do
      if idbutton == object:getButtons():Get(j):getId() then
         for i=1,aPlayerList:NumbersPlayers() do
          if id == aPlayerList:getPlayerList():Get(i):getId() then
            aPlayerList:getPlayerList():Get(i):getCreateMixArray().map     = object:getButtons():Get(j):getValue()
            aPlayerList:getPlayerList():Get(i):getCreateMixArray().mapVIEW = object:getButtons():Get(j):getNom()
            PlayerChoices = aPlayerList:getPlayerList():Get(i):getCreateMixArray()
          end
         end
      end
    end
  for i=1,theMenuList:NumbersMenus() do
        if("Create Mix - Knife round" == theMenuList:getMenuList():Get(i):getTitre())then
             if theMenuList:getMenuList():Get(i):ExistButton("") ~= true then
                local arrayOb = {{getContainerCreate(),":off","id"}}
                local bouton_close       = button(0,"","",nil,arrayOb)
                theMenuList:getMenuList():Get(i):addButton(bouton_close)
              end
              theMenuList:getMenuList():Get(i):Show(id)
        end
  end
    -------VIEW-------
        for i=1, aHeadContainerList:NumbersHeadContainers() do
          aHeadContainerList:getHeadContainerList():Get(i):off(id)
        end
        aHeadContainerList:RemoveAll()

        if aHeadContainerList:NumbersHeadContainers() == 0 then
          VIEWcreate(id,PlayerChoices)
        end
    ------------------
end

---menuFriendlyFire
--@param id of the player
--@param idbutton the button id pressed from the previus menu
--@param object the previus menu 
function menuFriendlyFire(id,idbutton,object)
   -- save result of past entry
  
    for j=1,object:NumbersButtons() do
      if idbutton == object:getButtons():Get(j):getId() then
         for i=1,aPlayerList:NumbersPlayers() do
          if id == aPlayerList:getPlayerList():Get(i):getId() then
  
            aPlayerList:getPlayerList():Get(i):getCreateMixArray().kniferound     = object:getButtons():Get(j):getValue()
            aPlayerList:getPlayerList():Get(i):getCreateMixArray().kniferoundVIEW = object:getButtons():Get(j):getNom()
            PlayerChoices = aPlayerList:getPlayerList():Get(i):getCreateMixArray()
          end
         end
      end
    end
	for i=1,theMenuList:NumbersMenus() do
        if("Create Mix - Friendly Fire" == theMenuList:getMenuList():Get(i):getTitre())then
              if theMenuList:getMenuList():Get(i):ExistButton("") ~= true then
                local arrayOb = {{getContainerCreate(),":off","id"}}
                local bouton_close       = button(0,"","",nil,arrayOb)
                theMenuList:getMenuList():Get(i):addButton(bouton_close)
              end
              theMenuList:getMenuList():Get(i):Show(id)
        end
  end
   -------VIEW-------
        for i=1, aHeadContainerList:NumbersHeadContainers() do
          aHeadContainerList:getHeadContainerList():Get(i):off(id)
        end
        aHeadContainerList:RemoveAll()

        if aHeadContainerList:NumbersHeadContainers() == 0 then
          VIEWcreate(id,PlayerChoices)
        end
    ------------------
end

function menuSniper(id,idbutton,object)
   -- save result of past entry

    for j=1,object:NumbersButtons() do
      if idbutton == object:getButtons():Get(j):getId() then
         for i=1,aPlayerList:NumbersPlayers() do
          if id == aPlayerList:getPlayerList():Get(i):getId() then
  
            aPlayerList:getPlayerList():Get(i):getCreateMixArray().fire     = object:getButtons():Get(j):getValue()
            aPlayerList:getPlayerList():Get(i):getCreateMixArray().fireVIEW = object:getButtons():Get(j):getNom()
            PlayerChoices = aPlayerList:getPlayerList():Get(i):getCreateMixArray()
          end
         end
      end
    end
  for i=1,theMenuList:NumbersMenus() do
        if("Create Mix - Sniper" == theMenuList:getMenuList():Get(i):getTitre())then
              if theMenuList:getMenuList():Get(i):ExistButton("") ~= true then
                local arrayOb = {{getContainerCreate(),":off","id"}}
                local bouton_close       = button(0,"","",nil,arrayOb)
                theMenuList:getMenuList():Get(i):addButton(bouton_close)
              end
              theMenuList:getMenuList():Get(i):Show(id)
        end
  end
   -------VIEW-------
        for i=1, aHeadContainerList:NumbersHeadContainers() do
          aHeadContainerList:getHeadContainerList():Get(i):off(id)
        end
        aHeadContainerList:RemoveAll()

        if aHeadContainerList:NumbersHeadContainers() == 0 then
          VIEWcreate(id,PlayerChoices)
        end
    ------------------
end



---menuSummary
--show the Menu Summary
--save the info for kniferound, wait the user approve his choices 
--call the function to create the mix
--@param id of the player
--@param idbutton the button id pressed from the previus menu
--@param object the previus menu
function menuSummary(id,idbutton,object)
   -- save result of past entry
    local choicePlayer
    for j=1,object:NumbersButtons() do
      if idbutton == object:getButtons():Get(j):getId() then
         for i=1,aPlayerList:NumbersPlayers() do
          if id == aPlayerList:getPlayerList():Get(i):getId() then
            aPlayerList:getPlayerList():Get(i):getCreateMixArray().sniper     = object:getButtons():Get(j):getValue()
            aPlayerList:getPlayerList():Get(i):getCreateMixArray().sniperVIEW = object:getButtons():Get(j):getNom()
            choicePlayer = aPlayerList:getPlayerList():Get(i):getCreateMixArray()
          end
         end
      end
    end
	-- body
      --new menu
        local menu_action1 = Menu(1,"Create Mix - Summary")
            --new menuList
        --local theMenuList    = MenuList(0);
        
        local bool = true
        for i=1,theMenuList:NumbersMenus() do
          if("Create Mix - Summary" == theMenuList:getMenuList():Get(i):getTitre())then
               bool = false
          end
        end
        if (bool) then
          theMenuList:addMenu(menu_action1);
        end
--[[
        local bouton_choiceRounds             = button(1,"("..choicePlayer.roundsVIEW..")","",nil,nil)
        local bouton_choiceNomberPlayers      = button(2,"("..choicePlayer.nombersplayersVIEW..")","",nil,nil)
        local bouton_choiceMap                = button(3,"("..choicePlayer.mapVIEW..")","",nil,nil)
        local bouton_choiceKnifeRound         = button(4,"("..choicePlayer.kniferoundVIEW..")","",nil,nil)
        --local bouton_choiceFire               = button(5,"("..choicePlayer.fireVIEW..")","",nil,nil)
        local bouton_choiceSniper             = button(5,"("..choicePlayer.sniperVIEW..")","",nil,nil)
          
          menu_action1:addButton(bouton_choiceRounds)
          menu_action1:addButton(bouton_choiceNomberPlayers)
          menu_action1:addButton(bouton_choiceMap)
          menu_action1:addButton(bouton_choiceKnifeRound)
          --menu_action1:addButton(bouton_choiceFire)
          menu_action1:addButton(bouton_choiceSniper)
          
]]--

local arrayOb = {{getContainerCreate(),":off","id"}}
local bouton_validChoices             = button(1,"Create The Mix","","CreateTheMix",arrayOb)
menu_action1:addButton(bouton_validChoices)
if menu_action1:ExistButton("") ~= true then
   local bouton_close       = button(0,"","",nil,arrayOb)
  menu_action1:addButton(bouton_close)
end


menu_action1:Show(id)
          -------VIEW-------
        for i=1, aHeadContainerList:NumbersHeadContainers() do
          aHeadContainerList:getHeadContainerList():Get(i):off(id)
        end
        aHeadContainerList:RemoveAll()

        if aHeadContainerList:NumbersHeadContainers() == 0 then
          VIEWcreate(id,PlayerChoices)
        end
    ------------------
end

---CreateTheMix
--create the mix 
--get all the different info setted by the user about the mix  
--and create the mix
--@param id of the player
--@param idbutton the button id pressed from the previus menu
--@param object the previus menu
function CreateTheMix(id,idbutton,object)
	local choicePlayer
  local Player
		for j=1,object:NumbersButtons() do
			if idbutton == object:getButtons():Get(j):getId() then
			--	 local aPlayerList = PlayerList(0);
				 for i=1,aPlayerList:NumbersPlayers() do
				 	if id == aPlayerList:getPlayerList():Get(i):getId() then
            Player       = aPlayerList:getPlayerList():Get(i)
				 		choicePlayer = aPlayerList:getPlayerList():Get(i):getCreateMixArray()
				 	end
				 end
			end
		end
--	local aMixList = MixList(0);
	--new mix
  --msg(choicePlayer.rounds..tostring(choicePlayer.nombersplayers)..tostring(choicePlayer.map)..tostring(choicePlayer.kniferound)..tostring(choicePlayer.fire)..tostring(choicePlayer.sniper))
 	local aMix = Mix(aMixList:NumbersMixs()+1,choicePlayer.rounds,choicePlayer.nombersplayers,choicePlayer.map,choicePlayer.kniferound,choicePlayer.fire,choicePlayer.sniper);
	aMix:addRegistPlayer(Player)

  --[[A RECHANGER 
  ----DEBUG :
           --local thePlayerList = PlayerList(0)
            for i=1, thePlayerList:NumbersPlayers() do 
                aMix:addRegistPlayer(thePlayerList:getPlayerList():Get(i))
            end 
  aMix:start() 
  ------DEBUGFIN ]]--

 aMixList:addMix(aMix)
 onServerAction1(id)

end

function getContainerCreate()
local container1
for i=1, aHeadContainerList:NumbersHeadContainers() do
  if(aHeadContainerList:getHeadContainerList():Get(i):getTitre()=="Create")then
    container1=aHeadContainerList:getHeadContainerList():Get(i)
  end
end
return container1
end 