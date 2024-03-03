#!/bin/bash

if [ -f /var/www/html/wp-config.php ]; then
	echo "Database already exists."

else

	sleep 15

	./wp-cli.phar config create --allow-root \
		--dbname=$SQL_DATABASE \
		--dbuser=$SQL_USER \
		--dbpass=$SQL_PASSWORD \
		--dbhost=mariadb:3306 \
		--path='/var/www/html'

	./wp-cli.phar core install --allow-root --url=$DOMAIN_NAME --title=$SITE_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWD --admin_email=$WP_ADMIN_EMAIL --path='/var/www/html'
	./wp-cli.phar user create $WP_SECOND_USER $WP_SECOND_MAIL --user_pass=$WP_SECOND_PASSWD --allow-root --role=author --path='/var/www/html'

fi

exec /usr/sbin/php-fpm7.4 -F
