#!/bin/bash

echo "Choose what you want to install. Enter your choices seperated by space(eg. 1 2 3)";
echo "1) Screen Temperature";
read ch1;

if [ $ch1 -eq 1 ]; then
    mkdir /usr/local/bin/bash-scripts
    cp screen_temp.sh /usr/local/bin/bash-scripts
    while true; do
    bash /usr/local/bin/bash-scripts/screen_temp.sh &
    sleep 3600
    done
fi
    
