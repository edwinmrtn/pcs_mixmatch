
dofile("sys/lua/pcs_mixmatch/model/mix.lua")
dofile("sys/lua/pcs_mixmatch/model/mixList.lua")
dofile("sys/lua/pcs_mixmatch/model/arrayList.lua")
function onListMixes(id)
	
	local aMixList = MixList(0);
	for i=1,aMixList:NumbersMixs() do
		parse("msg "..aMixList:getMixList():Get(i):showString())
	end
end