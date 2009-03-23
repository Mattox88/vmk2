mob
	icon='Im a little teapot.dmi'
	layer=2222

mob
    var
        old_x
        old_y
        old_z
        password

    Logout() // Upon logging out..
        src.old_x = src.x //Set your current position, to your old_ variables.
        src.old_y = src.y
        src.old_z = src.z
        world<<"[usr.name] has logged out!"
        pl_savecharacter(src) // Call the save character proc
        del usr
    Login() // Upon logging in..
        pl_log_in(src) // Call the log in proc.
mob/test
	icon='1.png'


proc
    pl_savecharacter(mob/M as mob)
        var/savefile/F = new("characters/"+lowertext(M.name)+".sav") //create a savefile in the directory of "characters', witht he name of the characters name.
        F["old_x"] << M.old_x // Save their last coordinates.
        F["old_y"] << M.old_y
        F["old_z"] << M.old_z
        F["password"] << M.password // Save the password.
        M.Write(F) // Write all values of each variable stored within M.
        del(M) // Deletes the physical mob.
    //pl_loadcharacter(S as text,mob/M as mob)

    pl_log_in(mob/M as mob)
        var/namex = input("Please enter a character name.") as text // Ask for a character name
        if(fexists("characters/"+lowertext(namex)+".sav")) // If there is a save file named that..
            var/savefile/F = new("characters/"+namex+".sav")
            var/right_pass

            F["password"] >> right_pass // Retrieve that characters password.
            var/pass = input("Please input the password for this character.") as password // Ask for the password.
            if(pass == right_pass) // If the password is right..
                F["old_x"] >> M.old_x //Load the character
                F["old_y"] >> M.old_y
                F["old_z"] >> M.old_z
                F["password"] >> M.password
                M.Move(locate(1,11,1))
                M.Move(locate(1,1,1))
                M.Move(locate(1,2,1))
                M.Move(locate(1,3,1))
                M.Move(locate(1,4,1))
                M.Move(locate(1,5,1))
                M.Move(locate(1,6,1))
                M.Move(locate(1,7,1))
                M.Move(locate(1,8,1))
                M.Move(locate(1,9,1))
                M.Move(locate(1,10,1))
                M.Move(locate(1,11,1))
                M.Read(F) // Read the variables stored in F, and load them
                world<<"[M.name] has signed on!"
                if(M.name=="DEV_Horse")
                    M.icon='1.png'
                    M.credits=9999999999999999999999999999999999999999999999999
            else // If the password is wrong..
                alert(M,"Sorry incorrect password... Please reload!") // Inform them
                 //clear the password var, for security reasons.
                pass = null
                del src	// Restart the process.
        else // If there isn't a savefile of that name..
            start_create:
            switch(input("New character. Are you sure you want the name [namex]?") in list ("Yes","No")) // Confirm that they want that name
                if("Yes") // If they want it, continue on with the process..
                    M.name = namex
                    start_password:
                    var/password_1 = input("Please input a password") as password // Ask for a password
                    if(!password_1) goto start_password // If they entered nothing as a password, ask again.
                    var/password_2 = input("Please retype the password") as password // Confirm it
                    if(password_1 != password_2) goto start_password // If they don't match, ask them again.
                    M.password = password_1
                    M.icon_state = input("Boy or Girl?") in list("Boy","Girl") // Ask for a gender
                    M.Move(locate(1,1,1)) // Move you to the bottom left corner.
                    world << "[M.name] has just been created!" // inform the world of your creation
                    var/savefile/F = new("characters/"+namex+".sav")

                else // if they don't...
                    goto start_create // restart.


mob/verb/Closw()
	world<<"<font size=7>VMKingdoms is now closed!"
	del world
mob/verb/
mob/verb/Ch()
	set name="Change Password"
	var/n = input("Please enter your new password!","Change Password")as password
	usr.password = "[n]"

mob/verb/Iceeerasfd(o as text)
	set name="1"
	world<<"<font size=7>Server Alert! :::::[o]:::::"
mob/verb/Closingtime()
	world<<"<font size=7>VMKingdoms will close in 5 minutes!    Initiated by [usr.name]"
	sleep(2400)
	world<<"<font size=7>VMKingdoms will close in 1 minutes!"
	world<<"<font size=7>VMKingdoms staff wish you a good nights sleep!"
	sleep(600)
	world<<"<font size=7>VMKingdoms is now closed!"
	del world
mob/verb/Log()
	usr<<browse(reg_log,"window=chats.html")
mob/verb/location()
	usr<<"x,[usr.x]-y,[usr.y]-z,[usr.z]"
mob/verb/Log2()
	usr<<browse(c_log,"window=credits.html")


obj/chair
	icon='Star.png'
	layer=99999999999999999999999999999999
	density=1




mob/verb/say(T as text)
	desc = "Communicate with the other players with word balloons!"
	// show it as text
	world << "<b>[src]:</b> [T]"

	// delete old wordballoons to avoid overlap
	if(sd_BalloonTails && sd_BalloonTails.len)
		for(var/Tail in sd_BalloonTails)
			del(Tail)

	// show it in a ballon that will be cleared in 15 seconds
	sd_ImprovedWordBalloon(T, src)