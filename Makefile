
name = inception
all:
	@sh ./srcs/requirements/tools/create_volumes.sh
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d

build:
	@sh ./srcs/requirements/tools/create_volumes.sh
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

down:
	@docker-compose -f ./srcs/docker-compose.yml down

re: down build

clean: down
	@docker system prune
	@docker container prune
	@docker network prune
	@docker volume prune

fclean: down
	@docker system prune --all --force
	@docker container prune --force
	@docker network prune --force
	@docker volume prune --force
	@docker volume rm srcs_db-volume
	@docker volume rm srcs_wp-volume
	@sudo rm -rf ~/volumes

.PHONY	: all build down re clean fclean
