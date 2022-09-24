#!/bin/sh
balena-engine run -d --name pigpio --network host --privileged --restart unless-stopped coderbot/alpine-pigpiod:arm32v7
balena-engine run -d --name backend --network host --privileged --restart unless-stopped ghcr.io/coderbotorg/containers/backend:latest
balena-engine run -d --name frontend --network host --privileged --restart unless-stopped ghcr.io/coderbotorg/containers/frontend:latest
balena-engine run -d --name wifi --network host --privileged --restart unless-stopped --mount type=bind,source=/run/dbus,target=/host/run/dbus -e DBUS_SYSTEM_BUS_ADDRESS="unix:path=/host/run/dbus/system_bus_socket" -e PORTAL_LISTENING_PORT=8080 --cap-add NET_ADMIN coderbot/wifi-connect:4.4.6


curl -X DELETE \
"https://api.balena-cloud.com/v6/release?\$filter=belongs_to__application%20eq%201967944%20and%20commit%20eq%20'582503119fd8f7d9f0bb3e102dd7909b'&\$select=id" \
-H "Content-Type: application/json" \
-H "Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjU2MTM3LCJ1c2VybmFtZSI6ImdoX3ByZXZpIiwiZW1haWwiOiIiLCJjcmVhdGVkX2F0IjoiMjAyMi0wOS0xN1QyMzozMjowOS4wMTJaIiwiand0X3NlY3JldCI6IkxUUlBDUTM0VFRDWVJUQ0RBS1VISlNESDdEQVRMQUNWIiwiaGFzX2Rpc2FibGVkX25ld3NsZXR0ZXIiOnRydWUsImZpcnN0X25hbWUiOiJSb2JlcnRvIiwibGFzdF9uYW1lIjoiUHJldml0ZXJhIiwiYWNjb3VudF90eXBlIjoicGVyc29uYWwiLCJzb2NpYWxfc2VydmljZV9hY2NvdW50IjpbeyJwcm92aWRlciI6ImdpdGh1YiIsImRpc3BsYXlfbmFtZSI6InByZXZpIn1dLCJjb21wYW55IjoiQ29kZXJCb3QiLCJoYXNQYXNzd29yZFNldCI6ZmFsc2UsInB1YmxpY19rZXkiOmZhbHNlLCJmZWF0dXJlcyI6W10sImludGVyY29tVXNlck5hbWUiOiJnaF9wcmV2aSIsImludGVyY29tVXNlckhhc2giOiJjMzQ1ODcwNDA4MjcwZjAxM2M2MmY3NDE5Mzg1NmM3NDkxZjE1MThlYzk1MjFiNmIyN2QzYmIwZTM5MjhmMGM4IiwicGVybWlzc2lvbnMiOltdLCJhdXRoVGltZSI6MTY2MzQ5MDAzMTUxNSwiaXNfdmVyaWZpZWQiOnRydWUsIm11c3RfYmVfdmVyaWZpZWQiOnRydWUsImFjdG9yIjoxMTgyOTE5MywiaWF0IjoxNjYzNzEyNjA4LCJleHAiOjE2NjQzMTc0MDh9.uUUqpQGlxWWXTT0LljyW7c3cTOHS62KxTeOfEs7t75o" 