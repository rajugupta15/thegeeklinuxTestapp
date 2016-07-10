#!/bin/bash
set -eo pipefail
function do_err() {
    code=$?
    echo "Command failed with code $code: $BASH_COMMAND"
    exit $code

}
trap do_err ERR

cp /root/config/server.xml /usr/local/content/tomcat/current/conf/
cp /root/config/tomcat-users.xml /usr/local/content/tomcat/current/conf/
cp /scripts/thegeeklinux/setenv.sh /usr/local/content/tomcat/current/bin/
cp /scripts/thegeeklinux/tomcat /etc/init.d/tomcat
#TODO: use envtpl for better replacement and conditions logic here
sed -i "s|@TOMCATHOME@|$TOMCAT_HOME|g" /etc/init.d/tomcat
sed -i "s|@JAVAHOME@|$JAVA_HOME|g" /etc/init.d/tomcat

sed -i "s/@DB_USER@/root/g" /usr/local/content/tomcat/current/bin/setenv.sh
sed -i "s/@DB_PASSWORD@/cloudjee123/g" /usr/local/content/tomcat/current/bin/setenv.sh
sed -i "s/@DB_HOST@/${DB_IPADDRES}/g" /usr/local/content/tomcat/current/bin/setenv.sh
chmod +x /etc/init.d/tomcat
