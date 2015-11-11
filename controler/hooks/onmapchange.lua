--------
--Executed script on every map change
--@module hooks.onMapchange
--
--


addhook("mapchange","onmapchange");

---onmapchange
--save all the mixes create in a .txt
--
--@param newmap name of the map
function onmapchange(newmap)
	 aMixList:saveData()
end 

