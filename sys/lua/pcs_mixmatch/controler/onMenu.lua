dofile("sys/lua/pcs_mixmatch/controler/onStartMixBouton.lua")
addhook("menu","onMenu")
function onMenu(id,title,button)
   --msg("player "..player(id,"name").." has pressed button #"..button.." in the menu '"..title.."'!")
   if(title == "PCS Mix option") then
   		if(button == 1) then 
   			onStartMixBouton(id)
   		end  
   end 
end