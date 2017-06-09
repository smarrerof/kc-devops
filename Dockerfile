# Set the base image to Ubuntu
FROM ubuntu:16.04

# File Author / Maintainer
LABEL Author="Sergio Marrero" \
      Nick="smarrero" \
      Description="Práctica de DevOps del V KeepCoding Startup Engineering Master Bootcamp (2017)"

#################################################
# Install Nginx 
#################################################

# Add application repository URL to the default sources
# RUN echo "deb http://archive.ubuntu.com/ubuntu/ raring main universe" >> /etc/apt/sources.list

# Update the repository
#RUN apt-get update

# Install necessary tools
# RUN apt-get install -y nano wget dialog net-tools

# Download and Install Nginx
#RUN apt-get install -y nginx  

# Remove the default Nginx configuration file
# RUN rm -v /etc/nginx/nginx.conf

# Copy a configuration file from the current directory
# ADD nginx.conf /etc/nginx/

# Copy nodepop-web that is served by IP
#ADD ./nodepop-web /var/www/html
#VOLUME /var/www/html

# Append "daemon off;" to the beginning of the configuration
#RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# Expose ports
#EXPOSE 80

# Set the default command to execute when creating a new container
#CMD service nginx start



# INSTALL NGINX
RUN apt-get update
RUN apt-get install -y nginx  
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# CONFIGURE NGINX
ADD ./nginx-config/html /etc/nginx/sites-available
ADD ./nginx-config/nodepop /etc/nginx/sites-available
RUN ln -s /etc/nginx/sites-available/html /etc/nginx/sites-enabled/html
RUN ln -s /etc/nginx/sites-available/nodepop /etc/nginx/sites-enabled/nodepop
RUN rm /etc/nginx/sites-enabled/default
#RUN service nginx restart --> Moved to start.sh script

# INSTALL NODE
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash
RUN apt-get install -y nodejs

# INSTALL MONGODB
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
RUN echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.4.list
RUN apt-get update
RUN apt-get install -y mongodb-org
RUN mkdir -p /data/db

# CREATE NEEDED VOLUMES
VOLUME /var/www/html
VOLUME /var/www/nodepop

# EXPOSE PORTS
EXPOSE 80
EXPOSE 8080
EXPOSE 27017

# START SCRIPT
ADD start.sh /start.sh
ENTRYPOINT ["/start.sh"]