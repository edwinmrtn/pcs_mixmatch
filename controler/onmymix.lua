
function onMyMix(id)
	for i=1,theMenuList:NumbersMenus() do
        if("My mix" == theMenuList:getMenuList():Get(i):getTitre())then
                theMenuList:getMenuList():Get(i):Show(id)
        end
    end	
end