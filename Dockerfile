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
RUN apt-get update

# Install necessary tools
# RUN apt-get install -y nano wget dialog net-tools

# Download and Install Nginx
RUN apt-get install -y nginx  

# Remove the default Nginx configuration file
# RUN rm -v /etc/nginx/nginx.conf

# Copy a configuration file from the current directory
# ADD nginx.conf /etc/nginx/

# Copy nodepop-web that is served by IP
#ADD ./nodepop-web /var/www/html
VOLUME /var/www/html

# Append "daemon off;" to the beginning of the configuration
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# Expose ports
EXPOSE 80

# Set the default command to execute when creating a new container
CMD service nginx start
