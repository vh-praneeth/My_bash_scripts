
#!/bin/bash
# turn off screen - https://forums.linuxmint.com/viewtopic.php?t=275007
xset dpms force off

sudo modprobe uvcvideo -r  # disable camera from device
#pactl set-source-mute 1 1  # mute mic
sudo modprobe btusb -r  # disable bluetooth from device
sudo mount -t ntfs /dev/sda6 /media/Praneeth  # mount Praneeth drive
#conservation_mode
amixer set Master mute  # mute speakers and mic

wmctrl -s 1  # switch to next workspace, the open files
sleep 3

cd ~/Desktop/

gedit ./Tasks.txt &  # TODO list
sleep 1

# switch to first tab of all txt files
xte "sleep 3" "keydown Alt_L" "key 1" "keyup Alt_L" "sleep 1"
wmctrl -s 0  # open all files, switch to prev workspace

google-chrome &
sleep 30
# Open Gmail
google-chrome https://mail.google.com/mail/u/1/#inbox

# stop unused programs to save memory (RAM)
killall -9 gnome-software csd-printer
sleep 20m
killall -9 gnome-software
sleep 40m
killall -9 mintUpdate

# apt update && apt upgrade  # install updates

