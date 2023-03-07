volume_worepress = /home/${USER}/data/wordpress
volume_database  = /home/${USER}/data/database

all: create-volumes run

create-volumes:
	@mkdir -p $(volume_worepress) $(volume_database)
	@chmod 777 $(volume_worepress) $(volume_database)

run:
	@docker compose -f ./srcs/docker-compose.yml up -d --build

stop:
	@docker compose -f ./srcs/docker-compose.yml down

clean:
	@sudo rm -rf /home/${USER}/data
	@docker system prune

re: stop clean all

.PHONY: all run stop clean re
