--------
--@module VIEW.listmix
--print the view for the list mix
--
		function VIEWlistmix(id)
			msg("je passe stp")
					cpt = 0
					local aimage = Image(1,"gfx/pcsmix/menu12.png",295,331,false) 
					local aimage2 = Image(1,"gfx/pcsmix/bebemenu123.png",277,331,true)
					local imagescale = Image(1,"gfx/gui_load.bmp",16,16,true)
					local imageKnifeRound = Image(1,"gfx/gui_load.bmp",16,16,false)
					local textNbrRoundsMixList = "Rounds"
					local textMapMixList = "Map"
					local textNbrPlayerMixList  = "Players"
					local WindowsLayout         = WindowsLayout(1,"List Mixes")
					--local GridLayout            = GridLayout(1,nil,4,50,3)
					--local aLinearVertiLayout    = LinearVertiLayout(1,nil,10,10)
					--local aLinearHoriLayout     = LinearHoriLayout(1,nil,10,10)

					
					local LayoutTitleMenuListFirstPart   = LinearVertiLayout(1,nil,2,10)
					local LayoutTitleMenuListSecondPart  = LinearVertiLayout(1,nil,3,10)
					local NbrMixShow = 5
					local LayoutMixMain                  = LinearHoriLayout(1,nil,NbrMixShow,0)

					local SeparateVertiLayoutMenu        = SeparateVertiLayout(1,nil,50,10)
					local aSeparateHoriLayout            = SeparateHoriLayout(1,nil,20,10)
					local LayoutMainBorderDown           = SeparateHoriLayoutbis(1,aimage2,20,10)
					local LayoutMainBorderRight          = SeparateVertiLayoutbis(1,nil,10,10)
					container1 = Container(1,aimage,295,331,470,210)

					cpt = container1:createLayout(id,WindowsLayout,cpt)
					aHeadContainerList:addHeadContainer(container1)
						cpt=container1:getContainers():Get(1):createLayout(id,LayoutMainBorderRight,cpt)
						cpt = container1:getContainers():Get(1):getContainers():Get(1):createLayout(id,aSeparateHoriLayout,cpt)
							cpt=container1:getContainers():Get(1):getContainers():Get(1):getContainers():Get(1):createLayout(id,SeparateVertiLayoutMenu,cpt)
								cpt=container1:getContainers():Get(1):getContainers():Get(1):getContainers():Get(1):getContainers():Get(1):createLayout(id,LayoutTitleMenuListFirstPart,cpt)
									cpt=container1:getContainers():Get(1):getContainers():Get(1):getContainers():Get(1):getContainers():Get(1):getContainers():Get(1):addElement(id,imageKnifeRound,cpt)
									cpt=container1:getContainers():Get(1):getContainers():Get(1):getContainers():Get(1):getContainers():Get(1):getContainers():Get(2):addElement(id,imageKnifeRound,cpt)
								cpt=container1:getContainers():Get(1):getContainers():Get(1):getContainers():Get(1):getContainers():Get(2):createLayout(id,LayoutTitleMenuListSecondPart,cpt)
									cpt=container1:getContainers():Get(1):getContainers():Get(1):getContainers():Get(1):getContainers():Get(2):getContainers():Get(1):addElement(id,textNbrRoundsMixList,cpt)
									cpt=container1:getContainers():Get(1):getContainers():Get(1):getContainers():Get(1):getContainers():Get(2):getContainers():Get(2):addElement(id,textMapMixList,cpt)
									cpt=container1:getContainers():Get(1):getContainers():Get(1):getContainers():Get(1):getContainers():Get(2):getContainers():Get(3):addElement(id,textNbrPlayerMixList,cpt)

									cpt=container1:getContainers():Get(1):getContainers():Get(1):getContainers():Get(2):createLayout(id,LayoutMainBorderDown,cpt)
									cpt=container1:getContainers():Get(1):getContainers():Get(1):getContainers():Get(2):getContainers():Get(1):createLayout(id,LayoutMixMain,cpt)
									--container1:getContainers():Get(i):getContainers():Get(2):getContainers():Get(1):getContainers():Get(1):addElement(id,aimage2,cpt11)
									if (aMixList:NumbersMixs() ~= 0)then 
						            
										for i=1,container1:getContainers():Get(1):getContainers():Get(1):getContainers():Get(2):getContainers():Get(1):NumbersContainers() do
											 if(aMixList:getMixList():Get(i) ~= nil) then 
												cpt=container1:getContainers():Get(1):getContainers():Get(1):getContainers():Get(2):getContainers():Get(1):getContainers():Get(i):createLayout(id,SeparateVertiLayoutMenu,cpt)
												cpt=container1:getContainers():Get(1):getContainers():Get(1):getContainers():Get(2):getContainers():Get(1):getContainers():Get(i):getContainers():Get(1):createLayout(id,LayoutTitleMenuListFirstPart,cpt)
													cpt=container1:getContainers():Get(1):getContainers():Get(1):getContainers():Get(2):getContainers():Get(1):getContainers():Get(i):getContainers():Get(1):getContainers():Get(1):addElement(id,tostring(aMixList:getMixList():Get(i):getTillEnd()),cpt)
													cpt=container1:getContainers():Get(1):getContainers():Get(1):getContainers():Get(2):getContainers():Get(1):getContainers():Get(i):getContainers():Get(1):getContainers():Get(2):addElement(id,tostring(aMixList:getMixList():Get(i):getKnifeRound()),cpt)
											 	cpt=container1:getContainers():Get(1):getContainers():Get(1):getContainers():Get(2):getContainers():Get(1):getContainers():Get(i):getContainers():Get(2):createLayout(id,LayoutTitleMenuListSecondPart,cpt)
													cpt=container1:getContainers():Get(1):getContainers():Get(1):getContainers():Get(2):getContainers():Get(1):getContainers():Get(i):getContainers():Get(2):getContainers():Get(1):addElement(id,aMixList:getMixList():Get(i):getRounds(),cpt)
													cpt=container1:getContainers():Get(1):getContainers():Get(1):getContainers():Get(2):getContainers():Get(1):getContainers():Get(i):getContainers():Get(2):getContainers():Get(2):addElement(id,aMixList:getMixList():Get(i):getMap(),cpt)
													cpt=container1:getContainers():Get(1):getContainers():Get(1):getContainers():Get(2):getContainers():Get(1):getContainers():Get(i):getContainers():Get(2):getContainers():Get(3):addElement(id,aMixList:getMixList():Get(i):getNumberRegist().."/"..aMixList:getMixList():Get(i):getNomberPlayers(),cpt)
												end	
										end
									end
				 	return container1
		end
				