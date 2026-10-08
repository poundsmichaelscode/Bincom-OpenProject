# Bincom OpenProject — Security Checklist

## Environment and secrets

- [ ] Environment secrets are excluded from Git
- [ ] SECRET_KEY_BASE is securely generated
- [ ] PostgreSQL credentials are unique
- [ ] Database URL and database credentials match
- [ ] Collaboration service secret is unique
- [ ] No actual passwords appear in documentation
- [ ] Default administrator password has been changed

## Docker security

- [ ] PostgreSQL is not publicly exposed
- [ ] Application networks are configured correctly
- [ ] Docker images are regularly updated
- [ ] Docker socket access is reviewed
- [ ] Container health checks are enabled
- [ ] Persistent storage is protected

## Production security

- [ ] HTTPS is enabled
- [ ] Domain and reverse proxy are configured
- [ ] Firewall permits only necessary connections
- [ ] SSH access is restricted
- [ ] Database backups are encrypted
- [ ] Restore procedures are documented
- [ ] Administrator access is limited
- [ ] Monitoring and alerting are configured

## Current deployment

The application currently runs locally at:

http://localhost:8081

This local HTTP configuration is intended for
development and validation only.

Do not expose the current development instance
directly to the internet.

## Recovery

An isolated PostgreSQL 17 recovery test passed.

Full application and attachment restoration
remains pending.
