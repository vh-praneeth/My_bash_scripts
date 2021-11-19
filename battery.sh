#!/bin/bash

# script to charge laptop till it reaches a specified value

clear
echo 'turning off conservation_mode'
conservation_mode off
resize -s 30 29 > /dev/null
xdotool getactivewindow windowmove 0 325

echo 'Battery reminder - started'

battery_status="`cat /sys/class/power_supply/BAT0/status`"

high=${1:-90}  # $1 or default 90 - https://coderwall.com/p/s8n9qa/default-parameter-value-in-bash
low=${2:-54}
# low=54
#high=90


if [ "$battery_status" == "Discharging" ] ; then
	echo 'Currently discharging'
	echo 'Reminder enabled for' $((low))%
	text="<span size='xx-large'> Battery low </span>"
	while [ 1 ] ; do
		sleep 5m
		battery_level=`cat /sys/class/power_supply/BAT0/capacity`
		if [ "$battery_level" -le $low ] ; then
			play /home/praneeth/files/sounds/warning.wav 2> /dev/null
		    #notify-send "Battery low" "Battery level is ${battery_level}%!"
		    zenity --info --width=200 --title="Turn on charging" --text="$text" ;
			sleep 5m
		    ./$(basename $0) && exit
		fi
	done
fi


if [ "$battery_status" == "Charging" ] ; then
	echo 'Currently charging'
	echo 'Reminder enabled for' $((high))%
	text="<span size='xx-large'> Battery full </span>"
	while [ 1 ] ; do
		sleep 5m
		battery_level=`cat /sys/class/power_supply/BAT0/capacity`
		if [ "$battery_level" -ge $high ] ; then

			conservation_mode on
			
			play /home/praneeth/files/sounds/warning.wav 2> /dev/null ;
		    #notify-send "Battery full" "Battery level is ${battery_level}%!"
		    zenity --info --width=200 --title="Turn off charging" --text="$text" ;
			sleep 5m
		    # ./$($0) && exit
		    exit
		fi
	done
fi


if [ "$battery_status" == "Unknown" ] ; then
	echo 'Error: battery_status Unknown'
fi

: '
References:
Restart script from inside script - https://askubuntu.com/questions/356800/how-to-completely-restart-script-from-inside-the-script-itself
'


