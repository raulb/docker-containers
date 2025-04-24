COMPOSE_FILE = compose.yml

.PHONY: help setup clean connect consume list-topics

# Default target
help:
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@echo "  help         Show this help message"
	@echo "  setup        Start the Kafka container"
	@echo "  clean        Stop and remove containers and volumes"
	@echo "  connect      Connect to Kafka and list topics"
	@echo "  consume      Consume messages from a Kafka topic (specify TOPIC=your-topic)"
	@echo "  list-topics  List all available Kafka topics"
	@echo ""

# Start the Kafka container
setup:
	docker-compose -f $(COMPOSE_FILE) up -d custom-kafka-0

# Clean up containers and data
clean:
	docker-compose -f $(COMPOSE_FILE) down --volumes --remove-orphans

# Connect to Kafka and list topics
connect:
	docker exec -it custom-kafka-0 /opt/kafka/bin/kafka-topics.sh --list --bootstrap-server localhost:9092

# Consume messages from a Kafka topic
consume:
	docker exec -it custom-kafka-0 /opt/kafka/bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic $(TOPIC) --from-beginning

# List all available Kafka topics
list-topics:
	docker exec -it custom-kafka-0 /opt/kafka/bin/kafka-topics.sh --list --bootstrap-server localhost:9092
