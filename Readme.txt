Created by hantenks.
The scripts are created only for educational purposes.
This is a bash dictionary based brute force ssh attack script.
requirements
[please give the scripts chmod access; eg. chmod +777 file_name.sh] file_name={main.sh,interface.sh} 
i)a linux terminal or cygwin(in case of Windows OS)
ii)expect script is used to attack "interactively" so install it:
   Fedora users(It's directly available from Fedora repository):
              sudo yum install expect
   Ubuntu Users(I haven't tried it but I am pretty much sure this will be in the repository too):
             sudo apt-get install expect
iii)The passwords you want to be tried against a server ip need to be in the file "list.txt" 
    Passwords on each line is treated as unique and are used as if not encountered before, so it's your responsibility to avoid repitition 
    before putting them in "list.txt"
iv)"interface.sh" has the default ip as 172.16.114.204 [change it accordingly to the server you want to attack]
v)the default username is used as "hantenks" change it as you please [change to "root" for super priviledges]
vi)After the attack is over the password is stored in "password.txt" : Result
   a)if a match has occured it will appear in the terminal message as well as in the "password.txt"
   b)If no match is found from the "list.txt" the "password.txt" file will be empty
   c)MOST IMPORTANLY: whenever you want to re-attack after a long time or attack a new server altogether, DELETE the "password.txt" or make it empty.
     otherwise on executing the scripts, It will always show that it took 0 tries as the script thinks password.txt is non-empty hence, It has already evaluated/attacked the server and successfully generated a match, and decides not to re-attack again.

Thank You!
Cheers

 
