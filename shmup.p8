pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
-- very generic shmup 
-- (c) 2023 jimmac.eu

function _init()
 --custom font
 poke(0x5600,unpack(split"6,8,10,0,0,1,0,0,0,0,0,0,0,0,0,0,101,0,16,96,102,112,118,6,112,0,0,0,0,102,112,112,16,0,112,7,80,23,39,1,0,112,7,33,0,7,0,0,16,0,112,7,80,23,39,1,0,112,7,33,0,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,63,63,63,63,63,63,63,0,0,0,63,63,63,0,0,0,0,0,63,51,63,0,0,0,0,0,51,12,51,0,0,0,0,0,51,0,51,0,0,0,0,0,51,51,51,0,0,0,0,48,60,63,60,48,0,0,0,3,15,63,15,3,0,0,62,6,6,6,6,0,0,0,0,0,48,48,48,48,62,0,99,54,28,62,8,62,8,0,0,0,0,24,0,0,0,0,0,0,0,0,0,12,24,0,0,0,0,0,0,12,12,0,0,0,10,10,0,0,0,0,0,4,10,4,0,0,0,0,0,0,0,0,0,0,0,0,6,6,6,6,0,6,6,0,27,27,0,0,0,0,0,0,0,54,127,54,54,127,54,0,8,62,11,62,104,62,8,0,0,27,24,12,12,6,54,0,14,27,27,110,59,59,110,0,6,6,0,0,0,0,0,0,6,7,3,1,3,7,6,0,3,7,6,4,6,7,3,0,0,0,27,14,31,27,0,0,0,0,0,6,15,6,0,0,0,0,0,0,0,6,7,3,0,0,0,15,15,0,0,0,0,0,0,0,0,6,6,0,32,48,24,12,6,3,1,0,14,31,27,27,27,31,14,0,6,7,7,6,6,15,15,0,15,31,24,14,3,31,31,0,15,31,24,14,24,31,15,0,27,27,27,30,24,24,24,0,31,31,3,15,24,31,15,0,14,15,3,15,27,31,14,0,31,31,24,28,6,6,6,0,14,31,27,14,27,31,14,0,14,31,27,30,24,30,14,0,0,0,6,6,0,6,6,0,0,0,6,6,0,6,7,3,48,24,12,6,12,24,48,0,0,0,15,15,0,15,0,0,6,12,24,48,24,12,6,0,7,15,12,6,0,6,6,0,0,30,51,59,59,3,30,0,0,14,14,30,27,63,51,0,0,15,31,27,15,27,15,0,0,28,30,7,3,3,30,0,0,7,15,27,27,15,7,0,0,14,15,3,15,3,15,0,14,15,3,15,3,3,3,0,0,28,30,3,27,27,30,0,0,27,27,27,31,27,27,0,0,3,3,3,3,3,3,0,0,14,14,12,12,12,7,0,0,51,51,27,15,31,59,0,0,3,3,3,3,3,15,0,0,54,62,62,107,107,99,0,0,48,51,55,63,59,51,0,0,14,31,27,27,27,14,0,0,15,31,27,15,3,3,0,0,14,31,27,27,15,30,0,0,15,31,27,11,31,27,0,0,14,15,3,6,12,7,0,0,15,15,6,6,6,6,0,0,27,27,27,27,27,14,0,0,51,51,51,27,26,14,0,0,99,99,107,42,62,54,0,0,27,27,27,14,27,27,0,0,27,27,27,14,12,6,0,0,15,15,12,6,3,15,0,62,6,6,6,6,6,62,0,1,3,6,12,24,48,32,0,62,48,48,48,48,48,62,0,12,30,18,0,0,0,0,0,0,0,0,0,0,0,0,31,12,24,0,0,0,0,0,0,14,14,30,27,31,63,51,0,15,31,27,15,27,31,15,0,28,30,7,3,3,31,30,0,7,15,27,27,27,15,7,0,14,15,3,15,3,15,15,0,14,15,3,15,3,3,3,0,28,30,3,27,27,31,30,0,27,27,27,31,31,27,27,0,3,3,3,3,3,3,3,0,14,14,12,12,12,15,7,0,51,51,27,15,31,51,51,0,3,3,3,3,3,15,15,0,54,62,62,107,107,99,99,0,48,51,55,63,59,51,51,0,14,31,27,27,27,31,14,0,15,31,27,31,15,3,3,0,14,31,27,27,15,30,28,0,15,31,27,11,31,31,27,0,14,15,3,6,12,15,7,0,15,15,6,6,6,6,6,0,27,27,27,27,27,31,14,0,51,51,51,27,27,31,14,0,99,99,107,107,62,62,54,0,27,27,31,14,27,27,27,0,27,27,27,14,12,6,6,0,15,15,12,6,3,15,15,0,56,12,12,7,12,12,56,0,8,8,8,0,8,8,8,0,14,24,24,112,24,24,14,0,0,0,110,59,0,0,0,0,0,0,0,0,0,0,0,0,127,127,127,127,127,127,127,0,85,42,85,42,85,42,85,0,65,99,127,93,93,119,62,0,62,99,99,119,62,65,62,0,17,68,17,68,17,68,17,0,4,12,124,62,31,24,16,0,28,38,95,95,127,62,28,0,34,119,127,127,62,28,8,0,42,28,54,119,54,28,42,0,28,28,62,93,28,20,20,0,8,28,62,127,62,42,58,0,62,103,99,103,62,65,62,0,62,127,93,93,127,99,62,0,24,120,8,8,8,15,7,0,62,99,107,99,62,65,62,0,8,20,42,93,42,20,8,0,0,0,0,85,0,0,0,0,62,115,99,115,62,65,62,0,8,28,127,28,54,34,0,0,127,34,20,8,20,34,127,0,62,119,99,99,62,65,62,0,0,10,4,0,80,32,0,0,17,42,68,0,17,42,68,0,62,107,119,107,62,65,62,0,127,0,127,0,127,0,127,0,85,85,85,85,85,85,85,0"))
 fr=0
 score=0
 blinkt=0
 splat=splat()
 
	mode="start"
	--mode="end"
