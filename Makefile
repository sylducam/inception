DIR		=	cd srcs

all		:
			mkdir -p /home/sylducam/data/log/nginx
			mkdir -p /home/sylducam/data/wordpress_database
			mkdir -p /home/sylducam/data/wordpress_files
			$(DIR) && docker-compose up --build

down	:
			$(DIR) && docker-compose down

execdb	:
			docker exec -it mariadb /bin/bash

execwp	:
			docker exec -it wordpress /bin/bash

execn	:
			docker exec -it nginx /bin/bash

clean	:	down
			docker system prune -f
			docker volume rm $$(docker volume ls -q) || true
			sudo rm -rf /home/sylducam/data/log/nginx/*
			sudo rm -rf /home/sylducam/data/wordpress_database/*
			sudo rm -rf /home/sylducam/data/wordpress_files/*
			docker network rm inception || true

fclean	:	clean
			docker stop $(docker ps -a -q) || true
			docker rm $(docker ps -a -q) || true
			docker rmi -f $(docker images -a -q) || true


.PHONY	:	all execdb execwp execn down clean fclean