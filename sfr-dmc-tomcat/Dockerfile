FROM tomcat:7.0

WORKDIR /usr/local/tomcat/webapps

# Set the dynamic JVM parameter
ENV dmcWeb_configDir=my_config_value
ENV dmcWeb_persoDir=my_config_value

EXPOSE 8080

# This will start the Tomcat server and automatically deploy the application
CMD ["catalina.sh", "run"]

