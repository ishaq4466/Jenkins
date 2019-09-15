#!/bin/bash

docker build -t jenkins-master .

echo "admin" | docker secret create jenkins-user -
echo "admin" | docker secret create jenkins-pass -

# docker run -itd -u 0 -p 8080:8080 -p 50000:50000 -v "$PWD/jenkins-data":/var/jenkins_home --name j1 jenkins-master
docker run -itd -p 8080:8080 -p 50000:50000 --name j1 jenkins-master



# docker stack deploy -c jenkins.yml jenkins

if [ "$1" == "clean" ]
then 
	docker stack rm jenkins
	docker secret rm jenkins-user
	docker secret rm jenkins-pass
fi