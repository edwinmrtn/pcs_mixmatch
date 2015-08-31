dofile("sys/lua/pcs_mixmatch/controler/onMenu.lua")
addhook("serveraction", "onServeraction")
function onServeraction(id, action)
    if (action == 1) then
          menu(id, "PCS Mix option,Start mix,Create a mix,Register for a mix, See mixes")
         
    end
end