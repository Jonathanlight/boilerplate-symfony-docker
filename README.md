# Symfony Docker Boilerplate

A ready-to-use Docker boilerplate for Symfony projects.

## Stack

| Component | Version |
|-----------|---------|
| PHP       | 8.3     |
| Symfony   | 7.4     |
| MySQL     | 8.0     |
| Apache    | 2.4     |

## Services

| Service          | URL                    |
|------------------|------------------------|
| Application      | http://localhost:8000  |
| phpMyAdmin       | http://localhost:8001  |
| Mailpit          | http://localhost:8025  |
| MySQL            | localhost:3306         |

## Prerequisites

- [Docker](https://www.docker.com/) and Docker Compose
- [Git](https://git-scm.com/)

## Installation

```bash
# 1. Clone the repository
git clone <repo-url>
cd boilerplate-symfony-docker

# 2. Configure the project name
cp .env .env.local
# Edit .env.local and set NAME_PROJECT=yourproject

# 3. Build and start Docker containers
make build

# 4. Install PHP dependencies
make install

# 5. Access the application
open http://localhost:8000
```

## Make Commands

### Docker

| Command         | Description                 |
|-----------------|-----------------------------|
| `make run`      | Start containers            |
| `make build`    | Build and start containers  |
| `make stop`     | Stop containers             |
| `make down`     | Remove containers           |
| `make restart`  | Restart containers          |
| `make ps`       | Show running containers     |
| `make exec`     | Enter the Apache container  |

### Project

| Command            | Description                |
|--------------------|----------------------------|
| `make install`     | Install Composer deps      |
| `make migrate`     | Run Doctrine migrations    |
| `make compile`     | Clear Symfony cache        |

### Code Quality

| Command              | Description                          |
|----------------------|--------------------------------------|
| `make php-cs-fixer`  | Fix code style                       |
| `make phpstan`       | Run static analysis                  |
| `make phpunit`       | Run tests                            |
| `make quality`       | Run all checks (dry-run)             |
