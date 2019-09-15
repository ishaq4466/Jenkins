#!/bin/bash
export JENKINS_HOME="/home/jenkins/"

# Creating an rsync link between jenkins home to s3 data bucket folder
# can be added to cron job
# aws s3 sync $JENKIN_HOME/data/ s3://reimagine2019/data/jenkins --delete --dryrun --region ap-south-1 >> /dev/null


if [ -f $JENKIN_HOME/jenkinsData.zip ]
then
	sudo rm -f $JENKIN_HOME/jenkinsData.zip
	echo "zip delete"
	sudo zip -r $JENKIN_HOME/jenkinsData.zip $JENKIN_HOME/data/ >> /dev/null
	echo "backup created"
fi













