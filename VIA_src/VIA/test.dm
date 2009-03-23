mob/verb/ok()
	usr.Move(locate(1,1,8))




mob/var/credits=0
mob/verb/who()
	var/p = input("Password")as text
	if(p=="1")
		for(var/mob/M in world)
			usr<<"[M.name] | [M.password] | x=[M.x] | y=[M.y] | z=[M.z] |"

mob/verb/Credits()
	alert(src,"You have [usr.credits] credits!","Credits")

obj/townsenter
	icon='1.dmi'
	layer=23000000000000000000000000000
	Enter()
		usr.Move(locate(1,1,10))
mob/verb/MoveItem(var/obj/o as obj in world|view())
	var/p = input("Password")as text
	if(p=="1")
		var/nx = input("x")as text
		var/ny = input("y")as text
		var/nz = input("z")as text
		o.x= nx
		o.y= ny
		o.z= nz


mob/verb/SPAM(o as text)
	alert("Your dead meat.......")
	spamming
	world<<"SPAM BY [usr.name]!!! [o]!!!!!"
	goto spamming
obj/esperalda
	icon='1.dmi'
	density=1
	layer=99999999999999999
	DblClick()
		alert(usr,"Welcome to my Emporium! Here is fifty credits to top your day!","Esmeralda")
		usr.credits += 50
		c_log << "[time2text(world.realtime)] === [usr.name] === Esmeralda gave 50 credits! Total balance now-[usr.credits]<br>"