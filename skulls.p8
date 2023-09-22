pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
-- very generic shmup 
-- (c) 2023 jimmac.eu

-- todo

-- boss
	-- space station map under
	-- special states
	   -- shooting aimed fast
	   -- spread shot gallore
	   -- enemy pooping
	-- special explosion
	
-- polish
	-- animated start screen blob
	-- delayed wave label 
	   --transition
	-- special boss music
	-- end stats -- ens killed
	             -- time
	             -- shots fired
	             -- lives lost

function _init()
 --custom font
 poke(0x5600,unpack(split"6,8,10,0,0,1,0,0,0,0,0,0,0,0,0,0,101,0,16,96,102,112,118,6,112,0,0,0,0,102,112,112,16,0,112,7,80,23,39,1,0,112,7,33,0,7,0,0,16,0,112,7,80,23,39,1,0,112,7,33,0,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,63,63,63,63,63,63,63,0,0,0,63,63,63,0,0,0,0,0,63,51,63,0,0,0,0,0,51,12,51,0,0,0,0,0,51,0,51,0,0,0,0,0,51,51,51,0,0,0,0,48,60,63,60,48,0,0,0,3,15,63,15,3,0,0,62,6,6,6,6,0,0,0,0,0,48,48,48,48,62,0,99,54,28,62,8,62,8,0,0,0,0,24,0,0,0,0,0,0,0,0,0,12,24,0,0,0,0,0,0,12,12,0,0,0,10,10,0,0,0,0,0,4,10,4,0,0,0,0,0,0,0,0,0,0,0,0,6,6,6,6,0,6,6,0,27,27,0,0,0,0,0,0,0,54,127,54,54,127,54,0,8,62,11,62,104,62,8,0,0,27,24,12,12,6,54,0,14,27,27,110,59,59,110,0,6,6,0,0,0,0,0,0,6,7,3,1,3,7,6,0,3,7,6,4,6,7,3,0,0,0,27,14,31,27,0,0,0,0,0,6,15,6,0,0,0,0,0,0,0,6,7,3,0,0,0,15,15,0,0,0,0,0,0,0,0,6,6,0,32,48,24,12,6,3,1,0,14,31,27,27,27,31,14,0,6,7,7,6,6,15,15,0,15,31,24,14,3,31,31,0,15,31,24,14,24,31,15,0,27,27,27,30,24,24,24,0,31,31,3,15,24,31,15,0,14,15,3,15,27,31,14,0,31,31,24,28,6,6,6,0,14,31,27,14,27,31,14,0,14,31,27,30,24,30,14,0,0,0,6,6,0,6,6,0,0,0,6,6,0,6,7,3,48,24,12,6,12,24,48,0,0,0,15,15,0,15,0,0,6,12,24,48,24,12,6,0,7,15,12,6,0,6,6,0,0,30,51,59,59,3,30,0,0,14,14,30,27,63,51,0,0,15,31,27,15,27,15,0,0,28,30,7,3,3,30,0,0,7,15,27,27,15,7,0,0,14,15,3,15,3,15,0,14,15,3,15,3,3,3,0,0,28,30,3,27,27,30,0,0,27,27,27,31,27,27,0,0,3,3,3,3,3,3,0,0,14,14,12,12,12,7,0,0,51,51,27,15,31,59,0,0,3,3,3,3,3,15,0,0,54,62,62,107,107,99,0,0,48,51,55,63,59,51,0,0,14,31,27,27,27,14,0,0,15,31,27,15,3,3,0,0,14,31,27,27,15,30,0,0,15,31,27,11,31,27,0,0,14,15,3,6,12,7,0,0,15,15,6,6,6,6,0,0,27,27,27,27,27,14,0,0,51,51,51,27,26,14,0,0,99,99,107,42,62,54,0,0,27,27,27,14,27,27,0,0,27,27,27,14,12,6,0,0,15,15,12,6,3,15,0,62,6,6,6,6,6,62,0,1,3,6,12,24,48,32,0,62,48,48,48,48,48,62,0,12,30,18,0,0,0,0,0,0,0,0,0,0,0,0,31,12,24,0,0,0,0,0,0,14,14,30,27,31,63,51,0,15,31,27,15,27,31,15,0,28,30,7,3,3,31,30,0,7,15,27,27,27,15,7,0,14,15,3,15,3,15,15,0,14,15,3,15,3,3,3,0,28,30,3,27,27,31,30,0,27,27,27,31,31,27,27,0,3,3,3,3,3,3,3,0,14,14,12,12,12,15,7,0,51,51,27,15,31,51,51,0,3,3,3,3,3,15,15,0,54,62,62,107,107,99,99,0,48,51,55,63,59,51,51,0,14,31,27,27,27,31,14,0,15,31,27,31,15,3,3,0,14,31,27,27,15,30,28,0,15,31,27,11,31,31,27,0,14,15,3,6,12,15,7,0,15,15,6,6,6,6,6,0,27,27,27,27,27,31,14,0,51,51,51,27,27,31,14,0,99,99,107,107,62,62,54,0,27,27,31,14,27,27,27,0,27,27,27,14,12,6,6,0,15,15,12,6,3,15,15,0,56,12,12,7,12,12,56,0,8,8,8,0,8,8,8,0,14,24,24,112,24,24,14,0,0,0,110,59,0,0,0,0,0,0,0,0,0,0,0,0,127,127,127,127,127,127,127,0,85,42,85,42,85,42,85,0,65,99,127,93,93,119,62,0,62,99,99,119,62,65,62,0,17,68,17,68,17,68,17,0,4,12,124,62,31,24,16,0,28,38,95,95,127,62,28,0,34,119,127,127,62,28,8,0,42,28,54,119,54,28,42,0,28,28,62,93,28,20,20,0,8,28,62,127,62,42,58,0,62,103,99,103,62,65,62,0,62,127,93,93,127,99,62,0,24,120,8,8,8,15,7,0,62,99,107,99,62,65,62,0,8,20,42,93,42,20,8,0,0,0,0,85,0,0,0,0,62,115,99,115,62,65,62,0,8,28,127,28,54,34,0,0,127,34,20,8,20,34,127,0,62,119,99,99,62,65,62,0,0,10,4,0,80,32,0,0,17,42,68,0,17,42,68,0,62,107,119,107,62,65,62,0,127,0,127,0,127,0,127,0,85,85,85,85,85,85,85,0"))
 score=0
 blinkt=0
 splat=splat()
 btnrelease=true
	mode="start"
	music(0)
	lockout=0
	t=0
	debug=false
end

function _update60 ()
  blinkt+=1
 	t+=1
  
  if mode=="game" then
	  update_game()
	 elseif mode=="wavetext" then
	 	update_wavetext()
	 elseif mode=="gameover" then
	  update_gameover()
	 elseif mode=="youwin" then
	  update_youwin() 
	 else
	 --start
	 	update_start()
	 end
end

function _draw ()
  if mode=="game" then
	  draw_game()
	 elseif mode=="wavetext" then
	 	draw_wavetext()
	 elseif mode=="gameover" then
	  draw_gameover()
	 elseif mode=="youwin" then
	  draw_youwin()	  
	 else
	 --start
	 	draw_start()
	 end
end

