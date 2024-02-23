FROM debian:bullseye
RUN apt update && apt upgrade -y
RUN apt install mariadb-server -y
RUN apt install vim -y 
#RUN mkdir -p /var/run/mysqld
#RUN chmod 777 /var/run/mysqld 
#RUN chown -R mysql:mysql /var/run/mysqld
#COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/mariadb.sh   mariadb.sh
RUN  chmod +x mariadb.sh

CMD ["./mariadb.sh"]
