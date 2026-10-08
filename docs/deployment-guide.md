# Bincom OpenProject — Deployment Guide

## Requirements

- Docker Engine or Docker Desktop
- Docker Compose v2
- Git
- Available host port
- Persistent disk storage

## Installation

Clone the repository:

git clone https://github.com/poundsmichaelscode/Bincom-OpenProject.git

cd Bincom-OpenProject

Copy the environment template:

cp .env.example .env

## Configuration

Set the following values in .env:

PORT=127.0.0.1:8081
OPENPROJECT_HOST__NAME=localhost:8081
OPENPROJECT_HTTPS=false

Generate secure values for SECRET_KEY_BASE
and COLLABORATIVE_SERVER_SECRET.

Configure DATABASE_URL and POSTGRES_PASSWORD
with matching PostgreSQL credentials.

For local collaboration, configure
COLLABORATIVE_SERVER_URL appropriately.

Review PGDATA and OPDATA storage paths.

Never commit the .env file.

## Validation

docker compose config --quiet

## Start

docker compose up -d --build

## Check status

docker compose ps

docker compose logs --tail=100

./scripts/health-check.sh

## Application access

http://localhost:8081

Change the default administrator password.

## Stop

docker compose down

Do not use docker compose down -v unless
intentional data deletion has been authorized.

## Production

Before production deployment:

- Configure HTTPS
- Secure application secrets
- Verify persistent storage
- Implement and test backup restoration
- Restrict network access
- Configure monitoring
- Document rollback procedures
