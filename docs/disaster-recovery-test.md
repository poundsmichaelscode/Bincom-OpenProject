# Bincom OpenProject — Disaster Recovery Test Report

## Test Information

- Date: 8 October 2026
- Environment: Local Docker deployment on macOS
- Application: OpenProject 17
- Database: PostgreSQL 17
- Recovery type: Isolated database restore
- Result: PASS

## Objective

Verify that the OpenProject PostgreSQL backup
can be restored into a separate Docker environment
without modifying the live application database.

## Recovery Procedure

1. Created an isolated Docker volume.
2. Created an internal Docker network.
3. Extracted the PostgreSQL backup into the isolated volume.
4. Started a separate PostgreSQL 17 container.
5. Verified PostgreSQL readiness.
6. Connected to the restored OpenProject database.
7. Queried database metadata and application tables.
8. Confirmed the recovery container had no published host ports.
9. Stopped the recovery container after testing.

## Verification Results

| Test | Result |
|------|--------|
| PostgreSQL startup | PASS |
| Database readiness | PASS |
| Database connection | PASS |
| PostgreSQL version | 17.11 |
| OpenProject tables recovered | 217 |
| Host database ports published | None |
| Live database unaffected | PASS |

## Limitations

This was a database-level recovery test.

A complete application recovery test,
including restored file attachments,
has not yet been performed.

Archive integrity and database connectivity
do not independently prove every application
record is intact.

## Conclusion

The PostgreSQL backup was successfully restored
and validated in an isolated Docker environment.

Database-level disaster recovery test: PASS.

Full application recovery: NOT YET VERIFIED.
