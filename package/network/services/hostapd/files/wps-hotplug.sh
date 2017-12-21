#!/bin/sh

if [ "$ACTION" = "pressed" -a "$BUTTON" = "wps" ]; then
	logger "WPS button pressed, looking for active radios"
#	echo "255" > /sys/class/leds/r7800:amber:power/brightness
	cd /var/run/hostapd
	for socket in *; do
		[ -S "$socket" ] || continue
		logger "WPS activated for: $socket"
		hostapd_cli -i "$socket" wps_pbc
	done
#	sleep 120
#	echo "0" > /sys/class/leds/r7800:amber:power/brightness
fi

return 0
