dofile("sys/lua/pcs_mixmatch/model/object.lua")
dofile("sys/lua/pcs_mixmatch/model/team.lua")
dofile("sys/lua/pcs_mixmatch/model/arraylist.lua")

--Public Static class Kniferound
Kniferound = newclass("Kniferound")


--Static Method start
function Kniferound:startStatic(Teams)
    			parse("restart")
				parse("mp_startmoney 0")
				parse("mp_roundtime 100")
				parse("mp_freezetime 0")
				msg("\169100255100KNIFE ROUND@C")
				
							parse('msg '..Teams:Get(1):NumbersPlayers())
			
end




