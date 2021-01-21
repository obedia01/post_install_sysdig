INSTANCE_NAME=$1
ibmcloud resource service-instance $INSTANCE_NAME --output json | jq -r '.[].guid'
