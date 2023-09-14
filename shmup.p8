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
	pl = {x=63,
	      y=100,
	      spx=0,
	      spy=0,
	      spr=2,
	      lv=2}
	flame=4
	bl={} --bulets
	
	en={} --enemies
	
	local myen={}
	myen.x=60
	myen.y=16
	myen.spr=20
	add(en,myen)
	
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
		myen.y+=.2
		myen.spr+=.1 --wtf works
		if myen.spr>=24 then
			myen.spr=20
		end
		
		if myen.y>128 then
		 del(en,myen)
		end
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
	
end


function update_start()
	if btnp(❎) or btnp(🅾️) then
		startgame()
	end
end

function update_end()
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
0000000000000000000000000000000010101011141455ddddd666677777777777777777676666ddddd554541110101010000000000000000000000000000000
00000000000000000000000000000000010101011145455ddd6d6666777777777777777776666d6ddd555541110101010100000000000000000000000000001d
0000000000000000000000000000000010101011111455d5ddd6d66767777777777777676666d6ddd555541411101010100000000000000000000000000000d5
00000000000000000000000000000001010101011111455ddddd6d667677777777777676666d6ddd5555414111010101010000000000000000000000000000d1
000000000000000000000000000000001010101011141455ddddd66667676777777767666666ddd55554141110101010100000000000000000000000000005d1
0000000000000000000000000000000101010101111145455ddd6d6d66767677777666666d6ddd55554141111101010100000000000000000000000000005100
00000000000000000000000000000010101010101111145555ddd6d66667676777666666d6d6ddd554141111101010101000000000000000000000000000d110
0000000000000000000000000000000101010101111141455ddddd6d666666667666666d6d6d5d55454111110101010100000000000000000000000000005511
00000000000000000000000000000000101010101111145455d5ddddd6666666766666d6d6dd555154111110101010100000000000000000000000000000d555
000000000000000000000000000000010101010111111145455ddddddd6d666666666d6d6dd55545411111110101010000000000000000000000000000d51111
0000000000000000000000000000000000101010111111145555d5ddddd6dd66666dd6d6dddd5454141111101010101000000000000000000000000000655111
0000000000000000000000000000000001010101011111111555556dddddd6d6765ddddddd561541411111010101010000000000000000000000000000d55111
0000000000000000000000000000000000101010111111115455557ddddddd66751dddddd5d614541411111010101000000000000000000000000000000d5111
0000000000000000000000000000000000010101011111114545556dddddddd7d111dddd55571541411111010101000100000000000000000000000000565555
0000000000000000000000000000000000101010111111111455557ddddddd66d510ddd5d556145414111110101000000000000000000000000000000056ddd5
0000000000000000000000000000000000010101011111114545556ddddddd6d10000ddd555715414111110101010100000000000000000000000000000105dd
0000000000000000000000000000000000001010111111111454556ddddddd7510011dd5d55611141111111010000000000000000000000000000000000015dd
0000000d00000000000000000000000000010101011111111545556d6767dd6d55111d6755571541411111010101000000000000000000000000000000005dd6
0000000011000000000000000000000000001010111111111454556677777d7d511115777656111411111110101000000000000000000000000000000001dddd
0000000001d0000000000000000000000001010111111111154555677777776d000115777757151111111100010000000000000000000000000000000015dd55
0000000000160d000000000000000000000000101111111111555d6777777765100015777776661111111110101000000000000000000000000000000055ddd5
000000000101d650000000000000000000000101111111111556d767f777776510000167ff67671111111101010100000000000000000000000000000015dddd
00000000001016600000000000000000001010101155511155d677777677766110000166f6f77611115115501010100000000000000000000000000000001155
0600000000000dd0000000000000000000010101155555d155d66767777757d167d001166667675111111555010100010000000000000000000000000000001d
00000000000001110000000000000000101010111555551155dd6677777676666010011df7777661665155555010001000000000000000000000000000000155
00000000000001101100000000000000010101011555dd5dddddd66ff76667d6d01100057777d556665511d11501010000000000000000000000000000055ddd
000000000000000000d0000000000000001010555551005011551566ff65d676d1010011776d511000000001515010000000000000000000000000000005dddd
00000000000000000005000000000000010101555555d5151ddd666d6f6d576d5101001166d66650000001151115100000000000000000000000000000055d5d
0000000000000000000010000000000000101055555551000000557dff7dd67d510100116d66d150000011111155510000000000000000000000000d55ddd5dd
0000000000000000000001000000000000010155551555500000d1566666d76d5101501105651000000011111115510000000000000000000001110d55511155
00000000000000000000000000000000001011555111115000115155656dd66d51011015556050000000011111155100000000000000000000115dddd5111111
00000000000000000000000000000000010115111111100000011550666ddf6d51011015551001000000051116d511000000000000000000011156dd55111101
000000000000000000000000000000000010115dd111100000000111166dd67d51015015d1050100000001116d5111d0515555000000000000111d6551111001
00000000000000000000000000000101060551155d111000000000155566df6d51051015500200000000011155d5160000000000000000000011155551111115
0000000000000000000000000000000050015616551111000000000105fdd67d51010015000000000000011165d565d00000000000000065d001555511111110
000000000000000000000000000000000000015556111100100000000566d66d550510150000000000000111d000600000001000000015551011155511111101
0000000000000000000000000000000000000d611151110000011100256dd67d51155015222000000000011111000000000010000005d5d511d1511111111000
0000000000000000000000000000000000000000100d111100010002226656dd55151015f422000000511115510000000010000055555d551111551111000000
000000000000000000000000000000000050000001115d501000115524fd5ddd45255055ff42d50000005511001000100000001dddd551111111555511000000
000000000000000000000000000000000000010501111111110004444ffd5ddd445511556fff44000500001110000000000000ddddd5111111111dd6d1000000
000000000000000000000000000000000005010511111001100024fffffd5ddd4455555577ffe40000000011111015000000006ddd65511110111116d1000000
000000000000000000000000000000000000000111111001000101eff76d5e4d4454550567ff40000000001111100000000000d6dd5511111111111500000000
000000000000000000000000000000000000000051111100000000ffff7d5ded444545556ffff000000051115100000000000066655511111100001110000000
0000000000000000000000000000000000000000001111155000424ff7676ff22222ff6f67ff22500000551111000000000006d66d5111111100000000000000
0000000000000000000000000000000000000000001111550000024eff55ddf42224d4206ffe4200012452111100100000015ddd6d1111111110000000000000
0000000000000000000000000000000000000000011112525000054fff454ff444446f426fff42000002521111100000000d56d6651111110000000000000000
000000000000000000000000000000000000001011115120000022effff447fefffe7642fffff2440000251111110000000dd66d755111111000000000000000
000000000000000000000000000000000000001111111150022ffffff76767fff7ff676e6fffffff22025511111111010006d6dddd1111111100000000000000
00000000000000000000000000000000100001111111111124effffff677777f777f7f777fffffffe44555111111111111166666d55111111000000000000000
000000000000000000000000000000001d10111111151111154effffeff7f7777777f7f7fe4fffffd4555511111111111565dd65dd1111111100000000100000
000000000000000000000000000000002d00001111111111554dffffd4ff7f7777777ffffd44fffe445511111111111116ddd555555111111100000000000000
000000000000000000000000000000000100011111511115555defff4ff7f77777777f77ff44dffd4455111511111511006ddd55555511111100000000000000
0000000000000000000000000000000000001111115111115544eff5eeff777777777777ffe44fe45555115551115dd1005dd55551d511111110000000000000
1000000000000000000001d60000000000001111155d51111554ef654ff7777777777777ffd45fd4551555dd555dd6d50016dd5566ddd6501100000000000000
110000000000001006666676750000000001111155df71111554e555effff777777777ffff44544555116ffddddd66d51dd6d56d6d66dddd1000001151000000
d1100000000001dd6666676766651000001111155ddf61111554e5544fff77777777777ffe44445555116f6f66666dd566dd616506d6dd5d5011110110000000
6dd100000000016ddd5d6667676776611155555d6d5510115554e55444f77777777777fffd4544455111116556f66dd566666d60665011005100111000000000
66dd10000001051155005576767077676ddddd6f01151001155d55544eff77777777777ffe44551551110110006f66d6666d666666d1101d5510000000000000
666d51000005d55501115117777777677776dd661111501155515544fef77777767777fffe44510051100100006f667556d5666d66666d155100111000010000
6666d510000005dd55050667677777777767676f111101111515554eff7f77776677777fffe452000511000000d7665615d5566666d650000001111001010000
66666d5100000000d5d666767677777767f7777611111010111115effff777766677777ffff452200050000066775d55556555515dd050000000000000000000
666666d510000000000dd5666777676d7d76766776d101515115744fff7f77666657777fffd75200000111667776765d55565515515100000000010000000000
6666666d1100000000000d6d66777676d767777777766511101674eee7f777d0f505777fff76d200000156776777766d56666661dd1000011000111110000000
d6666666d1100000000000566667677766667d757667776101566444df7f770677d0777fff67d20000d766767777676657676556100000011100111110000000
dd6666766d11000000000000dd66767666766757777776d010677644f7f77d0050005777fff7752000d677776776767676616600000000000111111110000000
d66d676766510000000000000116656667575d677777660001677f447f77d60566505577ff67662000757776d767676766d1d000000000000011111100000000
dd66d666666510000040000000001655777677656777d50d7d77764ef7766677766d57677ff776dd7707677660767666dd6d0000000000000011111111000000
5dddd666676d11000000000000000d6755677777677750d766776ffff7666667776655767ff777d67d70676766d656d656000000000000010111111100000000
1515ddd66676d110000000000000001d66d6d6677776000066777676f6566677776d55556676766d67d101767660d66600000000000000111111111000000000
1d111dddd6676d1100000000000000001d67000777500d0d60556f67655f66667d66555007666dd5500000676100061000000000000001111111111000000000
111155ddd6666dd11100000000000000100501556d50000dd00056f6506d66dd6d51d550057dd000d00d00d610150000000001dd500511111111110000000000
11115dd6666666d5111111005d000000000505500000510650001066156666000000d55006605000600000050151000000000000000051111111100000000000
115115dd7666666d511110000000000000000015000560060000501655667d000000d5500d5050000d0065d00d00000000000000000000001111100000000000
1111155dd766676cd110000000000000000010000d570055010017661066000000000010056610000500665d0000000000000000000000000001110000000000
1ddd15ddd666666dd000000000000001000000001066006d00006d76006d00000000001000656000055006610000000000000000000000000000011000010011
56d6dd5dddd6665000000000000000000000000006d1066000006666006d1011510000050065507000dd01000000000000000000000000000000511111111111
dddd6d5d6d6660000000000000050540000000000000666010005d75005500d6776100000066d70700dd10000000000004604000000000000000051111111115
ddddd66d66660000000000000000ff62000000000000676777676675005506676d6d500000d66777666d5000000000000f006000000000000000000111155dd7
5d6dd6dd6dd00000000000000002004e00000000000d7677777676700555d666765d500000666677766dd500000000000401d000000000000000000155dd6676
15dd66d660000000000000000002222f0000000000166777777767d0055051d67750510000566777776dd5000000000000d0000000001d111111115dd667666d
1555dddddddddd6d6d11100000004ff20000000000d66677777676600501d1d661100100000666777776d5100000000000000000000551111155ddd677766d6d
11555dddd6d66666dd15100000000000001d000005666777776666d00000501000000000000666677776d5510000005000000000000015155dddd6676666dddd
1155dddd66dd6666d11110000000000005d100000d666777766666d00115500000000000000d66777776d511000000d500000000000055dddd667776666d6d6d
11555ddd66666ddd11111000000000005d10000056676777776666500005500000000000000d666777776d51000000555000000001155ddd6777676666ddd6d5
11115555dddd6ddd111110000000000155000000d6667676fd666d5000001000100000000005666df7f77dd5100000d550000155d5dddd66777666666dd6dd55
1111155ddddd5551111111111111111555000000d667ff4ff4ddd51000000000000000000005d6dffd7445d5100000dd50000015d6d667777766666dd66ddd55
111111ddd5555551111111111111115555000005d666767ff444550000001000000000000001d424ff766dd5100005ddd500005dd666777676666d6dddd5d5d5
1155155dddd55d55511111111111111551000001d6d76766d44450000000000000000000000104444d66dd5d1000015d5d5000d6677777676666dd6dddd6dddd
1115d5ddd5ddd555dd1111111551115555015001d666767564450000000000000000000000000544f6677655500000ddddd00d667777767676dddddddd6dd55d
1d5ddd5555dddddd66dd5511111111155dd5555566d7776665100000000000000000000000000054d66777d55005555dddddd66777776766ddddddd66666d6dd
55d5555555dddd667666ddd111111155dddd55516677776dd1000000000000000000000000000001667677615005d5ddd66677777677766ddddd6d666ddd6d11
11111115155ddd67676766ddd5111515555d5505d6666666515000000006000000000500000000d5d6d6d6d650055dd6666777776666d100d66d6666666d1111
111111115555dd6666767766cdd55151555555156000000d5000000000ddd00000000ddd00000011dd600000d000dd6666777771d11d0000000066666d1115d5
01011111555dddd66667777666dddd155555551d0006500000000000deddd00000000ddddd000000560056100500166777676766151000000001d51ddd11dddd
0015111555dddd66666677777666d5555555510000d6500050000006fddd6d000000ddd5ded000005000d6100000167776d5667676d1000000d511511111dddd
15d6111555ddd6d66767677777666d55555d501000d61000100000ef44dddd000000dd555eef000010005650000001776ddd567766d00055551511111111dddd
55ddd15555efff667676767777766dd555650050016d000000000efed555dd550055d555ddff400010001dd0000000666d55566d6dddd5d555511111111dd555
56d615555defff6f67776767675ddd5d5660060011610000000067ffd45ddd55555555554fff600000110d610000606d555555d6d6dddd1515d5111111ddd555
5566655544fffff676711111111155d566111111111100011111611111155115515555d55dff76f001111161000101111151111111111111116111111115d550
5dd66dd44deffff5061166777777661661177111111100111d6d61177777777711155577777ddddfd1111111000617777761177777777777761111111155dd51
55dd6dd66df6ffff61677777777777661117711111110111d6d6d11777777777611156777776d6d11d111111000117777761177777777777777611115111d510
5dd6d556d6d666ff167777777777777761177111111111116d6d6117777777776111167777776d61161111111001177777611777777777777777611111555000
dd655dd66ddd66f167777777777777776117711111111116d66661177777777771111777777766611d61111110f1177777611777777777777777711111010101
151d1d166d5dd661677777766677777771177711111111166666711777777777761167777777766116d611111161177777611777777666777777761151011010
11116161d1dddd616777776000067777761777711111111666777117777777777611677777777771166d61110671177777611777776111167777761111110101
101d1d15161ddd6167777760111666666617776661111116777771177777777776116777777777711666d6d1fff1177777611777776111167777761100101010
011111115161d6d16777777766611111111777666666666777777117777777777711777776777771166666611df1177777611777776111167777761111111111
10101111151dd6616777777777777661114777666666777777777117777767777766777776777771176666611411177777611777776111167777761110111511
0101011151d15d660677777777777776115777766777777777777117777766777766777766777771177766611211177777611777777666677777765101015151
1010111115161ddd5067777777777777611777777777777777777117777766777776777766777771177777611011177777611777777777777777711110151515
0101011151d166655d00667777777777761777777777777777777117777766777777777766777771177777611111177777611777777777777777610151515151
101011151516166111110000667777777617777760000006777771177777607777777777067777711777776111116777776117777777777777760115151d1511
0101011151d166117777761100067777761777776011110677777117777760677777777606777771177777711111677777611777777777777600115151515111
101011151616d1117777776111167777761777776111111677777117777760677777777616777771177777761116777777611777776000000001111515151010
01010111d1d1d1117777777666677777761777776111111677777117777761177777777116777771167777776667777777611777776000000111011111111101
10101011161dd1116777777777777777761777776111111677777117777761167777776116777771167777777777777776111777776110111110101011101010
0101011151d16d11067777777777777760177777611111167777711777776116777777611677777110677777777777777111177777610101110101d111010101
10101011161665111067777777777776011777776111111677777117777761107777770116777771110677777777777661111777776110101010151115101010
0101011161d161511106677777776600111777776111111677777117777761116777761106777771111016677777766111111777776101015101010101510101
10101011151511111110000000000001111000000111111000000110000001110000001110000001111000000000000111111000000110101010101010101010
01010101111111111111100000000111511100001161111100001101010111110000011100000001111100000000001111111100001101010101515101010101
101010101111111010111111151011101d161d111011111111151410101511101010101111111011111010101011111010111111111010101010101010101011
015101d1011111010101011111d1110101d1d10101015111011171f1010101010101010101110101015101010101010101010111010101010101010101010101
101511151d151d1d1511111111111111111510101010111010121e14101010101010101010101010101010101010101010101010101010101010101010101010
0101511151d111d1d1d1d11101011101111101010101015111010121010101010101010101011101110101010101010101010101010101010101010101010101
1111111d151d151d1d1d1d1115151010111110101010101110101010101010101010101011111110111010101010101010101010101010101010101010101010
01511151515111d1d1d151d151110101010101010101010101010101010101010101010111111101110101010101010101010101010101010101010101010101
10111510111111151515151d10101010101010101010101010101010101010101010101011111011111010101010101010101010101010101010101010101010

__sfx__
00010000381302b1401e1401214011140081400613002130031200112000120001200211005300106000060000600006000000000000000000000000000000000000000000000000000000000000000000000000
000100000800000610006000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
