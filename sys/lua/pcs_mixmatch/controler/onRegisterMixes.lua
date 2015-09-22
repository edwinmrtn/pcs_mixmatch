
dofile("sys/lua/pcs_mixmatch/model/mix.lua")
dofile("sys/lua/pcs_mixmatch/model/mixList.lua")
dofile("sys/lua/pcs_mixmatch/model/arrayList.lua")
dofile("sys/lua/pcs_mixmatch/model/playerList.lua")
function onRegisterMixes(id)
	--new menu
    local menu_action1 = Menu(1,"Register Mix")
    --new menuList
    local theMenuList    = MenuList(0);
    local bool = true
    for i=1,theMenuList:NumbersMenus() do
        if("Register Mix" == theMenuList:getMenuList():Get(i):getTitre())then
    	        bool = false
        end
    end
    if (bool) then
        theMenuList:addMenu(menu_action1);
    end
    local aMixList    = MixList(0);
    local j = 1
    if (aMixList:NumbersMixs() == 0)then 
        parse("msg Error : No mixes found")
    else
        for i=1,aMixList:NumbersMixs() do
            
    	    --new Bouton	
    	    local bouton     = Bouton(j,aMixList:getMixList():Get(i):showString().." | "..aMixList:getMixList():Get(i):getNumberRegist().."/"..aMixList:getMixList():Get(i):getNomberPlayers(),aMixList:getMixList():Get(i),"registerMix")
    	    j = j +1 
            menu_action1:addBouton(bouton)
    	end
        menu(id,menu_action1:Show())
    end
	
	
		
	
end

function registerMix(id,button,object) --very mindfuck -- object == menu, menu > bouton > bouton.value == Mix  
     --new playerList
    local thePlayerList    = PlayerList(0);
    local Player 
    for i=1,thePlayerList:NumbersPlayers() do
        if id == thePlayerList:getPlayerList():Get(i):getId() then
            Player = thePlayerList:getPlayerList():Get(i)
        end
    end
    for i=1,object:NumbersBoutons() do
        if button == object:getBoutons():Get(i):getId() then
            object:getBoutons():Get(i):getValue():addRegistPlayer(Player)
            if tonumber(object:getBoutons():Get(i):getValue():getNomberPlayers()) == tonumber(object:getBoutons():Get(i):getValue():getNumberRegist()) then
                object:getBoutons():Get(i):getValue():start()
            end
        end
    end
end