FROM registry.access.redhat.com/jboss-webserver-3/webserver31-tomcat8-openshift:latest

USER root
EXPOSE 80 8090

ADD appdynamics/ /opt/appdynamics/

RUN chgrp -R 0 /opt/appdynamics/
RUN chmod -R g+rw /opt/appdynamics/
RUN find /opt/appdynamics/ -type d -exec chmod g+x {} +

RUN mkdir /usr/local/tomcat
RUN mkdir /usr/local/tomcat/conf
ADD application.properties /usr/local/tomcat/conf/application.properties

RUN mkdir /deployments/logs
RUN chgrp -R 0 /deployments/logs/
RUN chmod -R g+rw /deployments/logs/
ENV JAVA_OPTS="-javaagent:/opt/appdynamics/javaagent.jar -Dappdynamics.agent.logs.dir=/deployments/logs  $JAVA_OPTS"
ENV spring_config_location="/usr/local/tomcat/conf/"

ADD ROOT.war /deployments/ROOT.war


#jboss from FIS
USER 185
