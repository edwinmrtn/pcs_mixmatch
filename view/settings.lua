--------
--@module VIEW.settings
--
		function VIEWsettings(id)
					local striker = Image(1,"gfx/pcsmix/striker.png",433,479,true,1)
					local home     = Image(1,"gfx/pcsmix/home.png",24,24,false,0.2)
					local mymix    = Image(1,"gfx/pcsmix/mymix.png",24,24,false,0.2)
					local create   = Image(1,"gfx/pcsmix/create.png",24,24,false,0.2)
					local register = Image(1,"gfx/pcsmix/register.png",24,24,false,0.2)
					local leave    = Image(1,"gfx/pcsmix/leave.png",24,24,false,0.2)
					local setting  = Image(1,"gfx/pcsmix/setting.png",24,24,false,0.6)

					local knife    = Image(1,"gfx/pcsmix/knife.png",16,16,false,1)
					local fire     = Image(1,"gfx/pcsmix/fire.png",16,16,false,1)
					local sniper   = Image(1,"gfx/pcsmix/sniper.png",16,16,false,1)

					local cs2dnet = Image(1,"gfx/pcsmix/cs2dnet.png",80,25,false,0.3)
					local pcslogo = Image(1,"gfx/pcsmix/pcslogo.png",632,337,true,0.2)

					local bg      = Image(1,"gfx/pcsmix/window.png",272,440,false,1) 
					local bglight = Image(1,"gfx/pcsmix/window.png",272,440,true,1)
					local bgdark  = Image(1,"gfx/pcsmix/menu.png",272,440,true,1)

					local textNbrRoundsMixList = "Rounds"
					local textMapMixList = "Map"
					local textNbrPlayerMixList  = "Players"
					local WindowsLayout         = WindowsLayout(1,"Settings")
					--local GridLayout            = GridLayout(1,nil,4,50,3)
					--local aLinearVertiLayout    = LinearVertiLayout(1,nil,10,10)
					--local aLinearHoriLayout     = LinearHoriLayout(1,nil,10,10)

					
					local LVertiAriane                   = LinearVertiLayout(1,nil,6,10)
					local LHoriAriane                    = SeparateHoriLayout(1,bgdark,50,10)
					local SVertiArianeMarge              = SeparateVertiLayout(1,nil,10,0)
					local LVertiCopyright                = LinearVertiLayout(1,nil,2,10)
					local SBCopyright                    = SeparateHoriLayoutbis(1,bgdark,50,20)
					local SHoriMenu                      = SeparateHoriLayout(1,nil,0,10)

					local LayoutMainBorderDown           = SeparateHoriLayoutbis(1,striker,130,10)
					local LayoutMainBorderRight          = SeparateVertiLayoutbis(1,nil,17,10)
					
					local LayoutMixMain                  = LinearHoriLayout(1,bglight,1,10)
					
					container1 = Container(1,bg,272,440,484,241,mysetting[id].color)

					cptview[id] = container1:createLayout(id,WindowsLayout,cptview[id])
					aHeadContainerList:addHeadContainer(container1)
						cptview[id]=container1:getContainers():Get(1):createLayout(id,LayoutMainBorderRight,cptview[id])
										cptview[id]=container1:getContainers():Get(1):getContainers():Get(1):createLayout(id,LHoriAriane,cptview[id])

											cptview[id]=container1:getContainers():Get(1):getContainers():Get(1):getContainers():Get(1):createLayout(id,SVertiArianeMarge,cptview[id])
											cptview[id]=container1:getContainers():Get(1):getContainers():Get(1):getContainers():Get(1):getContainers():Get(2):createLayout(id,LVertiAriane,cptview[id])
											cptview[id]=container1:getContainers():Get(1):getContainers():Get(1):getContainers():Get(1):getContainers():Get(2):getContainers():Get(1):addElement(id,home,cptview[id])
											cptview[id]=container1:getContainers():Get(1):getContainers():Get(1):getContainers():Get(1):getContainers():Get(2):getContainers():Get(2):addElement(id,mymix,cptview[id])
											cptview[id]=container1:getContainers():Get(1):getContainers():Get(1):getContainers():Get(1):getContainers():Get(2):getContainers():Get(3):addElement(id,create,cptview[id])
											cptview[id]=container1:getContainers():Get(1):getContainers():Get(1):getContainers():Get(1):getContainers():Get(2):getContainers():Get(4):addElement(id,register,cptview[id])
											cptview[id]=container1:getContainers():Get(1):getContainers():Get(1):getContainers():Get(1):getContainers():Get(2):getContainers():Get(5):addElement(id,leave,cptview[id])
											cptview[id]=container1:getContainers():Get(1):getContainers():Get(1):getContainers():Get(1):getContainers():Get(2):getContainers():Get(6):addElement(id,setting,cptview[id])
										cptview[id]=container1:getContainers():Get(1):getContainers():Get(1):getContainers():Get(2):createLayout(id,SHoriMenu,cptview[id])

											
									cptview[id]=container1:getContainers():Get(1):getContainers():Get(1):getContainers():Get(2):getContainers():Get(2):createLayout(id,LayoutMainBorderDown,cptview[id])
									cptview[id]=container1:getContainers():Get(1):getContainers():Get(1):getContainers():Get(2):getContainers():Get(2):getContainers():Get(1):createLayout(id,LayoutMixMain,cptview[id])
									
									cptview[id]=container1:getContainers():Get(1):getContainers():Get(1):getContainers():Get(2):getContainers():Get(2):getContainers():Get(2):createLayout(id,SBCopyright,cptview[id])
									cptview[id]=container1:getContainers():Get(1):getContainers():Get(1):getContainers():Get(2):getContainers():Get(2):getContainers():Get(2):getContainers():Get(1):createLayout(id,LVertiCopyright,cptview[id])
									cptview[id]=container1:getContainers():Get(1):getContainers():Get(1):getContainers():Get(2):getContainers():Get(2):getContainers():Get(2):getContainers():Get(1):getContainers():Get(1):addElement(id,pcslogo,cptview[id])
									cptview[id]=container1:getContainers():Get(1):getContainers():Get(1):getContainers():Get(2):getContainers():Get(2):getContainers():Get(2):getContainers():Get(1):getContainers():Get(2):addElement(id,cs2dnet,cptview[id])
									--cptview[id]=container1:getContainers():Get(1):getContainers():Get(1):getContainers():Get(2):getContainers():Get(2):getContainers():Get(2):getContainers():Get(1):getContainers():Get(3):
									

				 	return container1
		end
				