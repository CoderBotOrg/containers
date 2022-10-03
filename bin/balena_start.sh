#!/bin/sh
balena-engine run -d --name pigpio --network host --privileged --restart unless-stopped coderbot/alpine-pigpiod:arm32v7
balena-engine run -d \
--name backend \
--network host \
--privileged --restart unless-stopped \
-v /mnt/data/coderbot/data:/coderbot/data \
-v /mnt/data/coderbot/logs:/coderbot/logs \
-v pulse:/run/pulse \
ghcr.io/coderbotorg/containers/backend:latest
balena-engine run -d \
--name frontend \
--network host --privileged \
--restart unless-stopped \
ghcr.io/coderbotorg/containers/frontend:latest
balena-engine run -d \
--name wifi \
--network host \
--privileged --restart unless-stopped \
--mount type=bind,source=/run/dbus,target=/host/run/dbus \
-e DBUS_SYSTEM_BUS_ADDRESS="unix:path=/host/run/dbus/system_bus_socket" \
-e PORTAL_LISTENING_PORT=8080 \
--cap-add NET_ADMIN coderbot/wifi-connect:4.4.6
balena-engine run -d --name audio \
--privileged --restart unless-stopped \
-v pulse:/run/pulse \
bh.cr/balenablocks/audio-rpi
