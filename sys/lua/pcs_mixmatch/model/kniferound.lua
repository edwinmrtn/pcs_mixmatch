local o = dofile("sys/lua/pcs_mixmatch/model/ObjectModel.lua")

--Public Static class Kniferound
Kniferound = o.class()


--Static Method start
function Kniferound:startStatic()
    			parse("restart")
				parse("mp_startmoney 0")
				parse("mp_roundtime 100")
				parse("mp_freezetime 0")
				msg("\169100255100KNIFE ROUND@C")
end




