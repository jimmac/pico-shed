pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
-- skull buster
-- (ccbysa 4.0) 2023 jimmac.eu

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
 cartdata("jimmac_skullbuster")
 topscore = dget(0)
	t=0
	intro={}
	intro.t=2*60
	intro.x1=0
	intro.x2=110
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
	  if t<intro.t then
	  	draw_intro()
	  else
		 	draw_start()
	  end
	 end
end

function startgame()
	camera(0,0)
	shaket=0
	shakex=0
	explt=0
	--mode="wavetext"
	flash=0
	firet=0
	wave=0
	lastwave=7
	nextwave()
	wavet=160
	nextfire=300
	drawmap=false
	--player
	pl=makespr()
	pl.x=63
	pl.y=100
	pl.sx=0
	pl.sy=0  --speed
	pl.spr=2
	pl.lv=5   --number of lives
	pl.inv=0  --invincibility 
	          -- frames
 pl.bmb=0  --bombs
	pl.deathshake=3 --extra shake when hit
	pl.outline=0
	flame=4   --spr of flame
	
	bl={} --bulets
	ebl={} --enemy bullets
	
	en={} --enemies
	deaden={} --dead enemies score
	for i=1,6 do
		deaden[i]=0
	end
	attackfreq=120
	allgone=0
	
	parts={} --particles
	
	sws={} --shockwaves
	
	pickups={} --upgrades for a boss
	
	mults={} --attac multipliers
	
	mapscroll=0 --boss map offset
	
	--starfield
	stars={}
	for i=1,100 do
		local newstar={}
		newstar.x=flr(rnd(128))
		newstar.y=flr(rnd(128))
		newstar.s=rnd(.5)+.5
		add(stars,newstar)
	end
	--map
	mapsegs={}
	for i=0,7 do
		add(mapsegs,{tx=i*16,ty=0})
	end
end
-->8
--tools


function draw_menu ()
	--bg
	--rectfill(0,0,128,7,0)

 
 --score
 local stringscore=0
 if score>0 then
 	stringscore=score.."00"
 end
 print("score: "..stringscore,50,1,6)

 --lives
 for i=1,5 do 
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

function drw_muzzle() --muzzle flash
  if flash>0 then
   circfill(pl.x+1,pl.y-1,flash,7)
   circfill(pl.x+6,pl.y-1,flash,7)
   flash-=1
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
		 spr(64,16,34,11,4)
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
 if a.ghost or b.ghost then 
  return false
 end
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

function flashpal() --on hit usually
	for i=1,16 do
		pal(i,7)
	end
end

function setoff_explosion(x,y,kind,size)
  if kind==nil then kind="generic" end
 --create 50 particles
	for i=1,50 do
		local myp={}
		myp.x=x
		myp.y=y
		myp.age=rnd(2)
		myp.kind=kind

		if size then
			myp.size=size
		else
			myp.size=1+rnd(2)
		end
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

function setoff_sparks(x,y,num)
--create spark (when enemy hit)
	if num==nil then num=2 end
	for i=1,num do
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
	colors["generic"]={1,7,10,9,8,2}
	colors["player"]={1,7,12,14,13,1}
	if age<1 then
		c=colors[kind][1]
	elseif age<=10 then
		c=colors[kind][2]
	elseif age<=15 then
		c=colors[kind][3]
	elseif age<=20 then
		c=colors[kind][4]
	elseif age<=25 then
		c=colors[kind][5]
	else
	 c=colors[kind][6]
	end
	
	return c
end

function spawn_bullet(x,y)
 --local blsprs={15,63}
	local newbl=makespr()
	
	newbl.x=x
	newbl.y=y
	newbl.sy=-6
	newbl.spr=15
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

--draw starfield
function draw_stars()
  for i=1,#stars do
   local mystar=stars[i]
  	local scol=6
  	
  	if mystar.s<.6 then
  		scol=1
  	elseif mystar.s<.8 then
  		scol=13
  	end
  	
  	pset(mystar.x,mystar.y,scol)
  end
end

function draw_bossship()
	for i=1,#mapsegs do
		local mapseg=mapsegs[i]
		local segx=mapscroll-(i-1)*256
		map(mapseg.tx,mapseg.ty,0,segx,16,32)
	end
end

function draw_deadens()
	ensprs={16,20,32,36,48,26}
	for i=1,#deaden do
		if i==6 then
		 --miniboss
			--spr(ensprs[i],54,70,2,2)
			--print(deaden[i].."x",71,76)
		else
			spr(ensprs[i],(i-1)*23+8,90)
			print(deaden[i].."x",(i-1)*23+17,91)
		end
	end
end

function spawn_mult(x,y)
	local mymult=makespr()
	
	mymult.x=x
	mymult.y=y
	mymult.life=60
	mymult.sy=-1
	
	add(mults,mymult)
end

