#!/bin/sh
if [ ! -f /var/www/html/wp-config.php  ]; then
	until mysqladmin -hmariadb -u${MYSQL_ADMIN} -p${MYSQL_ADMIN_P} ping; do
		sleep 2
	done
    wp core download --allow-root \
    && wp config create --dbname=$DB --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root \
    && wp core install --url=lmasson.42.fr --title=$TITLE --admin_user=$WADMIN --admin_password=$WADMIN_PASS --admin_email=$WADMIN_EMAIL --skip-email --allow-root \
    && wp user create $WUSER $WUSER_EMAIL --role=author --user_pass=$WPASSWORD --allow-root \
    && wp theme install $THEME --activate --allow-root 
else
    echo "wordpress already there"
fi

echo "Everything is working"
exec "$@"
