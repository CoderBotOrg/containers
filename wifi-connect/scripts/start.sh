#!/usr/bin/env bash

export DBUS_SYSTEM_BUS_ADDRESS=unix:path=/host/run/dbus/system_bus_socket

# Optional step - it takes couple of seconds (or longer) to establish a WiFi connection
# sometimes. In this case, following checks will fail and wifi-connect
# will be launched even if the device will be able to connect to a WiFi network.
# If this is your case, you can wait for a while and then check for the connection.
# sleep 15

# Choose a condition for running WiFi Connect according to your use case:

# 1. Is there a default gateway?
# ip route | grep default

# 2. Is there Internet connectivity?
# nmcli -t g | grep full

# 3. Is there Internet connectivity via a google ping?
# wget --spider http://google.com 2>&1
PORTAL_SSID=CoderBot_$(cat /sys/class/net/wlan0/address|awk '{print substr($1,1,2) substr($1,4,2)}')

printf "Starting Access Point portal $PORTAL_SSID\n"
./wifi-connect --portal-ssid $PORTAL_SSID

sleep infinity