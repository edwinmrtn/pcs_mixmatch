dofile("sys/lua/pcs_mixmatch/model/object.lua")
dofile("sys/lua/pcs_mixmatch/model/team.lua")
dofile("sys/lua/pcs_mixmatch/model/arraylist.lua")

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
				--Teams:Get(1) == ct
				--Teams:Get(2) == tt
				
				--DEBUG  :
				--parse('msg '..Teams:Get(1):NumbersPlayers())
				--parse('msg '..Teams:Get(2):NumbersPlayers())


				--[[
				for i=1,Teams:Get(1):NumbersPlayers() do
					Teams:Get(1):getPlayers():Get(i):stripWeapon(1)
				end
				for i=1,Teams:Get(2):NumbersPlayers() do
					Teams:Get(2):getPlayers():Get(i):stripWeapon(2)
				end  ]]--
			
			
end




