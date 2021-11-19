#!/bin/bash

# a script to connect to your phone using ADB, turn on screen, unlock it so you can use directly

adb connect 192.168.1.3  # connect to phone

adb shell input keyevent KEYCODE_WAKEUP  # turn on screen
sleep 0
# slide bottom to top to unlock (assuming there is no password protection)
adb shell input touchscreen swipe 10 250  10 10  50