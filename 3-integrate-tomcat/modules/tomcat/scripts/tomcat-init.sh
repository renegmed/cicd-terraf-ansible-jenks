#!/bin/bash

# sudo hostname tomcat-server

# REF: https://linuxize.com/post/how-to-install-tomcat-8-5-on-ubuntu-18-04/
sudo su -

apt-get update
apt-get install -y default-jdk
 
groupadd tomcat
# make this user a member of the tomcat group, with a home directory of /opt/tomcat 
# (where we will install Tomcat), and with a shell of /bin/false (so nobody can log into the account)
useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat

apt install -y unzip wget
wget http://www-us.apache.org/dist/tomcat/tomcat-8/v8.5.37/bin/apache-tomcat-8.5.37.zip
unzip apache-tomcat-*.zip
mkdir -p /opt/tomcat
mv apache-tomcat-8.5.37 /opt/tomcat/

ln -s /opt/tomcat/apache-tomcat-8.5.37 /opt/tomcat/latest
chown -R tomcat: /opt/tomcat

sh -c 'chmod +x /opt/tomcat/latest/bin/*.sh'

cat > /etc/systemd/system/tomcat.service<<EOF
[Unit]
Description=Tomcat 8.5 servlet container
After=network.target

[Service]
Type=forking

User=tomcat
Group=tomcat

Environment="JAVA_HOME=/usr/lib/jvm/default-java"
Environment="JAVA_OPTS=-Djava.security.egd=file:///dev/urandom"

Environment="CATALINA_BASE=/opt/tomcat/latest"
Environment="CATALINA_HOME=/opt/tomcat/latest"
Environment="CATALINA_PID=/opt/tomcat/latest/temp/tomcat.pid"
Environment="CATALINA_OPTS=-Xms512M -Xmx1024M -server -XX:+UseParallelGC"

ExecStart=/opt/tomcat/latest/bin/startup.sh
ExecStop=/opt/tomcat/latest/bin/shutdown.sh

[Install]
WantedBy=multi-user.target
EOF



 
  
 
