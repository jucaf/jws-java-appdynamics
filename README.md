# poc_appdynamics_tomcat
Extraido de fis-java-appdynamics, haciendo una poc para monitorizar contenedores de Openshift con Appdynamics

* base build for any FIS application requiring appdynamics agents

oc new-build https://github.com/juantimonescalona/poc_appdynamics_tomcat.git --context-dir=src/main/docker --allow-missing-images

Si hiciera falta:
oc import-image jboss-webserver-3/webserver31-tomcat8-openshift:latest --from=registry.access.redhat.com/jboss-webserver-3/webserver31-tomcat8-openshift:latest --confirm

oc new-app poc_appdynamics_tomcat

