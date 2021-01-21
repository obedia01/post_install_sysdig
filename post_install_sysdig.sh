INSTANCE_NAME=exp-cloud-monitoring
GUID=$(./get_ibm_instance_id.sh $INSTANCE_NAME)

echo INSTANCE_NAME:$INSTANCE_NAME
echo GUID:$GUID

APIKEY=$1
AUTH_TOKEN=$(./get_iam_token.sh $APIKEY)

echo APIKEY:$APIKEY
echo AUTH_TOKEN:$AUTH_TOKEN
