DIR		=	cd srcs

all		:
			$(DIR) && docker-compose up --build

down	:
			$(DIR) && docker-compose down

exec	:
			docker exec -it wp-app /bin/bash

clean	:	down
			docker system prune -f
			docker volume rm $$(docker volume ls -q)
			docker network rm $$(docker network ls -q)

fclean	:	clean
			docker stop $(docker ps -a -q)
			docker rm $(docker ps -a -q)
			docker rmi -f $(docker images -a -q)
			

.PHONY	:	all down clean