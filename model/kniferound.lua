

--Public class Kniferound

Kniferound = newclass("Kniferound")

--Constructor
function Kniferound:init()
end
--Static Method start
function Kniferound:start()
				parse("mp_startmoney 0")
				parse("mp_roundtime 100")
				parse("mp_freezetime 0")
				msg("\169100255100KNIFE ROUND@C")
end




