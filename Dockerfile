FROM tomcat:10.1-jdk17-temurin

# Debugging: Print environment variable during build
RUN echo "DEBUG: Dockerfile - EMAIL_SMTP_TLS_ENABLE during build: $EMAIL_SMTP_TLS_ENABLE"


# Disable the shutdown port (8005) to prevent Render health-check conflicts
RUN sed -i 's/port="8005"/port="-1"/g' /usr/local/tomcat/conf/server.xml

COPY ROOT.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]
