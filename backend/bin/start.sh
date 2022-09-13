#!/bin/sh
sudo docker run -dp 80:5000 --name pigpio --privileged --restart unless-stopped coderbot/alpine-pigpiod:arm32v7
sudo docker run -d --name backend --network container:pigpio --privileged --restart unless-stopped coderbot/coderbot:balena-arm7