function draw_randstripe()
	local patterns={░,∧,▥,▒,▤}
	palt(0,false)
	fillp(patterns[1+flr(rnd(#patterns))])
	rectfill(0,0,128,128,0)
	fillp() palt()
end
-->8
--update
function update_game()
	
 --starfield
 update_stars()
 --map
 mapscroll+=1.5
 if mapscroll>256*8 then
	 mapscroll=-256
 end
 
	--flame
	flame=4+rnd(3)

 --ship movement
 local dianorm=.7
 
	if btn(➡️) and btn(⬆️) and pl.x<119 and pl.y>0 then
		pl.sx=2*dianorm
		pl.sy=-1*dianorm
		pl.spr=3
	elseif btn(➡️) and btn(⬇️) and pl.x<119 and pl.y<=110 then
		pl.sx=2*dianorm
		pl.sy=2*dianorm
		pl.spr=3
	elseif btn(➡️) and pl.x<119 then
		pl.sx=2
		pl.sy=0
		pl.spr=3
	elseif btn(⬅️) and btn(⬆️) and pl.x>1 and pl.y>0 then
		pl.sx=-2*dianorm
		pl.sy=-1*dianorm
		pl.spr=1
	elseif btn(⬅️) and btn(⬇️) and pl.x>1 and pl.y<=110 then
		pl.sx=-2*dianorm
		pl.sy=2*dianorm
		pl.spr=1
	elseif btn(⬅️) and pl.x>1 then
		pl.sx=-2
		pl.sy=0
		pl.spr=1
	elseif btn(⬆️) and pl.y>0 then
	 pl.spr=2
	 pl.sx=0
	 pl.sy=-1
	elseif btn(⬇️) and pl.y<110 then
	 pl.spr=2
	 pl.sx=0
	 pl.sy=2
	 flame=7 --small flame
	else 
	 pl.sy=0
		pl.sx=0	
		pl.spr=2
	end
	pl.x=pl.x+pl.sx
	pl.y=pl.y+pl.sy 
	
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
			 if myen.boss then
			 	pl.lv=0
		 	else
					pl.lv-=1
				end
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
		return
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
			spawn_bullet(pl.x,pl.y-3)
	 	firet=2 --frames between shots
		 flash=5 --size of the muzzleflash resets
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
				myen.hp-=100
			end
			sfx(5)
			explt=t+10 --screen explosion
			screenshake(pl)
			pl.bmb-=1
		end
	end
	--make sure bombdeads are exploded
	for myen in all(en) do
		if myen.hp<=0 and not myen.boss then
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
	
	--multiplicator bonuses
	for mymult in all(mults) do
		mymult.life-=1
		if mymult.life>=0 then
		 mymult.sy*=.9--dampen speed
			mymult.y+=mymult.sy
	 else
	 	--remove
	 	del(mults,mymult)
		end
	end
	
	--collision bullets vs enemies
	for bullet in all(bl) do
		for myen in all(en) do
			if col(bullet,myen) then
				del(bl,bullet)
				myen.hp-=1
				sfx(3)
				if myen.boss then
					myen.flash=15
				else
					myen.flash=3
				end
				--every hit triggers sw
				local encx=myen.x+myen.sprw*4
			 local ency=myen.y+myen.sprh*4
			 local enby=myen.y+myen.sprh*8-4
				setoff_sw(bullet.x+3,enby,1)
				--and sparks from bottom
				setoff_sparks(bullet.x+3,enby)
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
 if t<lockout then
  return
 end
 
 if btn(❎)==false and btn(🅾️)==false then
 	btnrelease=true
 end
 
 if btnrelease then
		if btnp(🅾️) then
			mode="start"
			btnrelease=false
			score=0
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
 --bossship
	if drawmap then
		draw_bossship()
	end

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
	

	--showckwave under en
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

	--draw enemies
	for myen in all(en) do

		if myen.boss and myen.flash>0 then
			myen.flash-=1
			myen.spr=128
		elseif myen.flash>0 then
			myen.flash-=1
			flashpal()
		end
		drwspr(myen)
		pal()
	end
	

	drw_muzzle() --show muzzle flash

 --big explosion--

	--explosion and sparks
	for myp in all(parts) do
		local c=7
		--local r=myp.size-(myp.age+20)
		local r=(1/myp.age)*myp.size*15
		
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

	--bonus multiplicators
	for mymult in all(mults) do
		print("2x",mymult.x,mymult.y,blink())
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
	 	camera(sin(t/9)*shakex,cos(t/10)*shakex)
		end
	 shaket-=1
 else
 	camera(0,0)
 end
 
 --debug
 if debug then
		print("\#0t:"..t,2,110,15)
		print("\#0ag:"..allgone)
	end
end

function draw_wavetext()
	draw_game()
	if wave==lastwave then
		print("final boss approaching",23,40,blink())
	else
		print("wave "..wave.." approaching",30,40,blink())
	end
end

function draw_intro()
	cls(0)

	--t from 1 to intro.t(120)
	local ttx=58
	
	if t<30 then
		intro.x1-=(intro.x1-ttx)/6
		intro.x2-=(intro.x2-ttx)/6
		spr(52,intro.x1,50,2,1)
		spr(54,intro.x2,58,2,1)
	else
		spr(52,58,50,2,1)
		spr(54,58,58,2,1)
		print("jimmac.eu",49,72,1)
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
 --[[
	fillp(▥)
	rectfill(0,0,128,128,0)
	fillp(▒)
	rectfill(0,0,128,128,0)	
	fillp() 
 ]]--
	draw_randstripe()
	print("\14 game over",36,41,1)
	print("\14 game over",36,40,7)

	print("press any button", 36,101,1)	
	print("press any button", 36,100,blink())
end

function draw_youwin()
	camera(0,0) --might be offset
 draw_bgpattern()
 spr(76,48,16,4,4)
 palt(0,false)
	print("\14 player wins!",31,52,0)
	palt()
	print("\14 player wins!",31,47+sin(t/100)*4,7)
	stringscore=0
	if score>0 then
		stringscore=score.."00"
	end
	print("final score: "..stringscore,34,66,7)
	print("record score: "..topscore.."00",30,72,6)
	draw_deadens()
	print("press 🅾️", 48,110,blink())
end



function draw_bgpattern()
	cls(1)

 pal(1,2)
	for i=0,16 do
		for j=0,16 do
			spr(241+rnd(j),i*8,j*8)
		end
	end
	pal()
end
-->8
--enemies

function nextwave()
 wave+=1
 
 if wave>lastwave then
  if t>=allgone then
  -- go to endscreen
	  music(56)
	  if score>topscore then
	  	topscore=score
	  	dset(0,topscore)
	  end
		 mode="youwin"
		 lockout=t+60
		else
			--let boss explode
		end
 else
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
	 attackfreq=30
		placen({
			{2,2,1,1,2,2,1,1,2,2},
			{2,2,1,1,2,2,1,1,2,2},
			{2,2,2,2,2,2,2,2,2,2}
		})
		sfx(33)
	elseif wave==3 then
	 --introduce sideway attackers
	 attackfreq=60
		placen({
			{3,3,3,0,0,0,0,3,3,3},
			{3,3,3,0,0,0,0,3,3,3},
			{3,3,3,0,0,0,0,3,3,3}
		})
		sfx(34)
	elseif wave==4 then
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
	elseif wave==5 then
	 --skulls with aimers
		placen({
			{3,5,5,5,0,0,5,5,5,3},
			{3,5,5,5,0,0,5,5,5,3},
			{3,5,5,2,0,0,2,5,5,3},
			{3,2,2,2,0,0,2,2,2,3}
		})
		sfx(34)		
	elseif wave==6 then --miniboss
		placen({
		 {0,0,0,0,0,0,0,0,0,0},
			{3,3,0,0,6,0,0,0,3,3},
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
	myebul.spr=14
	myebul.ani={14,30,31,30,14}
	myebul.anispd=.1
	myebul.sx=sin(ang)*spd
	myebul.sy=cos(ang)*spd
	myebul.colw=2
	myebul.colh=2
	myebul.bulmode=true
	myebul.x=myen.x+3*myen.sprw	
	if myen.boss then 
		myebul.y=myen.y+7*myen.sprh
	else 
		myebul.y=myen.y+6*myen.sprh
		myen.flash=8 
	end
	sfx(4)
	add(ebl,myebul)
end

function efirespread(myen,num,spd,base)
 if base==nil then
  base=0
 end
 for i=1,num do
  efire(myen,1/num*i+base,spd)
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
		drawmap=true
		mapscroll=-500
		--boss
		myen.boss=true
		myen.sprw=4
		myen.sprh=4
		myen.colw=32
		myen.colh=32
		myen.hp=300
		myen.points=10
		myen.sy=0
		myen.sx=0
		myen.ani={132,136,140,136}
		myen.deathshake=0--speci expl
	elseif entype==6 then
		--miniboss
		myen.sprw=2
		myen.sprh=2
		myen.colw=16
		myen.colh=16
		myen.hp=100
		myen.points=5
		myen.sy=.1
		myen.sx=0
		myen.ani={24,26,28}
		myen.deathshake=1
	elseif entype==5 then
		--skull
		myen.hp=8
		myen.points=3
		myen.sy=.2
		myen.sx=0
		myen.ani={48,49,50,51}
		myen.deathshake=0
	elseif entype==4 then
	--eye
		myen.hp=10
		myen.sy=0 --stays but shoots
		myen.sx=0
		myen.ani={36,37,38,39,38,37}
		myen.points=2
	elseif entype==3 then
		myen.hp=3
		myen.points=1
		myen.sy=.2
		myen.sx=0
		myen.ani={32,33,34,35}
	elseif entype==2 then
		myen.hp=6
		myen.points=1
		myen.sy=.2
		myen.sx=0
		myen.ani={20,21,22,23}
	else
		--default 1
		myen.hp=4
		myen.points=1
		myen.sy=.21
		myen.sx=0
		myen.ani={16,17,18,19}
	end
	myen.flash=0
 myen.mission="flyin"
	add(en,myen)
end

function killen(myen)
 if myen.boss then
  myen.mission="boss5"
  myen.phbegin=t
  myen.ghost=true
  ebl={}
  sfx(51)
  return
 end
 local encx=myen.x+myen.sprw*4
 local ency=myen.y+myen.sprh*4

	sfx(2)

	--if killed is attaching
	--score double and spawn 
	--another
	if myen.mission=="attac" then
		pickattac()
		score+=myen.points*2
		spawn_mult(myen.x,myen.y)
	else
		score+=myen.points
	end
	
	--explode
	setoff_sw(encx,ency,5)
	setoff_explosion(encx,ency,nil)
	del(en,myen)
	deaden[myen.type]+=1
	--miniboss
	if myen.type==6 then
		--explode extra where it was
		setoff_explosion(encx,ency,nil,10)
		setoff_sw(encx,ency)
		--give pickup on special occ
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
  	if myen.boss then
  		myen.wait=60
  		myen.mission="boss1"
  		myen.phbegin=t
  	else
	   myen.mission="protec"
  	end  	
  end
 	
 elseif myen.mission=="protec" then
  -- staying put
 elseif myen.mission=="boss1" then
 	doboss1(myen)
 elseif myen.mission=="boss2" then
 	doboss2(myen)
 elseif myen.mission=="boss3" then
 	doboss3(myen)
 elseif myen.mission=="boss4" then
 	doboss4(myen)
 elseif myen.mission=="boss5" then
 	doboss5(myen)
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
	  myen.sy=1
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
  elseif myen.type==4 then  	
  --eye shoots
  if t%90==0 then
  	efirespread(myen,4,.8,-(t/1000))
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
		  efirespread(myen,8,.8,-(t/1000))
			end  
	  if myen.y>100 then
	  	myen.sy=1
	  end
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
	
	if myen and myen.mission=="protec" then
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

if myen and myen.mission=="protec" then
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
-->8
--boss
function doboss1(myen)
-- movement
 local spd=1
 
 if myen.sx==0 or myen.x>=93 then
  myen.sx=-spd
 end
 if myen.x<=3 then
  myen.sx=spd
 end
 -- shooting
 if t%30>15 then
  if t%6==0 then
   efire(myen,0,1)
  end
 end

 -- transition
 if myen.phbegin+8*60<t then
  myen.mission="boss2"
  myen.phbegin=t
  myen.subphase=1
 end
 move(myen)
end

function doboss2(myen)
	local spd=0.5
 
	-- movement
	if myen.subphase==1 then
	 myen.sx=-spd
	 if myen.x<=4 then
	  myen.subphase=2
	 end
	elseif myen.subphase==2 then
	 myen.sx=0
	 myen.sy=spd
	 if myen.y>=90 then
	  myen.subphase=3
	 end 
	elseif myen.subphase==3 then
	 myen.sx=spd
	 myen.sy=0
	 if myen.x>=91 then
	  myen.subphase=4
	 end  
	elseif myen.subphase==4 then
	 myen.sx=0
	 myen.sy=-spd
	 if myen.y<=25 then
	  -- transition
	  myen.mission="boss3"
	  myen.phbegin=t
	  myen.sy=0
	 end
	end
 -- shooting
 if t%30==0 then
  aimedfire(myen,spd*1.6)
 end

 move(myen)
end

function doboss3(myen)
-- movement
 local spd=0.5
 
 if myen.sx==0 or myen.x>=93 then
  myen.sx=-spd
 end
 if myen.x<=3 then
  myen.sx=spd
 end

 -- shooting
 if t%30==0 then
  efirespread(myen,8,1,time()/4)
 end 
 
 -- transition
 if myen.phbegin+8*30<t then
  myen.mission="boss4"
  myen.subphase=1
  myen.phbegin=t
 end
 move(myen)
end

function doboss4(myen)
 local spd=.5
 
 -- movement
 if myen.subphase==1 then
  myen.sx=spd
  if myen.x>=91 then
   myen.subphase=2
  end
 elseif myen.subphase==2 then
  myen.sx=0
  myen.sy=spd
  if myen.y>=90 then
   myen.subphase=3
  end 
 elseif myen.subphase==3 then
  myen.sx=-spd
  myen.sy=0
  if myen.x<=4 then
   myen.subphase=4
  end  
 elseif myen.subphase==4 then
  myen.sx=0
  myen.sy=-spd
  if myen.y<=25 then
   -- transition
   myen.mission="boss1"
   myen.phbegin=t
   myen.sy=0
  end  
 end 

 -- shooting
 if t%45==0 then
  if myen.subphase==1 then
   efire(myen,0,1)
  elseif myen.subphase==2 then
   efire(myen,0.25,1)
  elseif myen.subphase==3 then
   efire(myen,0.5,1)
  elseif myen.subphase==4 then
   efire(myen,0.75,1)
  end
 end
 -- transition
 move(myen)
end

function doboss5(myen)
	--fireball end
	myen.shake=3
 myen.flash=10 
    
 if t%30==0 then
 	--keep exploding
  setoff_explosion(myen.x+rnd(32),myen.y+rnd(24),nil,6)
  sfx(2)
  shake=1
 end

 if myen.phbegin+2*60<t then
	 if t%10==0 then
	  setoff_explosion(myen.x+rnd(32),myen.y+rnd(24),nil,10)
   --setoff_sw(myen.x+16,myen.y+16)
	  sfx(2)
   shake=2
	 elseif t%49==0 then   
	 	sfx(7)
	 	setoff_explosion(myen.x,myen.y,nil, 20)
   setoff_sw(myen.x+16,myen.y+16)
	 end
 end
	
	--end it
 if myen.phbegin+4*60<t then
 	allgone=t+360
 	sfx(32)
  setoff_sw(myen.x+16,myen.y+16)
  score+=myen.points
 	en={}
	end
end
__gfx__
00000000000660000006600000066000000000000000000000000000000000000000000000000000000000000000000000000000000000000222200097900979
000000000007d00007077070000760000000000000000000000000000000000001212100028282000000000000000000000000000000000028dd820077700777
0000000000c6d0000d7cc7d00007dc00000000000000000000000000000000000202020008a89800000000000000000000000000000000002d22d200a7a00a7a
0000000000c6d0000d7c17d000076c000c7777c000c77c0000c77c00001dd10002000200089de8000a7777a000a77a0000a77a00001881002d22d200a7a00a7a
000000000dd6d000d667767d00076d600dccccd000dccd0000dccd000001100001202100028e820009aaaa90009aa900009aa9000001100028dd8200a7a00a7a
000000006dd6d0006667667700076d6601dddd1000dccd00001dd10000000000001210000028200002888820009aa900008998000000000002222000a7a00a7a
000000006dddd00066d22d77000767d600000000001dd1000001100000000000000000000000000000000000008998000028820000000000000000009a9009a9
00000000000cc00002dccd20000cdd00000000000001100000000000000000000000000000000000000000000028820000000000000000000000000009000090
00111100001111000011110000111100013335100133551001335510013333100000000000000000000000000000000000000000000000000222200002222000
01ccddd001ccddd001ccddd001ccddd01bbb3b3113bb3b5113bb3b311bb3b3510066dd111dd000000066dd111dd0000000066dd111dd60002899820028aa8200
1ccdd2261ccdd22d1ccdd22d1ccdd88d8b1131355b1131155b113115b11311350666166661dd00000666166661dd000000666166666160d0292292002a88a200
1c12c1261c22c22d1c92d92d1c88d88d8b1131355b1131155b115115b113113506d16677761d000006d16677771d0dd00066d66776761ddd292292002a88a200
1c22cd611c22c6611c22dd611c88dd6183113355531153355311553531153335061677777661ddd0061677777771dddd006d16777767610d2899820028aa8200
11ccd61111ccd61111ccd61111ccd611133315511333355113115311133155510d1677722766dddd0d16777722d60d0dd0d167777722d10d0222200002222000
01c1d11001c1d11001c1d11001c1d110011111100111151001333150011155100d162278226d010d0d167227822d010dd0d167722782611d0000000000000000
01111100011111000111110001111100001551100015551000115510015551000016287982d6010d00167287982611ddd00167728798d01d0000000000000000
0000000000000000000000000000000000111100001111000011110000111100001677777d6d10dd001677777d7d10ddd0016d77776d61100000000000111100
8aa9880000888800008888000088880001666a2001666a1001666a1001666a200d166117d6711dd00d16671717d11dd000dd16d77116d10000011100019aa910
9818988008aa9880088a988208aa9880066776a2066ff6a1066ff6a1067776a2d11676766d7d1dd0d1d166666d6010d00d1dd16d7767d000001aa900111a9111
9111998229119981289a998229119982167717a21dddddd1166ff6a1167717a21d1c7c7c111010d01dd11c7c7cd0000001dd1111c7c7c00001111110111d1111
981891922918919128a1919229189192167007c2167007e21d666ad1167006620111c1c111100000011111c1c1100000001111111c1c100001a119101a9119a1
2aa9999228aa9992289a999228aa99921c7776c21c767ec21cddddc11c676ec20d1d1111110000000d1d11111100000000d1d1111111100001c91c101ca91ac1
2292c2c22292c2c22292c2c22292c2c202cccc200dcccc2002cccc2002cccc200010100000000000001010000000000000010100000000000011110001c11c10
02222222022222220222222102222221002222000011220000222200002222000000000000000000000000000000000000000000000000000000000000111100
1d666dd11d666dd11d677dd11d666dd10000d677776d0000711f7d11111d11070000000000000000000000000000000000000000000000000000000000000000
d66dddddd66dddddd6666dddd66ddddd00067d2111d7600071f7fddf7fdc10070000000000000000000000000000000000000000000000000001100000000000
6016d01d6006d00d6007600d6006d00d00721111111107006dffdddddddc10d60000000000000000000000000000000000000000000000000010010000000000
7176d16d7016d01d7107610d7016d01d06211111dd110060d7111111ddc1007d0000000000000000000000000000000000000000000000000101101000000000
6760dddd6760dddd6760dddd6760ddddd71111fffd11007d06f6666ddc1100600000000000000000000000000000000000000000000000000101101000000000
666d6dd166666dd166676dd166666dd16dffffffddd100d6007ddddc111007000000000000000000000000000000000000000000000000000010010000000000
06c6c6100d6c6cd00d6c7cd00d6c6cd07661f167661d100700067d2110d760000000000000000000000000000000000000000000000000000001100000000000
0c0c0c0000c0c0c000c0c0c000c0c0c07171f166171111070000d677776d00000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000ddddddddddddd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000ddd66666666666dd0005677776d0007777000067777d077770000077770777700000007777000000000000000000000000000000000ddddd000000000
00000ddd666666666666666dd1767677776007777000d7777d00777700000777707777000000077770000000000000000000000000000000007766ddd0000000
0000dd666666666666666666d1676777777d077770057777600077770000077770777700000007777000000000000000000000000000000006711166d0000000
000dd6d666666666d6d6dd66dd166556777707777006777610007777000007777077770000000777700000000000000000000000000001166611611116dd0000
000d6d6d666dd6ddddddddddddd150016666077770677775000077770000077770777700000007777000000000000000000000000000011111166611666d0000
00ddd6d6d6d6666666d6666666dd16d5000007777d7777d0000077770000077770777700000007777000000000000000000000011100111d6d6dd66666dd0000
0ddddd6ddd667777767dd777766dd16766100777777777000000777700000777707777000000077770000000000000000000000111111d6666666d6666d00000
0dddddddd66777666667d77dddd6dd167675077777777750000077770000077770777700000007777000000000000000000000011111d767777766dd6dd00dd0
0ddddddd66776d1111d6d7dd22d6dd166766077777777760000077770000077770777700000007777000000000000000000d0001111176666677766dddd0d6d0
0dddddd66776112818d6ddd2282d6d16667707777767777d00007777000007777077770000000777700000000000000000dd0001111d6d1111d67766dd0d6dd0
0dddddd67661128282dddd12828d6d05676707777606777750007777d000d7777077770000000777700000000000000000d6d0011d1d6d81821167766d6dd6d0
0dddddd666d128282826d6122926dd516677077775017777600067777d1d77777077770000000777700000000000000000d6d111d11ddd28282116676ddd6d11
0dddddd666118289822d676222666dd1666607777000d7777d005777777777775077777777770777777777700000000000dd611d1d1d628282821d666dd6d611
0ddddd6666d82898922d7d7dd66d66d1666107777000067777100d777777777d0077777777770777777777700000000000d61111d116d228982811666dd61110
0dddd66666dd2289222d7dd7ddd666d16d000777700005777760005667776650007777777777077777777770000000000dd611111d16d22989828d666d111100
0dddd666d66dd22222d672dd7dd66dc000000000000000000000000000000000000000000000000000000000000000000dd611111112d2229822dd666d110000
01d6d666dd6ddd22ddd7727d76ddcc0000000000000000000000000000000000000000000000000000000000000000000dd6611111126d22222dd66ddd110000
011dd6666ddddddd6dd6777776dd0600000000000000000000000000000000000000000000000000000000000000000000dd66672d2766dd22ddd6dddd600000
0011dd6666ddd6666d667777766dd1000000000777777ee07770077700e77777ee777777e77777707777777e000000000000dd6727766666ddddddd6dddd0000
00111dcc66666666dd667777776dd1000000000777777770777007770e7777777e777777e77777707777777700000000000dd66777666666666ddd6d1ddc1000
000111d1dccccccddd66677dd6666d1000000007770077707770077707770e77700e77e0077000007700007700000000000dd6777766d6c6666666c1ddd11100
0000111d1d1d1d1d1dd6dd6666d6ddd10000000777007770777007770777e000000e77e0077ee000770000770000000000077777766d6ddccc666c1ddc111110
0000011111d1d1d1d1d6d76776776dd00000000777777ee0777007770e777777e00e77e0077770007700007700000000007776777666ddddd1ccc1ddc1111110
00000001111cc111111d77d77d677dd000000007770077707770077700e77777700e77e0077ee000777777770000000006666666676d6dd1ddddddc111111110
0000000000111ccc1111d7dddd6dddd1000000077700777077777777077e1077700e77e007700000777777ee000000000d6776677677dd1d1d1ccc11111111d0
00000000000011111101cc1cc11cc1110000000777777770e777777e07777777700e77e00777777077001777000000000dcddccddcdd11d1d1d1111111116dd0
000000000000000000001111111110000000000777777ee00e7777e10e777777e00e77e00777777077000e77000000000111c11cc1cc1111111111111dddd110
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011111111111111111111111111110
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000011111111111111111111000000000001111111111111111111110000000000011111111111111111111100000000000111111111111111111111000000
00011166666666666666ddddd111000000011166666666666666ddddd111000000011166666666666666ddddd111000000011166666666666666ddddd1110000
0001dddd667777776666666dddd110000001dddd667777776666666dddd110000001dddd667777776666666dddd110000001dddd667777776666666dddd11000
0011ddd66777777766dddd666ddd11000011dddd6777777766dddd666ddd11000011dddd6777777766dddd666ddd11000011dddd6777777766dddd666ddd1100
001ddd6666777766ddddddddddddd100001ddddd66777766ddddddddddddd100001ddddd66777766ddddddddddddd100001ddddd66777766ddddddddddddd100
001ddd666666666dddddddddddddd100001dddddd666666dddd111ddddddd100001dddddd666666dddd111ddddddd100001dddddd666666dddd111ddddddd100
001dddddd666666ddddd111dddddd110001ddd111d66666dd1111111ddddd110001ddd111d66666dd1111111ddddd110001ddd111d66666dd1111111ddddd110
001ddddddd6666dddd111111dddddd10001dd1111d1116ddd11888111ddddd10001dd1111d1116ddd11aaa111ddddd10001dd1111d1116ddd11888111ddddd10
0011dd111d1116ddd11dddd11ddddd100011d11d111d16dd117799811ddddd100011d11c111c16dd117799a11ddddd100011d11d111d16dd117799811ddddd10
0001dd11111116dd11dddddd11dded100001d111c1c176dd1177aa9811dded100001d111ccc176dd1177889a11dded100001d111d1d176dd1177889811dded10
0001dd611111666d1dd6666dd1dedd100001dd611c11666d119a11a911dedd100001dd61c7c1666d11a9118a11dedd100001dd611c11666d1189119811dedd10
0001d1111111166d1666666661dded100001d111c1c1166d111a11a711dded100001d111ccc1166d111a11a711dded100001d111d1d1166d1118118711dded10
0011d1111111166d1dd6d6dddddeed100011d11d111d166d1118aa7116deed100011d11c111c166d1118aa7116deed100011d11d111d166d1118887116deed10
001ddd776d77766d611dddd11deded10001ddd116d11166d611111111deded10001ddd116d11166d611111111deded10001ddd116d11166d611111111deded10
001dd6666666666dd6111116dd6edd10001ddd77dd67766dd61111167d6edd10001ddd77dd67766dd61111167d6edd10001ddd77dd67766dd61111167d6edd10
001dd6d6d6d6d6666d666666d66ded10001dd66dddd666666d676766d66ded10001dd66dddd666666d676766d66ded10001dd66dddd666666d676766d66ded10
0011dd677767611dddd777676deded10001d666666666666d666666667dedd10001d666666666666d666666667dedd10001d666666666666d666666667dedd10
001221ddddd66111dd6ddee22ede2d100011dd677767611dddd777676deded100011dd677767611dddd777676deded100011dd677767611dddd777676deded10
001dd22d1d6111111dd1d11edee22d10001221ddddd66111dd6ddee22ede2d10001221ddddd66111dd6ddee22ede2d10001221ddddd66111dd6ddee22ede2d10
0012dddddd6116d116dddddeee22c100001dd22d1d6611111dd1d11edee22d10001dd22d1d6611111dd1d11edee22d10001dd22d1d6611111dd1d11edee22d10
001122ddd6616ddd16d6dddd222c20000012dddddd6111111ddddddeee22c1000012dddddd6111111ddddddeee22c1000012dddddd6111111ddddddeee22c100
00011122dd666666666d6dde11d20000001122ddd66116d116d6dddd222c1000001122ddd66116d116d6dddd222c1000001122ddd66116d116d6dddd222c1000
00000111d6d6d6d6d666dddde210000000011122dd616ddd166d6dde11d1000000011122dd616ddd166d6dde11d1000000011122dd616ddd166d6dde11d10000
00000055dd6ddddd6d6ddddde255dd1000000111d66666666d66dddde255100000000115d66666666d66dddde211100000000111d66666666d66dddde2111000
0000dd15dddd11dddddddedec221110000000115dd666666666d6ddedd55dd0000000115dd666666666d6ddedd55dd0000000111dd666666666d6ddedd11dd00
000d1111cdd1221ddc1222cc2220000000d01d55d6d6d666d6d6ddddec101d0000001d55d6d6d666d6d6ddddec55d1d00000dd11d6d6d666d6d6ddddec551d00
00d001112cc2001cc2200222225110d0001ddd51dd6d116dddd1ccdecc1001d0000ddd51dd6d116dddd1ccdecc100000001d1551dd6d116dddd1ccdecc100d00
0000001512220002220000000011dd0000000d11cdd1111ddc1111ccc255100000000d11cdd1111ddc1111ccc2511d1000000111cdd1111ddc1111ccc21100d0
001ddd5000000000000000000000000000000111cc21001cc21001122211d00000000111cc21001cc21101122215d00000d00111cc21001cc21001122251dd00
000000000000000000000000000000000001dd55111100111110000111001d000001dd11111100111110000111000000000dd551111100111110000111000d00
00000000000000000000000000000000000d00001111000111000000000000000000000011100001110000000000000000000000111000011100000000000000
000000000000000000000000d5d5d5d50055555555555555555555005500000055550055d5d5d5d5000000000000000000000000000000000000000000000000
0000000000999999999999005d5d5d5d055d5d5d5d5d5d5d5d5d5d50d55555555d55555d5d6d5d6d000001100011000000000000000000000000000000000000
000000000919911991199190d5d5d5d555d5d5d5d5d5d5d5d5d5d5d5d5d5d5d5d5d5d5d5d5d661d5001111100000000000000111111000000000555555000000
0000000091991199991199195d5d5d5d5d5d5d5d5d5d5d5d5d5d5d555d5d5d5d5d5d5d5d5d56615d011111100000011000011110001110000005556155565000
000000009991199119911999d5d5d5d555d5d5d5d5d5d5d5d5d5d5d5d5d5d5d5d5d5d5d5d5d111d5011111000000011000111100011111000015555115115000
0000000099119911119911995d5d5d5d5d5d5d5d5d5d5d5d5d5d5d555d5d5d5d5d5d5d5d5d1d5d1d011110000100000000051101111011000115556116615000
000000009119911991199119d5d5d5d555d5d5d5d5d5d5d5d5d5d5d5d5ddd5d5d5d5d5d5d5d5d5d5000000000110000000151110111001000155655555555000
0000000091991199991199195d5d5d5d5d5d5d5d5d5d5d5d5d5d5d555d5d5d5d5d5d5d5d5d5d5d5d000000000000000000010111111111000115556555111000
000000009991199119911999d5d5d5d555d5d5d5d5d5d5d5d5d5d5d5d5d5d5d5d5d5d5d500000000000000000000000000101511111110000111115665151000
0000000099119911119911995d5d5d5d5d5d5d5d5d5d5d5d5d5d5d555d5d5d5d5d5d5d5d00000000011000000011000000010151111101000015155555511000
000000009119911991199119d5d5d5d555d5d5d5d5d5d5d5d5d5d5d5d5d5d5d5d5d5d5d500000000011100000011000000000010555011000001111115610000
0000000091991199991199195d5d5d5d5d5d5d5d5d5d5d5d5d5d5d555d5d5d5d5d5d5d5d00000000011100000000000000000101010101000000151155510000
000000009991199119911999d5d5d5d555d5d5d5d5d5d5d5d5d5d5d5d5d5d5d5d5d5d5d500000000000000000000000000000010111010000000015551100000
5000000099119911119911995d5d5d5d5d5d5d5d5d5d5d5d5d5d5d555d5d5d5d5d5d5d5d00000005000011000000000000000000110100000000011110000000
500000009119911991199119d5d5d5d555d5d5d5d5d5d5d5d5d5d5d5d5d5d5d5d5d5d5d500000005000011100000000000000000000000000000000000000000
5550000091991199991199195d5d5d5d5d5ddd5d5d5d5d5d5d5d5d555d5d5d5d5d5d5d5d0000055d000000000000000000000000000000000000000000000000
d5d55555999119911991199955d5d5d555d5d5d5d5d5d5d5d5d5d5d5d5d5d5d5d5d5d5d5555555d5000000000000000000000000000000000000000000000000
5d5d5d5d99119911119911995d5d5d5d5d5d5d5d5d5d5d5d5d5d5d555d5d5d5d5d5d5d5d5d5d5d5d000000100010000000000000000001100005000000000000
d5d5d5d5911991199119911955d5d5d556d5d5d5d5d5d5d5d5d5d565d5d5d5d5d5d5d5d5d5d5d5d5011000000000001000000100001001100055510000111000
5d5d5d5dda991199991199a15d5d5d5d5d666666666666666666661566666666666666665d5d5d5d011000000000000000000000011100000155510001555100
d5d5d5d5ddaaaaaaaaaaaa1c55d5d5d50222222222222222222222502222222222222222d5d5d5d5000000000000000000100000001100000155110005155100
5d5d5d5d0c111111111111c05d5d5d5d001511515151111115155500151511511111115d5d5d5d5d000001000000100000000000000001000011000005511000
d5d5d5d500c1cccccccccc00d5d5d5d50001010010150101010010000000010010001000d5d5d5d5000011000000000000000000000000000000000001110000
5d5d5d5d00000000000000005d5d5d5d00001010010000000011000000110010010100105d5d5d5d000000000000000000000000000000000000000000000000
d5d5d5d5000000000100010101010101010100010101010100000000000000000000000001010101010101010101000001010001010101010101000001010101
5d5d5d55000000000000000000000000000000001010100010100010101010101010101010100010101010101010001010101010101000101010101010100010
d5d5d5d5000000000000000001010100010100000000000001000101010101000100000101010000010100010000000000000000010001010101010100010001
5d5d5d55000000001000001000000000101010000010000010100010001010001000101010101010000000001010101010100010000000000010101000101010
d5d5d5d5000000000000000001010000000000000101010100000000000000000101000100000000010100010101010001010100010101000000000001010001
5d5d5d5d000000000000000000000000101010000000000010101010001010101010100010001010101000101010101000101000101010001010100010100010
d5d5d5d5000000000101000101010101010101010101000101010100000001010000000000010100010100010001000100000101010100000101010001010101
5d5d5d5d000000000000000000000000000000001010100010000000101010101010100010101000101010100000101010001010001010001010000010101000
__label__
00110000000200000000000000000000000000000000000000012111112211112111111111111000111000111100000000000001000011001000011110111100
00111000000221000000000000000000000000000000000000111011112211111211112122111000011000011100000000000000000011111111111111121100
01111000000111000000000000000000000000000000000000111100012222211111111121221010000010000010000000000100100111001102110110000100
00011122110011000000000000000000000000000000000001011111110111111111111222111110011100000110000000000000001111110001111100110011
00000000000000000000000000000000000000000000000000111101111000011111111112111111111100001100000000000000001011111000000010100001
00000010000000000000000000000000000000000000000001101110111001001111111112220111111000001100000000000000000012112110000000000000
00000000000001110000000000000000000000000000000011001110110000000021111111111000111200001000000000000000000111221111010010100100
00000000000111110000000000000000000000000000000011111100010000000011121111101000111110010001100000000000000011101022111010000000
00000000000010000000011111110000000000000000000011001000000000100011111111000000111101111000000000000000001000021111211111000000
00000000000000000000010111111100000000000000000001010100000001000011110010111000110000100000000000000000001002111111212111110000
00000000000000100000001100111110000000000000000000000010001011100111110000111110220000001000000000001000001011111111112111111100
00000000000000000001000011111001000000000000000000000000000000000211110000111111110000000000000000010000001121111111111111111110
00000000000000000222121221100000001000000000000000001000000010000121110000110011111001000000000000000000011112111121110121111111
00000000000000011221111121220000000000000000000000000100000100000122100000110001111001000000000000000000021112112211111111110111
00000000000001112211111122121100000000000000000000000000000000000112100012210001111000100000000000000000111112111221111111101111
00000000000011112211121112112210000000000000000000000000000000000111101111100000000000000000000000000000111111121111111110010000
01000000000112111111221112211120000000101000000000000000000000011001111001100000000000000000000000110000101111111111111111100000
00000000001112211211122111211212000011100000000000000111000000010111111000100011000000000000010000000000111110111101111111000000
00000000010002122111121121111110010000101010100000001110000000000001011110101111100001000000000000000000111110011100111100000000
00000000111111111221122112212210001000000100000000000010010000000000000011101111100001110000000100000002111101111100110000000000
00000000100100001112121112211100000111000000000000100100001000000000000011111110100001000000000000011001211101111101110000000000
00000001001000000002112000111111000111111000000000000000110000000000000011110101110000000000000000000010000111111111200000000000
00000001001000000001200000021111000111111110000011111111000000000000001000101110100001010011000000010010000010000012100000000000
00000001000000000001000000011110001211111110001111111111111000000000001000000011111000000010111101010010000000000000110000000000
00000000000000000001000000000110000100121110011111111122211110000000000000001111111100001000000100000010000010000000001000000000
00000000000000000011000000000210000000100121011111111111221111000000000000011111211111111200010000110011000011000000000000000000
00000000000000000002100000012120000010000002111111111111111111100000000001111211111111111111100010111011100120000000000000000000
00000000000000000000110000121221000102200001211111111111221111110000000011122111211111111111110100100000001000000000000000000000
00000000000000000000110011012221111212100010000211111111111111111000000112112221211111111111111111011000000001111110000011100000
00000000000000000000000011101222111112210110000111111111121112121110001111121120111111111111212210000000000000000001000000000000
000000000000000000000000011ddddddddddddd2110001111111111222122222111111111111111111112211111112210100000000000000000000000000000
1111110000000000000101011ddd66666666666dd1105677776d1117777222167777d17777111117777177772111111777700000000000000000000000000000
00111110000000000011000ddd666666666666666dd1767677776127777222d7777d117777111117777277772212211777700000010010000000000000000000
0001110000000000000010dd666666666666666666d1676777777d17777225777761117777112017777277771112211777710000011100000000000000000001
111111000000000000000dd6d666666666d6d6dd66dd166556777727777226777611117777111207777177771111112777711000000010101000000000001111
111122120000000011110d6d6d666dd6ddddddddddddd15121666617777267777511117777210117777177771111211777700000000010000000000000111111
11221121220000011100ddd6d6d6d6666666d6666666dd16d5111127777d7777d111117777211117777177771111000777700100000000000000000011111111
2111112222210000010ddddd6ddd667777767dd777766dd167661117777777771111117777121117777077771111000777700100000000000000000110111222
1122111222122000000dddddddd66777666667d77dddd6dd16767517777777775111127777121117777077772110000777700100001000000000001111221112
1211112112222201100ddddddd66776d1111d6d7dd22d6dd16676627777777776221127777221117777077771000000777710110001100000000011112212112
1211212112222100000dddddd66776112818d6ddd2282d6d16667727777767777d11117777011107777077770000000777711011001000000000011111111221
1211111121222100000dddddd67661128282dddd12828d6d15676727777616777751017777d111d7777077770000000777720001100101000000111111111211
1111211211111210000dddddd666d128282826d6122926dd516677277775117777610167777d1d77777077770000000777720000001110100001111121211110
1121211211111210000dddddd666118289822d676222666dd1666627777111d7777d005777777777775077777777770777777777711211100001122111111101
1111111200100221000ddddd6666d82898922d7d7dd66d66d1666127777111167777111d777777777d0077777777771777777777711212211011111111111110
0000111001100001000dddd66666dd2289222d7dd7ddd666d16d2227777111157777611156677766500077777777770777777777712122111101111111111010
0000011111000000100dddd666d66dd22222d672dd7dd66dc1121012211011121111001000011000000000001011001111100000011111111100111111111000
00000011120000001101d6d666dd6ddd22ddd7727d76ddcc12121112110011112101111000010000000000000000001111100101011111111000111111110100
000000112100000001011dd6666ddddddd6dd6777776dd0621121000111011000011221000000000000000000000000011111111221111122000111111101000
0000001120000000010011dd6666ddd6666d667777766dd1200000000777777ee07771277700e77777ee777777e77777717777777e1110011001111111101000
00000011100020001010111dcc66666666dd667777776dd1000000000777777770777117770e7777777e777777e7777771777777771110011000011111100000
000011220000111111100111d1dccccccddd66677dd6666d1000000007770077707770077707770e77700e77e007700111770001770001020000011111110000
0021111100000110112111111d1d1d1d1d1dd6dd6666d6ddd10000000777007770777007770777e000000e77e0077ee111772111770000100000000011111102
1001111100000111111112211111d1d1d1d1d6d76776776dd00000000777777ee0777007770e777777e00e77e007777111772021770000102000000001111100
11110110000001110112112121111cc111111d77d77d677dd000000007770077707770077700e77777700e77e0077ee000777777771120111000000001111000
1110011101112211121122121211111ccc1111d7dddd6dddd1000001277700777077777777077e1277700e77e007700001777777ee1111111000000000000000
11111111122121111222122122121211111111cc1cc11cc1112001022777777770e777777e07777777700e77e007777772770117771111122110000000000000
000011122212212122222222221122222111111111111111000000012777777ee00e7777e10e777777e00e77e00ddddddddddddd771111111111200000000000
000001211010111222222222222212222221122112220021000000000000000000001000011000011211000000dd66777677766ddd1111112111110010000000
00000100001000222221221222111122211111221122002200000000000000000000000000000001111111000d667777777766666ddd11211111112000000000
0000000011110022222222022012111222222111221200020000000000000000000000000000000121211111d667777766666666666dd2221122112100000001
0000100010002222221222200000121122221122121120000000000100000000000000000000000111221111d6677776666666666666dd121112212211000111
00001010010012222022222100002222121111222222110000000222100000011000000000000011112121ddddd6d666d6d6dd6666666d111121210111000010
0100000100111210221212000000122121111121221001100000022221010101111000000000001111111dd6666666d6666666d666666dd11111111111001010
000000000111120122202100000022000000011101000010000001111020111111000000000001111111dd667777dd767777766dd666d6dd1111101111100011
111101101010110202110001000200000000010201000000000111211020111110000000000021011111d6dddd77d76666677766dd666d6d1110010100101110
11111000000000001110002000200000000000122100000000001101120101111000000000011110111dd6d22dd7d6d1111d67766dd666dd1112000010011100
12121101001000000110000001010000000000122210000000012121200101010000000000111111111d6d2822ddd6d81821167766d66d6d1110000100011111
20002100000100000000000002110000000000121120000000002120200101000000000000011111101d6d82821dddd28282116676dd66dd1100000010000000
10000100000000000000000002220000000001212000000000000020201101000000000000001111011dd6292216d628282821d666dd6d6d1000000000001000
11200110000000000000000001120000000001210000000002000000102101000000000000000110021dd66222666d228982811666dd66d60000000000000000
0100112100000000000001000211110001122212000001000000000000000000000000000000011001dddd6666226d22989828d666dd6d6d0000000000000100
1000001110000000000000022221112102122210000010001110000000000000000000000000010001dd66dd62222d2229822dd666d6d6d60000000000000000
0000000000000000000000122121001001011020000011100000000000110000000000000000211122dd666672d226d22222dd66dddd6d6d0000000000000000
00000000000000000000000021200000001102000000010000000000010001000000000000001111110dddd672d2766dd22ddd6dddd6d6d10000000000000000
1000000100000000000000001221000000011210000001000000000000011100000000111101111111100dd6727766666ddddddd6ddddd110000000000000000
110000111011110000000000122100001001120201202100000000000001110000000011012000111110dd66777666666666ddd6d1ddd1100000000000000000
110000000111111000000000021200001212111122220210000000000010000100000000000001101100dd6777766d6d6666666d1ddd11100000000000000000
01000000001010100000000000000000011212122211211000000000000010001000000010000112110077777766d6ddd1d666d1ddd111010000000000010000
000000000000000100000000000000000012111122212110000000000010000000000000001100210007776777666ddddd1d1d1ddd1110000000000000001200
00000001000000000000010000000000002112012211122000000000000000000000001111110000006666666676d6dd1ddddddd111100000000000000000010
0011111100010011000000000000000001111120220202000000000000000000000111111111110000d6776677677dd1d1d1ddd1110002000000000000000000
0001001100011000000000000000000111122110120212100000000000000000011122212111111200d6dd66dd6dd11d1d1d1110000000000000000000000000
0001111111211110000000000000000111122222210101200000000000000001111222222211111120111d11dd1dd10111111111100010000000000000000011
10021111112212100000000011000001000000000000000000000000000000011222222221111112120011111111100000000011112100000000000000000011
00011221111000100000000100100000000000000000000000000000000000111222222211111121222011111011000000000000021000000100000000000111
11112221100000210000000000001000000000000000000000000000000002212111211111111121112200001111000000000000000000001100000000010111
12122211100001201000000000011000000000000000000000000000002122122111112122212221011110000110010000001000000000000000000001110111
22212111000001100200000000000021000000000000000000000000002212222211122122121211001111000211111000000000000000000000000111111111
12110111000001000001000000000021112100000000000000000000000212222112112222212211101121001212120000010000000000000000000121111011
11121221000000000001111000000111211110000000000000000000000121222222212221111121111110002112210000110000000000000000001112211011
11111121212001000001121100000111112111100000000000000000000222222211112221111111111210001121100000110100000000000000001111121111
22121220121111112222211110001111111211100000000000000000000222120000121221221111112200112101001010101000000000000000001110011221
11222000011112222222221111111111111111100000000000000000201220000000021111100011121200102211010001100000000000000000000000001112
22211000011111111121222111211111111111100000001100000002202000000000012111000001211200000001010001010000000000000000001000101110
11111111212122112111111211121110001111111110111000000002220000000000011110000000021100000000000000000000001111000000000000011000
11001112122121211222112221112212000022111112100010000002220000000000021110000000001200000000000000000000121112000000000000011000
11000111111212111221122221111111000000000011000000000002220000000000021210000000000010000000011111000000000200100000000000110000
00001111111112211111220111111112100000000010000000000002220000000000111100000000000000000000001210000000000000200000000000000000
00011121111111111120121111211121110000000010100000000002220000000000122000000000000001000002110011110000001011000000000000000000
00111110110011211111100111111121211000000002001100000000111000001102220001000000000021000010000111000000011000000000000000000000
01211100111000121200000011011111121100000000000000000010010101211110100000100000000021000010011002000000001000000000000000000000
01111101111100121000000011101111110000000000000000000110022211112202100001110000001011000000110000000100000000112111000000000001
11111111111100110000000000011112110001000000000000000222211000001102000000001100001011000010010000011100000001001110000000000001
11111111111110120000000000120121000000100000000000000022210000001002000000001112110120000000000110100000000110000001210000000012
11111101011110121000000000111111100000210000000011000012210000001110000000000110011200000100000000000012111101102001000000000000
11111000001000002000000000102111100000011000000011100002200000001011000000001100000000000000000000000012111111110001000011100000
00010100000000022000000000011021000000000200000020000002100000000210000000011100000000000000000000000111111111111000000000000000
00000200000000111200000001011211000000000000000000000000000012100010120010111100000000000000110011111111111111111100000000000000
00000000000000122100000000211111000000010000000000000000000001111110112110011000000000000001111111111111111111111110000000001000
00000000100000121212000011110110000000010000002211100000000000222112112010011000000000000011111111111111111111111111000111000000
00000000000000011221111101111010000000221000122221100000000000222122111100120011000000000111111111121112111111111111101101100000
00000000000000022211220000011100000000011001100001000000000010122111211001221100000000001111111111122111211111111110110000100000
00000000010000001000000000011110000002011010000010100000000010120122010101121000000000001111111111121111211111111100110000000000
00000000000000000000000000001110101021121000002020010000000001001112110100201000000000011111111111121122111111111110101000001100
00000000000000000000000100000111111111111100012200000000000011211111210110111000000000111111111111211121111111111101110000000000
00000000000000000000000001101011121110111102000000001000001211211112111111110000000000111111111111111211111221111110011000000000
00000000000000000000000100111112111112110211200000001000111211111111111121000000000001111011111111211111211111111110001000000000
00000000000000000000000000111111111001110100100000000011111111112111111122200000000011111101111111211211111111111110001100000111
00000000011100000000000000000012100000200000000000000212112111111211111111220000000001000011111111112111011111111100000110001110
00000000000111000000000000000012000000000000010000102211122222111111121112211000001010001000001111111110001111111110000110001000
00000000100110000000000000000100000000000000000011122221121112211211111122221100011100000000001111111110001111111100000011000000
00000111000010000000000000000000000000000000000011212222111111212221111111111111011100000000000111011110001111111100000000000000
00000011000001000000000000000000000000000010000002111111111111121211111111111111111100000000000100111100000111111100000000000000
00000011011210100000000000000000001210010110110111111111111111111111212111111111111100000000000010100000000111111100000010000000
00000001002100000000000000000000000000001000111011111101110111112111111111111111111100000000000001000000000101111100000110000000
00000000000000000000000000000000000000121000011111111011011110111111221111111111101100000000000000000000000000011000000111000000
01000000000000000000000000000000000002210000001010111111111111111111111112111112100000000000000000000000000000011000000111000000

__map__
eb0000cbef0000000000ebec00ecebdbcc000000000000000000000000000000fb0000000000ea000000000000cccd00d20000000000ed00ea000000ebeccbd1d200000000000000d9000000000000d1d20000000000000000000000000000d1d2d5d5d5d5d5d5d5d5d5d5d5d5d5c3d1c20000000000000000000000000000c1
ea0000edcb00000000000000edcccd00000000000000ea000000000000000000fff4f2f20000000000000000eadcdd00d200000000000000000000cccdeb00d1d200000000000000d9000000000000d1d20000000000000000000000000000d1d2d5d5d8d5d5c3d5d5d5d5d8d5d5d5d1d20000000000000000000000000000d1
cd0000ec00ee00ec000000ebecdcddcb0000000000cbec000000000000000000c6fbfcfff3f2000000000000000000c4d200000000000000000000dcddeaebd1d200000000000000d9000000000000d1d20000000000000000000000000000d1d2d5d5d5d5d5d5d5d5c3d5d5d5d5d5d1d20000000000000000000000000000d1
dd00cccd000000eb000000eaebdaca00000000000000edeb00000000ed00eaedd6fafbf5f200000000000000000000d4d20000000000ebeccb00ea00db0000d1d200000000000000d9000000000000d1d20000000000000000000000000000d1d2d5d5c3d5d5d5d5d5d5d5d5d5d5d5d1d20000000000000000000000000000d1
eaeadcdd00ebf2ec0000ed00ebeceacc00000000edececeb00000000000000dbd6fff50000000000000000000000ccd4d2000000000000eb00000000000000d1d200000000000000d9000000000000d1d2000000cccd0000000000000000ced1d2d5d5d5d5d5d5d5d5d5d5d5d5d5d5d1d20000000000000000000000000000d1
cb0000f2f3f7fafcf3f2000000ebecdc00000000000000000000000000000000d6f2000000000000000000000000dcd4d2000000000000eaeb000000000000d1d2eccb0000000000d900cccd000000d1d2000000dcdd0000000000000000ded1d2d5d5d5d5d5d5d8d5d5d5d8d3d8d5d1d20000000000000000000000000000d1
eb00cb0000f2f9f3f20000eb00ec0000000000000000ed00ea000000ebeccbccd6cd00000000000000000000000000d4d2000000ea00db0000000000000000d1d2eb0000000000000000dcdd000000d1d200000000000000000000cccd0000d1d2d5d5d5d8d5d5d5d5d5d5d5d5d5d5d1d200000000cb0000000000000000ced1
da0000edee000000ec00000000ec000000000000000000000000000000eb00dcd6dd00000000000000000000ea0000d4d20000000000000000000000000000d1d2eaeb000000000000000000000000d1d200000000000000000000dcdd0000d1d2d5d5d5d5d5d5d5d5d5d5d5d5d5d5d1d20000000000000000cb00000000ded1
0000000000000000eceb00000000000000000000000000000000000000eaeb00d60000000000000000000000000000d4d2000000000000000000ebeccb00ead1d20000000000000000000000000000d1d20000000000000000000000000000d1d2d5c3d5d5d5d5d5d5c3d5d5d5d5d5d1d200000000000000000000cccd0000d1
00000000ea0000000000ed000000da00000000000000ebeccb00ea00db000000d6cccd000000000000000000000000d4d200000000000000000000eb0000ced1d200c1c200dacb00c4c5c600c1c200d1d20000000000000000000000000000d1d2d5d5d5d5d5d5d5d5d5d5d5d5d5d5d1d2000000000000eb000000dcdd0000d1
0000000000000000000000000000cb0000000000000000eb0000000000000000d6dcdd000000000000000000000000d4d200000000eb0000000000eaeb00ded1d200d1d200ebed00d4d5d600d1d200d1d2eccb000000000000000000000000d1d2d5d5d5d5d3d5d5d5d8d5d5d5d5d5d1d2000000eb00000000000000000000d1
00cccd00000000da000000ebec00000000000000000000eaeb00000000000000d60000000000000000000000000000d4d200000000000000ea00db00000000d1d2d9e1e200eaebebd4d5d600e1e200d1d2eb00000000000000000000000000d1d2d5d5d5d5d5d5d5d5d8d5d5d5d5d5d1d20000000000000000000000000000d1
00dcdd0000000000000000000000ec0000000000ea00db000000000000000000d600000000ea000000000000000000d4d20000000000000000000000000000d1d200ebeb000000cad4d5d600000000d1d2eaeb000000000000000000000000d1d2d5d5d5d5d5d5d5d8d5d5d5d5c3d5d1d2000000000000ebec00ecdbea0000d1
000000000000000000000000000000ce00000000000000000000000000000000d600000000000000000000ea0000ccd4d20000ea00db0000ea00db00000000d1d200ebebeb000000d4d5d6ea000000d1d2cb00000000000000000000c30000d1d2d5d5d5d8d5d5d5d5d5d5d5d5d5d5d1d2000000c4c5c8c5c5c7c6cadaebc0d1
cd0000ec00000000ed00ea00000000de000000000000000000000000000000ccd600000000000000000000000000dcd4d2cf00000000000000000000000000d1d200ebedebeceb00d4d5d600000000d1d2000000000000eedbef0000ec0000d1d2d5d5d5d5d5d5d5d5d5d5d5d5d5d5d1d2000000d4c3d5d5d5d5d6eeecc0c0d1
dd0000ebeb0000000000000000000000000000000000000000000000eb0000dcd6cd0000ea00000000000000000000d4d2df00000000000000000000000000d1d200eb0000ebebebd4d5d60000cb00d1d2eb00000000db00caeb0000000000d1d2d5d5d5c3d5d5d5d5d5d3d5d5d5d5d1d2000000d4d5d5d5d5d5d6d0eeedcbd1
00000000eb0000000000000000eb000000000000000000ebeccb000000000000d6dd00cbea000000000000eacb0000d4d20000000000000000000000000000d1d200ebed00eaecebd4d5d6cbebec00d1d2000000000000ebdbeded000000ccd1d2d5d5d5d5d5d5d5d5d5d5d5d5d5d5d1d2000000d4d5d5d5d5c3d5c7c8c5c8d1
0000000000000000ebeccb00000000000000000000000000eb00000000eceb00d6da00000000000000eccbcaeb0000d4d20000000000000000000000000000d1d200edeb00ebeb00d4d5d6ebebeb00d1d2000000000000eceb00eded0000dcd1d2d5d5d5d5d5d5d5d5d5d5d8d5d5d5d1d2000000d4d8d5d5d5d5d5d5d5d5d5d1
000000000000000000eb0000000000000000000000000000eaeb00000000ec00d6ebcb0000000000eb0000ecdb0000d4d2000000ed00ea000000ebeccb0000d1d2ebebecedebcbebd4d5d6eccbeb00d1d20000000000db00000000eb000000d1d2d5d5d5d5d3d5d5d5d5d5d5d5d5d5d1d2000000d4d5d5d5d5d5d5d5d5d5d5d1
00ea00000000000000eaeb0000000000000000000000000000000000daec0000d6eaecebda00000000000000eb0000d4d200cccd00000000000000eb000000d1d20000ebecebebebd4d5d600eced00d1d200000000000000000000ebeb0000d1d2d5d5d5d8d5d5d5d5d5d5d5d5d5d5d1d2000000d4d5d5d5d5d5d5d5d5d5d5d1
f30000000000ea00db00000000000000000000000000000000cccd00ebdb00edd600daec0000000000ea0000000000d4d200dcdd00000000000000eaeb0000d1d200cbcaeb00cb00d4d5d6ebeb0000d1d20000000000000000000000000000d1d2d5d5d5d5d5d5d5d5d5d5d5d5d5d5d1d20000d9e3d5d5c3d5d5d5d5c3d5d5d1
f80000000000000000000000000000000000000000ed00ea00dcdd00ebed0000d6eceb000000000000000000000000d4d2000000ebeccb00ea00db00000000d1d2000000eaeb0000d4d5d6ebeb0000d1d2000000cccd000000000000000000d1d2d5d5d5d5d5d5d5c3d5d5d5d5d5d5d1d2c5c5e9d5d5d5d5d5d5d3d5d5d5d5d1
fbf20000ecebeb0000cccd00ebeb000000000000000000000000000000ec0000d600000000ea000000000000000000d4d200000000eb00000000000000edced1d2ea00db0000ed00e4e5e600eceb00d1d2000000dcdd000000000000000000d1d2d5d5d5d5d5c3d5d5d5d5d5d5d5d5d1d2d5d5d5d5d5d5d5d5d5d5d5d5d5d5d1
fdf3f200ebea000000dcdd0000ebeb0000000000000000ee0000eb0000000000e60000000000000000000000000000e4d200000000eaeb00000000000000ded1d20000000000000000000000ebeb00d1d20000000000000000000000000000d1d2d5d5d5d5d5d5d5d5d5d5d5d5d5d5d1d2d5d5d8d5d5d5d5d5d5d5d5d5d5d5d1
fff300eb00000000000000ec000000000000000000ebeccb00ef0000ea00000000000000000000000000000000000000d200ea00db00000000000000000000d1d2000000ea000000ed00000000ec00d1d20000000000000000000000000000d1d2d5d5d5c3d5d5d5d5d5d5d5d5d5d5d1d2d5d5d5d5d3d5d5d5d5d5d8d5d5d5d1
f6ecebec00000000ebeaeb0000ed00000000000000eceb00ee000000000000cb00000000ea00000000000000cccdea00d2000000000000000000000000ebecd1d2ea00db000000000000000000eb00d1d20000000000000000000000000000d1d2d5c3c3d3d5d5d5d5d5d5d5c3d5d5d1d2d5d5d5d5d5d5d5d5d5d5d5d5d5d5d1
f4f2eb000000dbebebcbeb0000000000000000000000eaeb00000000000000ea00000000eaea000000000000dcdd0000d200000000000000000000000000ebd1d200000000000000000000000000ebd1d20000000000000000000000000000d1d2d5d5d5d5c3d5d5d5d5d5d5d3d5d5d1d2d5d5d5d5d8d5d5d5d5d5d5d5d5d5d1
f2f3eaeb00eaebebdbebcb0000000000000000ea00db0000000000eccb00ebeb00000000000000000000000000000000d200000000000000000000000000ead1d200000000ca000000da0000000000d1d2000000000000000000cccd000000d1d2e7e7e7e7e7e7e7e7e7e7e7e7e7e7d1d2d5d5d5d5d5d5d5d5d5d5d5d5d5d5d1
ec000000ebebeb0000000000000000000000000000000000000000eb00caebed000000000000000000000000ea000000e200000000000000000000ea00db00e1d20000000000ed0000000000000000d1d2000000000000000000dcdd000000d1d2da00000000000000000000000000d1d2d5d5d5d5d5d5d5d3d5d5d5d5d5c3d1
0000000000eaec0000000000000000000000000000000000000000eaeb00ebeb00000000000000000000000000000000000000cccd00000000000000000000ebd20000000000000000eced00000000d1d20000000000000000000000000000d1d20000000000000000000000000000d1d2d5d5d5d5d5d5d5d5d5d5d5d5d5d5d1
0000ed000000000000000000000000000000000000000000ea00db00000000eb00000000000000000000000000000000000000dcdd00000000000000000000ecd20000000000000000ecca00000000d1d20000000000000000000000000000d1d20000000000000000000000000000d1d2d5d5c3d8d5d5d5d5d5d5d5d5d5d6d1
00000000000000000000000000000000000000000000000000000000000000000000000000000000ea00000000000000000000000000000000000000000000eed20000000000da0000000000000000d1d20000000000000000000000000000d1d20000000000000000000000000000d1d2d5d5d5d5d5d5d5d5d5d5c3d5d5d6d1
__sfx__
920200001801016610016000060000600026000560010600006000060000600006000060000600006000060000600006000060000600006000060000600006000060000000000000000000000000000000000000
00020000266560d6163165612656376560c65025650096500965007650076500765007650076500865008650086500865008650086500865008650096500d6500f650136401b6402063026630286202c61030610
0002000004150140501e0400d6301762014610116100f6400d6300b63009620096100010000100001000010000100001000010000100001000010000100001000010000100001000010000100001000010000100
4b01000004110176101661013610036100061000610000100d6000b60009600096000010000100001000010000100001000010000100001000010000100001000010000100001000010000100001000010000100
d701000004450144501e4400d4301741014400114000f4000d4000b40009400094000040000400004000040000400004000040000400004000040000400004000040000400004000040000400004000040000400
780600002c650256501d6501a650196501865018650196501965017650116500d650046500165034600356003560035600336002f6002a600236001e6001960014600106000e6000b60008600076000560005600
a70400001645617456194561c456224562d4562745626456364562d406324063d4000040000400004000040000400004000040000400004000040000400004000040000400004000040000400004000040000400
8f070000236503465036650376503765036650326502d6502865025650206501d65017650146500f6500a65006650026200165000650026500165000650006500065000650006500065000650006500360005600
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
59180000151501a2501e350151501a2501e350151501a2501e3501715017252173521735200300003000030000300003000030000300003000030000300003000030000300003000030000300003000030000300
d71000000000000000003540c35000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
8f100000002540c2500c2500c25200402004000040000400004000040000400004000040000400004000040000400004000040000400004000040000400004000040000400004000040000400004000000000000
3e090000002540c250002540c250002540c2500c2520c2520c2520c25200200002000020000200002000020000200002000020000200002000020000200002000020000200002000020000200002000000000000
3f0a0000002540c250002540c250002540c2500c2520c2520c2520c25200254082500825208252082520825405250052520525205252052520525205252052520525205252052520525205254000000000000000
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
09200000000602e0501a0500c050220501f050000501f0501f03000010130201b03000040110300f030000300f0300f030000300c0300f030000300a030000000c05000000000000c05000000000000c05000000
c6090000357502a750247501d750157500b7500275000750007000070000700007000070000700007000070000700007000070000700007000070000700007000070000700007000070000700007000070000700
13200000000602e0502905000050220501f050000501f0501f03000010130201b03000040110300f030000300f0300f030000300c0300f030000300a030000000005000000000000005000000000000005000000
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
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
01 34164355
00 34164355
00 34164355
02 32164355