end

function _update60 ()
  blinkt+=1
  
  if mode=="game" then
	  update_game()
	 elseif mode=="end" then
	  update_end()
	 else
	 --start
	 	update_start()
	 end
end

function _draw ()
  if mode=="game" then
	  draw_game()
	 elseif mode=="end" then
	  draw_end()
	 else
	 --start
	 	draw_start()
	 end
end

function startgame()
	mode="game"
	flash=0
	--player
	pl = {}
	pl.x=63
	pl.y=100
	pl.spx=0
	pl.spy=0 --speed
	pl.spr=2
	pl.lv=5 --number of lives
	flame=4 --spr of flame
	
	bl={} --bulets
	
	en={} --enemies

	--[[	
	add(en,{x=40,y=24,spy=.2,spx=0,
	        spr=20+rnd(3)})
	--]]
	for i=1,7 do
		for j=1,3 do
			local myen={}
			myen.x=(i-1)*16+12
			myen.y=16*j
			myen.spy=.2
			myen.spx=0
			myen.spr=20+rnd(3)
			add(en,myen)
		end
	end

	
	--starfield
	stars={}
	for i=1,100 do
		local newstar={}
		newstar.x=flr(rnd(128))
		newstar.y=flr(rnd(128))
		newstar.s=rnd(1.5)+0.5
		add(stars,newstar)
	end
end
-->8
--tools


function menu ()
  --score
  print("score: "..score,50,1,6)
  --lives
  for i=0,4 do --5 lives
	  if i<pl.lv then h=9 else h=8 end
	  spr(h,i*6)
  end
end

function bang()
  if flash>0 then
    circfill(pl.x+3,pl.y-3,flash,7)
    flash-=1
  end
end

--nicer labels
function blink()
 local cols={5,5,5,5,5,5,
 												5,5,5,5,5,5,
 												5,5,5,5,5,5,
 												10,10,10,10,10,10,
 												7,7,7,7,7,7,
 												7,7,7,7,7,7}
 
	if blinkt>#cols then
		blinkt=0
	end
	
	return cols[blinkt+1]
end

function splat()
 local tbl={}
 for i=1,20 do
	 tbl[i]={}
 	tbl[i].x=60-rnd(40)+rnd(40)
 	tbl[i].y=45-rnd(20)+rnd(20)
 	tbl[i].r=4+rnd(8)
 end
 
	return tbl
end

function draw_logo(l)
 --background
 --jitter=1+rnd(0.01)
 jitter=1
 
 for i=1,#splat do
 	circfill(splat[i].x*jitter,
 	         splat[i].y*jitter,
 	         splat[i].r,
 	         8)
 end
	if l==1 then
		 spr(64,0,36,16,4)
	end
