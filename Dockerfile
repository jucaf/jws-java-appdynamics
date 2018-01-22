FROM registry.access.redhat.com/jboss-webserver-3/webserver31-tomcat8-openshift:1.1

USER root
RUN curl -o /deployments/ROOT.war -O ${WAR_FILE_URL} -H "X-JFrog-Art-Api:${ARTIFACTORY_TOKEN}"
ADD src/main/docker/appdynamics/ /opt/appdynamics/
ADD src/main/docker/AvantCardRootCertificationAuthority.crt /tmp
RUN chgrp -R 0 /opt/appdynamics/
RUN chmod -R g+rw /opt/appdynamics/
RUN find /opt/appdynamics/ -type d -exec chmod g+x {} +

RUN keytool -import -trustcacerts -alias avcrAppDProdController -keystore $JAVA_HOME/jre/lib/security/cacerts -file /tmp/AvantCardRootCertificationAuthority.crt -noprompt -storepass 'changeit'
#-keystore /etc/pki/ca-trust/extracted/java/cacerts  
RUN mkdir /deployments/logs
RUN chgrp -R 0 /deployments/logs/
RUN chmod -R g+rw /deployments/logs/
#ENV JAVA_OPTS="-javaagent:/opt/appdynamics/javaagent.jar -Dappdynamics.agent.logs.dir=/deployments/logs $JAVA_OPTS"
#ENV JAVA_OPTS="$JAVA_OPTS -Xbootclasspath/p:/wildfly/modules/system/layers/base/org/jboss/log4j/logmanager/main/log4j-jboss-logmanager-1.0.2.Final-redhat-1.jar -Djboss.modules.system.pkgs=org.jboss.byteman,com.appdynamics,com.appdynamics.,com.singularity,com.singularity."


#jboss from FIS
USER 185
