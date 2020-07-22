export CRN="crn:v1:bluemix:public:power-iaas:eu-de-1:a/45d319a4b25971b53b40137d095ab213:f83b6038-b9a7-42a6-9500-6d458bbdd11e::"
#BEARER=$(ibmcloud iam oauth-tokens --output json | jq ."iam_token" | sed "s/"//g")
export BEARER=""

export INSTANCE_ID="f83b6038-b9a7-42a6-9500-6d458bbdd11e"
export REGION="eu-de"
SERVERNAME="ibmiqa1"
IMAGE_ID="d8b5dff9-973b-4107-83d5-a705076ff6f0"
PROCESSORS=0.25
PROC_TYPE="shared"
MEMORY=2
NETWORKIDS='"3ea919be-e1c5-4fac-a629-fdb5c2f311f4"'
# public-192_168_131_160-29-VLAN_2048
generate_post_data()
{
  cat <<EOF
{
        "serverName":"$SERVERNAME",
        "imageID": "$IMAGE_ID",
        "processors": $PROCESSORS,
        "procType": "$PROC_TYPE",
        "memory": $MEMORY,
        "networkIDs": [$NETWORKIDS]
}
EOF
}
echo $(generate_post_data)
curl -X POST \
  https://${REGION}.power-iaas.cloud.ibm.com/pcloud/v1/cloud-instances/${INSTANCE_ID}/pvm-instances \
  -H "Authorization: Bearer ${BEARER}" \
  -H "CRN: ${CRN}" \
  -H "Content-Type: application/json" \
  --data "$(generate_post_data)" 
