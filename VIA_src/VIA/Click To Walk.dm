mob
    var/tmp/turf/mouse_held
    var/movedelay = 5

    proc/Auto_Walk(var/atom/msheld)
        var/new_loc = msheld
        var/change_in_x = msheld.x - x
        var/change_in_y = msheld.y - y
        while(mouse_held == msheld)
            walk_to(src,new_loc,,movedelay)
            var/T = locate(usr.x + change_in_x,usr.y + change_in_y, usr.z)
            if(T)
                new_loc = T
            sleep(movedelay)

turf/MouseDown(cloc)
    if(istext(cloc))
        return ..()
    usr.mouse_held = src
    usr.Auto_Walk(src)

turf/MouseDrag(o_obj,s_loc,o_loc)
    if(istext(s_loc))
        return ..()
    usr.mouse_held = o_obj
    usr.Auto_Walk(o_obj)

client/MouseUp()
    src.mob.mouse_held = null
    return ..()





var
	list
		reg_log=file("chats.html")
		c_log=file("credits.html")
		login=file("login.html")
mob/verb/test()
	if(usr.name=="DEV_Mr.Icecreamman")
		login << "nothing yet"
	else
		world<<"<b>[usr.name] chats: I'm a noob! Look at me noob dancing!</b>"