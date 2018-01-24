#!/bin/bash
#title           :entrypoint.sh
#description     :This script will start neo-cli in the background use screen
#author		       :Carolusian <https://github.com/carolusian>
#date            :20171227
#version         :0.1    
#usage		       :bash entrypoint.sh
#==============================================================================
screen -dmS neo expect /start_cli.sh /opt/wallets/neo-wallet.dat $NEO_WALLET_PASSWORD

while :
do
    if ! screen -list | grep -q "neo"; then 
       # run bash script
        echo "NEO client is NOT running ..."
        break
    fi
    echo "NEO client is running ..."

    test $? -gt 128 && break
    sleep 10s
done
