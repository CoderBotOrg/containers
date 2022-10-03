curl http://192.168.27.1:8080/status
curl http://192.168.27.1:8080/scan
curl -w "\n" -d '{"ssid":"Vodafone-kanaha", "psk":"Catoblepa1catoblepa"}' -H "Content-Type: application/json" -X POST localhost:8080/connect