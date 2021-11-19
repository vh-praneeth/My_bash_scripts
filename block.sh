#!/bin/bash

# script used to block a website
# Usage: sh block.sh website.com

exit  # please don't use without having update_hosts.sh file

if [ -z "$1" ]
then
	echo String empty
else
	cd /etc ;
	sudo sh -c " echo '0.0.0.0 $1' >>  ./hosts.d/hosts_manual";
	sudo sh -c " echo '0.0.0.0 $1' >>  ./hosts";
	#./refresh_dns.sh
	sudo sudo ./update_hosts.sh
	cd ~/
	echo Blocked
fi