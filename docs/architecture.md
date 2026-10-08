# Bincom OpenProject — Deployment Architecture

## Overview

This repository provides a Docker Compose deployment
of OpenProject 17 for the Bincom client project.

OpenProject is an open-source project management platform.
This repository focuses on deployment and infrastructure
engineering, not development of the OpenProject application.

## Services

| Service | Responsibility |
|---------|----------------|
| proxy | Caddy HTTP reverse proxy |
| web | OpenProject web application |
| db | PostgreSQL database |
| cache | Memcached |
| worker | Background job processing |
| cron | Scheduled tasks |
| seeder | Application database initialization |
| hocuspocus | Real-time document collaboration |
| autoheal | Container health recovery |

## Networking

Two Docker networks are configured:

- frontend: Proxy and application-facing services
- backend: Application, database, and supporting services

The PostgreSQL database is not published directly
to the host.

## Local configuration

Application URL: http://localhost:8081

HTTPS: Disabled for localhost development.

Production deployments must use HTTPS and
client-controlled infrastructure.

## Persistence

The database and attachment storage use configurable
PGDATA and OPDATA mount paths.

Actual persistence must be verified on the deployment host.

## Security

- Secrets are stored outside Git.
- The .env file is ignored.
- Database ports are not publicly exposed.
- Production requires HTTPS.
- Default administrator credentials must be changed.

## Upstream

https://github.com/opf/openproject-docker-compose
