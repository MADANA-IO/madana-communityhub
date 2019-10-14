FROM tomcat:9-jdk8-openjdk-slim

RUN rm -r $CATALINA_HOME/webapps/ROOT
#COPY target/madana-communityhub*.war $CATALINA_HOME/webapps/ROOT.war
COPY target/madana*[^\.war] $CATALINA_HOME/webapps/ROOT
