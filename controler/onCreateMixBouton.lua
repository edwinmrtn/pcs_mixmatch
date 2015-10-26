function onCreateMixBouton(id)
	menuUIRounds(id)
end
function menuUIRounds(id)
		
    	for i=1,theMenuList:NumbersMenus() do
        if("Create Mix - Rounds" == theMenuList:getMenuList():Get(i):getTitre())then
              theMenuList:getMenuList():Get(i):Show(id)
        end
      end
end
function menuUINumberPlayer(id,button,object)
  -- save result of past entry

    for j=1,object:NumbersBoutons() do
      if button == object:getBoutons():Get(j):getId() then
         --parse("msg "..object:getBoutons():Get(j):getNom())
--         local aPlayerList = PlayerList(0);
         for i=1,aPlayerList:NumbersPlayers() do
          if id == aPlayerList:getPlayerList():Get(i):getId() then
            aPlayerList:getPlayerList():Get(i):getCreateMixArray().rounds     = object:getBoutons():Get(j):getValue()
            aPlayerList:getPlayerList():Get(i):getCreateMixArray().roundsVIEW = object:getBoutons():Get(j):getNom()
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
function menuUIMap(id,button,object)
  -- save result of past entry

    for j=1,object:NumbersBoutons() do
      if button == object:getBoutons():Get(j):getId() then
         --parse("msg "..object:getBoutons():Get(j):getNom())
--         local aPlayerList = PlayerList(0);
         for i=1,aPlayerList:NumbersPlayers() do
          if id == aPlayerList:getPlayerList():Get(i):getId() then
            aPlayerList:getPlayerList():Get(i):getCreateMixArray().nombersplayers     = object:getBoutons():Get(j):getValue()
            aPlayerList:getPlayerList():Get(i):getCreateMixArray().nombersplayersVIEW = object:getBoutons():Get(j):getNom()

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
function menuUITillEnd(id,button,object)
   -- save result of past entry

    for j=1,object:NumbersBoutons() do
      if button == object:getBoutons():Get(j):getId() then
         --parse("msg "..object:getBoutons():Get(j):getNom())
--         local aPlayerList = PlayerList(0);
         for i=1,aPlayerList:NumbersPlayers() do
          if id == aPlayerList:getPlayerList():Get(i):getId() then
            aPlayerList:getPlayerList():Get(i):getCreateMixArray().map     = object:getBoutons():Get(j):getValue()
            aPlayerList:getPlayerList():Get(i):getCreateMixArray().mapVIEW = object:getBoutons():Get(j):getNom()
        
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
function menuUIKnifeRound(id,button,object)
   -- save result of past entry

    for j=1,object:NumbersBoutons() do
      if button == object:getBoutons():Get(j):getId() then
         --parse("msg "..object:getBoutons():Get(j):getNom())
   --      local aPlayerList = PlayerList(0);
         for i=1,aPlayerList:NumbersPlayers() do
          if id == aPlayerList:getPlayerList():Get(i):getId() then
            aPlayerList:getPlayerList():Get(i):getCreateMixArray().tillend     = object:getBoutons():Get(j):getValue()
            aPlayerList:getPlayerList():Get(i):getCreateMixArray().tillendVIEW = object:getBoutons():Get(j):getNom()
  
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
function menuSummary(id,button,object)
   -- save result of past entry
    local choicePlayer
    for j=1,object:NumbersBoutons() do
      if button == object:getBoutons():Get(j):getId() then
         --parse("msg "..object:getBoutons():Get(j):getNom())
     --    local aPlayerList = PlayerList(0);
         for i=1,aPlayerList:NumbersPlayers() do
          if id == aPlayerList:getPlayerList():Get(i):getId() then
            choicePlayer = aPlayerList:getPlayerList():Get(i):getCreateMixArray()
            aPlayerList:getPlayerList():Get(i):getCreateMixArray().kniferound     = object:getBoutons():Get(j):getValue()
            aPlayerList:getPlayerList():Get(i):getCreateMixArray().kniferoundVIEW = object:getBoutons():Get(j):getNom()
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
          --new Bouton  
        local bouton_choiceRounds             = Bouton(1,"("..choicePlayer.roundsVIEW..")","","",nil,nil)
        local bouton_choiceNomberPlayers      = Bouton(2,"("..choicePlayer.nombersplayersVIEW..")","","",nil,nil)
        local bouton_choiceMap                = Bouton(3,"("..choicePlayer.mapVIEW..")","","",nil,nil)
        local bouton_choiceTillEnd            = Bouton(4,"("..choicePlayer.tillendVIEW..")","","",nil,nil)
        local bouton_choiceKnifeRound         = Bouton(5,"("..choicePlayer.kniferoundVIEW..")","","",nil,nil)
          local bouton_validChoices             = Bouton(6,"Create The Mix","","CreateTheMix",nil,nil)
          
          menu_action1:addBouton(bouton_choiceRounds)
          menu_action1:addBouton(bouton_choiceNomberPlayers)
          menu_action1:addBouton(bouton_choiceMap)
          menu_action1:addBouton(bouton_choiceTillEnd)
          menu_action1:addBouton(bouton_choiceKnifeRound)
          menu_action1:addBouton(bouton_validChoices)
          menu_action1:Show(id)
end

function CreateTheMix(id,button,object)
	local choicePlayer
  local Player
		for j=1,object:NumbersBoutons() do
			if button == object:getBoutons():Get(j):getId() then
				 --parse("msg "..object:getBoutons():Get(j):getNom())
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
             parse("msg "..thePlayerList:NumbersPlayers())
            for i=1, thePlayerList:NumbersPlayers() do 
                aMix:addRegistPlayer(thePlayerList:getPlayerList():Get(i))
            end 
  aMix:start() 
  ------DEBUGFIN ]]--

 aMixList:addMix(aMix)
 aMixList:saveData()
end