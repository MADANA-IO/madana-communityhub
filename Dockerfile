FROM tomcat:9-jdk8-openjdk-slim


RUN rm -rf $CATALINA_HOME/webapps/ROOT
RUN mkdir -p $CATALINA_HOME/webapps/ROOT

COPY target/ROOT.war $CATALINA_HOME/webapps
