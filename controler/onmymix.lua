--------
--Event on "mymix" button from main menu - visible only when the player play a mix 
--
--
--

---onMyMix
--show the menu my mix
--
--@param id of the player
--
--
function onMyMix(id)
	for i=1,theMenuList:NumbersMenus() do
        if("My mix" == theMenuList:getMenuList():Get(i):getTitre())then
                theMenuList:getMenuList():Get(i):Show(id)
        end
    end	
end