# jws_appdynamics_openshift
Extraido de fis-java-appdynamics, modificado para monitorizar contenedores de Openshift con Appdynamics

* base build for any JWS application requiring appdynamics agents

oc new-build https://github.com/isanmartin0/jws_appdynamics_openshift.git --context-dir=src/main/docker --allow-missing-images

Si hiciera falta:
oc import-image jboss-webserver-3/webserver31-tomcat8-openshift:1.1 --from=registry.access.redhat.com/jboss-webserver-3/webserver31-tomcat8-openshift:1.1 --confirm

oc new-app jws_appdynamics_openshift
