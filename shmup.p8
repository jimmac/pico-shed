pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
-- following tut series 
-- https://www.youtube.com/watch?v=yxrjdmzyv0u

function _init()
	--player
	pl = {x=63,y=120,spx=0,spy=0}
	bl = {x=0,y=0,life=30}
	cls(0)
end

function _update60()
 --movement
	if btn(➡️) and pl.x<120 then
		pl.spx=2
	elseif btn(⬅️) and pl.x>0 then
		pl.spx=-2
	else 
		pl.spx=0	
	end
	pl.x = pl.x+pl.spx
	
	--shooting
	if btnp(❎) then
		sfx(0)
		bl.life=30
		bl.x=pl.x
		bl.y=pl.y-3
	end
	if bl.y>0 then
		bl.y-=5
	end
	bl.life-=1
end

function _draw()
	cls(0)
	--player
	spr(1,pl.x,pl.y)
	--bullet
	if bl.life>0 then spr(3,bl.x,bl.y) end
end
__gfx__
00000000000100000011110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000017100001999910001d1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700027662001939939100d7d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000017d610019b99b9100dad000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000217761201999999100191000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0070070017766610119d9d1100181000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000177766100111111000111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000111111100000000000020000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
00010000305302b26026270212501a240142400e2300a230092200722005220012200021000610006000060000600006000000000000000000000000000000000000000000000000000000000000000000000000
