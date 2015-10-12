--dofile("sys/lua/pcs_mixmatch/controler/onStartMixBouton.lua")
--dofile("sys/lua/pcs_mixmatch/model/chooseside.lua")
addhook("menu","onMenu")
function onMenu(id,title,button)
	--local theMenuList = MenuList(0)
	for i=1,theMenuList:NumbersMenus() do
			 if(title == theMenuList:getMenuList():Get(i):getTitre())then 
			 	for j=1,theMenuList:getMenuList():Get(i):NumbersBoutons() do
			 		msg(button)
			 		msg(theMenuList:getMenuList():Get(i):getBoutons():Get(j):getId())
			 		if(button == 0 and button == theMenuList:getMenuList():Get(i):getBoutons():Get(j):getId()) then
			 			timer(0,"atimer",id)

			 		elseif(button == theMenuList:getMenuList():Get(i):getBoutons():Get(j):getId()) then
			 			msg("yess")
			 			if (theMenuList:getMenuList():Get(i):getBoutons():Get(j):getObject() ~= nil and theMenuList:getMenuList():Get(i):getBoutons():Get(j):getNomObject() ~= nil) then 
			 				theMenuList:getMenuList():Get(i):getBoutons():Get(j):getObject():Show(id)
						else
				 			local fonctionName = theMenuList:getMenuList():Get(i):getBoutons():Get(j):getFonction()
				 			_G[fonctionName](id,button,theMenuList:getMenuList():Get(i)) --thanks http://stackoverflow.com/questions/1791234/lua-call-function-from-a-string-with-function-name 
			 			end 
			 		end
			 	end
			 end
	end	
end

function atimer(id)
--	local theMenuList = MenuList(0)
	for i=1,theMenuList:NumbersMenus() do
		 if("Choose your team" == theMenuList:getMenuList():Get(i):getTitre())then 
			theMenuList:getMenuList():Get(i):Show(tonumber(id))
		 end
	end
	
end