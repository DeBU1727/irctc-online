FROM tomcat:10.1-jdk17-temurin


RUN sed -i 's/port="8005"/port="-1"/g' /usr/local/tomcat/conf/server.xml

COPY ROOT.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]