function startgame()
	camera(0,0)
	shaket=0
	shakex=0
	explt=0
	mode="wavetext"
	flash=0
	firet=0
	wave=5
	lastwave=6
	nextwave()
	wavet=160
	nextfire=300
	--player
	pl=makespr()
	pl.x=63
	pl.y=100
	pl.spx=0
	pl.spy=0  --speed
	pl.spr=2
	pl.lv=3   --number of lives
	pl.inv=0  --invincibility 
	          -- frames
 pl.bmb=1  --bombs
	pl.deathshake=3 --extra shake when hit
	pl.outline=0
	flame=4   --spr of flame
	
	bl={} --bulets
	ebl={} --enemy bullets
	
	en={} --enemies
	attackfreq=120
	
	parts={} --particles
	
	sws={} --shockwaves
	
	pickups={} --upgrades for a boss
	
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


function draw_menu ()
 --fake semi-transparent bcg
 if t%3>0 then
 	rectfill(0,0,128,7,0)
	end
 
 --score
 palt(0,false)
 print("score: "..score,50,1,6)
 palt()
 --lives
 for i=1,3 do 
  if i<=pl.lv then h=9 else h=8 end
  spr(h,i*6,0)
 end
 --bombs
 if pl.bmb>0 then
 	spr(46,112,0)
 else
 	spr(62,112,0)
 end
end

function bang() --muzzle flash
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

function splat() --start screen bg
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
		 spr(64,16,34,12,4)
	end
end

function drwspr(myspr)
 local sprx=myspr.x
 local spry=myspr.y
 
 if myspr.shake>0 then
 	myspr.shake-=1
 	sprx+=sin(t/(4*3.14))
 end
 
 --fake hitbox for ebullets
 if myspr.bulmode then
 	sprx-=2
 	spry-=2
 end
 
	spr(myspr.spr,sprx,spry,myspr.sprw,myspr.sprh)
end

function drwoutline(myspr)
	local c=7
	if t%16<8 then
		c=14
	end
	for i=1,15 do --rep to white
		pal(i,c)
	end
	spr(myspr.spr,myspr.x+1,myspr.y,myspr.sprw,myspr.sprh)
	spr(myspr.spr,myspr.x-1,myspr.y,myspr.sprw,myspr.sprh)
	spr(myspr.spr,myspr.x,myspr.y+1,myspr.sprw,myspr.sprh)
	spr(myspr.spr,myspr.x,myspr.y-1,myspr.sprw,myspr.sprh)
	pal() --reset
end

function col(a,b)
	--collision between a and b
	--assumes 8x8 sprites
	local a_left=a.x
	local a_top=a.y
	local a_right=a.x+a.colw
	local a_bottom=a.y+a.colh
	
	local b_left=b.x
	local b_top=b.y
	local b_right=b.x+b.colw
	local b_bottom=b.y+b.colh

	if a_top>b_bottom then	return false	end
	if b_top>a_bottom then	return false	end
 if a_left>b_right then	return false	end
 if b_left>a_right then	return false	end
 
 return true
end

function flashpal()
	for i=1,16 do
		pal(i,7)
	end
end

function setoff_explosion(x,y,kind)
  if kind==nil then kind="generic" end
 --create particle
	for i=1,50 do
		local myp={}
		myp.x=x
		myp.y=y
		myp.age=rnd(2)
		myp.size=1+rnd(2)
		myp.kind=kind
		if rnd()>0.5 then
			myp.spark=true
			myp.sx=(rnd()-.5)*10
 		myp.sy=((rnd()-.5)*10)
 		myp.maxage=10+rnd(20)
		else
		 myp.spark=false
 		myp.sx=(rnd()-.5)*2
 		myp.sy=((rnd()-.5)*2)
			myp.maxage=20+rnd(20)
		end
		add(parts,myp)
	end
end

function setoff_sparks(x,y)
--create spark (when enemy hit)
for i=1,2 do
	local myp={}
	myp.x=x
	myp.y=y
	myp.age=10+rnd(2)
	myp.maxage=rnd(10)
	myp.size=1+rnd(2)
	myp.sx=(rnd()-.5)*10
	myp.sy=((rnd()-1)*10)
	myp.kind="generic"
	myp.spark=true
	
	add(parts,myp)
end

end

function setoff_sw(x,y,maxage)
	--set up shockwave
	local mysw={}
	
	mysw.x=x
	mysw.y=y
	mysw.s=5
	mysw.r=0
	if maxage==nil then
		mysw.maxage=100
	else
		mysw.maxage=maxage
	end
	mysw.age=0
	add(sws,mysw)
end

--recolor explosion particles
function age_to_c(age,kind)
	local colors={}
	colors["generic"]={7,10,9,8,2}
	colors["player"]={7,12,14,13,1}
	if age<10 then
		c=colors[kind][1]
	elseif age<=15 then
		c=colors[kind][2]
	elseif age<=20 then
		c=colors[kind][3]
	elseif age<=25 then
		c=colors[kind][4]
	else
	 c=colors[kind][5]
	end
	
	return c
end

function spawn_bullet(x,y,spr)
	local newbl=makespr()
	
	newbl.x=x
	newbl.y=y
	newbl.sy=-2
	newbl.spr=spr
	add(bl,newbl)
end

function makespr()
	local myspr={}
	myspr.x=0
	myspr.y=0
	myspr.sx=0
	myspr.sy=0
	myspr.flash=0
	myspr.shake=0
	myspr.aniframe=1
	myspr.spr=0
	myspr.sprw=1
	myspr.sprh=1
	myspr.colw=8
	myspr.colh=8
	
	return myspr
end

function move(obj)
  obj.x+=obj.sx
  obj.y+=obj.sy
end

