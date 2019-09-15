#!/bin/bash

if [ "$1" == "deploy" ]
then

	echo "Building the image"

	docker build -t jenkins-master .

	echo "Create secrets....."
	# docker swarm init
	echo "admin" | docker secret create jenkins-user -
	echo "admin" | docker secret create jenkins-pass -
	echo "Running the stack...."
	# docker run -itd -u 0 -p 8080:8080 -p 50000:50000 -v "$HOME/jenkins-data":/var/jenkins_home --name j1 jenkins-master
	# docker run -itd -p 8080:8080 -p 50000:50000 --name j1 jenkins-master
	docker stack deploy -c jenkins.yml jenkins
fi

if [ "$1" == "clean" ]
then 
	echo "cleaning all stacks"
	docker stack rm jenkins
	docker secret rm jenkins-user
	docker secret rm jenkins-pass
fi