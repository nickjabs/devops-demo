# Define variables
BASE_NAME = pimcore
DEV_TAG = dev
IMAGE_NAME = $(BASE_NAME):$(DEV_TAG)

# Disable echoing commands
.SILENT:

# Target: build
# Builds the Docker image
.PHONY: build
build:
	docker build \
		--tag $(IMAGE_NAME) \
		--file Dockerfile \
        .

# Target: compose_up
# Starts the Docker Compose services in detached mode
.PHONY: compose_up
compose_up:
	docker compose up -d

# Target: compose_down
# Stops and removes the Docker Compose services
.PHONY: compose_down
compose_down:
	docker compose down

# Target: connect
# Connects to the PHP container using bash
.PHONY: connect
connect:
	docker compose exec php bash

# Target: pimcore_install
# Executes Pimcore installation command in the PHP container
.PHONY: pimcore_install
pimcore_install:
	docker compose exec php \
        ./vendor/bin/pimcore-install  \
        --no-interaction

# Target: pimcore_chmod
# Changes permissions recursively in the /var/www/html/var directory
.PHONY: pimcore_chmod
pimcore_chmod:
	docker compose exec php \
        chmod -R 777 /var/www/html/var

# Target: up
# Starts services, installs Pimcore, and adjusts permissions
.PHONY: up
up: compose_up pimcore_install pimcore_chmod

# Target: down
# Stops and removes services
.PHONY: down
down: compose_down
