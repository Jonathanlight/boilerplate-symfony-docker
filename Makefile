# --------------------------------#
# Makefile for the "make" command
# --------------------------------#

DOCKER= docker compose

## ----- Docker -----
run: ## Start containers
	$(DOCKER) up -d

ps: ## Show running containers
	$(DOCKER) ps

build: ## Build and start containers
	$(DOCKER) up --force-recreate --build -d

stop: ## Stop containers
	$(DOCKER) stop

restart: ## Restart containers
	$(DOCKER) restart

down: ## Remove containers
	$(DOCKER) down

exec: ## Enter the Apache container
	$(DOCKER) exec apache bash

shell: ## Enter the Apache container (alias)
	$(DOCKER) exec apache bash

## ----- Project -----
install: ## Install Composer dependencies
	$(DOCKER) exec apache composer install

migrate: ## Run Doctrine migrations
	$(DOCKER) exec apache php bin/console doctrine:migrations:migrate --no-interaction

compile: ## Clear Symfony cache
	$(DOCKER) exec apache php bin/console cache:clear

## ----- Code Quality -----
php-cs-fixer: ## Run PHP-CS-Fixer
	$(DOCKER) exec apache vendor/bin/php-cs-fixer fix --config=.php-cs-fixer.dist.php

phpstan: ## Run PHPStan
	$(DOCKER) exec apache vendor/bin/phpstan analyse --configuration=phpstan.neon

phpunit: ## Run PHPUnit tests
	$(DOCKER) exec apache vendor/bin/phpunit --colors=always

quality: ## Run all quality checks (cs-fixer, phpstan, linters)
	$(DOCKER) exec apache vendor/bin/php-cs-fixer fix --config=.php-cs-fixer.dist.php --dry-run --diff && \
	$(DOCKER) exec apache vendor/bin/phpstan analyse --configuration=phpstan.neon && \
	$(DOCKER) exec apache php bin/console lint:twig templates && \
	$(DOCKER) exec apache php bin/console lint:yaml config && \
	$(DOCKER) exec apache php bin/console lint:container

## ----- Help -----
help: ## Display this help
	@grep -E '(^[a-zA-Z0-9_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}{printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'
