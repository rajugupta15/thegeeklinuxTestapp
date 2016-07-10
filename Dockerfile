FROM wavemaker/tomcat:6.0.39_1
#Create platform node
ADD ./scripts/ /scripts/thegeeklinux/
ADD supervisor/tomcat.conf /etc/supervisor/conf.d/tomcat.conf
ADD webapps/ $TOMCAT_HOME/current/webapps/
ADD config/ /root/config/
RUN echo "/bin/bash /scripts/thegeeklinux/start" >> /scripts/init && chmod a+x /scripts/init
