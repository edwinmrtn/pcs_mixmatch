addhook("serveraction", "onServeraction")
function onServeraction(id, action)

    if (action == 1) then
          --new menuList

        --local theMenuList    = MenuList(0);
        for i=1,theMenuList:NumbersMenus() do
          if("PCS Mix option " == theMenuList:getMenuList():Get(i):getTitre())then
              theMenuList:getMenuList():Get(i):Show(id)
          end
        end
     end
end
