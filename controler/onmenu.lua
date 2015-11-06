--dofile("sys/lua/pcs_mixmatch/controler/onStartMixBouton.lua")
--dofile("sys/lua/pcs_mixmatch/model/chooseside.lua")
addhook("menu","onMenu")
function onMenu(id,title,button)
	--local theMenuList = MenuList(0)
	for i=1,theMenuList:NumbersMenus() do
			 if(title == theMenuList:getMenuList():Get(i):getTitre())then 
			 	for j=1,theMenuList:getMenuList():Get(i):NumbersBoutons() do
			 		if(button == 0 and button == theMenuList:getMenuList():Get(i):getBoutons():Get(j):getId()) then
			 			timer(0,"atimer",id)
			 		elseif(button == theMenuList:getMenuList():Get(i):getBoutons():Get(j):getId()) then
			 			if (theMenuList:getMenuList():Get(i):getBoutons():Get(j):getObject() ~= nil and theMenuList:getMenuList():Get(i):getBoutons():Get(j):getFoncObject() ~= nil) then
			 				ob     = theMenuList:getMenuList():Get(i):getBoutons():Get(j):getObject()
			 				meth   = theMenuList:getMenuList():Get(i):getBoutons():Get(j):getFoncObject()
			 				param  = theMenuList:getMenuList():Get(i):getBoutons():Get(j):getParamObject()
			 				lid    = id
			 				if(param == "id") then
								loadstring("ob"..meth.."(lid)")()
			 				elseif (param ~= nil) then
			 					loadstring("ob"..meth.."(param)")()
							else
								loadstring("ob"..meth.."()")()
							end
							if tostring(ob) == "I am a Mix" and meth == ":addRegistPlayer" then
								ob:checkStartMix()
							end 	
						end 	
						if (theMenuList:getMenuList():Get(i):getBoutons():Get(j):getFonction() ~= nil) then
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