end

function drwspr(myspr)
	spr(myspr.spr,myspr.x,myspr.y)
end

function col(a,b)
	--collision between a and b
	--assumes 8x8 sprites
	local a_left=a.x
	local a_top=a.y
	local a_right=a.x+7
	local a_bottom=a.y+7
	
	local b_left=b.x
	local b_top=b.y
	local b_right=b.x+7
	local b_bottom=b.y+7

	if a_top>b_bottom then	return false	end
	if b_top>a_bottom then	return false	end
 if a_left>b_right then	return false	end
 if b_left>a_right then	return false	end
 
 return true
end
-->8
--update
function update_game()
 --starfield
 update_stars()
 
	--flame
	flame=4+rnd(3)

 --ship movement
	if btn(➡️) and pl.x<119 then
		pl.spx=2
		pl.spy=0
		pl.spr=3
	elseif btn(⬅️) and pl.x>1 then
		pl.spx=-2
		pl.spy=0
		pl.spr=1
	elseif btn(⬆️) and pl.y>0 then
	 pl.spr=2
	 pl.spx=0
	 pl.spy=-1
	elseif btn(⬇️) and pl.y>=0 and pl.y<110 then
	 pl.spr=2
	 pl.spx=0
	 pl.spy=2
	 flame=7 --small flame
	else 
	 pl.spy=0
		pl.spx=0	
		pl.spr=2
	end
	pl.x=pl.x+pl.spx
	pl.y=pl.y+pl.spy 
	
	--moving enemies
	for myen in all(en) do
		myen.y+=myen.spy
		myen.spr+=.1 --wtf works
		if myen.spr>=24 then
			myen.spr=20
		end
		
		if myen.y>128 then
		 del(en,myen)
		end
	end
	
	--collision pl x en
	for myen in all(en) do
		if col(myen,pl) then
			pl.lv-=1
			sfx(1)
			del(en,myen)
		end
	end
	if pl.lv<=0 then
		mode="end"
	end
	
	--shooting
	if btnp(❎) then
		sfx(0)
		local newbl={}
		
		newbl.x=pl.x
		newbl.y=pl.y-3
		newbl.spr=16+flr(rnd(2))
		add(bl,newbl)
		flash=3 --size of the muzzleflash resets
	end
	--manage flying bullets
	for bullet in all(bl) do
		bullet.y-=2
		if bullet.y<-8 then --delete offscreen bullets
			del(bl,bullet)
		end
	end
	--collision bullets vs enemies
	for bullet in all(bl) do
		for enemy in all(en) do
			if col(bullet,enemy) then
				sfx(1)
				score+=100
				del(en,enemy)
				del(bl,bullet)
			end
		end
	end
	
end


function update_start()
	if btnp(❎) or btnp(🅾️) then
		startgame()
	end
end

function update_end()
 score=0
 pl.lv=5
	if btnp(❎) or btnp(🅾️) then
		mode="start"
	end
end

function update_stars()
  for mystar in all(stars) do
  	
  	mystar.y=mystar.y+mystar.s
  	if mystar.y>128 then
  	  mystar.y=mystar.y-128
  	end
  end 
end

-->8
--draw

function draw_game()
	cls(0)
	fr+=1
	--starfield
	draw_stars()

	--player
	drwspr(pl)
	--flame
	spr(flame,pl.x,pl.y+5)
	
	--enemies
	for myen in all(en) do
		drwspr(myen)
	end
	
	--shooting & bullet
	bang() --show muzzle flash
	for mybul in all(bl) do
		drwspr(mybul)
	end
	
 --top menu
 menu()
end

function draw_start()
	cls(2)
	draw_logo(1)
	
	print("press any button\
    to start", 30,100,blink())
end

function draw_end()
 for i=0,128 do
   for j=0,128 do
   	--pset(i,j,pixels[i*j])
   	if (j%2==0) then
   		pset(i,j,0)
   	else
   	 pset(i,j,1)
   	end
   end
 end

	print("\14 game over",38,41,1)
	print("\14 game over",38,40,7)

	print("press any button", 34,101,1)	
	print("press any button", 34,100,blink())
end

function draw_stars()
  for i=1,#stars do
  	local mystar=stars[i]
  	local scol=6
  	
  	if mystar.s<1 then
  		scol=1
  	elseif mystar.s<1.5 then
  		scol=13
  	end
  	
  	pset(mystar.x,mystar.y,scol)
  end
end

