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
	menuUIRounds(id)
end

---menuUIRounds
--show the Menu rounds
--call the menu number of player and send the info of the rounds 
--@param id of the player
function menuUIRounds(id)
		
    	for i=1,theMenuList:NumbersMenus() do
        if("Create Mix - Rounds" == theMenuList:getMenuList():Get(i):getTitre())then
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

    for j=1,object:NumbersButtons() do
      if idbutton == object:getButtons():Get(j):getId() then
         for i=1,aPlayerList:NumbersPlayers() do
          if id == aPlayerList:getPlayerList():Get(i):getId() then
            aPlayerList:getPlayerList():Get(i):getCreateMixArray().rounds     = object:getButtons():Get(j):getValue()
            aPlayerList:getPlayerList():Get(i):getCreateMixArray().roundsVIEW = object:getButtons():Get(j):getNom()
          end
         end
      end
    end
		for i=1,theMenuList:NumbersMenus() do
        if("Create Mix - Nombers of player" == theMenuList:getMenuList():Get(i):getTitre())then
              theMenuList:getMenuList():Get(i):Show(id)
        end
      end
 		
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

          end
         end
      end
    end
	for i=1,theMenuList:NumbersMenus() do
        if("Create Mix - Map" == theMenuList:getMenuList():Get(i):getTitre() or "Create Mix - Map1" == theMenuList:getMenuList():Get(i):getTitre())then
              theMenuList:getMenuList():Get(i):Show(id)
        end
  end
end

---menuUITillEnd
--show the Menu till end
--save the info of Map, get the info for a till end mix 
--and call the Menu Knife round
--@param id of the player
--@param idbutton the button id pressed from the previus menu
--@param object the previus menu 
function menuUITillEnd(id,idbutton,object)
   -- save result of past entry

    for j=1,object:NumbersButtons() do
      if idbutton == object:getButtons():Get(j):getId() then
         for i=1,aPlayerList:NumbersPlayers() do
          if id == aPlayerList:getPlayerList():Get(i):getId() then
  
            aPlayerList:getPlayerList():Get(i):getCreateMixArray().map     = object:getButtons():Get(j):getValue()
            aPlayerList:getPlayerList():Get(i):getCreateMixArray().mapVIEW = object:getButtons():Get(j):getNom()
        
          end
         end
      end
    end
	for i=1,theMenuList:NumbersMenus() do
        if("Create Mix - Till End?" == theMenuList:getMenuList():Get(i):getTitre())then
              theMenuList:getMenuList():Get(i):Show(id)
        end
  end
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
            aPlayerList:getPlayerList():Get(i):getCreateMixArray().tillend     = object:getButtons():Get(j):getValue()
            aPlayerList:getPlayerList():Get(i):getCreateMixArray().tillendVIEW = object:getButtons():Get(j):getNom()
  
          end
         end
      end
    end
	for i=1,theMenuList:NumbersMenus() do
        if("Create Mix - Knife round?" == theMenuList:getMenuList():Get(i):getTitre())then
              theMenuList:getMenuList():Get(i):Show(id)
        end
  end
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
            choicePlayer = aPlayerList:getPlayerList():Get(i):getCreateMixArray()
            aPlayerList:getPlayerList():Get(i):getCreateMixArray().kniferound     = object:getButtons():Get(j):getValue()
            aPlayerList:getPlayerList():Get(i):getCreateMixArray().kniferoundVIEW = object:getButtons():Get(j):getNom()
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
        local bouton_choiceRounds             = button(1,"("..choicePlayer.roundsVIEW..")","",nil,nil)
        local bouton_choiceNomberPlayers      = button(2,"("..choicePlayer.nombersplayersVIEW..")","",nil,nil)
        local bouton_choiceMap                = button(3,"("..choicePlayer.mapVIEW..")","",nil,nil)
        local bouton_choiceTillEnd            = button(4,"("..choicePlayer.tillendVIEW..")","",nil,nil)
        local bouton_choiceKnifeRound         = button(5,"("..choicePlayer.kniferoundVIEW..")","",nil,nil)
        local bouton_validChoices             = button(6,"Create The Mix","","CreateTheMix",nil)
          
          menu_action1:addButton(bouton_choiceRounds)
          menu_action1:addButton(bouton_choiceNomberPlayers)
          menu_action1:addButton(bouton_choiceMap)
          menu_action1:addButton(bouton_choiceTillEnd)
          menu_action1:addButton(bouton_choiceKnifeRound)
          menu_action1:addButton(bouton_validChoices)
          menu_action1:Show(id)
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
	local aMix = Mix(aMixList:NumbersMixs()+1,choicePlayer.rounds,choicePlayer.nombersplayers,choicePlayer.map,choicePlayer.tillend,choicePlayer.kniferound);
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

end