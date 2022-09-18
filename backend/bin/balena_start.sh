#!/bin/sh
balena-engine run -d --name pigpio --network host --privileged --restart unless-stopped coderbot/alpine-pigpiod:arm32v7
balena-engine run -d --name backend --network host --privileged --restart unless-stopped ghcr.io/coderbotorg/containers/backend:latest
balena-engine run -d --name frontend --network host --privileged --restart unless-stopped ghcr.io/coderbotorg/containers/frontend:latest
balena-engine run -d --name wifi --network host --privileged  --restart unless-stopped -v $(pwd)/wificfg.json:/cfg/wificfg.json -v /etc/wpa_supplican
t/wpa_supplicant.conf:/etc/wpa_supplicant/wpa_supplicant.conf coderbot/txwifi:latest
