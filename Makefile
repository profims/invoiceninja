.DEFAULT_GOAL = help
.PHONY: *

help: ## Help
	@grep -E '(^[a-zA-Z0-9_-]+:.*?##.*$$)|(^##)' Makefile | awk 'BEGIN {FS = ":.*?## "}{printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'

### Local Docker
create: build up init migrations ## Create full environment

build: ## Build Docker Compose
	docker compose stop || true
	docker compose build

up: ## Start Docker containers
	docker compose up --detach --remove-orphans
	sleep 3

down: ## Stop Docker containers
	docker compose down --remove-orphans

destroy: ## Stop Docker containers and remove volumes
	docker compose down --remove-orphans --volumes

### Commands
init: ## Install dependencies and build Codeception
	docker compose exec php composer install --no-dev -o;
	docker compose exec php php artisan cache:clear;
	docker compose exec php php artisan config:cache;

migrations: ## Run database migrations and load fixtures
	docker compose exec php php artisan migrate --force

### Frontend
open-front: up ## Open frontend in browser
	open http://localhost:8081
