# Container's OS choice
FROM debian:bullseye

# Installation of needed depedencies
RUN apt update && apt upgrade -y
RUN apt install mariadb-server -y
RUN apt install vim -y 

# We give necessary rights to user in appropriate folder
RUN mkdir -p /var/run/mysqld
RUN chmod 777 /var/run/mysqld 
RUN chown -R mysql:mysql /var/run/mysqld

# We put our nginx.conf in good directory
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# We copy our initialisation script in the container
COPY ./tools/mariadb.sh   mariadb.sh
RUN  chmod +x mariadb.sh

# We expose port 3306 of our container
EXPOSE 3306

# We run the initialisation script that will run mariadb service in the end
CMD ["./mariadb.sh"]
