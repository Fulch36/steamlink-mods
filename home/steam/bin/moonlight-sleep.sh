#!/bin/sh

# Moonlight running flag
ML_RUNNING=0

while true; do
	if ((pgrep moonlight > /dev/null))
	then
		ML_RUNNING=1
	elif !((pgrep moonlight > /dev/null)) && [ $ML_RUNNING -eq "1" ]
	then
		ML_RUNNING=0
		dbus-send --system --print-reply --dest=system.powermanager /powermanager system.powermanager.Sleep > /dev/null
	fi
	sleep 10
done

