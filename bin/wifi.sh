curl http://192.168.27.1:8080/status
curl http://192.168.27.1:8080/scan
curl -w "\n" -d '{"ssid":"Vodafone-kanaha", "psk":"Catoblepa1catoblepa"}' -H "Content-Type: application/json" -X POST localhost:8080/connect

# networks
curl -X GET http://coderbot.local/wifi/networks

# connect
curl -X POST http://coderbot.local/wifi/connect -H "Content-Type: application/x-www-form-urlencoded" -d "ssid=Vodafone-kanaha&passphrase=Catoblepa1catoblepa&identity="

# disconnect
curl -X POST http://coderbot.local/wifi/disconnect -H "Content-Type: application/x-www-form-urlencoded" -d "ssid=Vodafone-kanaha"

curl -X POST http://coderbot.local/wifi/connect -H "Content-Type: application/x-www-form-urlencoded" -d "ssid=kanaha-mobi&passphrase=catoblepa&identity="

curl -X POST http://coderbot.local/wifi/connect -H "Content-Type: application/x-www-form-urlencoded" -d "ssid=kanaha-mobi&passphrase=catoblepa&identity="
curl -X POST http://coderbot.local/wifi/disconnect -H "Content-Type: application/x-www-form-urlencoded" -d "ssid=kanaha-mobi"
