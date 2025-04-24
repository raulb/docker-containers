.PHONY: help
help:
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@echo "  help         	Show this help message"
	@echo "  start        	Start all containers"
	@echo "  clean        	Stop all containers and remove volumes"
	@echo "  insert-pg-data Insert test data (20M employees by default)"
	@echo ""

.PHONY: start
start:
	make -C ./kafka setup
	make -C ./postgresql setup

.PHONY: clean
clean:
	make -C ./kafka clean
	make -C ./postgresql clean

# Insert data calling the `make insert-data` target from the PostgreSQL directory
.PHONY: insert-pg-data
insert-pg-data:
	make -C ./postgresql insert-data
