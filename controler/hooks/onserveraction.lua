--------
--Executed script every press on the serveraction keyboard touch
--@module hooks.onServeraction
--
--

addhook("serveraction", "onServeraction")

---onServeraction
--open the main mix menu
--@param id of the player
--@param action id of the keyboard touch
function onServeraction(id, action)
    if (action == 1) then
    	local bool = true
        for k=1,theMenuList:NumbersMenus() do
            if("PCS Mix option " == theMenuList:getMenuList():Get(k):getTitre() or "PCS Mix option 1" == theMenuList:getMenuList():Get(k):getTitre())then
                theMenuList:getMenuList():Get(k):Refresh()

                -------TEST-------
                if aHeadContainerList:exist("List Mixes") ~= true then
					VIEWlistmix(id)
				end
				------------------

                for i=1, aMixList:NumbersMixs() do
	                if (aMixList:getMixList():Get(i):getState() ~= "preparation")then
	              	    for j=1, aMixList:getMixList():Get(i):getNumberRegist() do
		              		if (aMixList:getMixList():Get(i):getRegistPlayers():Get(j):getId() == id) then
		              				local container1
					          	    for i=1, aHeadContainerList:NumbersHeadContainers() do
										if(aHeadContainerList:getHeadContainerList():Get(i):getTitre()=="List Mixes")then
											container1=aHeadContainerList:getHeadContainerList():Get(i)
										end
									end
									local arrayOb = {{container1,":off","id"}}
		              				local bouton_mymix         = button(1,"My mix","","onMyMix",arrayOb)
		              				local bouton_saut          = button(2,"","","",nil)
		              				local bouton_createmix     = button(3,"Create","","onCreateMixButton",arrayOb)
							        local bouton_registermix   = button(4,"Register mixes","","onRegisterMixes",arrayOb)
							        local bouton_listmix       = button(5,"List mixes","","onListMixes",arrayOb)
							        local bouton_leavemix      = button(6,"Leave mixes","","onLeaveMixes",arrayOb)
							        
							        theMenuList:getMenuList():Get(k):addButton(bouton_mymix) 
							        theMenuList:getMenuList():Get(k):addButton(bouton_saut)  
							        theMenuList:getMenuList():Get(k):addButton(bouton_createmix)
							        theMenuList:getMenuList():Get(k):addButton(bouton_registermix)
							        theMenuList:getMenuList():Get(k):addButton(bouton_listmix)
							        theMenuList:getMenuList():Get(k):addButton(bouton_leavemix)
							        theMenuList:getMenuList():Get(k):Show(id)
		              				bool = false
	              		    end
	              	    end
	                end 
          	    end
          	    local container1
          	    for i=1, aHeadContainerList:NumbersHeadContainers() do
					if(aHeadContainerList:getHeadContainerList():Get(i):getTitre()=="List Mixes")then
						container1=aHeadContainerList:getHeadContainerList():Get(i)
					end
				end
		        if bool then
		        local arrayOb = {{container1,":off","id"}}
		        local bouton_createmix     = button(1,"Create","","onCreateMixButton",arrayOb)
		        local bouton_registermix   = button(2,"Register mixes","","onRegisterMixes",arrayOb)
		        local bouton_listmix       = button(3,"List mixes","","onListMixes",arrayOb)
		        local bouton_leavemix      = button(4,"Leave mixes","","onLeaveMixes",arrayOb)
		        local bouton_close   	   = button(0,"","",nil,arrayOb)
		          
		        theMenuList:getMenuList():Get(k):addButton(bouton_createmix)
		        theMenuList:getMenuList():Get(k):addButton(bouton_registermix)
		        theMenuList:getMenuList():Get(k):addButton(bouton_listmix)
		        theMenuList:getMenuList():Get(k):addButton(bouton_leavemix)
		        theMenuList:getMenuList():Get(k):addButton(bouton_close)
		        theMenuList:getMenuList():Get(k):Show(id)
		       	end
		       	
            end
        end
     end
end
