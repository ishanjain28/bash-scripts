#!/bin/bash

#A simple script to change your screen temperature according to time.
#Uses redshift to change Temperature and notify-send to show Notification.

#get current hour
current_time_hour="`date +%H`";

#execute a command to check if redshift is installed
#silenced the output and stored the exit code in a variable c. success > 0. Fail > 1
dpkg -s redshift > /dev/null 2>&1 && c=$?; $(exit $c) || c=$?; $(exit $c)

#checks if c = 0; and then sets the temperature accordingly. Used the temerperatures of lights which I usually use.
if [ $c -eq 0 ]; then 
	if [ $current_time_hour -ge 22 ] || [ $current_time_hour -le 5 ]; then
		redshift -O 4000
		notify-send "Redshift Active" "Redshift Active and Temperature set at 4000"
		elif [ $current_time_hour -ge 20 ]; then
			redshift -O 4500
			notify-send "Redshift Active" "Redshift Active and Temperature set at 4500"
			elif [ $current_time_hour -ge 19 ]; then
				redshift -O 5000
				notify-send "Redshift Active" "Redshift Active and Temperature set at 5000"
				elif [ $current_time_hour -ge 18 ]; then
					redshift -O 5500
					notify-send "Redshift Active" "Redshift Active and Temperature set at 5500"
					elif [ $current_time_hour -ge 6 ]; then
						redshift -O 6000
						notify-send "Redshift Active" "Redshift Active and Temperature set at 6000"
	fi	
#if redshift is missing then this executes a apt-get to install redshift. Password might be required to install redshift.
	else
		echo "Redshift is missing.  Install redshift first.";
		sudo apt-get install redshift
		if [ $current_time_hour -ge 22 ] || [ $current_time_hour -le 5 ]; then
			redshift -O 4000
			notify-send "Redshift Active" "Redshift Active and Temperature set at 4000"
			elif [ $current_time_hour -ge 20 ]; then
				redshift -O 4500
				notify-send "Redshift Active" "Redshift Active and Temperature set at 4500"
				elif [ $current_time_hour -ge 19 ]; then
					redshift -O 5000
					notify-send "Redshift Active" "Redshift Active and Temperature set at 5000"
					elif [ $current_time_hour -ge 18 ]; then
						redshift -O 5500
						notify-send "Redshift Active" "Redshift Active and Temperature set at 5500"
						elif [ $current_time_hour -ge 6 ]; then
							redshift -O 6000
							notify-send "Redshift Active" "Redshift Active and Temperature set at 6000"
		fi	

fi