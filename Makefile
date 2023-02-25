all: wp-data
	docker compose up
	
wp-data:
	mkdir -p "/opt/data/wp-data" "/opt/data/database"
	chmod 777 "/opt/data/"
	
	
re: wp-data
	docker compose down -v
	docker compose up --build 
