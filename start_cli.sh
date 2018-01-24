#!/usr/bin/expect -f
#title           :start_cli.sh
#description     :This script will start neo-cli with expect command
#author		       :Carolusian <https://github.com/carolusian>
#date            :20171227
#version         :0.1    
#usage		       :./start_cli.sh
#==============================================================================

set dnpath /opt/neo-cli
cd $dnpath

set wallet [lindex $argv 0]
set password [lindex $argv 1]

spawn dotnet neo-cli.dll /rpc
expect "neo>"
send "open wallet $wallet\n"
expect "password:"
send "$password\n"
expect "neo>"
# send "start consensus\n"
# expect "OnStart"

interact