function animate(myen)
	--sprite animation
	myen.spr=myen.ani[flr(myen.aniframe)]
	myen.aniframe+=myen.anispd
	
	if (myen.aniframe>=#myen.ani+.9) then
		myen.aniframe=1
	end
end

function screenshake(obj)
	shaket=60
	shakex=obj.deathshake
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
	
	-- spawn enemies if wave over
 if mode=="game" and #en==0 then
		nextwave()
	end
	
	--moving enemies
	for myen in all(en) do
  --mission
  doenemy(myen)
  --enemy animation
  animate(myen)
		-- kill offscreen enemies
		if myen.mission!="flyin" then
			if myen.y>150 or myen.x>170 or myen.x<-42 then
			 del(en,myen)
			end
		end
	end
	-- picking an enemy for attack
	enpicktimer()
	
	
	
	--collision pl x en
	if pl.inv<=0 then
		for myen in all(en) do
			if col(myen,pl) then
			 local encx=myen.x+myen.sprw*4
			 local ency=myen.y+myen.sprh*4
			 local plcx=pl.x+pl.sprw*4
			 local plcy=pl.y+pl.sprh*4
				pl.lv-=1
				pl.inv=90
				sfx(1)
				del(en,myen)
				setoff_explosion(encx-rnd(10),ency-rnd(10))
				setoff_explosion(plcx+rnd(10),plcy+rnd(10),"player")
				setoff_sw(plcx,plcy)
				screenshake(pl)
			end
		end
	end
	pl.inv-=1
	if pl.lv<=0 then
		pl.inv=0 --don't flash at the end
		mode="gameover"
		music(40)
	end
	
	--collision pl x enemy bullets
	if pl.inv<=0 then
		for myebul in all(ebl) do
			if col(myebul,pl) then
			 local encx=myebul.x+myebul.sprw*4
			 local ency=myebul.y+myebul.sprh*4
			 local plcx=pl.x+pl.sprw*4
			 local plcy=pl.y+pl.sprh*4
				pl.lv-=1
				pl.inv=90
				sfx(1)
				del(ebl,myebul)
				setoff_explosion(plcx+rnd(10),plcy+rnd(10),"player")
				setoff_sw(plcx,plcy)
				screenshake(pl)
			end
		end
	end
	pl.inv-=1
	if pl.lv<=0 then
		pl.inv=0 --don't flash at the end
		mode="gameover"
		music(40)
	end
	
	--shooting
	if btn(❎) then
		if firet<=0 then
			sfx(0)
			spawn_bullet(pl.x,pl.y-3,15)
	 	firet=4 --frames between shots
		 flash=6 --size of the muzzleflash resets
		else
			firet-=1
		end
	else
		--immediate fire cooldown 
		-- when not ❎
		firet=0
	end
	--setting off bombs
	if btn(🅾️) then
		if pl.bmb>0 then
			--fixme steal 10hp from everyone
			for myen in all(en) do
				myen.hp-=50
			end
			sfx(5)
			explt=t+10 --screen explosion
			screenshake(pl)
			pl.bmb-=1
		end
	end
	--make sure bombdeads are exploded
	for myen in all(en) do
		if myen.hp<=0 then
		 killen(myen)
		 screenshake(myen)
		end
	end

	--move player bullets
	for bullet in all(bl) do
		move(bullet)
		if bullet.y<-8 then --delete offscreen bullets
			del(bl,bullet)
		end
	end
	
	--move enemy bullets
	for myebul in all(ebl) do
		move(myebul)
		
		if myebul.y>150 or myebul.x>170 or myebul.x<-42 or myebul.y<0 then
			del(ebl,myebul)
		end
		animate(myebul)
	end
	
	--move pickups/upgrades
	for mypick in all(pickups) do
		move(mypick)
		if mypick.y>150 then
			del(pickups,mypick)
		end
		--animate(mypick)
	end
	
	--collision bullets vs enemies
	for bullet in all(bl) do
		for myen in all(en) do
			if col(bullet,myen) then
				del(bl,bullet)
				myen.hp-=1
				sfx(3)
				myen.flash=3
				--every hit triggers sw
				local encx=myen.x+myen.sprw*4
			 local ency=myen.y+myen.sprh*4
				setoff_sw(encx,ency,2)
				--and sparks
				setoff_sparks(encx,ency)
				if myen.hp<=0 then
				 killen(myen)
				 screenshake(myen)
				end
			end
		end
	end
	
	--collision with pickups
	for mypick in all(pickups) do
		if col(mypick,pl) then
			sfx(6)
			pl.bmb+=1
			del(pickups,mypick)
			pl.outline=60 --1s outline
		end
	end
	
end

function update_wavetext()
	update_game()
	wavet-=1	

	if wavet<=0 then
		mode="game"
		spawnwave()
	end
end

function update_start()
 if btn(❎)==false and btn(🅾️)==false then
 	btnrelease=true
 end

 if btnrelease then
		if btnp(❎) or btnp(🅾️) then
			startgame()
			music(16)
			btnrelease=false
		end
	end

end

function update_gameover()
 if btn(❎)==false and btn(🅾️)==false then
 	btnrelease=true
 end
 
 if btnrelease then
		if btnp(🅾️) or btnp(❎) then
			mode="start"
			btnrelease=false
			score=0
			music(0)
		end
	end
end

function update_youwin()
 if btn(❎)==false and btn(🅾️)==false then
 	btnrelease=true
 end
 
 if btnrelease then
		if btnp(🅾️) then
			mode="start"
			btnrelease=false
			music(0)
		end
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
	--starfield
	draw_stars()

	--player
	if pl.lv>0 then --dont render when dead
		if pl.inv<=0 then
		 --ship
		 if pl.outline>0 then --flashing when upgraded
				drwoutline(pl)
		 	pl.outline-=1
		 end
			drwspr(pl)
			pal()--reset flashing
			--flame
	 	spr(flame,pl.x,pl.y+5)
	 else
	  --invulnerable state
	  if sin(t/10)<0.1 then
		  drwspr(pl)
		  spr(flame,pl.x,pl.y+5)
		 end
		end
	
	end
	--pickups
	for mypick in all(pickups) do
		drwoutline(mypick)
		drwspr(mypick)
	end
	
	--enemies
	for myen in all(en) do
		if myen.flash>0 then
			myen.flash-=1
			flashpal()
		end
		drwspr(myen)
		pal()
	end
	

	bang() --show muzzle flash

 --big explosion--
	--showckwave
	for mysw in all(sws) do
	 circ(mysw.x,mysw.y,mysw.r,1)
	 circ(mysw.x,mysw.y,mysw.r+1,2)
	 circ(mysw.x,mysw.y,mysw.r+2,5)
	 mysw.s=mysw.s+.9 --slowdown
	 mysw.r=mysw.r+mysw.s
		mysw.age+=1
	 if mysw.age>mysw.maxage then
			del(sws,mysw)
		end

	end
	--explosion and sparks
	for myp in all(parts) do
		local c=7
		local r=1/(myp.age)*myp.size*40
		
		c=age_to_c(myp.age,myp.kind)

		if myp.spark then
		 pset(myp.x,myp.y,7)
		else
			circfill(myp.x,myp.y,r,c)
		end
		myp.x+=myp.sx
		myp.y+=myp.sy
		myp.sx=myp.sx*0.93 --dampen
		myp.sy=myp.sy*0.93
		myp.age+=1
				
		if myp.age>myp.maxage then
		 myp.size-=0.5
		 if myp.size<0 then
				del(parts,myp)
			end
		end
	end
	
	--bullets
	for mybul in all(bl) do
		drwspr(mybul)
	end

	--drawing enemy bullets
	for myebul in all(ebl) do
		drwspr(myebul)
	end
	
 --top menu
 draw_menu()
 
 --shake screen, optionally flash
 if shaket>0 then
  if explt>t then
	  cls(7)
	 else
	 	camera(sin(t/10)*shakex,cos(t/5)*shakex)
		end
	 shaket-=1
 else
 	camera(0,0)
 end
 
 --debug
 if debug then
 	print(t,2,102,15)
	 print(explt)
	 print(shaket)
 end

end

function draw_wavetext()
	draw_game()
	if wave==6 then
		print("final boss approaching",23,40,blink())
	else
		print("wave "..wave.." approaching",30,40,blink())
	end
end


function draw_start()
	cls(2)
	draw_logo(1)
	
	print("press any button\
    to start", 34,100,blink())
end

function draw_gameover()
 draw_game()

	print("\14 game over",36,41,1)
	print("\14 game over",36,40,7)

	print("press any button", 36,101,1)	
	print("press any button", 36,100,blink())
end

function draw_youwin()
	camera(0,0) --might be offset
 draw_bgpattern()
 spr(76,48,34,4,4)
	print("\14 player wins!",31,85+sin(t/90)*2,13)
	print("\14 player wins!",31,80+sin(t/100)*4,7)
	print("press 🅾️", 48,100,blink())
end

--draw starfield
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

function draw_bgpattern()
	cls(14)
	for i=0,16 do
		for j=0,16 do
			spr(240+rnd(j),i*8,j*8)
		end
	end
end
-->8
--enemies

function nextwave()
 wave+=1
 
 if wave>lastwave then
	 mode="youwin"
	 lockout=t+30
	 music(24)
 else --waves
 	mode="wavetext"
 	wavet=160
 end
end

function spawnwave()
	if wave==1 then
	 --simple
		placen({
			{1,1,1,1,1,1,1,1,1,1},
			{0,1,1,1,1,1,1,1,1,0},
			{0,0,1,1,1,1,1,1,0,0},
			{0,0,0,1,1,1,1,0,0,0}
		})
		sfx(33)
	elseif wave==2 then
	 --some suiciders
	 attackfreq=90
		placen({
			{2,2,1,1,2,2,1,1,2,2},
			{2,2,1,1,2,2,1,1,2,2},
			{2,2,1,1,2,2,1,1,2,2},
			{2,2,2,2,2,2,2,2,2,2}
		})
		sfx(33)
	elseif wave==3 then
	 --some sideway attackers
	 --some eyes shooting
	 attackfreq=60
		placen({
			{3,1,1,1,0,0,1,1,1,3},
			{3,3,4,4,0,0,4,4,3,3},
			{3,3,4,4,0,0,4,4,3,3},
			{3,3,1,1,0,0,1,1,3,3}
		})
		sfx(34)
	elseif wave==4 then
	 --skulls with aimers
		placen({
			{5,5,5,5,0,0,5,5,5,5},
			{5,5,5,5,0,0,5,5,5,5},
			{2,5,5,2,0,0,2,5,5,2},
			{2,2,2,2,0,0,2,2,2,2}
		})
		sfx(34)		
	elseif wave==5 then --miniboss
		placen({
		 {0,0,0,0,0,0,0,0,0,0},
			{0,0,0,0,6,0,0,0,0,0},
			{2,2,0,0,0,0,0,0,2,2}
		})
		sfx(35)
	else --boss
		placen({
			{0,0,0,0,7,0,0,0,0,0}
		})
		sfx(36)
	end
end

function efire(myen,ang,spd)
	local myebul=makespr()
		
	myebul.spr=14
	myebul.x=myen.x+3*myen.sprw
	myebul.y=myen.y+6*myen.sprh
	myebul.spr=14
	myebul.ani={14,30,31,30,14}
	myebul.anispd=.1
	myebul.sx=sin(ang)*spd
	myebul.sy=cos(ang)*spd
	myebul.colw=2
	myebul.colh=2
	myebul.bulmode=true
	
	myen.flash=8
	sfx(4)
	add(ebl,myebul)
end

function efirespread(myen,num,spd)
 local offset=t%4/10
 for i=1,num do
 	efire(myen,(1/num)*i+offset,spd)
 end
end

function aimedfire(myen,spd)
 local ang=atan2(pl.y-myen.y,pl.x-myen.x)
	efire(myen,ang,spd)
end

function placen(mywave)
 
	for i=1,#mywave do --rows
		for j=1,#mywave[i] do --columns
			if mywave[i][j]>0 then
				spawnen(j*12-6,i*12,mywave[i][j],j*4)
			end
		end
	end
end

function spawnen(x,y,entype,enwait)
	if entype==nil then entype=1 end
	
	local myen=makespr()
	myen.x=x*(rnd()*10)
	myen.y=y-128
	
	myen.posx=x
	myen.posy=y
	
	myen.wait=enwait
	myen.type=entype
	myen.anispd=.1
	myen.deathshake=0
			
	myen.aniframe=1+rnd(4) --first frame of animation	
	if entype==7 then
		--boss
		myen.sprw=4
		myen.sprh=4
		myen.colw=32
		myen.colh=32
		myen.hp=150
		myen.spy=.1
		myen.spx=0
		myen.ani={132,136,140,136}
		myen.deathshake=0--speci expl
	elseif entype==6 then
		--miniboss
		myen.sprw=2
		myen.sprh=2
		myen.colw=16
		myen.colh=16
		myen.hp=50
		myen.spy=.1
		myen.spx=1
		myen.ani={24,26,28}
		myen.deathshake=1
	elseif entype==5 then
		--skull
		myen.hp=4
		myen.spy=.2
		myen.spx=0
		myen.ani={48,49,50,51}
		myen.deathshake=0
	elseif entype==4 then
	--eye
		myen.hp=5
		myen.hp=5
		myen.spy=0 --stays but shoots
		myen.spx=0
		myen.ani={36,37,38,39}
	elseif entype==3 then
		myen.hp=3
		myen.spy=.2
		myen.spx=0
		myen.ani={32,33,34,35}
	elseif entype==2 then
		myen.hp=1
		myen.spy=.2
		myen.spx=0
		myen.ani={20,21,22,23}
	else
		--default 1
		myen.hp=2
		myen.spy=.21
		myen.spx=0
		myen.ani={16,17,18,19}
	end
	myen.flash=0
 myen.mission="flyin"
	add(en,myen)
end

function killen(myen)
 local encx=myen.x+myen.sprw*4
 local ency=myen.y+myen.sprh*4

	sfx(2)
	score+=10
	if myen.mission=="attac" then
		pickattac()
	end
	del(en,myen)
	--explode where it was
	setoff_explosion(encx,ency)
	setoff_sw(encx,ency)
	--give pickup on special occ
	if myen.type==6 then
	--miniboss
		dropickup(myen.x,myen.y)

	end
end

function dropickup(pix,piy)
 local mypick=makespr()
 mypick.x=pix
 mypick.y=piy
 mypick.sy=0.5
 mypick.spr=47

	add(pickups,mypick)
end
-->8
--behaviors

function doenemy(myen)
	if myen.wait>0 then 
		myen.wait-=1
		return
	end

 if myen.mission=="flyin" then
  --flying in
  --easing
  myen.y+=(myen.posy-myen.y)/10
  myen.x+=(myen.posx-myen.x)/5
  
  if abs(myen.posy-myen.y)<.9 then
  	myen.y=myen.posy --snap to final destination
  	myen.x=myen.posx
   myen.mission="protec"
  end
  
 elseif myen.mission=="protec" then
  -- staying put
		
 elseif myen.mission=="attac" then
  if myen.type==1 then
  --basic suicide attack
	  myen.sy=.5
	  myen.sx=sin(t/45)
	  -- push from edges
	  if myen.x<32 then
	  	myen.sx+=1-(myen.x/32)
	  end
	  if myen.x>88 then
	  	myen.sx-=(myen.x-88)/32
	  end
  elseif myen.type==2 then
 	 --fast trooper
	  myen.sy=2.5
	  myen.sx=sin(t/20)
	  -- push from edges
	  if myen.x<32 then
	  	myen.sx+=1-(myen.x/32)
	  end
	  if myen.x>88 then
	  	myen.sx-=(myen.x-88)/32
	  end
  elseif myen.type==3 then
   --sideway attacking beast
  	if myen.sx==0 then --mode
  	--flying down
  		myen.sy=1
  		if (pl.y)<=myen.y then
 		--flying horizontally
 				myen.sy=0
  			if pl.x<myen.x then
  				myen.sx-=1
  			else
  				myen.sx+=1
  			end
  		end
  	end
  elseif myen.type==5 then
	  --skull
			myen.sy=0.5
	  if myen.y>pl.y then
	  	myen.sy=2
	  end
	  if pl.x+1<myen.x then
	  	myen.sx=-.3
	  elseif pl.x-1>myen.x then
	  	myen.sx=.3
	  else
	  	myen.sx=0
	  end
  elseif myen.type==6 then
  --miniboss
	  myen.sy=0.1
	  if t>nextfire then
 	  nextfire=t+30
		  efirespread(myen,8,.8)
			end  
	  if myen.y>100 then
	  	myen.sy=1
	  end
  else
  --fixme:boss

  
	 end
  move(myen)
 end
end

function enpicktimer()

 if mode!="game" then
 	return
 end
 local myen=rnd(en)
	if t%attackfreq==0 then
	 pickattac()
	end
	if t>nextfire then
		pickfire()
		nextfire=t+20+rnd(100*(1/wave))
	end
end

function pickattac()
	--pick something from the tail of
	--the grid
	local maxnum=min(8,#en)
	local myindex=#en-flr(rnd(maxnum))
	local myen=en[myindex]
	
	if myen.mission=="protec" then
		myen.mission="attac"
		myen.wait=60
		myen.shake=60
		myen.anispd=.15
	end
end

function pickfire()
	--pick something from the tail of
	--the grid
	local maxnum=min(8,#en)
	local myindex=#en-flr(rnd(maxnum))
	local myen=en[myindex]

if myen.mission=="protec" then
  if myen.type==6 then
   --miniboss
   efirespread(myen,8,1.3,rnd())
  elseif myen.type==4 then
			--eye
   aimedfire(myen,1)
  elseif myen.type==2 then
   --fast skull
   aimedfire(myen,2)
  else
  	--default fire type
   efire(myen,0,1)
  end
 end	
end
__gfx__
00000000000660000006600000066000000000000000000000000000000000000000000000000000000000000000000000000000000000000222200097900979
000000000007d00007077070000760000000000000000000000000000000000001212100028282000000000000000000000000000000000028dd820077700777
0000000000c6d0000d7cc7d00007dc00000000000000000000000000000000000202020008a89800000000000000000000000000000000002d22d200a7a00a7a
0000000000c6d0000d7c17d000076c000c7777c000c77c0000c77c00001dd10002000200089de8000a7777a000a77a0000a77a00001881002d22d200a7a00a7a
000000000dd6d000d667767d00076d600dccccd000dccd0000dccd000001100001202100028e820009aaaa90009aa900009aa9000001100028dd8200aaa00aaa
000000006dd6d0006667667700076d6601dddd1000dccd00001dd10000000000001210000028200002888820009aa900008998000000000002222000aaa00aaa
000000006dddd00066d22d77000767d600000000001dd1000001100000000000000000000000000000000000008998000028820000000000000000009a9009a9
00000000000cc00002dccd20000cdd00000000000001100000000000000000000000000000000000000000000028820000000000000000000000000009000090
001111000011110000111100001111000166dd100166dd100166dd10016666100000000000000000000000000000000000000000000000000222200002222000
01ccddd001ccddd001ccddd001ccddd016666dd116666dd116666dd116666d610066dd111dd000000066dd111dd0000000066dd111dd600028ee820028998200
1ccdd2261ccdd22d1ccdd22d1ccdd88dd688717dd688727dd688787d6887dddd066616666ddd0000066616666ddd000000666166666160d02e22e20029229200
1c12c1261c22c22d1c92d92d1c88d88dd68877ddd68977ddd68877dd689726dd061d667776dd0000061d667777dd0dd00061d6677676dddd2e22e20029229200
1c22cd611c22c6611c22dd611c88dd61d6776dddd6776dddd6776dddd666776d06d677777661ddd006d677777771dddd006d16777767610d28ee820028998200
11ccd61111ccd61111ccd61111ccd611166607d1166607d1166607d11d70dd610dd677722766dddd0dd6777722d60d0dd0dd67777722d10d0222200002222000
01c1d11001c1d11001c1d11001c1d1100116dd100116dd100116dd100166d1100d162278226d010d0d167227822d010dd0d167722782611d0000000000000000
0111110001111100011111000111110000167d1000167d1000167d100167d1000016287982d6010d00167287982611ddd00167728798d01d0000000000000000
0000000000000000000000000000000000111100001111000011110000111100001677777d6d10dd001677777d7d10ddd0016d77776d61100011110000111100
0088880000888800008888000088880001666a2001666a1001666a1001666a200dd66117d6711dd00dd6671717d11dd000dd16d77116d100019aa910019aa910
08677680086776800867768208677680066776a2066ff6a1066ff6a1067776a2ddd666666d7d1dd0dddd66666d6010d00ddddd6d776dd000111a9111111a9111
26117682262276812899768226227682167717a21dddddd1166ff6a1167717a2ddd67676111010d0ddd1d67676d000000ddd11116766d0001111111111111111
26187162262a6161269a716226296162167007e2167007e21d666ad1167006620d117171111000000d1111717110000000ddd111171710001a9119a11a9119a1
267766622677666d2677666d267766621877768218767e8218dddd8118676e820ddd1111110000000ddd11111100000000dddd11111110001aa91aa11aa91aa1
22626262226d6d62226d6d62226d6d62028888200d888820028888200288882000d0d0000000000000d0d00000000000000d0d000000000001a11a1001a11a10
02222222022222220222222102222221002222000011220000222200002222000000000000000000000000000000000000000000000000000011110000111100
1d666dd11d666dd11d677dd11d666dd1000000000000000000000000000000000000000000000000000000000000000000000000000000000011110000000000
d66dddddd66dddddd6666dddd66ddddd000000000000000000000000000000000000000000000000000000000000000000000000000000000101101000000000
6016d01d6006d00d6007600d6006d00d000000000000000000000000000000000000000000000000000000000000000000000000000000001000000100000000
7176d16d7016d01d7107610d7016d01d000000000000000000000000000000000000000000000000000000000000000000000000000000001001100100000000
6760dddd6760dddd6760dddd6760dddd000000000000000000000000000000000000000000000000000000000000000000000000000000001001100100000000
666d6dd166666dd166676dd166666dd1000000000000000000000000000000000000000000000000000000000000000000000000000000001110011100000000
0666d6100d6d6dd00d6d7dd00d6d6dd0000000000000000000000000000000000000000000000000000000000000000000000000000000000110011000000000
06060600006060d0006070d0006060d0000000000000000000000000000000000000000000000000000000000000000000000000000000000011110000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000ddddddddddddd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000ddd66666666666dd0005677776d0007777000067777d077770000077767770000000777000000000000000000000000000000000000ddddd000000000
00000ddd666666666666666dd6767677776007777000d7777d00777700000777677700000007770000000000000000000000000000000000007766ddd0000000
0000dd666666666666666666d6676777777d077770057777600077770000077767770000000777ddddddddd000000000000000000000000006711166d0000000
000dd6666666666666666666dd66655677770777700677761000777700000777677700000007dddd6777766dd000000000000000000001166611611116dd0000
000d6666666dd6d6d666d6ddddd65001666607777067777500007777000007776777000000ddd66777777766dd000000000000000000011111166611666d0000
00dd666666d6666666d6666666dd66d5000007777d7777d000007777000007776777000000d77dd7777777766dd00000000000011100111d6d6dd66666dd0000
0dd6d666dd667777767dd777766dd66766100777777777000000777700000777677700000777777d7777777766ddd0000000000111111d6666666d6666d00000
0d6d666dd66777666667d77dddd6dd66767507777777775000007777000007776777000d7766266667666ddd6666dd00000000011111d767777766dd6dd00dd0
0dd666dd66776d1111d6d7dd22d6dd6667660777777777600000777700000777677700dd7682828666667777d66ddd00000d0001111176666677766dddd0d6d0
0d6d66d66776112818d6ddd2282d6d66667707777767777d0000777700000777677700d662282826662222667d6ddd0000dd0001111d6d1111d67766dd0d6dd0
ddd66dd67661128282dddd12828d6d05676707777606777750007777d000d777677700dd66829226628282266d66ddd000d6d0011d1d6d81821167766d6dd6d0
dd6d6dd666d128282826d6122926dd566677077775017777600067777d1d7777677700dd7662277662282282666dddd100d6d111d11ddd28282116676ddd6d11
d6d66dd666118289822d66622266ddd6666607777000d7777d00577777777777567666dd77777766628292226666dd1100dd611d1d1d628282821d666dd6d611
dd6d6dd666d82898922d6226666dddd6666107777000067777100d777777777d076766ddd667776672292922766dddd100d61111d116d228982811666dd61110
d6d6d6d666dd2289222d22226dd66dd66d000777700005777760005667776650067666dddd7722267722922276661d110dd611111d16d22989828d666d111100
dd6d6dddd66dd22222d622d276666dd0000000000000000000000000000000000000000d66722276dd622222766d11d10dd611111112d2229822dd666d110000
01d6d6dddd6ddd22dd6672d276dddd00000000000000000000000000000000000000000d67727776d66662776ddd1d110dd6611111126d22222dd66ddd110000
011ddddd6ddddddd6666777276dd000000000000000000000000000000000000000000dd6777766dddd6666dddd111d100dd66672d2766dd22ddd6dddd600000
0011ddd1d6ddd66666667777766dd0000000000777777e007770077700ee777e07777dd6777666d6dddddddddd111d110000dd6727766666ddddddd6dddd0000
00111ddd1d666666dd667777776dd00000000007777777e0777007770e7777770777dddd7776666d6d6111dd1111d1d1000dd66777666666666ddd6d1ddd1000
000111ddd1dddddd1d6667777777700000000007770077e07770077707770e7700071d7dddd66dd6d6dd1111111d1d11000dd6777766d6d6666666d1ddd11100
0000111ddd1d1d1dddd667777767770000000007770077e0777007770777e0000007d776d7dddd6dddddd11111d1d11000077777766d6ddd1d666d1ddd111110
000001111ddddddd1dd667766666666600000007777777007770077700e7777e00071d76d76d6ddd1d1d1d1d1d1d1100007776777666ddddd1d1d1ddd1111110
0000000111ddd1d1d1dd7767766776d600000007770077e077700777000e7777700771edd76d6d11d1d1d1d1d111100006666666676d6dd1ddddddd111111110
0000000000111d1d1d11dd6dd66dd6d100000007770077e0777ee77707771077700777111ddddd11111d1d11111000000d6776677677dd1d1d1ddd11111111d0
00000000000011111101dd1dd11d111100000007777777e0e777777e0e777777700777007777710770111111000000000d6dd66dd6dd11d1d1d1111111116dd0
000000000000000000001111111110000000000777777e000ee77ee100e7777e000777007777700770000770000000000111d11dd1dd1111111111111dddd110
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011111111111111111111111111110
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000011111111111111111000000000000000111111111111111110000000000000001111111111111111100000000000000011111111111111111000000000
00011166666666666666ddddd100000000011166666666666666ddddd100000000011166666666666666ddddd100000000011166666666666666ddddd1000000
0001dddd667777776666666dddd100000001dddd667777776666666dddd100000001dddd667777776666666dddd100000001dddd667777776666666dddd10000
0001dddd6777777766dddd666ddd10000001dddd6777777766dddd666ddd10000001dddd6777777766dddd666ddd10000001dddd6777777766dddd666ddd1000
001ddddd66777766dddddddddddd1100001ddddd66777766dddddddddddd1100001ddddd66777766dddddddddddd1100001ddddd66777766dddddddddddd1100
001dddddd666666ddddddddddddd2100001dddddd666666dddd111dddddd2100001dddddd666666dddd111dddddd2100001dddddd666666dddd111dddddd2100
001ddd111d66666ddddd111dddddd110001ddd111d66666dd1111111ddddd110001ddd111d66666dd1111111ddddd110001ddd111d66666dd1111111ddddd110
001dd1111d1116dddd111111ddddd110001dd1111d1116ddd11888111dddd110001dd1111d1116ddd11aaa111dddd110001dd1111d1116ddd11888111dddd110
0001d110010016ddd11dddd11dddd1100001d118011816dd117799811dddd1100001d118011816dd117799a11dddd1100001d118011816dd117799811dddd110
0001dd11000176dd11dddddd11dde2100001d111909176dd1077aa9801dde2100001d111808176dd1077889a01dde2100001d111808176dd1077889801dde210
0001dd610001666d1dddddddd1ded2100001dd610a11666d119a00a911ded2100001dd610a11666d11a9008a11ded2100001dd610811666d1189009811ded210
0001d1100100166d166dddd661dde2100001d1109191166d101a00a701dde2100001d1108181166d101a00a701dde2100001d1108181166d1018008701dde210
0001d1101110166d1dd6666dd6dee2100001d1181118166d1108aa7016dee2100001d1181118166d1108aa7016dee2100001d1181118166d1108887016dee210
001ddd116d11166d611dddd11dede210001ddd116d11166d611111111dede210001ddd116d11166d611111111dede210001ddd116d11166d611111111dede210
001ddd77dd67766dd6111116dd6ed110001ddd77dd67766dd6111116dd6ed110001ddd77dd67766dd6111116dd6ed110001ddd77dd67766dd6111116dd6ed110
001dd66dddd666666d666666d66de110001dd66dddd666666d666666d66de110001dd66dddd666666d666666d66de110001dd66dddd666666d666666d66de110
001d666666666666d666666667ded110001d666666666666d666666667ded110001d666666666666d666666667ded110001d666666666666d666666667ded110
0011dd677767611dddd777676dede1000011dd677767611dddd777676dede1000011dd677767611dddd777676dede1000011dd677767611dddd777676dede100
00d221ddddd66101dd6ddee22ede210000d221ddddd66101dd6ddee22ede210000d221ddddd66101dd6ddee22ede210000d221ddddd66101dd6ddee22ede2100
001dd22d1d6610001dd1d11edee22100001dd22d1d6610001dd1d11edee22100001dd22d1d6610001dd1d11edee22100001dd22d1d6610001dd1d11edee22100
0012dddddd6101111ddddddeee2211000012dddddd6101111ddddddeee2211000012dddddd6101111ddddddeee2211000012dddddd6101111ddddddeee221100
001122ddd66116d116d6dddd22211000001122ddd66116d116d6dddd22211000001122ddd66116d116d6dddd22211000001122ddd66116d116d6dddd22211000
00011122dd616ddd166d6dde1111000000011122dd616ddd166d6dde1111000000011122dd616ddd166d6dde1111000000011122dd616ddd166d6dde11110000
00000111d66666666d66dddde210000000000111d66666666d66dddde210000000000111d66666666d66dddde210000000000111d66666666d66dddde2100000
00000001dd666666666d6dded210111000000001dd666666666d6dded210110000000001dd666666666d6dded210110000000001dd666666666d6dded2101100
00001101d6d6d666d6d6dddde210110000101101d6d6d666d6d6dddde210110000001101d6d6d666d6d6dddde210111000001101d6d6d666d6d6dddde2101100
00011101dd6d116dddd1dedee210000000111101dd6d116dddd1dedee210011000011101dd6d116dddd1dedee210000000111101dd6d116dddd1dedee2100100
00100101edd1111dde1111ee2110001000000101edd1111dde1111ee2110000000000101edd1111dde1111ee2110011000000101edd1111dde1111ee21100010
00000001ee21001ee21001221110110000000001ee21001ee21001221110100000000001ee21001ee21001221110100000100001ee21001ee210012211101100
00111101111100111110000111000000000111011111001111100001110011000001110111110011111000011100000000011101111100111110000111000100
00000000111000011100000000000000000100001110000111000000000000000000000011100001110000000000000000000000111000011100000000000000
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
00000000000000000d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0000000000000000000000000d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d
0000000000000000000000000000000000000000d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0
000000000d0d0d0d000000000d0d0d0d0d0d0d0d000000000d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d00000000000000000d0d0d0d0d0d0d0d0d0d0d0d
0000000000000000d0d0d0d000000000d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d000000000d0d0d0d0d0d0d0d000000000d0d0d0d0d0d0d0d0
0000000000000000000000000d0d0d0d000000000d0d0d0d00000000000000000d0d0d0d000000000d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d000000000d0d0d0d
00000000d0d0d0d00000000000000000d0d0d0d000000000d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0
00000000000000000d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d000000000d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d
0000000000000000000000000000000000000000d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0
__label__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000022288822288822200000000022288822288822200000000022288822288822200000000000000000000000000000000000000
00000000000000000000000000022288822288822200000000022288822288822200000000022288822288822200000000000000000000000000000000000000
00000000000000000000000000022288822288822200000000022288822288822200000000022288822288822200000000000000000000000000000000000000
00000000000000000000000000088888888888888800000000088888888888888800000000088800088800088800000000000000000000000000000000000000
00000000000000000000000000088888888888888800000000088888888888888800000000088800088800088800000000000000000000000000000000000000
00000000000000000000000000088888888888888800000000088888888888888800000000088800088800088800000000000000000000000000000000000000
00000000000000000000000000088888888888888800000000088888888888888800000000088800000000088800000000000000000000000000000000000000
00000000000000000000000000088888888888888800000000088888888888888800000000088800000000088800000000000000000000000000000000000000
00000000000000000000000000088888888888888800000000088888888888888800000000088800000000088800000000000000000000000000000000000000
00000000000000000000000000022288888888822200000000022288888888822200000000022288800088822200000000000000000000000000000000000000
00000000000000000000000000022288888888822200000000022288888888822200000000022288800088822200000000000000000000000000000000000000
00000000000000000000000000022288888888822200000000022288888888822200000000022288800088822200000000000000000000000000000000000000
00000000000000000000000000000022288822200000000000000022288822200000000000000022288822200000000000000000000000000000000000000000
00000000000000000000000000000022288822200000000000000022288822200000000000000022288822200000000000000000000000000000000000000000
00000000000000000000000000000022288822200000000000000022288822200000000000000022288822200000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00011100000000000000000000000000000000000000000000000000000000000000066600000000000000000000000000000000000000000000000000000000
00011100000000000000000000000000000000000000000000000000000000000000066600000000000000000000000000000000000000000000000000000000
00011100000000000000000000000000000000000000000000000000000000000000066600000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000011111111111100000000000000000000000011111111111100000000000000000000000011111111111100000000000000000000
00000000000000000000000011111111111100000000000000000000000011111111111100000000000000000000000011111111111100000000000000000000
00000000000000000000000011111111111100000000000000000000000011111111111100000000000000000000000011111111111100000000000000000000
000000000000000000000111ccccccddddddddd000000000000000000111ccccccddddddddd000000000000000000111ccccccddddddddd00000000000000000
000000000000000000000111ccccccddddddddd000000000000000000111ccccccddddddddd000000000000000000111ccccccddddddddd00000000000000000
000000000000000000000111ccccccddddddddd000000000000000000111ccccccddddddddd000000000000000000111ccccccddddddddd00000000000000000
000000000000000000111ccccccdddddd888888ddd000000000000111ccccccdddddd222222ddd000000000000111ccccccdddddd222222ddd00000000000011
000000000000000000111ccccccdddddd888888ddd000000000000111ccccccdddddd222222ddd000000000000111ccccccdddddd222222ddd00000000000011
000000000000000000111ccccccdddddd888888ddd000000000000111ccccccdddddd222222ddd000000000000111ccccccdddddd222222ddd00000000000011
000000000000000000111ccc888888ddd888888ddd000000000000111ccc999777ddd999222ddd000000000000111ccc222222ccc222222ddd00000000000011
000000000000000000111ccc888888ddd888888ddd000000000000111ccc999777ddd999222ddd000000000000111ccc222222ccc222222ddd00000000000011
000000000000000000111ccc888888ddd888888ddd000000000000111ccc999777ddd999222ddd000000000000111ccc222222ccc222222ddd00000000000011
000000000000000000111ccc888888dddddd666111000000000000111ccc222222dddddd666111000000000000111ccc222222ccc66666677700066600000011
000000000000000000111ccc888888dddddd666111000000000000111ccc222222dddddd666111000000000000111ccc222222ccc66666677700066600000011
000000000000000000111ccc888888dddddd666111000000000000111ccc222222dddddd666111000000000000111ccc222222ccc66666677700066600000011
000000000000000000111111ccccccddd666111111000000000000111111ccccccddd666111111000000666000111111ccccccddd66611111100000000000011
000000000000000000111111ccccccddd666111111000000000000111111ccccccddd666111111000000666000111111ccccccddd66611111100000000000011
000000000000000000111111ccccccddd666111111000000000000111111ccccccddd666111111000000666000111111ccccccddd66611111100000000000011
000000000000000000000111ccc111ddd111111000000000000000000111ccc111ddd111111000000000000000000111ccc111ddd11111100000000000000000
000000000000000000000111ccc111ddd111111000000000000000000111ccc111ddd111111000000000000000000111ccc111ddd11111100000000000000000
000000000000000000000111ccc111ddd111111000000000000000000111ccc111ddd111111000000000000000000111ccc111ddd11111100000000000000000
000000000000000000000111111111111111000ddd00000000000000011111111111111100000000000000000000011111111111111100000000000000000000
000000000000000000000111111111111111000ddd00000000000000011111111111111100000000000000000000011111111111111100000000000000000000
000000000000000000000111111111111111000ddd00000000000000011111111111111100000000000000000000011111111111111100000000000000000000
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
00000000000000000000000000000000000000000000000000000000000011111111111100000000000000000000000011111111111100000000000000000000
00000000000000000000000000000000000000000000000000000000000011111111111100000000000000000000000011111111111100000000000000000000
00000000000000000000000000000000000000000000000000000000000011111111111100000000000000000000000011111111111100000000000000000000
000000000000000000000000000000000000000000000000000000000111ccccccddddddddd000000000000000000111ccccccddddddddd00000000000000000
000000000000000000000000000000000000000000000000000000000111ccccccddddddddd000000000000000000111ccccccddddddddd00000000000000000
000000000000000000000000000000000000000000000000000000000111ccccccddddddddd000000000000000000111ccccccddddddddd00000000000000000
000000000000000000000000000000000000000000000000000000111ccccccdddddd222222ddd111000000000111ccccccdddddd22222266600000000000000
000000000000000000000000000000000000000000000000000000111ccccccdddddd222222ddd111000000000111ccccccdddddd22222266600000000000000
000000000000000000000000000000000000000000000000000000111ccccccdddddd222222ddd111000000000111ccccccdddddd22222266600000000000000
000000000000000000000000ddd000000000000000000000000000111ccc222222ccc222222ddd000000000000111ccc111222ccc11122266600000000000000
000000000000000000000000ddd000000000000000000000000000111ccc222222ccc222222ddd000000000000111ccc111222ccc11122266600000000000000
000000000000000000000000ddd000000000000000000000000000111ccc222222ccc222222ddd000000000000111ccc111222ccc11122266600000000000000
000000000000000000000000000000000000000000000000000000111ccc222222ccc666666111000000000000111ccc222222cccddd66611100000000000000
000000000000000000000000000000000000000000000000000000111ccc222222ccc666666111000000000000111ccc222222cccddd66611100000000000000
000000000000000000000000000000000000000000000000000000111ccc222222ccc666666111000000000000111ccc222222cccddd66611100000000000000
000000000000000000000000000000000000000000000000000000111111ccccccddd666111111000000000000111111ccccccddd66611111100000000000000
000000000000000000000000000000000000000000000000000000111111ccccccddd666111111000000000000111111ccccccddd66611111100000000000000
000000000000000000000000000000000000000000000000000000111111ccccccddd666111111000000000000111111ccccccddd66611111100000000000000
000000000000000000000000000000000000000000000000000000000111ccc111ddd111111000000000000000000111ccc111ddd11111100000000000000000
000000000000000000000000000000000000000000000000000000000111ccc111ddd111111000000000000000000111ccc111ddd11111100000000000000000
000000000000000000000000000000000000000000000000000000000111ccc111ddd111111000000000000000000111ccc111ddd11111100000000000000000
00000000000000000000000000000000000000000000000000000000011111111111111100000000000000000000011111111111111100000000000000000000
00000000000000000000000000000000000000000000000000000000011111111111111100000000000000000000011111111111111100000000000000000000
00000000000000000000000000000000000000000000000000000000011111111111111100000000000000000000011111111111111100000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000ddd00000000000000000000000000066600000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000ddd00000000000000000000000000066600000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000ddd00000000000000000000000000066600000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ddd00000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ddd00000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ddd00000000000000000000000
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
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ddd00000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ddd00000000

__sfx__
000200002261028420016000060000600026000560010600006000060000600006000060000600006000060000600006000060000600006000060000600006000060000000000000000000000000000000000000
00020000266560d6163165612656376560c65025650096500965007650076500765007650076500865008650086500865008650086500865008650096500d6500f650136401b6402063026630286202c61030610
0002000004150140501e0400d6301762014610116100f6400d6300b63009620096100010000100001000010000100001000010000100001000010000100001000010000100001000010000100001000010000100
0001000004150176501664013630036200061000610000100d6000b60009600096000010000100001000010000100001000010000100001000010000100001000010000100001000010000100001000010000100
d701000004450144501e4400d4301741014400114000f4000d4000b40009400094000040000400004000040000400004000040000400004000040000400004000040000400004000040000400004000040000400
780600002c650256501d6501a650196501865018650196501965017650116500d650046500165034600356003560035600336002f6002a600236001e6001960014600106000e6000b60008600076000560005600
a70400001645617456194561c456224562d4562745626456364562d406324063d4000040000400004000040000400004000040000400004000040000400004000040000400004000040000400004000040000400
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
cf100000001602e1502915000150221501f150001501f1501f13000110131201b13000140111300f130001300f1300f130001300c1300f130001300a130001000015000100001000015000100001000015000100
01100000000602e0502905000050220501f050000501f0501f03000010130201b03000040110300f030000300f0300f030000300c0300f030000300a030000000005000000000000005000000000000005000000
0b1000001007300000000000000000000000001007300000000000000010073000000000000000000000000010073000000000000000000000000010073000000000000000000000000010073000000000010073
441000000051000510005100051000510005100051000510005100051000510005100051000510005100051003510035100351003510035100351003510035100651006510065100651006510065100651006510
452000001552017520155201752015520135201752013520175201a520175201c5201d520175201d520175201f5201f520235202152023520215201c520215201c5201f5201f5201a5201f5201d5201d5201a520
511000000000000000000000000000000000000000000000306550000000000000000000000000000000000000000000000000000000000000000000000000003065500000000000000000000000000000000000
01100000000602e0502905000050220501f050000501f0501f03000010130201b03000040110300f0300003000000000000000000000000000000000000000000000000000000000000000000000000000000000
011000000061700607016170160701617026070361703607046170460705617066070662707607076270760708627096070a6270b6070c6270d6070e6270f60710637126071363715607186471c6071e6571f607
0f1000001007300000000000000000000000001007300000306720000010073000000000000000000000000010073000000000000000000000000010073000003067200000000000000010073000000000010073
b41000000031000310003100031000310003100031000310003100031000310003100031000310003100031003310033100331003310033100331003310033100631006310063100631006310063100631006310
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
003000002a0501f050130500305000050000000005000000000500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
011000001d05022050240501d0501d0501f05022050240502b050300501f050220502205024050270502b0503a05027050290502b0502e050300503a0563a0563a0563a0563a0523a0523a0523a0520000000000
3f100000153501a3501e350153501a3501e350153501a3501e3501735017352173521735200300003000030000300003000030000300003000030000300003000030000300003000030000300003000030000300
d71000000000000000003540c35000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
8f100000002540c2500c2500c25200402004000040000400004000040000400004000040000400004000040000400004000040000400004000040000400004000040000400004000040000400004000000000000
3e090000002540c250002540c250002540c2500c2520c2520c2520c25200200002000020000200002000020000200002000020000200002000020000200002000020000200002000020000200002000000000000
3f0a0000002540c250002540c250002540c2500c2520c2520c2520c25200254082500825208252082520825405250052520525205252052520525205252052520525205252052520525205254000000000000000
__music__
00 14164355
00 14164315
01 19581a15
00 13161815
00 13161815
02 14161815
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 16554344
00 16554344
00 16554344
01 16154344
00 16154344
00 1c554344
00 161b4344
02 161b4344
00 1f424344
00 41424344
00 20424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 17424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 1e424344

