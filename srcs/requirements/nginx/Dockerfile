FROM debian:bullseye
RUN apt update && apt upgrade -y
RUN apt install nginx -y
RUN apt install vim -y 
RUN apt install curl -y
RUN apt install openssl -y
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=[atardif.42.fr](http://atardif.42.fr/)/UID=atardif"
COPY conf/nginx.conf /etc/nginx/conf.d/nginx.conf
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html
EXPOSE 443
CMD [ "nginx", "-g", "daemon off;" ]
