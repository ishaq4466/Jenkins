#FROM jenkins/jenkins:2.176.3
FROM jenkinsci/blueocean


ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"
COPY createuser.groovy /usr/share/jenkins/ref/init.groovy.d/createuser.groovy
RUN echo "$USER"
#RUN adduser "$USER"
#RUN usermod add -aG $USER  
# COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
# RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt