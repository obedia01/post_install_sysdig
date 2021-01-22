TEAM_FILE=$1
IBM_REGION=$2
GUID=$3
AUTH_TOKEN=$4
curl -k -X POST https://$IBM_REGION.monitoring.cloud.ibm.com/api/teams -H 'Authorization: Bearer '$AUTH_TOKEN  -H 'IBMInstanceID: '$GUID   -H 'Content-Type: application/json' -d @$TEAM_FILE
