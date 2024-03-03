# Container's OS choice
FROM debian:bullseye

# Installation of needed depedencies
RUN apt update && apt upgrade -y
RUN apt install nginx -y
RUN apt install vim -y 
RUN apt install curl -y
RUN apt install openssl -y

# SSL certificates attribution
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=[atardif.42.fr](http://atardif.42.fr/)/UID=atardif"

# We put our nginx.conf in good directory
COPY conf/nginx.conf /etc/nginx/conf.d/nginx.conf

# We give necessary rights to user in appropriate folder
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

# We expose port 443 of our container
EXPOSE 443

# We launch nginx 
CMD [ "nginx", "-g", "daemon off;" ]
