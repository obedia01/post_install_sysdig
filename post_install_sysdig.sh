INSTANCE_NAME=exp-cloud-monitoring
GUID=$(./get_ibm_instance_id.sh $INSTANCE_NAME)

echo INSTANCE_NAME:$INSTANCE_NAME
echo GUID:$GUID

APIKEY=$1
AUTH_TOKEN=$(./get_iam_token.sh $APIKEY)

echo APIKEY:$APIKEY
echo AUTH_TOKEN:$AUTH_TOKEN

IBM_REGION=$2
./create_sysdig_team.sh team_OPS.json $IBM_REGION $GUID $AUTH_TOKEN
