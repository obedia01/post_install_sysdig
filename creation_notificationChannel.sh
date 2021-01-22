TEAMID=$1
IBM_REGION=$2
GUID=$3
AUTH_TOKEN=$4

sed -i "s/@_TEAMID_@/$TEAMID/g" notificationChannel.json
curl -k -X POST https://$IBM_REGION.monitoring.cloud.ibm.com/api/notificationChannels -H 'Authorization: Bearer '$AUTH_TOKEN -H 'Content-Type: application/json' -H 'IBMInstanceID: '$GUID -d @notificationChannel.json
