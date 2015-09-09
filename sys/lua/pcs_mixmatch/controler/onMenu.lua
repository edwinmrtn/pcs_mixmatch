dofile("sys/lua/pcs_mixmatch/controler/onStartMixBouton.lua")
dofile("sys/lua/pcs_mixmatch/model/menuList.lua")
addhook("menu","onMenu")
function onMenu(id,title,button)
	local theMenuList = MenuList(0)

	for i=1,theMenuList:NumbersMenus() do
			 if(title == theMenuList:getMenuList():Get(i):getTitre())then 
			 	for j=1,theMenuList:getMenuList():Get(i):NumbersBoutons() do
			 		if(button == theMenuList:getMenuList():Get(i):getBoutons():Get(j):getId()) then
			 			local fonctionName = theMenuList:getMenuList():Get(i):getBoutons():Get(j):getFonction()
			 			_G[fonctionName](id) --thanks http://stackoverflow.com/questions/1791234/lua-call-function-from-a-string-with-function-name 
			 		end
			 	end
			 end
	end	
end