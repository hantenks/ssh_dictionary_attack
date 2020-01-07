#!/usr/bin/expect -f
set arg1 [lindex $argv 0]  #The password
set arg2 [lindex $argv 1]  #The ith iteration, initial certi cases considered
set timeout 5              #can increase it - default is 10
spawn ssh hantenks@172.16.114.175

if { $arg2 == 0} {
    set timeout 1
    expect "\)\?"  { send "yes\r" }   #certi, rsa-key
    set timeout 5
}
expect "password:" { send "$arg1\r" }  #send the password
expect "again." { exit }             #if password wrong
interact

