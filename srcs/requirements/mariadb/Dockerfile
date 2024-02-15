FROM debian:bullseye
RUN apt update && apt upgrade -y
RUN apt install mariadb-server -y
RUN apt install vim -y 
RUN mkdir -p /var/run/mysqld
RUN chmod 777 /var/run/mysqld 
RUN chown -R mysql:mysql /var/run/mysqld


