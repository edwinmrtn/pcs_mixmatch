function onCreateMixBouton(id)
	menuUIRounds(id)
end
function menuUIRounds(id)
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
    	    menu_action1:Show(id)
end
function menuUINumberPlayer(id,button,object)
		-- save result of past entry

		for j=1,object:NumbersBoutons() do
			if button == object:getBoutons():Get(j):getId() then
				 --parse("msg "..object:getBoutons():Get(j):getNom())
				 local aPlayerList = PlayerList(0);
				 for i=1,aPlayerList:NumbersPlayers() do
				 	if id == aPlayerList:getPlayerList():Get(i):getId() then
				 		aPlayerList:getPlayerList():Get(i):getCreateMixArray().rounds     = object:getBoutons():Get(j):getValue()
				 		aPlayerList:getPlayerList():Get(i):getCreateMixArray().roundsVIEW = object:getBoutons():Get(j):getNom()
				 	end
				 end
			end
		end

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

    	 menu_action1:Show(id)
 		
end
function menuUIMap(id,button,object)
	-- save result of past entry

		for j=1,object:NumbersBoutons() do
			if button == object:getBoutons():Get(j):getId() then
				 --parse("msg "..object:getBoutons():Get(j):getNom())
				 local aPlayerList = PlayerList(0);
				 for i=1,aPlayerList:NumbersPlayers() do
				 	if id == aPlayerList:getPlayerList():Get(i):getId() then
				 		aPlayerList:getPlayerList():Get(i):getCreateMixArray().nombersplayers     = object:getBoutons():Get(j):getValue()
				 		aPlayerList:getPlayerList():Get(i):getCreateMixArray().nombersplayersVIEW = object:getBoutons():Get(j):getNom()

				 	end
				 end
			end
		end

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
    	  local bouton_dust     = Bouton(1,"de_dust","de_dust","menuUITillEnd",nil,nil)
    	  local bouton_office   = Bouton(2,"de_office","de_office","menuUITillEnd",nil,nil)
          
          menu_action1:addBouton(bouton_dust)
          menu_action1:addBouton(bouton_office)

    	  menu_action1:Show(id)
end
function menuUITillEnd(id,button,object)
	-- save result of past entry

		for j=1,object:NumbersBoutons() do
			if button == object:getBoutons():Get(j):getId() then
				 --parse("msg "..object:getBoutons():Get(j):getNom())
				 local aPlayerList = PlayerList(0);
				 for i=1,aPlayerList:NumbersPlayers() do
				 	if id == aPlayerList:getPlayerList():Get(i):getId() then
				 		aPlayerList:getPlayerList():Get(i):getCreateMixArray().map     = object:getBoutons():Get(j):getValue()
				 		aPlayerList:getPlayerList():Get(i):getCreateMixArray().mapVIEW = object:getBoutons():Get(j):getNom()
				
				 	end
				 end
			end
		end
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

    	  menu_action1:Show(id)
end
function menuUIKnifeRound(id,button,object)
	-- save result of past entry

		for j=1,object:NumbersBoutons() do
			if button == object:getBoutons():Get(j):getId() then
				 --parse("msg "..object:getBoutons():Get(j):getNom())
				 local aPlayerList = PlayerList(0);
				 for i=1,aPlayerList:NumbersPlayers() do
				 	if id == aPlayerList:getPlayerList():Get(i):getId() then
				 		aPlayerList:getPlayerList():Get(i):getCreateMixArray().tillend     = object:getBoutons():Get(j):getValue()
				 		aPlayerList:getPlayerList():Get(i):getCreateMixArray().tillendVIEW = object:getBoutons():Get(j):getNom()
	
				 	end
				 end
			end
		end
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

    	  menu_action1:Show(id)
end
function menuSummary(id,button,object)
	-- save result of past entry
		local choicePlayer
		for j=1,object:NumbersBoutons() do
			if button == object:getBoutons():Get(j):getId() then
				 --parse("msg "..object:getBoutons():Get(j):getNom())
				 local aPlayerList = PlayerList(0);
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
				 local aPlayerList = PlayerList(0);
				 for i=1,aPlayerList:NumbersPlayers() do
				 	if id == aPlayerList:getPlayerList():Get(i):getId() then
            Player       = aPlayerList:getPlayerList():Get(i)
				 		choicePlayer = aPlayerList:getPlayerList():Get(i):getCreateMixArray()
				 	end
				 end
			end
		end
	local aMixList = MixList(0);
	--new mix
	local aMix = Mix(aMixList:NumbersMixs()+1,choicePlayer.rounds,choicePlayer.nombersplayers,choicePlayer.map,choicePlayer.tillend,choicePlayer.kniferound);
	aMix:addRegistPlayer(Player)

  --[[A RECHANGER 
  ----DEBUG :
           local thePlayerList = PlayerList(0)
             parse("msg "..thePlayerList:NumbersPlayers())
            for i=1, thePlayerList:NumbersPlayers() do 
                aMix:addRegistPlayer(thePlayerList:getPlayerList():Get(i))
            end 
  aMix:start() 
  ------DEBUGFIN ]]--

 aMixList:addMix(aMix)
 aMixList:saveData()
end