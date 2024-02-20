
name = inception
all:
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d

build:
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

down:
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env down

re: down
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

clean: down
	@docker container prune
	@docker rmi $$(docker images)
	@docker network prune
	@docker volume prune
	# @sudo rm -rf ~/data/wordpress/*

fclean: down
	@docker container prune -f
	@docker rmi -f $$(docker images)
	@docker network prune -f
	@docker volume prune -f
	# @sudo rm -rf ~/data/wordpress/*
	# @sudo rm -rf ~/data/mariadb/*

.PHONY	: all build down re clean fclean
