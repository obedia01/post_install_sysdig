IBM_REGION=$1
GUID=$2
AUTH_TOKEN=$3
curl -k -X GET https://$IBM_REGION.monitoring.cloud.ibm.com/api/teams -H 'Authorization: Bearer '$AUTH_TOKEN -H 'IBMInstanceID: '$GUID -H 'Content-Type: application/json' | jq -c -S ".teams["0"].id"
