#!/bin/bash
if [ ! -d /var/lib/mysql/${DB} ]; then
	mysqld &
	until mysqladmin ping;do
        sleep 2
    done
    mysql -u root -e "CREATE DATABASE $DB;"
	mysql -u root -e "CREATE USER '$MYSQL_ADMIN'@'%' IDENTIFIED BY '$MYSQL_ADMIN_P';"
	mysql -u root -e "GRANT ALL ON *.* TO '$MYSQL_ADMIN'@'%';"
	mysql -u root -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" 
	mysql -u root -e "GRANT ALL ON $DB.* TO '$MYSQL_USER'@'%';"
	mysql -u root -e "FLUSH PRIVILEGES;"
	mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$PASSWORD';"
	mysql -u root -p$PASSWORD -e "FLUSH PRIVILEGES;"
	echo "database created";
    killall mysqld
else
    echo "mariadb already there"
fi
exec "$@"
