pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
-- very generic shmup 
-- (c) 2023 jimmac.eu

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
	shaket=0
	shakex=0
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
	mode="wavetext"
	flash=0
	firet=0
	wave=4
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
	pl.deathshake=3
	flame=4   --spr of flame
	
	bl={} --bulets
	ebl={} --enemy bullets
	
	en={} --enemies
	attackfreq=120
	
	parts={} --particles
	
	sws={} --shockwaves
	
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
  --score
  palt(0,false)
  print("score: "..score,49,0,0)
  print("score: "..score,51,0,0)
  print("score: "..score,49,2,0)
  print("score: "..score,50,2,0)
  print("score: "..score,51,2,0)
  print("score: "..score,50,1,6)
  palt()
  --lives
  for i=1,3 do 
	  if i<=pl.lv then h=9 else h=8 end
	  spr(h,i*8)
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
		 spr(64,0,36,16,4)
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
			drwspr(pl)
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
 
 --shake screen
 if shaket>0 then
 	camera(sin(t/10)*shakex,cos(t/5)*shakex)
 	shaket-=1
 else
 	camera(0,0)
 end
 
 --debug
 print(t,2,102,15)
 --print(#ebl)
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
 draw_bgpattern()
 spr(160,48,34,5,5)
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
	for i=0,16 do
		for j=0,16 do
			spr(144+rnd(j),i*8,j*8)
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
	--wave editor
	if wave==1 then
		placen({
			{1,1,1,1,1,1,1,1,1,1},
			{0,1,1,1,1,1,1,1,1,0},
			{0,0,1,1,1,1,1,1,0,0},
			{0,0,0,1,1,1,1,0,0,0}
		})
		sfx(33)
	elseif wave==2 then
	 attackfreq=90
		placen({
			{1,1,1,0,2,2,0,1,1,1},
			{1,1,1,0,2,2,0,1,1,1},
			{1,1,1,0,2,2,0,1,1,1},
			{1,1,1,0,2,2,0,1,1,1}
		})
		sfx(33)
	elseif wave==3 then
	 attackfreq=60
		placen({
			{0,3,3,3,0,0,0,3,3,0},
			{3,4,4,4,3,3,4,4,4,3},
			{3,4,4,4,3,3,4,4,4,3},
			{0,3,3,3,0,0,3,3,3,0}
		})
		sfx(34)
	elseif wave==4 then
		placen({
			{5,5,5,5,0,0,5,5,5,5},
			{5,5,5,5,0,0,5,5,5,5},
			{1,5,5,1,0,0,1,5,5,1},
			{1,1,1,1,0,0,1,1,1,1}
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
			{0,0,0,0,0,0,0,1,1,1}
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
	if entype==6 then
		--miniboss
		myen.sprw=2
		myen.sprh=2
		myen.colw=16
		myen.colh=16
		myen.hp=50
		myen.spy=.1
		myen.spx=1
		myen.ani={24,26,28}
		myen.deathshake=2
	elseif entype==5 then
		--skull
		myen.hp=4
		myen.spy=.2
		myen.spx=0
		myen.ani={48,49,50,51}
		myen.deathshake=1
	elseif entype==4 then
		myen.hp=3
		myen.spy=.5
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
000000000007d00007077070000760000000000000000000000000000000000002828200028282000000000000000000000000000000000028dd820077700777
0000000000c6d0000d7cc7d00007dc00000000000000000000000000000000000808080008888800000000000000000000000000000000002d22d200a7a00a7a
0000000000c6d0000d7c17d000077c000c7777c000c77c0000c77c00001dd10008000800088888000a7777a000a77a0000a77a00001881002d22d200a7a00a7a
000000000dd6d000d6677f6d00077d600dccccd000dccd0000dccd0000011000028082000288820009aaaa90009aa900009aa9000001100028dd8200aaa00aaa
000000006dd6d0006667d6f600077d6601dddd1000dccd00001dd10000000000002820000028200002888820009aa900008998000000000002222000aaa00aaa
000000006dddd00066d22f6f000777d600000000001dd1000001100000000000000000000000000000000000008998000028820000000000000000009a9009a9
00000000000cc00002dccd20000cdd00000000000001100000000000000000000000000000000000000000000028820000000000000000000000000009000090
001111000011110000111100001111000166dd100166dd100166dd10016666100000000000000000000000000000000000000000000000000222200002222000
01ccddd001ccddd001ccddd001ccddd016666dd116666dd116666dd116666d610066dd111dd000000066dd111dd0000000066dd111dd600028ee820028998200
1ccdd2261ccdd22d1ccdd22d1ccdd88dd622717dd688727dd699787d6887dddd066616666ddd0000066616666ddd000000666166666160d02e22e20029229200
1c12c1261c22c22d1c92d92d1c88d88dd62877ddd68977ddd69a77dd689726dd061d667776dd0000061d667777dd0dd00061d6677676dddd2e22e20029229200
1c22cd611c22c6611c22dd611c88dd61d6776dddd6776dddd6776dddd666776d06d677777661ddd006d677777771dddd006d16777767610d28ee820028998200
11ccd61111ccd61111ccd61111ccd611166607d1166607d1166607d11d70dd610dd677722766dddd0dd6777722760d0dd0dd67777722610d0222200002222000
01c1d11001c1d11001c1d11001c1d1100116dd100116dd100116dd100166d1100d1622782266010d0d1672278226010dd0d167722782611d0000000000000000
0111110001111100011111000111110000167d1000167d1000167d100167d100001628798266010d00167287982611ddd00167728798601d0000000000000000
000000000000000000000000000000000011110000111100001111000011110000167777766610dd00167777777610ddd0016677776661100000000000000000
00dddd0000dddd0000dddd0000dddd0001666a2001666a1001666a1001666a200dd6611766711dd00dd6671717611dd000dd16677116d1000000000000000000
0d6776d00d6776d00d6776d00d6776d0066776a2066ff6a1066ff6a1067776a2ddd66666667d1dd0ddd66666666010d00dddd6667766d0000000000000000000
0d1176d00d8876d10daa76d10d8876d1167717a21dddddd1166ff6a1167717a2ddd67676111010d0ddd16676767000000ddd11116766d0000000000000000000
16187160168a616116a7716116896161167007e2167007e21d666ad1167006620d117171111000000d1111717110000000ddd111171710000000000000000000
1677666d1677666d1677666d1677666d1877768218767e8218dddd8118676e820ddd1111110000000ddd11111100000000dddd11111110000000000000000000
126d6d6d126d6d6d126d6d6d126d6d6d028888200d888820028888200288882000d0d0000000000000d0d00000000000000d0d00000000000000000000000000
02d2d2d101d1d1d101d1d1d101d1d1d1002222000011220000222200002222000000000000000000000000000000000000000000000000000000000000000000
1d666dd11d666dd11d677dd11d666dd1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
d66dddddd66dddddd6666dddd66ddddd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
6016d01d6006d00d6007600d6006d00d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
7176d16d7016d01d7107610d7016d01d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
6760dddd6760dddd6760dddd6760dddd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
666d6dd166666dd166676dd166666dd1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0666d6100d6d6dd00d6d7dd00d6d6dd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
06060600006060d0006070d0006060d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000ddddddddddddd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000ddd66666666666dd0005677776d0007777000067777d07777000007777077770000000777700000000000000000000000000000000000000
00000000000000ddd666666666666666dd6767677776007777000d7777d007777000007777077770000000777700000000000000000000000000000000000000
0000000000000dd666666666666666666d6676777777d077770057777600077770000077770777700000007777000000000000ddddddddd00000000000000000
000000000000dd6666666666666666666dd66655677770777700677761000777700000777707777000000077770000000000dddd6777766dd000000000000000
000000000000d6666666dd6d6d666d6ddddd65001666607777067777500007777000007777077770000000777700000000ddd66777777766dd00000000000000
00000000000dd666666d6666666d6666666dd66d5000007777d7777d000007777000007777077770000000777700000000d77dd7777777766dd0000000000000
0000000000dd6d666dd667777767dd777766dd66766100777777777000000777700000777707777000000077770000000777777d7777777766ddd00000000000
0000000000d6d666dd66777666667d77dddd6dd66767507777777775000007777000007777077770000000777700000d7766266667666ddd6666dd0000000000
0000000000dd666dd66776d1111d6d7dd22d6dd6667660777777777600000777700000777707777000000077770000dd7682828666667777d66ddd0000000000
0000000000d6d66d66776112818d6ddd2282d6d66667707777767777d0000777700000777707777000000077770000d662282826662222667d6ddd0000000000
000000000ddd66dd67661128282dddd12828d6d05676707777606777750007777d000d777707777000000077770000dd66829226628282266d66ddd000000000
000000000dd6d6dd666d128282826d6122926dd566677077775017777600067777d1d7777607777000000077770000dd7662277662282282666dddd100000000
000000000d6d66dd666118289822d66622266ddd6666607777000d7777d00577777777777507777777777077767666dd77777766628292226666dd1100000000
000000000dd6d6dd666d82898922d6226666dddd6666107777000067777100d777777777d007777777777077776766ddd667776672292922766dddd100000000
000000000d6d6d6d666dd2289222d22226dd66dd66d000777700005777760005667776650007777777777077767666dddd7722267722922276661d1100000000
000000000dd6d6dddd66dd22222d622d276666dd0000000000000000000000000000000000000000000000000000000d66722276dd622222766d11d100000000
00000000001d6d6dddd6ddd22dd6672d276dddd00000000000000000000000000000000000000000000000000000000d67727776d666627766dd1d1100000000
000000000011ddddd6ddddddd6666777276dd000000000000000000000000000000000000000000000000000000000dd6777766ddd66666d6dd111d100000000
0000000000011ddd1d6ddd66666667777766dd0000000000777777e007770077700ee777e07777777077777707777dd6777666d6dddd66d6dd111d1100000000
00000000000111ddd1d6666666d667777776dd00000000007777777e0777007770e7777770777777707777770777dddd7776666d6d1111dd1111d1d100000000
000000000000111ddd1d666d1dd6667777777700000000007770077e07770077707770e7707777777077000007701d7dddd66dd6d6dd1111111d1d1100000000
0000000000000111ddd1d1d1dddd667777767770000000007770077e0777007770777e00000077700077eeee0770d776d7dddd6dddddd11111d1d11000000000
000000000000001111ddddddd1dd667766666666600000007777777007770077700e7777e00077700077777707771d76d76d6ddd1d1d1d1d1d1d110000000000
0000000000000000111ddd1d1d1dd7767766776d600000007770077e077700777000e777770077700077eeee077771edd76d6d11d1d1d1d1d111100000000000
0000000000000000000111d1d1d11dd6dd66dd6d100000007770077e0777ee777077710777007770007700000770e7111ddddd11111d1d111110000000000000
00000000000000000000011111101dd1dd11d111100000007777777e0e777777e0e7777777007770007777770770e77e01111100001111110000000000000000
000000000000000000000000000001111111110000000000777777e000ee77ee100e7777e0007770007777770770077e00000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeededededededededededededededededeeeeeeeeedededed
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedededededededededededede
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeededededeeeeeeeeededededededededeeeeeeeeedededededededed
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeededededeeeeeeeeededededededededededededeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeededededeeeeeeeeededededeeeeeeeeedededed
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeededededeeeeeeeeeeeeeeeeededededeeeeeeeeedededededededede
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedededededededededededededededededededededededed
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedededededededededededede
eeeeeeeeeeeeeeeeededededededededededededededededeeeeeeeeeeeeeeeeeeeeeeeeedededededededededededededededededededededededededededed
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedededededededededededededededededededededededededededededededededededededededededededede
eeeeeeeeededededeeeeeeeeededededededededeeeeeeeeededededededededededededededededededededeeeeeeeeeeeeeeeeedededededededededededed
eeeeeeeeeeeeeeeededededeeeeeeeeededededededededededededededededededededededededeeeeeeeeededededededededeeeeeeeeedededededededede
eeeeeeeeeeeeeeeeeeeeeeeeededededeeeeeeeeededededeeeeeeeeeeeeeeeeededededeeeeeeeeededededededededededededededededeeeeeeeeedededed
eeeeeeeededededeeeeeeeeeeeeeeeeededededeeeeeeeeedededededededededededededededededededededededededededededededededededededededede
eeeeeeeeeeeeeeeeededededededededededededededededededededededededeeeeeeeeedededededededededededededededededededededededededededed
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedededededededededededededededededededededededededededededededededededededededededededede
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000ddddd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000007766ddd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000006711166d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000001166611611116dd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000011111166611666d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000011100111d6d6dd66666dd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000111111d6666666d6666d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000011111d767777766dd6dd00dd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000d0001111176666677766dddd0d6d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00dd0001111d6d1111d67766dd0d6dd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00d6d0011d1d6d81821167766d6dd6d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00d6d111d11ddd28282116676ddd6d11000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00dd611d1d1d628282821d666dd6d611000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00d61111d116d228982811666dd61110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0dd611111d16d22989828d666d111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0dd611111112d2229822dd666d110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0dd6611111126d22222dd66ddd110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00dd66672d2766dd22ddd6dddd600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000dd6727766666ddddddd6dddd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000dd66777666666666ddd6d1ddd1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000dd6777766d6d6666666d1ddd11100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077777766d6ddd1d666d1ddd111110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
007776777666ddddd1d1d1ddd1111110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
06666666676d6dd1ddddddd111111110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0d6776677677dd1d1d1ddd11111111d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0d6dd66dd6dd11d1d1d1111111116dd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0111d11dd1dd1111111111111dddd110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00011111111111111111111111111110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__label__
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
ededededeeeeeeeeeeeeeeeeededededeeeeeeeeededededededededeeeeeeeeededededededededeeeeeeeeeeeeeeeeeeeeeeeeededededededededeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
dedededeeeeeeeeeeeeeeeeededededeeeeeeeeededededededededeeeeeeeeededededededededeeeeeeeeeeeeeeeeeeeeeeeeededededededededeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
ededededeeeeeeeeeeeeeeeeededededededededededededededededeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeededededeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeededededeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeededededeeeeeeee
dedededeeeeeeeeeeeeeeeeededededededededededededededededeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeededededeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeededededeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeededededeeeeeeeee
ededededeeeeeeeeeeeeeeeeededededededededededededededededeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeededededeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeededededeeeeeeeeededededeeeeeeeeededededededededededededeeeeeeeeededededeeeeeeeeeeeeeeeeeeeeeeeeededededeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
ededededeeeeeeeeededededeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeededededededededeeeeeeeeededededeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedededed
eeeeeeeededededeeeeeeeeededededeeeeeeeeededededededededeeeeeeeeeeeeeeeeededededeeeeeeeeeeeeeeeeeeeeeeeeededededeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeededededeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
dedededeeeeeeeeededededeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeededddddeeeeeeeeededededeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedededede
eeeeeeeeededededeeeeeeeeededededeeeeeeeeededededededededededededee7766ddddedededeeeeeeeeeeeeeeeeeeeeeeeeededededeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee6711166deeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeededededeeeeeeeeeeeeeeeeededededededededeeeeeeeeedede1166611611116ddededededededededededeeeeeeeeededededededededeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee11111166611666deeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeededededededededededededeeeeeeeeededede111ed111d6d6dd66666ddededeeeeeeeeeeeeeeeeeeeeeeeeededededededededeeeeeeee
eeeeeeeededededeeeeeeeeeeeeeeeeededededededededeeeeeeee111111d6666666d6666dededededededededededeeeeeeeeededededededededeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee11111d767777766dd6ddeeddeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeededededededededededededeeeeeeeeededdded1111176666677766dddded6deeeeeeeeeeeeeeeeeeeeeeeeededededededededeeeeeeeee
eeeeeeeeededededeeeeeeeeeeeeeeeeededededededededeeddeee1111d6d1111d67766dded6dddededededededededeeeeeeeeededededededededeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeed6dee11d1d6d81821167766d6dd6deeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeededededededededededededededededeeeeeeeeedd6d111d11ddd28282116676ddd6d11ededededeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedededed
eeeeeeeeeeeeeeeededededeeeeeeeeeeeeeeeeeeeeeeeeeeedd611d1d1d628282821d666dd6d611eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedededede
eeeeeeeeededededeeeeeeeeedededededededededededededd61111d116d228982811666dd6111dededededeeeeeeeeeeeeeeeeededededeeeeeeeeeeeeeeee
eeeeeeeededededededededededededeeeeeeeeeeeeeeeeeddd611111d16d22989828d666d1111eededededeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedededede
eeeeeeeeeeeeeeeeededededeeeeeeeeededededeeeeeeeeedd611111112d2229822dd666d11eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedededed
eeeeeeeededededeeeeeeeeededededeeeeeeeeedededededdd6611111126d22222dd66ddd11dedededededeeeeeeeeeeeeeeeeededededeeeeeeeeeeeeeeeee
eeeeeeeeededededededededededededededededeeeeeeeeeddd66672d2766dd22ddd6dddd6eeeeeededededeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedededed
eeeeeeeeeeeeeeeededededeeeeeeeeeeeeeeeeeeeeeeeeeeeeedd6727766666ddddddd6ddddeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedededede
ededededeeeeeeeeededededeeeeeeeeeeeeeeeeeeeeeeeeeeedd66777666666666ddd6d1ddd1eeeededededeeeeeeeeeeeeeeeeeeeeeeeeedededededededed
eeeeeeeededededeeeeeeeeededededeeeeeeeeeeeeeeeeeeeedd6777766d6d6666666d1ddd111eeeeeeeeeeeeeeeeeededededeeeeeeeeeeeeeeeeedededede
eeeeeeeeededededeeeeeeeeededededeeeeeeeeeeeeeeeeede77777766d6ddd1d666d1ddd11111eededededeeeeeeeeededededededededeeeeeeeeeeeeeeee
dedededededededededededededededeeeeeeeeeeeeeeeeeee7776777666ddddd1d1d1ddd111111ededededeeeeeeeeededededeeeeeeeeedededededededede
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee6666666676d6dd1ddddddd11111111eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedededed
eeeeeeeededededeeeeeeeeededededeeeeeeeeeeeeeeeeedd6776677677dd1d1d1ddd11111111dededededeeeeeeeeededededededededeeeeeeeeeeeeeeeee
ededededededededededededededededeeeeeeeeeeeeeeeeed6dd66dd6dd11d1d1d1111111116ddeededededeeeeeeeeededededeeeeeeeeedededededededed
eeeeeeeededededeeeeeeeeededededeeeeeeeeeeeeeeeeee111d11dd1dd1111111111111dddd11eeeeeeeeeeeeeeeeededededeeeeeeeeeeeeeeeeedededede
eeeeeeeeededededededededededededededededeeeeeeeeeee1111111111111111111111111111dedededededededededededededededededededededededed
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeededededeeeeeeeeededededeeeeeeeeededededeeeeeeeeeeeeeeeeededededeeeeeeeeededededeeeeeeeeeeeeeeeee
ededededededededededededededededeeeeeeeeeeeeeeeeededededededededededededeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedededededededed
eeeeeeeededededededededeeeeeeeeededededeeeeeeeeededededeeeeeeeeededededededededededededededededededededededededeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeededededededededeeeeeeeeeeeeeeeeededededeeeeeeeeeeeeeeeeeeeeeeeeededededeeeeeeeeedededededededededededed
dedededededededededededeeeeeeeeeeeeeeeeeeeeeeeeededededeeeeeeeeededededeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeededededededededededededededededeeeeeeeeedededededededededededededededededededededededededededededededededededededededed
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeededededeeeeeeeeededededeeeeeeeeededededeeeeeeeeeeeeeeeeededededeeeeeeeeededededeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeededededededededeeeeeeeeeeeeeeeeededededeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeededededeeeeeeeeeeeeeeee
dedededededededeeeeeeeeeeeeeeeeededededededededededededeeeeeeeeeeeeeeeeededededededededededededededededeeeeeeeeeeeeeeeeeeeeeeeee
ededededededededededededededededeeeeeeeeededededededededeeeeeeeeedededededededededededededededededededededededededededededededed
dedededededededeeeeeeeeeeeeeeeeededededededededededededededededeeeeeeeeededededededededededededededededeeeeeeeeeeeeeeeeeeeeeeeee
ededededeeeeeeeeeeeeeeeeededededededededededededededededeeeeeeeeeeeeeeeeededededeeeeeeeeeeeeeeeeeeeeeeeeededededeeeeeeeeeeeeeeee
dedededededededededededeeeeeeeeeeeeeeeeededededededededeeeeeeeeededededededededededededededededededededeeeeeeeeedededededededede
eeeeeeeeededededeeeeeeeeededededededededeeeeeeeeeeeeeeeeededededeeeeeeeeeeeeeeeeededededededededededededededededeeeeeeeeeeeeeeee
dedededededededeeeeeeeeeeeeeeeeede7777de77dede777ede77d77ee777e7777eeeee77ded77e77deded77ed777de77dededeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeededededeeeeeeeeededededed77777d77eded777eee77e77e7777e77777eded77ede77d77e77ee77d7777ed77eeeeeeeeeeeeeeeeeeeeeeedededed
dedededededededededededeeeeeeeeede77d77e77eeee7777ee77e77e77ded77e77eeee77d7d77e77d777d77e77eeee77eeeeeededededeeeeeeeeeeeeeeeee
ededededeeeeeeeeededededededededed77777d77eee77e77eee777ed7777e77e7eeeee77e7e77e77e777777de77ded77eeeeeeededededededededeeeeeeee
dedededededededededededededededede7777de77ded77777eeee77de77ded77777deded77777de77d77e777eee77eeeeeeeeeededededeeeeeeeeedededede
eeeeeeeeededededededededeeeeeeeeee77eeee7777e777777ee77eed7777e77777eeeee77777ed77e77ee77d7777ed77eeeeeeeeeeeeeeeeeeeeeeeeeeeeee
dedededeeeeeeeeededededededededede77ddde7777e77dd77ed77dde7777d77d77eeeed77e77de77d77ed77e777dee77eeeeeededededededededeeeeeeeee
ededededededededeeeeeeeeedededededddddddddededdddeeeddeddeddddedddddededddededddddedddedddddddedddeeeeeeededededeeeeeeeeedededed
dedededededededededededeeeeeeeeededddddeddeeeeddddeeddeddedddedddeddeeeedddddddedddddddddeddeeeeddeeeeeededededeeeeeeeeeeeeeeeee
ededededededededededededeeeeeeeeeedddddeddededddddededddeeddddedddddededddededdeddedddddddedddedddedededeeeeeeeeeeeeeeeeeeeeeeee
dedededededededeeeeeeeeededededededddddeddeeeddddddededddedddeddddddeeeeedddddeedddddedddeeeddeededededededededeeeeeeeeedededede
eeeeeeeeeeeeeeeeedededededededededddededddddedddddddedddedddddedddddeeeeedddddeeddedddedddddddedddeeeeeeedededededededededededed
dedededededededeeeeeeeeededededededddededddddddedddedddededddddddedddedeeddeddeedddddedddedddeeedddededededededeeeeeeeeedededede
ededededededededededededeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeededededededededededededededededeeeeeeeeedededed
eeeeeeeeeeeeeeeeeeeeeeeededededededededededededededededededededeeeeeeeeeeeeeeeeededededeeeeeeeeeeeeeeeeedededededededededededede
ededededededededededededededededededededededededededededededededededededeeeeeeeeeeeeeeeeededededededededeeeeeeeeeeeeeeeeeeeeeeee
dedededededededeeeeeeeeededededededededeeeeeeeeededededededededeeeeeeeeeeeeeeeeededededeeeeeeeeededededededededeeeeeeeeedededede
ededededededededeeeeeeeeededededeeeeeeeeededededeeeeeeeeededededeeeeeeeeeeeeeeeeededededededededeeeeeeeeedededededededededededed
dedededededededededededededededededededeeeeeeeeededededededededeeeeeeeeeeeeeeeeededededeeeeeeeeeeeeeeeeeeeeeeeeedededededededede
eeeeeeeeeeeeeeeeededededeeeeeeeeededededededededededededeeeeeeeeededededeeeeeeeeededededededededededededededededeeeeeeeeeeeeeeee
dedededededededededededededededededededeeeeeeeeededededededededeeeeeeeeeeeeeeeeededededeeeeeeeeeeeeeeeeedededededededededededede
ededededededededeeeeeeeeededededee777e777d777de77de77deded777d77ee7e7eeeee777e7e7e777e777de77d77eeeeeeeeeeeeeeeeedededededededed
eeeeeeeeeeeeeeeededededeeeeeeeeede7e7e7e7e7eee7ede7ededeee7e7e7e7e7e7edeee7e7e7e7ed7ded7ee7e7e7e7edededededededededededeeeeeeeee
ededededededededededededededededed777d77ed77ed777e777eeeed777d7d7e777eeeee77ee7e7de7ede7ed7d7d7d7eeeeeeeedededededededededededed
dedededededededededededededededede7ede7e7e7eeeee7ede7edede7e7e7e7eee7eeeee7e7e7e7ed7ded7ee7e7e7e7eeeeeeeeeeeeeeedededededededede
ededededededededeeeeeeeeededededee7eee7e7e777e77ee77eeeeed7d7d7d7d777dedee777ee77de7ede7ed77ed7d7eeeeeeeeeeeeeeeedededededededed
dedededededededededededeeeeeeeeededededededededeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeededededededededededededeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeededededeeeeeeeeededededededededededededededededededededeeeeeeeeededededeeeeeeeeededededededededededededeeeeeeee
dedededededededededededededededededededededededeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeededededededededeeeeeeeeeeeeeeeeedededede
ededededededededeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeededededededededeeeeeeeeededededededededeeeeeeeeeeeeeeeeededededeeeeeeee
dedededededededededededeeeeeeeeededededededededededededeeeeeeeeeeeeeeeeeeeeeeeeededededededededededededededededeeeeeeeeeeeeeeeee
ededededededededededededededededededededededededeeeeeeeeededededededededeeeeeeeeededededededededededededeeeeeeeeedededededededed
dedededededededededededeeeeeeeeededededededededeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeededededededededededededeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeededededededededededededeeeeeeeeededededeeeeeeeeededededeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeededededeeeeeeeeededededeeeeeeee
eeeeeeeededededededededededededededededeeeeeeeeededededeeeeeeeeededededededededededededeeeeeeeeeeeeeeeeededededeeeeeeeeedededede
ededededededededededededededededededededeeeeeeeeededededeeeeeeeeededededededededededededeeeeeeeeeeeeeeeeedededededededededededed
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeededededededededededededededededededededededededededededeeeeeeeeedededededededededededededededede
eeeeeeeeededededededededededededededededeeeeeeeeededededeeeeeeeeededededededededeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedededed
dedededededededededededededededededededeeeeeeeeededededeeeeeeeeededededededededededededeeeeeeeeeeeeeeeeedededededededededededede
eeeeeeeeededededededededededededeeeeeeeeededededeeeeeeeeededededeeeeeeeeeeeeeeeeededededeeeeeeeeededededededededededededeeeeeeee
eeeeeeeededededededededededededededededeeeeeeeeededededeeeeeeeeededededededededededededeeeeeeeeeeeeeeeeededededeeeeeeeeedededede
ededededededededeeeeeeeeededededeeeeeeeeededededededededededededeeeeeeeeededededededededeeeeeeeeedededededededededededededededed
dedededeeeeeeeeededededeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeededededeeeeeeeeededededededededeeeeeeeeededededededededeeeeeeeee
eeeeeeeeededededededededededededededededeeeeeeeeededededededededededededededededededededededededeeeeeeeeeeeeeeeeededededeeeeeeee
dedededeeeeeeeeededededededededeeeeeeeeededededededededeeeeeeeeededededededededededededededededededededededededeeeeeeeeedededede
ededededededededeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeededededeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeededededededededeeeeeeee
dedededeeeeeeeeededededededededededededeeeeeeeeededededeeeeeeeeededededededededededededededededeeeeeeeeededededededededeeeeeeeee
ededededededededededededededededeeeeeeeeedededededededededededededededededededededededededededededededededededededededededededed
dedededeeeeeeeeededededeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeededededeeeeeeeeededededededededeeeeeeeeededededededededeeeeeeeee

__sfx__
000200002261028420016000060000600026000560010600006000060000600006000060000600006000060000600006000060000600006000060000600006000060000000000000000000000000000000000000
00020000266560d6163165612656376560c65025650096500965007650076500765007650076500865008650086500865008650086500865008650096500d6500f650136401b6402063026630286202c61030610
0002000004150140501e0400d6301762014610116100f6400d6300b63009620096100010000100001000010000100001000010000100001000010000100001000010000100001000010000100001000010000100
0001000004150176501664013630036200061000610000100d6000b60009600096000010000100001000010000100001000010000100001000010000100001000010000100001000010000100001000010000100
d701000004450144501e4400d4301741014400114000f4000d4000b40009400094000040000400004000040000400004000040000400004000040000400004000040000400004000040000400004000040000400
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

