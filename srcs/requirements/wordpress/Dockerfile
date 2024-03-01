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
RUN cp -r /var/www/wordpress/. /var/www/html
RUN rm -rf /var/www/wordpress
RUN chown -R root:root /var/www/html
COPY ./conf/www.conf  /etc/php/7.4/fpm/pool.d/www.conf
EXPOSE 9000
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
#RUN mv wp-cli.phar /usr/local/bin/wp
COPY ./tools/wp_config.sh .
RUN chmod +x wp_config.sh
# ENTRYPOINT ["/wp_config.sh"]
# WORKDIR /var/www/html/
# CMD [ "/usr/sbin/php-fpm7.4", "-F" ]

RUN mkdir -p /run/php
CMD [ "./wp_config.sh"]
