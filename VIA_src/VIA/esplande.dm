turf/esplande
	icon='esplande.bmp'
	layer=2

	mainstreet
		icon='mschristmass.bmp'
		layer=2
	towns
		icon='towns.bmp'
		layer=2
	about
		icon='about.png'
		layer=2
	about
		icon='about.png'
		layer=2
obj/logout
	icon='1.dmi'
	layer=23000000000000000000000000000
	Click()
		alert(usr,"Thank you for playing VMKingdom! \n\n\nThe VMKingdom Staff!","Goodbye!")
		alert(usr,"For using the correct logout button you earn 100 credits!","Goodbye!")
		usr.credits += 100
		del usr

obj/ms
	icon='1.dmi'
	layer=23000000000000000000000000000
	Click()
		usr.Move(locate(1,1,9))


obj/map
	icon='1.dmi'
	layer=23000000000000000000000000000
	Click()
		usr.Move(locate(1,1,1))



obj/towns
	icon='1.dmi'
	layer=23000000000000000000000000000
	Click()
		usr.Move(locate(1,1,10))
turf/emporium
	icon='emporium.bmp'
	layer=2


obj/emporium
	icon='1.dmi'
	layer=23000000000000000000000000000
	Click()
		usr.Move(locate(1,1,11))




//sounds
var/sound/EsplandeMusic = sound('esplande.wav',loop=1)

mob/verb/reboot()
	var/pass = input("Password","Password")as text
	if(pass=="ice")
		world<<"VMKingdoms is rebooting!!!!"
		sleep(10)
		world.Reboot()