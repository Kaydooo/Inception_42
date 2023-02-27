volume_worepress = /opt/data/wp-data
volume_database  = /opt/data/database

all: create-volumes run

build: 
	docker compose build 

create-volumes:
	mkdir -p $(volume_worepress) $(volume_database)
	chmod 777 $(volume_worepress) $(volume_database)

run:
	docker compose up -d

stop:
	docker compose down

fclean:
	docker system prune
	
re: stop fclean build all