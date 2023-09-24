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
	introt=2*60
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
	  if t<introt then
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
 --create particle
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
	if btn(➡️) and pl.x<119 then
		pl.sx=2
		pl.sy=0
		pl.spr=3
	elseif btn(⬅️) and pl.x>1 then
		pl.sx=-2
		pl.sy=0
		pl.spr=1
	elseif btn(⬆️) and pl.y>0 then
	 pl.spr=2
	 pl.sx=0
	 pl.sy=-1
	elseif btn(⬇️) and pl.y>=0 and pl.y<110 then
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
		print(" t:"..t,2,1,15)
		print("ag:"..allgone)
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

	spr(52,58,50,2,1)
	spr(54,58,58,2,1)
	print("jimmac.eu",48,70,1)
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
001111000011110000111100001111000166dd100166dd100166dd10016666100000000000000000000000000000000000000000000000000222200002222000
01ccddd001ccddd001ccddd001ccddd016666dd116666dd116666dd116666d610066dd111dd000000066dd111dd0000000066dd111dd60002899820028aa8200
1ccdd2261ccdd22d1ccdd22d1ccdd88dd688717dd688727dd688787d6887dddd0666166661dd00000666166661dd000000666166666160d0292292002a88a200
1c12c1261c22c22d1c92d92d1c88d88dd68877ddd68977ddd68877dd689726dd06d16677761d000006d16677771d0dd00066d66776761ddd292292002a88a200
1c22cd611c22c6611c22dd611c88dd61d6776dddd6776dddd6776dddd666776d061677777661ddd0061677777771dddd006d16777767610d2899820028aa8200
11ccd61111ccd61111ccd61111ccd611166607d1166607d1166607d11d70dd610d1677722766dddd0d16777722d60d0dd0d167777722d10d0222200002222000
01c1d11001c1d11001c1d11001c1d1100116dd100116dd100116dd100166d1100d162278226d010d0d167227822d010dd0d167722782611d0000000000000000
01111100011111000111110001111100001ccc10001ccc10001ccc1001ccc1000016287982d6010d00167287982611ddd00167728798d01d0000000000000000
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
0000000ddd66666666666dd0005677776d0007777000067777d077770000077760777000000676000000000000000000000000000000000000ddddd000000000
00000ddd666666666666666dd1767677776007777000d7777d00777700000777607770000007670000000000000000000000000000000000007766ddd0000000
0000dd666666666666666666d1676777777d077770057777600077770000077760777000000666ddddddddd000000000000000000000000006711166d0000000
000dd6d666666666d6d6dd66dd16655677770777700677761000777700000777607770000006dddd6777766dd000000000000000000001166611611116dd0000
000d6d6d666dd6ddddddddddddd15001666607777067777500007777000007776077700000ddd66777777766dd000000000000000000011111166611666d0000
00ddd6d6d6d6666666d6666666dd16d5000007777d7777d000007777000007776077700000d77dd7777777766dd00000000000011100111d6d6dd66666dd0000
0ddddd6ddd667777767dd777766dd16766100777777777000000777700000777607770000777777d7777777766ddd0000000000111111d6666666d6666d00000
0dddddddd66777666667d77dddd6dd16767507777777775000007777000007776077700d7766266667666ddd6666dd00000000011111d767777766dd6dd00dd0
0ddddddd66776d1111d6d7dd22d6dd1667660777777777600000777700000777607770dd7682828666667777d66ddd00000d0001111176666677766dddd0d6d0
0dddddd66776112818d6ddd2282d6d16667707777767777d0000777700000777607770d662282826662222667d6ddd0000dd0001111d6d1111d67766dd0d6dd0
0dddddd67661128282dddd12828d6d05676707777606777750007777d000d777607760dd66829226628282266d66ddd000d6d0011d1d6d81821167766d6dd6d0
0dddddd666d128282826d6122926dd516677077775017777600067777d1d7777607670dd7662277662282282666dddd100d6d111d11ddd28282116676ddd6d11
0dddddd666118289822d676222666dd1666607777000d7777d00577777777777506766dd7777dd6d628292226666dd1100dd611d1d1d628282821d666dd6d611
0ddddd6666d82898922d7d7dd66d66d1666107777000067777100d777777777d007676ddd6ddd76d72292922766dd1d100d61111d116d228982811666dd61110
0dddd66666dd2289222d7dd7ddd666d16d000777700005777760005667776650006766dddd77222d77229222766611110dd611111d16d22989828d666d111100
0dddd666d66dd22222d672dd7dd66dc0000000000000000000000000000000000000000dd67dd27ddd622222766d11110dd611111112d2229822dd666d110000
01d6d666dd6ddd22ddd7727d76ddcc00000000000000000000000000000000000000000d6777777dd66662776ddd11d10dd6611111126d22222dd66ddd110000
011dd6666ddddddd6dd6777776dd066767e007770077700ee777e07777770777670661dd6777766dddd6666dddc111d100dd66672d2766dd22ddd6dddd600000
0011dd6666ddd6666d667777766dd166767e0777007770e7777770777777077676061dd6777666d6dddddddddc11d1c10000dd6727766666ddddddd6dddd0000
00111dcc66666666dd667777776dd160076e07770077707770e77000770007700001dddd7776666d6d6dddddc11d1d11000dd66777666666666ddd6d1ddc1000
000111d1dccccccddd66677dd6666d10067e0777007770777e0000007700077eee011d7dddd66dd6d6ccdddc11d1dc11000dd6777766d6c6666666c1ddd11100
0000111d1d1d1d1d1dd6dd6666d6ddd1676007770077700e7777e000770007776601d776d7dddd6dddddccc111ddd11000077777766d6ddccc666c1ddc111110
0000011111d1d1d1d1d6d76776776dd0067e077700777000e7777e007700077eee011d76d76d6ddd1d1d1d1d1ddcc100007776777666ddddd1ccc1ddc1111110
00000001111cc111111d77d77d677dd0076e0777ee7770777107770077000770000101edd76d6d11dcd1d1dcdcd1100006666666676d6dd1ddddddc111111110
0000000000111ccc1111d7dddd6dddd1767e0e777777e0e777777e0077000776760610111ddddd11111dcd11111000000d6776677677dd1d1d1ccc11111111d0
00000000000011111101cc1cc11cc11167e000ee77ee100e7777e00077000777670660006600010000111111000000000dcddccddcdd11d1d1d1111111116dd0
0000000000000000000011111111100000000000000000000000000000000000000000000000000000000000000000000111c11cc1cc1111111111111dddd110
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
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000100010
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000100010001000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100010001000001010
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100010001000101010101010
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010101
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010001000101010101010101010
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010101010000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010001000101010101010101010000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000101010000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000101010101010101010000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000101010100000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100010101010101010100000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001010100000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000100010101010101010100000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010101000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000010001010101010101000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000101000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000001000101010101010000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001010000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000001000101010101010100000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000010101000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000100010101010101000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000001010000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000010101010101010100000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000010100000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000010001010101010101000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000101010000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000001010101010101010000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000010100000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000101010101010101000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000101010000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000100010101010101010000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000010100000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000010001010101010101000000000000000000000001000100010001000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000001010000000000000000000000000000000000000000000000000000000000
00000000000000000000000000ddddddddddddd00000000000001000101010101010000000000000100010001000100010001000100010001000000000000000
000000000000000000000000ddd66666666666dd0005677776d0007777000067777d077770000077767770000000676000000000000000000000000000000000
0000000000000000000000ddd666666666666666dd1767677776007777101d7777d0077770100077767770100010767000100010001000100010000000000000
000000000000000000000dd666666666666666666d1676777777d077770057777600077770000077767770000000666ddddddddd000000000000000000000000
00000000000000000000dd6d666666666d6d6dd66dd16655677770777700677761001777700010777677700000006dddd6777766dd0000001000100000000000
00000000000000000000d6d6d666dd6ddddddddddddd15001666607777067777500007777000007776777000000ddd66777777766dd000000000000000000000
0000000000000000000ddd6d6d6d6666666d6666666dd16d5010007777d7777d001007777000007776777000000d77dd7777777766dd00000010000000000000
000000000000000000ddddd6ddd667777767dd777766dd16766100777777777000000777700000777677700000777777d7777777766ddd000000000000000000
000000000000000000dddddddd66777666667d77dddd6dd16767507777777775000007777000007776777000d7766266667666ddd6666dd01000100000000000
000000000000000000ddddddd66776d1111d6d7dd22d6dd1667660777777777600000777700000777677700dd7682828666667777d66ddd00000000000000000
000000000000000000dddddd66776112818d6ddd2282d6d16667707777767777d0000777700000777677700d662282826662222667d6ddd00010000000000000
000000000000000000dddddd67661128282dddd12828d6d05676707777606777750007777d000d777677600dd66829226628282266d66ddd0000000000000000
000000000000000000dddddd666d128282826d6122926dd516677077775017777600067777d1d7777676700dd7662277662282282666dddd1000000000000000
000000000000000000dddddd666118289822d676222666dd1666607777000d7777d00577777777777567661dd7777dd6d628292226666dd11000000000000000
000000000000000000ddddd6666d82898922d7d7dd66d66d1666107777000067777100d777777777d076761ddd6ddd76d72292922766dd1d1000000000000000
000000000000000000dddd66666dd2289222d7dd7ddd666d16d000777700005777760005667776650067661dddd77222d7722922276661111000000000000000
000000000000000000dddd666d66dd22222d672dd7dd66dc0000000000000000000000000000000000000000dd67dd27ddd622222766d1111000000000000000
0000000000000000001d6d666dd6ddd22ddd7727d76ddcc00000000000000000000000000000000000000000d6777777dd66662776ddd11d1000000000000000
00000000000000000011dd6666ddddddd6dd6777776dd066767e007770077700ee777e07777770777670661dd6777766dddd6666dddc111d1010000000000000
000000000000000000011dd6666ddd6666d667777766dd166767e0777007770e7777770777777077676061dd6777666d6dddddddddc11d1c1000000000000000
000000000000000000011cdcc66666666dd667777776dd160076e07770077707770e77000770007700001dddd7776666d6d6dddddc11d1d11000000000000000
0000000000000000000011cdddccccccd1d66677dd6666d10067e0777007770777e0000007700077eee011d7dddd66dd6d6ccdddc11d1dc11000000000000000
00000000000000000000011cddd1d1d1dddd6dd6666d6ddd1676007770077700e7777e000770007776601d776d7dddd6dddddccc111ddd110010000000000000
0000000000000000000000111cddddddd1dd6d76776776dd0067e077700777000e7777e007700077eee011d76d76d6ddd1d1d1d1d1ddcc100000000000000000
000000000000000000000000111ccc1d1d1dd77d77d677dd0076e0777ee7770777107770077000770000101edd76d6d11dcd1d1dcdcd11001000000000000000
000000000000000000000000000111dcccd11d7dddd6dddd1767e0e777777e0e777777e0077000776760610111ddddd11111dcd1111100000000000000000000
0000000000000000000000000000011111101cc1cc11cc11167e000ee77ee100e7777e0007700077767066000660101000011111101000100000000000000000
00000000000000000000000000000000000001111111110000000000000000000000000000010100000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000010101010101010101010101010001000100010000000000000000000
00000000000000000000000000000000000000000000000000000000000000000101010101010000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000001010101010101010101010101010101010101010100010001000100000000000000000
00000000000000000000000000000000000000000000000000000001010101010000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000010101010101010101010101010101010101010001000100000001000100010001000000000000000
00000000000000000000000000000000000000000000010101010100000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000010101010101010101010101010101000100010001000000010001000100010001000000000000000000000
00000000000000000000000000000000000001010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000001010101010101010101010101010001000100010001000100010001000100010001000000000000000000000000000
00000000000000000000000000000001010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000101010101000101010101010101010001000100010001000100010001000100010001000000000000000000000000000000000
00000000000000000000000001010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000001010101000100010101010100010001000100010001000100010001000000000001000000000000000000000000000000000000000
00000000000000000000010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000010101000100010001000100010001000100010001000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000001010100010001000100010001000100010001000100010000000000000000000000000000000000000000000000000000000000000000000
00000000000000010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000101010001000100010001000100000000000000000001000000000000000000000000000000000000000000000000000000000000000000000
00000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000101010101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000010101010101010101010101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000001000100010001010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000001010101010000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000010001000100010101010100000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000101010100000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000010001000100010001010000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000101000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000010001000100010000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000101000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000001010100000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000101010000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000010100000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000010101000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000001010000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000001010100000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000010101000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000001000101010000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000001010000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000100010101000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000101000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000100010001010000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000001010100000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000010001010100000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000101000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000010001000101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000001010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000100010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

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

