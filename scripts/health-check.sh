#!/usr/bin/env bash
set -euo pipefail

BASE_URL="${1:-http://localhost:8081}"
HEALTH_URL="${BASE_URL%/}/health_checks/default"

echo "Checking OpenProject: $HEALTH_URL"

if curl --fail --silent --show-error \
  --connect-timeout 5 \
  --max-time 20 \
  "$HEALTH_URL"; then
  echo
  echo "PASS: OpenProject is healthy."
else
  echo "FAIL: OpenProject health check failed."
  exit 1
fi
