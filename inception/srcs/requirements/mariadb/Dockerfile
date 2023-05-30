FROM debian:buster

RUN apt-get update && \
	apt-get -y install mariadb-server mariadb-client && \
	mkdir -p /var/run/mysqld; mkdir -p /run/mysqld && \
	chown -R mysql:root /run/mysqld ; chown -R mysql:root /var/run/mysqld

COPY ./conf/server.cnf	/etc/mysql/mariadb.conf.d/server.cnf

COPY ./tool/script.sh .

RUN chmod +x ./script.sh

ENTRYPOINT ["./script.sh"]

CMD	["mysqld"]
