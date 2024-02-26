NAME = inception
all:
	@sh srcs/requirements/tools/make_volumes.sh
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d

build:
	@sh srcs/requirements/tools/make_volumes.sh
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

down:
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env down

re: down build

clean: down
	@docker system prune --all
	@sudo rm -rf ~/volumes

fclean: clean
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force
	@docker volume rm srcs_db-volume
	@docker volume rm srcs_wp-volume
	@sudo rm -rf ~/volumes

.PHONY	: all build down re clean fclean
