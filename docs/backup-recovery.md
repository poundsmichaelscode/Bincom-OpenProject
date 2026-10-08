# Bincom OpenProject — Backup and Recovery

## Backup Strategy

This deployment uses the upstream OpenProject
control/backup tooling for offline backups.

The backup includes:
- PostgreSQL database storage
- OpenProject uploaded attachments

Backups are stored in the local backups/ directory.

## Offline Backup Procedure

1. Schedule maintenance downtime.
2. Confirm the backup storage location.
3. Stop OpenProject:

   docker compose down

4. Build the backup service:

   docker compose -f docker-compose.yml \
     -f docker-compose.control.yml build backup

5. Execute the backup without starting dependencies:

   docker compose -f docker-compose.yml \
     -f docker-compose.control.yml \
     run --rm --no-deps backup

6. Verify archive integrity:

   gzip -t backups/*.tar.gz

7. Restart the application:

   docker compose up -d

8. Check application health:

   ./scripts/health-check.sh

## Security

Never commit backups to Git.

Backup archives contain sensitive application
and database information.

Store production backups in secure storage
with restricted permissions and encryption.

## Recovery

A complete recovery requires both the PostgreSQL
archive and the corresponding attachment archive.

A restore procedure must be tested in an isolated
environment before being approved for production.

Do not overwrite an existing production database
without a separately verified recovery plan.
