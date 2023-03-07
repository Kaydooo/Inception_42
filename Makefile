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

clean: stop
	@docker system prune --volumes --all --force
	@docker rm -q $$(docker ps -qa) 2> /dev/null || true
	@docker rmi -f $$(docker images -qa) 2> /dev/null || true
	@docker volume rm $$(docker volume ls -q) 2> /dev/null  || true
	@rm -rf /home/${USER}/data

re: clean all

.PHONY: all run stop clean re
