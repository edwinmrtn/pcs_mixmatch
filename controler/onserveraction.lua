addhook("serveraction", "onServeraction")
function onServeraction(id, action)
    if (action == 1) then
    	local bool = true
        for k=1,theMenuList:NumbersMenus() do
            if("PCS Mix option " == theMenuList:getMenuList():Get(k):getTitre() or "PCS Mix option 1" == theMenuList:getMenuList():Get(k):getTitre())then
                theMenuList:getMenuList():Get(k):Refresh()
                for i=1, aMixList:NumbersMixs() do
	                if (aMixList:getMixList():Get(i):getState() ~= "preparation")then
	              	    for j=1, aMixList:getMixList():Get(i):getNumberRegist() do
		              		if (aMixList:getMixList():Get(i):getRegistPlayers():Get(j):getId() == id) then

		              				local bouton_mymix         = Bouton(1,"My mix","","onMyMix",nil,nil,nil)
		              				local bouton_saut          = Bouton(2,"","","",nil,nil,nil)
		              				local bouton_createmix     = Bouton(3,"Create","","onCreateMixBouton",nil,nil,nil)
							        local bouton_registermix   = Bouton(4,"Register mixes","","onRegisterMixes",nil,nil,nil)
							        local bouton_listmix       = Bouton(5,"List mixes","","onListMixes",nil,nil,nil)
							        local bouton_leavemix      = Bouton(6,"Leave mixes","","onLeaveMixes",nil,nil,nil)
							        local bouton_switchteams   = Bouton(7,"Switch Team","","onSwitchTeam",nil,nil,nil)
							        
							        theMenuList:getMenuList():Get(k):addBouton(bouton_mymix) 
							        theMenuList:getMenuList():Get(k):addBouton(bouton_saut)  
							        theMenuList:getMenuList():Get(k):addBouton(bouton_createmix)
							        theMenuList:getMenuList():Get(k):addBouton(bouton_registermix)
							        theMenuList:getMenuList():Get(k):addBouton(bouton_listmix)
							        theMenuList:getMenuList():Get(k):addBouton(bouton_leavemix)
							        theMenuList:getMenuList():Get(k):addBouton(bouton_switchteams)
							        theMenuList:getMenuList():Get(k):Show(id)
		              				bool = false
	              		    end
	              	    end
	                end 
          	    end
		        if bool then
		        local bouton_createmix     = Bouton(1,"Create","","onCreateMixBouton",nil,nil,nil)
		        local bouton_registermix   = Bouton(2,"Register mixes","","onRegisterMixes",nil,nil,nil)
		        local bouton_listmix       = Bouton(3,"List mixes","","onListMixes",nil,nil,nil)
		        local bouton_leavemix      = Bouton(4,"Leave mixes","","onLeaveMixes",nil,nil,nil)
		        local bouton_switchteams   = Bouton(5,"Switch Team","","onSwitchTeam",nil,nil,nil)
		          
		        theMenuList:getMenuList():Get(k):addBouton(bouton_createmix)
		        theMenuList:getMenuList():Get(k):addBouton(bouton_registermix)
		        theMenuList:getMenuList():Get(k):addBouton(bouton_listmix)
		        theMenuList:getMenuList():Get(k):addBouton(bouton_leavemix)
		        theMenuList:getMenuList():Get(k):addBouton(bouton_switchteams)
		        theMenuList:getMenuList():Get(k):Show(id)
		       	end
            end
        end
     end
end
