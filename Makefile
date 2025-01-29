APP_CONTAINER = sales-api-app


.PHONY: build up down migrate fresh

build:
	@echo "Construyendo y levantando contenedores..."
	docker-compose build --no-cache
	docker-compose up -d 
	@echo "Proyecto listo. Accede a http://localhost:8080"

down:
	@echo "Deteniendo y eliminando contenedores..."
	docker-compose down

migrate:
	@echo "Ejecutando migraciones..."
	docker exec -it $(APP_CONTAINER) php artisan migrate

fresh:
	@echo "Reiniciando la base de datos..."
	docker exec -it $(APP_CONTAINER) php artisan migrate:fresh --seed

bash:
	docker exec -it $(APP_CONTAINER) /bin/sh
