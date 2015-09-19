
dofile("sys/lua/pcs_mixmatch/model/menu.lua")
dofile("sys/lua/pcs_mixmatch/model/bouton.lua")
dofile("sys/lua/pcs_mixmatch/model/arrayList.lua")
dofile("sys/lua/pcs_mixmatch/model/menuList.lua")
dofile("sys/lua/pcs_mixmatch/controler/onStartMixBouton.lua")

addhook("serveraction", "onServeraction")
function onServeraction(id, action)
    if (action == 1) then
    		--new menu
    	  local menu_action1 = Menu(1,"PCS Mix option")
    	  	--new menuList
    	  local amenuList    = MenuList(0);
    	   amenuList:addMenu(menu_action1);

    	    --new Bouton	
    	  local bouton_startmix = Bouton(1,"Start mix","onStartMixBouton")
         


    	  menu_action1:addBouton(bouton_startmix)
    	  menu(id,menu_action1:Show())
     end
end