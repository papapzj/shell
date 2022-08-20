#install_tomcat
wget https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.14/bin/apache-tomcat-8.5.14.tar.gz
tar zxvf apache-tomcat-8.5.14.tar.gz
rm -rf apache-tomcat-8.5.14.tar.gz
mv apache-tomcat-8.5.14 /usr/local/tomcat

#开机启动
cat > /etc/systemd/system/tomcat.service <<EOF

[Unit]

Description=Apache Tomcat Web Application Container

After=syslog.target network.target



[Service]

Type=forking



Environment=JAVA_HOME=/usr/local/jdk1.8.0_231

Environment=CATALINA_PID=/usr/local/tomcat/temp/tomcat.pid

Environment=CATALINA_HOME=/usr/local/tomcat

Environment=CATALINA_BASE=/usr/local/tomcat



ExecStart=/usr/local/tomcat/bin/catalina.sh start

ExecStop=/bin/kill -15 $CATALINA_PID



[Install]

WantedBy=multi-user.target
EOF

systemctl enable tomcat.service
