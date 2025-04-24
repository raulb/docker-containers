COMPOSE_FILE = compose.yml

.PHONY: help setup clean connect insert-data

# Default target
help:
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@echo "  help         Show this help message"
	@echo "  setup        Start PostgreSQL container with docker-compose"
	@echo "  clean        Stop containers, remove volumes and data directory"
	@echo "  connect      Connect to PostgreSQL with psql client"
	@echo "  insert-data  Insert test data (20M employees by default)"
	@echo ""

# Start PostgreSQL container
setup:
	docker-compose -f $(COMPOSE_FILE) up -d custom-pg-0

# Clean up containers and data
clean:
	docker-compose -f $(COMPOSE_FILE) down --volumes --remove-orphans
	rm -rf data

# Connect to the database with psql
connect:
	docker exec -it custom-pg-0 psql -U meroxauser -d meroxadb

# Insert test data
insert-data:
	./scripts/insert_test_employees.sh "20000000"
