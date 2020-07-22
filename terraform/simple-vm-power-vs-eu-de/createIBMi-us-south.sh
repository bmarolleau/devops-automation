export CRN="crn:v1:bluemix:public:power-iaas:us-south:a/45d319a4b25971b53b40137d095ab213:f0f71cbe-7997-4924-8321-7f876a494973::"
#BEARER=$(ibmcloud iam oauth-tokens --output json | jq ."iam_token" | sed "s/"//g")
export BEARER="eyJraWQiOiIyMDIwMDIyNTE4MjgiLCJhbGciOiJSUzI1NiJ9.eyJpYW1faWQiOiJJQk1pZC0wNjAwMDFNWFU5IiwiaWQiOiJJQk1pZC0wNjAwMDFNWFU5IiwicmVhbG1pZCI6IklCTWlkIiwiaWRlbnRpZmllciI6IjA2MDAwMU1YVTkiLCJnaXZlbl9uYW1lIjoiQkVOT0lUIiwiZmFtaWx5X25hbWUiOiJNQVJPTExFQVUiLCJuYW1lIjoiQkVOT0lUIE1BUk9MTEVBVSIsImVtYWlsIjoiYmVub2l0Lm1hcm9sbGVhdUBmci5pYm0uY29tIiwic3ViIjoiYmVub2l0Lm1hcm9sbGVhdUBmci5pYm0uY29tIiwiYWNjb3VudCI6eyJ2YWxpZCI6dHJ1ZSwiYnNzIjoiNDVkMzE5YTRiMjU5NzFiNTNiNDAxMzdkMDk1YWIyMTMiLCJpbXNfdXNlcl9pZCI6Ijc5NzIxMjgiLCJpbXMiOiIyMDE0ODU2In0sImlhdCI6MTU4NDQ3MzY1OCwiZXhwIjoxNTg0NDc3MjU4LCJpc3MiOiJodHRwczovL2lhbS5jbG91ZC5pYm0uY29tL2lkZW50aXR5IiwiZ3JhbnRfdHlwZSI6InVybjppYm06cGFyYW1zOm9hdXRoOmdyYW50LXR5cGU6YXBpa2V5Iiwic2NvcGUiOiJpYm0gb3BlbmlkIiwiY2xpZW50X2lkIjoiYngiLCJhY3IiOjEsImFtciI6WyJwd2QiXX0.SFcgaF3_pnL3394Y3m8czlyq6QtF11V2wyq3sPG25QatKtvU-iuBHgJ7d9_WJZDfPC-WvalBLSxBmX2ZFodPGhZgLbFBeHhZjHMfH7DrOLKEDWslY4HuBJAe3rUaXqvWSOZxZu0fsF12BV4UMeMuXCF-26jKA5STZGl6UgrrsSgZvdgncatHb0EUcXSo-QA27ghIKs1XFAzEIx_DtaEhiUsuWuIwecI2ZJXHyqO1tVc3dHYYMmQ2n14pQRCU8lTJwSZEf5pQgsKNEDZbbIYCeAjTh83lD-02fZEaP9zLJ9M2dTZXyxq2cSbWiQoj5qHv6Txa0yqtzdv8jzaSuagklQ"

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
