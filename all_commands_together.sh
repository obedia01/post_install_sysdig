ENV=$1
TOKEN_SYSDIG_TOPIC=$2

if [ -f "notificationChannel.json" ]; then
	rm notificationChannel.json;echo "Fichier notificationChannel supprimé" 
fi
sed "s/@_TOKEN_SYSDIG_TOPIC_@/$TOKEN_SYSDIG_TOPIC/g" notificationChannel_$ENV.json > notificationChannel.json


APIKEY=$3

GUID=$4

AUTH_TOKEN=$(curl -g -k -X POST 'https://iam.cloud.ibm.com/identity/token' -H 'Content-Type: application/x-www-form-urlencoded' -H 'Accept:application/json' -d 'grant_type=urn:ibm:params:oauth:grant-type:apikey' -d 'apikey='$APIKEY | jq -j '.access_token')

IBM_REGION=$5

curl -g -k -X POST https://$IBM_REGION.monitoring.cloud.ibm.com/api/teams -H 'Authorization: Bearer '$AUTH_TOKEN  -H 'IBMInstanceID: '$GUID   -H 'Content-Type: application/json' -d @team_OPS.json
curl -g -k -X POST https://$IBM_REGION.monitoring.cloud.ibm.com/api/teams -H 'Authorization: Bearer '$AUTH_TOKEN  -H 'IBMInstanceID: '$GUID   -H 'Content-Type: application/json' -d @team_DEV.json
curl -g -k -X POST https://$IBM_REGION.monitoring.cloud.ibm.com/api/teams -H 'Authorization: Bearer '$AUTH_TOKEN  -H 'IBMInstanceID: '$GUID   -H 'Content-Type: application/json' -d @team_BP2I.json

TEAMID=$(curl -g -k -X GET https://$IBM_REGION.monitoring.cloud.ibm.com/api/teams -H 'Authorization: Bearer '$AUTH_TOKEN -H 'IBMInstanceID: '$GUID -H 'Content-Type: application/json' | jq -c -S ".teams["0"].id")

sed -i "s/@_TEAMID_@/$TEAMID/g" notificationChannel.json
curl -g -k -X POST https://$IBM_REGION.monitoring.cloud.ibm.com/api/notificationChannels -H 'Authorization: Bearer '$AUTH_TOKEN -H 'Content-Type: application/json' -H 'IBMInstanceID: '$GUID -d @notificationChannel.json
