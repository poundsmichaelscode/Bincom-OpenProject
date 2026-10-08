#!/usr/bin/env bash
set -euo pipefail

echo "Bincom OpenProject Security Audit"
echo "================================"

FAILED=0

check() {
  local description="$1"
  local result="$2"

  if [ "$result" = "pass" ]; then
    echo "PASS: $description"
  else
    echo "WARN: $description"
    FAILED=1
  fi
}

if git check-ignore -q .env; then
  check ".env is Git-ignored" pass
else
  check ".env is Git-ignored" fail
fi

if git ls-files --error-unmatch .env >/dev/null 2>&1; then
  check ".env is not tracked by Git" fail
else
  check ".env is not tracked by Git" pass
fi

if [ -f .env ]; then
  if grep -Eq '^SECRET_KEY_BASE=(OVERWRITE_ME|your-generated.*|)$' .env; then
    check "Application secret is customized" fail
  elif grep -q '^SECRET_KEY_BASE=' .env; then
    check "Application secret is configured" pass
  else
    check "Application secret is configured" fail
  fi
else
  check "Local environment file exists" fail
fi

if docker compose config --quiet >/dev/null 2>&1; then
  check "Docker Compose configuration is valid" pass
else
  check "Docker Compose configuration is valid" fail
fi

if curl -fsS --max-time 10 \
  http://localhost:8081/health_checks/default \
  >/dev/null; then
  check "Local application health" pass
else
  check "Local application health" fail
fi

echo "================================"

if [ "$FAILED" -ne 0 ]; then
  echo "Security audit has findings requiring review."
  exit 1
fi

echo "Basic security checks passed."
echo "Manual production security review is still required."
