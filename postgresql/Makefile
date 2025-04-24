COMPOSE_FILE = compose.yml

.PHONY: setup
setup:
	docker-compose -f $(COMPOSE_FILE) up -d custom-pg-0

.PHONY: clean
clean:
	docker-compose -f $(COMPOSE_FILE) down --volumes --remove-orphans
	rm -rf data

.PHONY: connect
connect:
	docker exec -it custom-pg-0 psql -U meroxauser -d meroxadb

.PHONY: insert-data
insert-data:
	./scripts/insert_test_employees.sh "20000000"
