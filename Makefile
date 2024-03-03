SRCS = ./srcs/requirements/nginx/Dockerfile \
					./srcs/requirements/nginx/conf/nginx.conf \
					./srcs/requirements/mariadb/Dockerfile \
					./srcs/requirements/mariadb/conf/50-server.cnf \
					./srcs/requirements/mariadb/tools/mariadb.sh \
					./srcs/requirements/wordpress/Dockerfile \
					./srcs/requirements/wordpress/tools/wp_config.sh \
					./srcs/requirements/wordpress/conf/www.conf \

all : ${SRCS} env_file create_volumes_repo
			docker compose -f ./srcs/docker-compose.yml up -d --build

env_file : 
						@if [ ! -e /srcs/.env ]; \
						then \
							cp /home/atardif/.env ./srcs/; \
						fi; 

create_volumes_repo :
						
						@if [ ! -d /home/atardif/data/ ]; \
						then \
							mkdir /home/atardif/data; \
						fi ; \
						if [ ! -d /home/atardif/data/wordpress ]; \
						then \
							mkdir /home/atardif/data/wordpress; \
						fi ; \
						if [ ! -d /home/atardif/data/mariadb ]; \
						then \
							mkdir /home/atardif/data/mariadb; \
						fi ; 

down	: ${SRCS} env_file
			docker compose -f ./srcs/docker-compose.yml down 

clean : down
				
				@if [ "docker images nginx" ]; \
				then \
					docker rmi -f nginx; \
				fi ; \
				if [ "docker images mariadb" ]; \
				then \
					docker rmi -f mariadb; \
				fi ; \
				if [ "docker images wordpress" ]; \
				then \
					docker rmi -f wordpress; \
				fi ; \
				if [ "docker volume ls -f name=srcs_mariadb" ]; \
				then \
					docker volume rm -f srcs_mariadb; \
				fi ; \
				if [ "docker volume ls -f name=srcs_wordpress" ]; \
				then \
					docker volume rm -f wordpress; \
				fi ; \
				docker system prune -af;

fclean : clean 
					sudo rm -rf /home/atardif/data

re : fclean all

.PHONY: all re down clean fclean env_file create_volumes_repo
