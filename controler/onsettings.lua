
---onSettings
function onSettings(id)
	for i=1,theMenuList:NumbersMenus() do
        if("Settings" == theMenuList:getMenuList():Get(i):getTitre())then
                 -------VIEW-------
                if aHeadContainerList:exist("Settings") ~= true then
					VIEWsettings(id)
				end
				------------------
                local container1
                for i=1, aHeadContainerList:NumbersHeadContainers() do
                    if(aHeadContainerList:getHeadContainerList():Get(i):getTitre()=="Settings")then
                        container1=aHeadContainerList:getHeadContainerList():Get(i)
                    end
                end
                theMenuList:getMenuList():Get(i):Refresh()
                local arrayOb = {{container1,":off","id"}}
                local bouton_ColorUI       = button(1,"Color UI","","onColorUI",arrayOb)
                local bouton_close         = button(0,"","",nil,arrayOb)
                theMenuList:getMenuList():Get(i):addButton(bouton_ColorUI)
                theMenuList:getMenuList():Get(i):addButton(bouton_close)
                theMenuList:getMenuList():Get(i):Show(id)
        end
    end	
end