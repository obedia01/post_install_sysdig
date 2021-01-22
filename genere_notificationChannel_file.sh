ENV=$1
TOKEN_SYSDIG_TOPIC=$2

echo ENV:$ENV
echo TOKEN_SYSDIG_TOPIC:$TOKEN_SYSDIG_TOPIC

if [ -f "notificationChannel.json" ]; then
	rm notificationChannel.json;echo "Fichier notificationChannel supprimé" 
fi
sed "s/@_TOKEN_SYSDIG_TOPIC_@/$TOKEN_SYSDIG_TOPIC/g" notificationChannel_$ENV.json > notificationChannel.json
