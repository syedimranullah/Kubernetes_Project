FROM centos:latest
MAINTAINER imranullahsyed.dwh@gmail.com

# Install Apache HTTP Server, zip, and unzip using yum
RUN yum update -y && \
    yum install -y httpd zip unzip

# Download the zip file and extract it
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip photogenic.zip && \
    cp -rvf photogenic/* . && \
    rm -rf photogenic photogenic.zip

# Start Apache HTTP Server
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

# Expose ports
EXPOSE 80