__gfx__
00000000000660000006600000066000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000007d0000007600000076000000000000000000000000000000000000282820002828200000000000000000000000000000000000000000000000000
0000000000c6d000006c16000007dc00000000000000000000000000000000000808080008888800000000000000000000000000000000000000000000000000
0000000000c6d0000d6c16d000077c000a7777a000a77a0000a77a00001881000800080008888800000000000000000000000000000000000000000000000000
000000000dd6d000d667df6d00077d6009aaaa90009aa900009aa900000110000280820002888200000000000000000000000000000000000000000000000000
000000006dd6d0006667d6f600077d6602888820009aa90000899800000000000028200000282000000000000000000000000000000000000000000000000000
000000006dddd00066d22f6f000777d6000000000089980000288200000000000000000000000000000000000000000000000000000000000000000000000000
00000000000880000289982000098800000000000028820000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000033003300000000003300330000000000000000000000000000000000000000000000000000000000000000000000000
0001100000088000000000000000000033b33b330330033033b33b33033003300000000000000000000000000000000000000000000000000000000000000000
001cc100009aa90000000000000000003bbbbbb333b33b333bbbbbb333b33b330000000000000000000000000000000000000000000000000000000000000000
01c77c1008a77a8000000000000000000b7717b03bbbbbb30b7717b03bbbbbb30000000000000000000000000000000000000000000000000000000000000000
01c77c1008a77a8000000000000000000b7117b00b7717b00b7117b00b7717b00000000000000000000000000000000000000000000000000000000000000000
001cc100009aa9000000000000000000005775000b7117b0005775000b7117b00000000000000000000000000000000000000000000000000000000000000000
00011000000880000000000000000000030330300056650003033030005665000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000050000503503305305000050053333500000000000000000000000000000000000000000000000000000000000000000
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
000000000000000000ee777777ee00000777777000000777777007777777770000007777777770077777700000077777700777777777777e0000000000000000
0000000000000000e77777777777ee00077777700000077777700777777777e0000e777777777007777770000007777770077777777777777e00000000000000
000000000000000e77777777777777e0077777700000077777700777777777e0000e7777777770077777700000077777700777777777777777e0000000000000
00000000000000e777777777777777e0077777700000077777700777777777700007777777777007777770000007777770077777777777777770000000000000
00000000000000e777777eee777777700777777000000777777007777777777e00e777777777700777777000000777777007777770000e77777e000000000000
00000000000000e77777e0000077777e0777777000000777777007777777777e00e7777777777007777770000007777770077777700000e7777e000000000000
00000000000000e77777e00000eeeeee0777777000000777777007777777777e00e7777777777007777770000007777770077777700000e7777e000000000000
00000000000000e7777777ee00000000077777777777777777700777777777770077777777777007777770000007777770077777700000e7777e000000000000
00000000000000e777777777777ee00007777777777777777770077777777777ee7777777777700777777000000777777007777770000e77777e000000000000
000000000000000e7777777777777e00077777777777777777700777777e7777ee7777e77777700777777000000777777007777777777777777e000000000000
0000000000000000e7777777777777e0077777777777777777700777777e7777777777e777777007777770000007777770077777777777777770000000000000
000000000000000000ee77777777777e077777777777777777700777777e7777777777e7777770077777700000077777700777777777777777e0000000000000
0000000000000000000000ee7777777e077777700000077777700777777077777777770777777007777770000007777770077777777777777e00000000000000
0000000000000077777e00000e77777e0777777000000777777007777770e77777777e07777770077777700000077777700777777777777e0000000000000000
00000000000000777777e0000e77777e0777777000000777777007777770e77777777e077777700777777e0000e7777770077777700000000000000000000000
000000000000007777777eeee777777e07777770000007777770077777700777777770077777700e777777eeee77777770077777700000000000000000000000
00000000000000e7777777777777777e07777770000007777770077777700e777777e0077777700e7777777777777777e0077777700000000000000000000000
000000000000000e77777777777777e007777770000007777770077777700e777777e00777777000e77777777777777e00077777700000000000000000000000
0000000000000000e777777777777e000777777000000777777007777770007777770007777770000e77777777777ee000077777700000000000000000000000
00000000000000000ee7777777ee0000077777700000077777700777777000e7777e000777777000000ee777777ee00000077777700000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ddddddddddddddd6777777777777776dd777776dddddd677777dd7777777776dddd6777777777dd777776dddddd777776dd7777777777777776ddddddddddddd
dddddddddddddd67777777777777776dd777776dddddd677777dd7777777777dddd7777777777dd777776dddddd777776dd7777777777777777ddddddddddddd
dddddddddddddd67777776667777777dd777776dddddd677777dd77777777776dd67777777777dd777776dddddd777776dd77777766677777776dddddddddddd
dddddddddddddd6777776dddd6777776d777776dddddd677777dd77777777776dd67777777777dd777776dddddd777776dd777776dddd6777776dddddddddddd
dddddddddddddd6777776dddd6666666d777776dddddd677777dd77777777776dd67777777777dd777776dddddd777776dd777776dddd6777776dddddddddddd
dddddddddddddd67777777666dddddddd777777666666777777dd77777777777dd77777677777dd777776dddddd777776dd777776dddd6777776dddddddddddd
dddddddddddddd677777777777766dddd777777777777777777dd777776777776677777677777dd777776dddddd777776dd777776dddd6777776dddddddddddd
ddddddddddddddd677777777777776ddd777777777777777777dd777776677776677776677777dd777776dddddd777776dd77777766667777776dddddddddddd
dddddddddddddddd677777777777776dd777777777777777777dd777776677777677776677777dd777776dddddd777776dd7777777777777777ddddddddddddd
dddddddddddddddddd66777777777776d777777777777777777dd777776677777777776677777dd777776dddddd777776dd7777777777777776ddddddddddddd
dddddddddddddddddddddd6677777776d777776dddddd677777dd777776d7777777777d677777dd777776ddddd6777776dd777777777777776dddddddddddddd
dddddddddddddd777776ddddd6777776d777776dddddd677777dd777776d6777777776d677777dd777777ddddd6777776dd7777777777776dddddddddddddddd
dddddddddddddd7777776dddd6777776d777776dddddd677777dd777776d6777777776d677777dd7777776ddd67777776dd777776ddddddddddddddddddddddd
dddddddddddddd777777766667777776d777776dddddd677777dd777776dd77777777dd677777dd677777766677777776dd777776ddddddddddddddddddddddd
dddddddddddddd677777777777777776d777776dddddd677777dd777776dd67777776dd677777dd67777777777777776ddd777776ddddddddddddddddddddddd
ddddddddddddddd6777777777777776dd777776dddddd677777dd777776dd67777776dd677777ddd677777777777777dddd777776ddddddddddddddddddddddd
dddddddddddddddd67777777777776ddd777776dddddd677777dd777776ddd777777ddd677777dddd67777777777766dddd777776ddddddddddddddddddddddd
ddddddddddddddddd66777777766ddddd777776dddddd677777dd777776ddd677776ddd677777dddddd6677777766dddddd777776ddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
__label__
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222288888222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222228888888882222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222288888888888222228888822222222222222222222222222222222222
22222222222222222222222222222222222222222222228888822222222222222222222888888888888822888888888222222222222222222222222222222222
22222222222222222222222222222222222222222222288888882222222222222222222888888888888828888888888822222222222222222222222222222222
22222222222222222222222222222222222222222222888888888222222222222222228888888888888888888888888882222222222222222222222222222222
22222222222222222222222222222222222222222228888888888822222222222222228888888888888888888888888882222222222222222222222222222222
22222222222222222222222222222222222222222288888888888882222222222222228888888888888888888888888888222222222222222222222222222222
22222222222222222222222222222222222222222288888888888882222222222222228888888888888888888888888888222222222222222222222222222222
22222222222222222222222222222222222222222288888888888882222222222222228888888888888888888888888888222222222222222222222222222222
22222222222222222222222222222222222222222288888888888882222222222222228888888888888888888888888888222222222222222222222222222222
22222222222222222222222222222222222222222288888888888882222222222222228888888888888888888888888888222222222222222222222222222222
22222222222222222222222222222222222222222228888888888822222222222222288888888888888888888888888882222222222222222222222222222222
22222222222222222222222222222222222222222288888888888222222222222222888888888888888888888888888882222222222222222222222222222222
22222222222222222222222222222222222222222888888888888822222222222288888888888888888888888888888822222222222222222222222222222222
22222222222222222222222222222222222222222888888888888822222222228888888888888888888888888888888222222222222222222222222222222222
22222222222222222222222222222222222222228888888888888882222222228888888888888888888888888888822222222222222222222222222222222222
22222222222222222222222222222222222222228888888888888882222222288888888888888888888888888822222222222222222222222222222222222222
22222222222222222222222222222222222222228888888888888882222222288888888888888888888888888822222222222222222222222222222222222222
22222222222222222222222222222222222222228888888888888882222222888888888888888888888888888822222222222222222222222222222222222222
22222222222222222222222222222222222222288888888888888882222222888888888888888888888888888822222222222222222222222222222222222222
22222222222222222222222222222222222222288888888888888822222222888888888888888888888888888822222222222222222222222222222222222222
22222222222222222222222222228888888222888888888888888882222222888888888888888888888888888222222222222222222222222222222222222222
222222222222222222ee777777ee88888777777888888777777887777777778888887777777778877777788882277777722777777777777e2222222222222222
2222222222222222e77777777777ee88877777788888877777788777777777e8888e777777777887777778888227777772277777777777777e22222222222222
222222222222222e77777777777777e8877777788888877777788777777777e8888e7777777778877777788882277777722777777777777777e2222222222222
22222222222222e777777777777777e8877777788888877777788777777777788887777777777887777778882227777772277777777777777772222222222222
22222222222222e777777eee777777788777777888888777777887777777777e88e777777777788777777888222777777227777772222e77777e222222222222
22222222222222e77777e2888877777e8777777888888777777887777777777e88e7777777777887777778822227777772277777722222e7777e222222222222
22222222222222e77777e88888eeeeee8777777888888777777887777777777e88e7777777777887777778822227777772277777722222e7777e222222222222
22222222222222e7777777ee88888888877777777777777777788777777777778877777777777887777778222227777772277777722222e7777e222222222222
22222222222222e777777777777ee88887777777777777777778877777777777ee7777777777788777777822222777777227777772222e77777e222222222222
222222222222222e7777777777777e88877777777777777777788777777e7777ee7777e77777788777777222222777777227777777777777777e222222222222
2222222222222222e7777777777777e8877777777777777777788777777e7777777777e777777887777772222227777772277777777777777772222222222222
222222222222222222ee77777777777e877777777777777777788777777e7777777777e7777778877777722222277777722777777777777777e2222222222222
2222222222222222222228ee7777777e877777788888877777788777777877777777772777777887777772222227777772277777777777777e22222222222222
2222222222222277777e22888e77777e8777777888888777777887777778e77777777e27777778877777722222277777722777777777777e2222222222222222
22222222222222777777e2888e77777e8777777888888777777887777778e77777777e277777722777777e2222e7777772277777722222222222222222222222
222222222222227777777eeee777777e87777778888887777778877777788777777772277777722e777777eeee77777772277777722222222222222222222222
22222222222222e7777777777777777e87777778888887777778877777788e777777e2277777722e7777777777777777e2277777722222222222222222222222
222222222222222e77777777777777e887777778888887777778877777788e777777e22777777222e77777777777777e22277777722222222222222222222222
2222222222222222e777777777777e888777777888888777777887777778887777772227777772222e77777777777ee222277777722222222222222222222222
22222222222222222ee7777777ee8888877777788888877777788777777888e7777e222777777222222ee777777ee22222277777722222222222222222222222
22222222222222222222222222222222288888888888888888888888888888222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222288888888888888888888888888882222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222288888888888888888888888888222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222288888888888888888888888222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222228888888888888888888882222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222228888888888888888888882222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222888888888888888888822222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222288888888888888888222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222288888888888888888222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222888888888888822222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222288888888888222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222888888822222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222255525552555225522552222255525522525222225552525255525552255255222222222222222222222222222222222222
22222222222222222222222222222252525252522252225222222252525252525222225252525225222522525252522222222222222222222222222222222222
22222222222222222222222222222255525522552255525552222255525252555222225522525225222522525252522222222222222222222222222222222222
22222222222222222222222222222252225252522222522252222252525252225222225252525225222522525252522222222222222222222222222222222222
22222222222222222222222222222252225252555255225522222252525252555222225552255225222522552252522222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222225552255222222552555255525552555222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222522525222225222252252525252252222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222522525222225552252255525522252222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222522525222222252252252525252252222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222522552222225522252252525252252222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222

__sfx__
00010000381302b1401e1401214011140081400613002130031200112000120001200211005300106000060000600006000000000000000000000000000000000000000000000000000000000000000000000000
000200002d6502c610286501e6101965015650136500b650076500365002650006500065006600046000360001600006000060000600006000060000600006000060000000000000000000000000000000000000
