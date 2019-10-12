#!/bin/bash

echo "********** EC2 state change job triggered *************"
region=ap-south-1
echo "Instance Id: $1 "
echo "Instance state: $2"
echo "region: $region"

case $2 in
"start")
echo "Starting the instance as per parameter"
echo aws ec2 start-instances --instance-id $1 --region $region --dry-run

;;
"stop" | "Stop")
echo "stoping the instance as per parameter"
aws ec2 stop-instances --instance-id $1 --region $region
;;

"terminate" | "Terminate")
echo "Terminating the instance as per parameter"
echo aws ec2 terminate-instances --instance-id $1 --region $region --dry-run

;;
*)
echo "unknow state"
;;
esac
echo "************  Job ends                ***************"
