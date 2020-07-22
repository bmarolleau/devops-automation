export CRN="crn:v1:bluemix:public:power-iaas:us-south:a/45d319a4b25971b53b40137d095ab213:f0f71cbe-7997-4924-8321-7f876a494973::"
#BEARER=$(ibmcloud iam oauth-tokens --output json | jq ."iam_token" | sed "s/"//g")
export BEARER=""

export INSTANCE_ID="f0f71cbe-7997-4924-8321-7f876a494973"
export REGION="us-south"
SERVERNAME="arcad"
IMAGE_ID="968e8508-5df8-4ed4-92b8-f8ebb216ee33"
PROCESSORS=0.25
PROC_TYPE="shared"
MEMORY=2
NETWORKIDS='"e57dde10-6c72-45e1-953e-3dc29cff2268","eed23d18-99f1-4821-9e95-5e4ba595af8d"'

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
