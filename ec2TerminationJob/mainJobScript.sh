
#!/bin/bash

echo "********** EC2 state change job triggered *************"
echo "Instance Id: $1 "
echo "Instance state: $2"

case $2 in
"start")
echo "Starting the instance as per parameter"
echo aws ec2 start-instances --instance-id $1 --region ap-south-1 --dry-run

;;
"stop" | "Stop")
echo "stoping the instance as per parameter"
echo aws ec2 stop-instances --instance-id $1 --region ap-south-1 --dry-run

;;

"terminate" | "Terminate")
echo "Terminating the instance as per parameter"
echo aws ec2 terminate-instances --instance-id $1 --region ap-south-1 --dry-run

;;
*)
echo "unknow state"
;;
esac
echo "************  Job ends                ***************"
