NAME = inception
all: create_volumes build up

up:
	@docker-compose -f ./srcs/docker-compose.yml up -d

down:
	@docker-compose -f ./srcs/docker-compose.yml down -v

start:
	@docker-compose -f ./srcs/docker-compose.yml start

stop:
	@docker-compose -f ./srcs/docker-compose.yml stop

build: create_volumes
	@docker-compose -f ./srcs/docker-compose.yml build

re: down build up

clean: down clean_volumes

fclean: clean remove_volumes
	@docker system prune --all --force
	@docker network prune --force
	@docker volume prune --force

create_volumes:
	@sh srcs/requirements/mariadb/tools/create_volumes.sh

clean_volumes:
	@sudo rm -rf ~/data/mariadb/*
	@sudo rm -rf ~/data/wordpress/*

remove_volumes:
	@sudo rm -rf ~/data

.PHONY	: all up start stop build down re clean fclean
