
---onColorUI
function onColorUI(id,unbouton,menu)
	for i=1,theMenuList:NumbersMenus() do
        if("Color UI" == theMenuList:getMenuList():Get(i):getTitre())then
        	 
            if(menu:getTitre()=="Color UI")then
                if(unbouton == 1)then --BLUE
                    mysetting[id].color = Color.BLUE
                elseif(unbouton == 2)then --YELLOW
                    mysetting[id].color = Color.YELLOW
                elseif(unbouton == 3)then --RED
                    mysetting[id].color = Color.RED
                elseif(unbouton == 4)then --GREEN
                    mysetting[id].color = Color.GREEN
                elseif(unbouton == 5)then --VIOLET
                    mysetting[id].color = Color.VIOLET
                end
            end  
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
                local bouton_Blue     = button(1,"Blue","","onColorUI",arrayOb)
                local bouton_Yellow   = button(2,"Yellow","","onColorUI",arrayOb)
                local bouton_Red      = button(3,"Red","","onColorUI",arrayOb)
                local bouton_Green    = button(4,"Green","","onColorUI",arrayOb)
                local bouton_Violet   = button(5,"Violet","","onColorUI",arrayOb)
                local bouton_close    = button(0,"","",nil,arrayOb)
              

                
                theMenuList:getMenuList():Get(i):addButton(bouton_Blue)
                theMenuList:getMenuList():Get(i):addButton(bouton_Yellow)
                theMenuList:getMenuList():Get(i):addButton(bouton_Red)
                theMenuList:getMenuList():Get(i):addButton(bouton_Green)  
                theMenuList:getMenuList():Get(i):addButton(bouton_Violet)
                theMenuList:getMenuList():Get(i):addButton(bouton_close) 

           
            theMenuList:getMenuList():Get(i):Show(id)
        end
    end	
end