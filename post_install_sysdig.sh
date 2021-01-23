APIKEY=$1
echo APIKEY:$APIKEY

GUID=$2
echo GUID:$GUID

AUTH_TOKEN=$(./get_iam_token.sh $APIKEY)

echo AUTH_TOKEN:$AUTH_TOKEN

IBM_REGION=$3
echo IBM_REGION:$IBM_REGION

./create_sysdig_team.sh team_OPS.json $IBM_REGION $GUID $AUTH_TOKEN
./create_sysdig_team.sh team_DEV.json $IBM_REGION $GUID $AUTH_TOKEN
./create_sysdig_team.sh team_BP2I.json $IBM_REGION $GUID $AUTH_TOKEN

TEAMID=$(./get_team_monitor_operations_id.sh $IBM_REGION $GUID $AUTH_TOKEN)
echo TEAMID:$TEAMID

./creation_notificationChannel.sh $TEAMID $IBM_REGION $GUID $AUTH_TOKEN
