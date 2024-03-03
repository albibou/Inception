# Container's OS choice
From debian:bullseye

# Installation of needed depedencies
RUN apt update -y && apt upgrade -y
RUN apt install wget -y
RUN apt install vim -y
RUN apt-get install -y php7.4 \
    php-fpm\
    php-mysql\
    mariadb-client

# Installation of wordpress using wget and folder rename
RUN wget https://fr.wordpress.org/wordpress-6.4-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.4-fr_FR.tar.gz && rm wordpress-6.4-fr_FR.tar.gz  
RUN cp -r /var/www/wordpress/. /var/www/html
RUN rm -rf /var/www/wordpress
RUN chown -R root:root /var/www/html

# We put our configuration file in good directory
COPY ./conf/www.conf  /etc/php/7.4/fpm/pool.d/www.conf

# Wordpress CLI installation
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar

# We copy our configuration script in the container
COPY ./tools/wp_config.sh .
RUN chmod +x wp_config.sh

# Creation of a needed folder to run PHP
RUN mkdir -p /run/php

# We expose port 9000 of our container
EXPOSE 9000

# We run our configuration script, that will launch PHP in the end
CMD [ "./wp_config.sh"]
