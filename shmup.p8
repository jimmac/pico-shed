pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
-- following tut series 
-- https://www.youtube.com/watch?v=yxrjdmzyv0u

function _init()
 fr=0
 score=0
 flash=0
	--player
	pl = {x=63,
	      y=100,
	      spx=0,
	      spy=0,
	      sp=2,
	      lv=4}
	bl = {x=0,y=-10,life=30}
	flame=4
	cls(0)
	--starfield
	starsx={} starsy={}
	starss={}
	for i=1,100 do
	  cols={6,7,9,10}
	  col=cols[1+flr(rnd(4))]
	  add(starsx,rnd(128))
	  add(starsy,rnd(128))
	  add(starss,rnd(1.5)+0.5)
	end
end

function _update60()
 --ship movement
	if btn(➡️) and pl.x<120 then
		pl.spx=2
		pl.spy=0
		pl.sp=3
	elseif btn(⬅️) and pl.x>0 then
		pl.spx=-2
		pl.spy=0
		pl.sp=2
	elseif btn(⬆️) and pl.y>0 then
	 pl.sp=2
	 pl.spx=0
	 pl.spy=-1
	elseif btn(⬇️) and pl.y>=0 and pl.y<110 then
	 pl.sp=2
	 pl.spx=0
	 pl.spy=2
	else 
	 pl.spy=0
		pl.spx=0	
		pl.sp=2
	end
	pl.x=pl.x+pl.spx
	pl.y=pl.y+pl.spy 
	--flame
	flame=4+rnd(3)
	sfx(1) --flamefx
	
	
	--shooting
	if btnp(❎) then
		sfx(0)
		bl.life=30
		bl.x=pl.x
		bl.y=pl.y-3
		flash=3
	end
	if bl.y>0 then
		bl.y-=5
	end
	bl.life-=1
end

function _draw()
	cls(0)
	fr+=1
	--starfield
	starfield()

	--player
	spr(pl.sp,pl.x,pl.y)
	spr(flame,pl.x,pl.y+6)
	--shooting & bullet
	bang()
	if bl.life>0 then spr(16,bl.x,bl.y) end

 --menu
 menu()
end
-->8
function starfield()
  for i=1,#starsx do
   --flicker color
   local col
   if starss[i]>1.9 then
   	col=7
   elseif starss[i]>1.7 then
    col=6
   else
    col=13
   end
   --render  
			pset(starsx[i],starsy[i],col)
			--movement
			if (starsy[i]<128) then
				starsy[i]+=starss[i]
			else
				starsy[i]=0
			end
		end
end

function menu ()
  --score
  print("score: "..score,50,1,6)
  --lives
  for i=0,4 do --5 lives
	  if i<pl.lv then h=33 else h=32 end
	  spr(h,i*6)
  end
end
-->8
function bang()
  if flash>0 then
    circfill(pl.x+3,pl.y-3,flash,7)
    flash-=1
  end
end
__gfx__
00000000000100000001000000010000000000000000000000000000001111000000000000000000000000000000000000000000000000000000000000000000
000000000016100000d6100000271000000000000000000000000000019999100000000000000000000000000000000000000000000000000000000000000000
00700700027620000277620000277100000000000000000000000000193993910000000000000000000000000000000000000000000000000000000000000000
000770000d1e10000d71610000d71d100a777a0000a7a00000a7a00019b99b910000000000000000000000000000000000000000000000000000000000000000
000770002d1521002dd1d12000d71d2009aaa900009a9000009a9000199999910000000000000000000000000000000000000000000000000000000000000000
00700700d765d100d6775d100d67e61002888200009a900000898000119d9d110000000000000000000000000000000000000000000000000000000000000000
00000000d775d100d77655100d67e610000000000089800000282000011111100000000000000000000000000000000000000000000000000000000000000000
00000000ddd11100211111200dd15110000000000028200000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001d1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00d7d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00dad000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00191000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00181000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00020000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
02828200028282000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
08080800088888000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
08000800088888000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
02808200028882000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00282000002820000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__label__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000001d1000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000d7d000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000dad000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000191000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000181000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000111000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000171000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000002766200000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000017d6100000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000021d6d120000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000016776d10000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000017766610000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000011111110000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000a7a000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000009a9000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000898000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000282000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

__sfx__
0001000037330303602d3702935024340203401b33017330133200f3200c320093200631005300106000060000600006000000000000000000000000000000000000000000000000000000000000000000000000
000100000800000610006000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
