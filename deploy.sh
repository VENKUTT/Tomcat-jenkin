#!/bin/bash

TOMCAT_HOST=54.226.165.119
TOMCAT_USER=tomcat
TOMCAT_PWD=12345678
TOMCAT_HOME=/opt/apache-tomcat-9.0.78
#
WAR_FILE_PATH=./target/ELPDevOps.war

echo "Bringing tomcat server down for deployment..."
sleep 3

$TOMCAT_HOME/bin/shutdown.sh 1>/dev/null 2>&1

#1>file.log 2>&1
if [ -f $WAR_FILE_PATH ];then
    echo "deploying ELPDevOps application..."
    sleep 4
    scp  $WAR_FILE_PATH $TOMCAT_USER@$TOMCAT_HOST:$TOMCAT_HOME/webapps
else
   echo "war file doesn't exist! Please check the build"
fi

echo "starting tomcat server..."
$TOMCAT_HOME/bin/startup.sh 1>/dev/null 2>&1

echo "deployment is successful! Email notification has been .sent!"
