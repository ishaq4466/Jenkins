#1. Installation for jenkins
sudo yum install -y java-1.8.0-openjdk-devel
sudo yum install -y wget
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key
sudo yum install -y jenkins

#2. Building in jenkins

Simple Tasks: 
* Creating a folder 
* Creating a build with shell executing the command and redirected into the 
user_test.txt, file can be viewed by going into workspace folder

#3. Building from SCM

* Installing and configuring maven for Build
Global tool configuration
* In scm put git repo address
* invoke top level jenkins
* run a shell command bin/makeindex
* Archeiving the artifact index.jsp

#4. Distributing the build on a remote server i.e master-slave configuration
[Master]
* SSH to the master jenkins server
* configured the /etc/passwd for default shell cmd /bin/bash for jenkins
* change the passwd for jenkins user 
* su - jenkins and ssh-keygen for key generation id_pub id_pub.key

[Slave]
* Install a git and jdk-8
* create a jenkins user
* Change the passwd for jenkins
* edit the sudoer file using visudo cmd and the below line
	jenkins ALL=(ALL)       NOPASSWD: ALL
[Master]
* ssh-copy-id jenkins@3.92.87.150
* Test the ssh connection with slave ip without passwd.(Key exchang)
* if not succeeded than restart the sshd service for slave node  
* cat /var/jenkins/.ssh/id_rsa private key

[Master]
* Go to GTC and add maven installation
* Go to Jenkins UI and Manage Node-->add new node 
* Add a label to slave node
* set /home/jenkins to slave remote root directory
* Enter the host ip 
* Launch agent via ssh than ssh username with private key



#5. Building an application as a Freestyle project
Freestlye projet allows to builds automatically whenever the changes/pushed occured in
the source code repo using webhook triggers.

Main purpose is to connect the github repo and jenkins server using webhook
trigger so that when any changes occurred into the github repo 
the build should automatically trrggrs 

* Get the access token from the github account by going to the developer setting in github
  admin:repo_hook








