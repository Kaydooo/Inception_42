volume_worepress = /opt/data/wp-data
volume_database  = /opt/data/database

all: create-volumes run

create-volumes:
	@mkdir -p $(volume_worepress) $(volume_database)
	@chmod 777 $(volume_worepress) $(volume_database)

run:
	@docker compose -f ./srcs/docker-compose.yml up -d --build

stop:
	@docker compose -f ./srcs/docker-compose.yml down

fclean:
	@docker system prune

re: stop fclean all

.PHONY: all run stop fclean re
