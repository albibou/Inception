From debian:bullseye
RUN apt update -y && apt upgrade -y
RUN apt install wget -y
RUN apt install vim -y
RUN apt-get install -y php7.4 \
    php-fpm\
    php-mysql\
    mariadb-client
RUN wget https://fr.wordpress.org/wordpress-6.4-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.4-fr_FR.tar.gz && rm wordpress-6.4-fr_FR.tar.gz  
RUN chown -R root:root /var/www/wordpress
EXPOSE 9000

