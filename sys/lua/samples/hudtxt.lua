--------------------------------------------------
-- HUD Text Script by Unreal Software           --
-- 14.03.2011 - www.UnrealSoftware.de           --
-- Adds a custom text to the HUD                --
--------------------------------------------------

if sample==nil then sample={} end
sample.hudtxt={}
sample.hudtxt.timer=0

-----------------------
-- SECOND            --
-----------------------
addhook("second","sample.hudtxt.second")
function sample.hudtxt.second()
	sample.hudtxt.timer=sample.hudtxt.timer+1
	if sample.hudtxt.timer>=5 then
		sample.hudtxt.timer=0
		-- HUD Color Fade ( see http://www.cs2d.com/help.php?cat=server&cmd=hudtxtcolorfade#cmd )
		parse('hudtxt 0 "©255255255This is just a HUD Text sample! The text will fade to black!" 320 240 1')
		parse('hudtxtcolorfade 0 0 5000 0 0 0')
		parse('hudtxt 1 "...and this text will become red!" 320 260 1')
		parse('hudtxtcolorfade 0 1 5000 255 0 0')
		-- HUD Alpha Fade ( see http://www.cs2d.com/help.php?cat=server&cmd=hudtxtalphafade#cmd )
		parse('hudtxt 2 "this one will become invisible!" 320 280 1')
		parse('hudtxtalphafade 0 2 5000 0.0')
		-- HUD Move ( see http://www.cs2d.com/help.php?cat=server&cmd=hudtxtmove#cmd )
		parse('hudtxt 3 "<-- go left" 320 300 1')
		parse('hudtxtmove 0 3 5000 220 300')
		parse('hudtxt 4 "go right -->" 320 320 1')
		parse('hudtxtmove 0 4 5000 420 320')
		parse('hudtxt 5 "go down" 320 340 1')
		parse('hudtxtmove 0 5 5000 320 440')
	end
end