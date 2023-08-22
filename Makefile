up:
	docker-compose up -d --build
	@echo "Remove --build in Makefile after first use..."

down:
	docker-compose down

install: up  
	docker-compose run --rm wp core download
	
configure:
	docker-compose run --rm wp theme install https://github.com/waqastudios/inti-foundation/archive/refs/tags/v1.11.2.zip
	docker-compose run --rm wp theme install --force https://github.com/waqastudios/inti-acf-starter/archive/refs/tags/v1.6.1.zip
	docker-compose run --rm wp theme delete twentytwentythree
	docker-compose run --rm wp theme delete twentytwentytwo
	docker-compose run --rm wp theme delete twentytwentyone
	docker-compose run --rm wp plugin delete hello
	docker-compose run --rm wp plugin install classic-editor --activate
	docker-compose run --rm wp plugin install classic-widgets --activate
	docker-compose run --rm wp plugin install wordpress-importer --activate
	# docker-compose run --rm wp import ./theme-unit-test-data.xml --authors=skip

wp-download:
	docker-compose run --rm wp core download

wp-test:
	docker-compose run --rm wp user list

clean: down
	@echo "Removing WordPress and MySQL data..."
	@rm -rf  mysql/* wordpress/*

