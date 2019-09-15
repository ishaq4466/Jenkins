FROM jenkins/jenkins:2.176.3

ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"

COPY createuser.groovy /usr/share/jenkins/ref/init.groovy.d/createuser.groovy

# COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
# RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt