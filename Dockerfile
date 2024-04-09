FROM ubuntu:latest
MAINTAINER imranullahsyed.dwh@gmail.com

# Update package lists and install Apache HTTP Server, zip, and unzip
RUN apt update -y && \
    apt install -y apache2 zip unzip

# Download the zip file and extract it
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip photogenic.zip && \
    cp -rvf photogenic/* . && \
    rm -rf photogenic photogenic.zip

# Start Apache HTTP Server
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

# Expose ports
EXPOSE 80 22

