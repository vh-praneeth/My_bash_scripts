#!/bin/bash

# conservation mode is a mode in Lenovo Ideapad laptops which will lock the battery charging between 55 and 60%
# after reaching that range, power will be used to run the laptop but not to charge the battery
# then battery percentage will remain constant

# To enable battery conservation mode 
# setcharging 1

# To disable it
# setcharging 0

# Default is enabled
function setcharging() {
  echo ${1:-1}  | sudo tee /sys/bus/platform/drivers/ideapad_acpi/VPC2004\:00/conservation_mode

  #cat /sys/bus/platform/drivers/ideapad_acpi/VPC2004\:00/conservation_mode
}

echo "0 is off. 1 is on"

if [[ "$1" == *"f"* ]]; then
	setcharging 0
else
	setcharging 1
fi

