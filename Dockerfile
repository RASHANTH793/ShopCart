# Use the official Tomcat image as a base
FROM tomcat:10.1

# Set the working directory
WORKDIR /usr/local/tomcat/webapps

# Copy the WAR file from the context directory to the Tomcat webapps directory
COPY shopcart1.war /usr/local/tomcat/webapps/


# Expose port 8080 (the default Tomcat port)
EXPOSE 8443

# Start Tomcat
CMD ["catalina.sh", "run"]
