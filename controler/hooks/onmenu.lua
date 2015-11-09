addhook("menu","onMenu")
function onMenu(id,title,button)
	for i=1,theMenuList:NumbersMenus() do
			 if(title == theMenuList:getMenuList():Get(i):getTitre())then 
			 	for j=1,theMenuList:getMenuList():Get(i):NumbersButtons() do
			 		if(button == theMenuList:getMenuList():Get(i):getButtons():Get(j):getId()) then
			 			if (theMenuList:getMenuList():Get(i):getButtons():Get(j):getArrayObject() ~= nil) then
			 				for k=1, #theMenuList:getMenuList():Get(i):getButtons():Get(j):getArrayObject() do 
				 				
				 				ob     = theMenuList:getMenuList():Get(i):getButtons():Get(j):getArrayObject()[k][1]
				 				meth   = theMenuList:getMenuList():Get(i):getButtons():Get(j):getArrayObject()[k][2]
				 				param  = theMenuList:getMenuList():Get(i):getButtons():Get(j):getArrayObject()[k][3]
				 				lid    = id
				 			

				 				if(param == "id") then
									loadstring("ob"..meth.."(lid)")()
				 				elseif (param ~= nil) then
				 					loadstring("ob"..meth.."(param)")()
								else
									loadstring("ob"..meth.."()")()
								end
							end	
						end 	
						if (theMenuList:getMenuList():Get(i):getButtons():Get(j):getFonction() ~= nil) then
				 			local fonctionName = theMenuList:getMenuList():Get(i):getButtons():Get(j):getFonction()	
				 			_G[fonctionName](id,button,theMenuList:getMenuList():Get(i)) --thanks http://stackoverflow.com/questions/1791234/lua-call-function-from-a-string-with-function-name 
			 			end
			 		end
			 	end
		    end
	end	
end

