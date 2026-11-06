#!/usr/bin/env bash
set -euo pipefail

BASE_URL="${1:-http://localhost:3000}"

# Print only the HTTP status code of a request ("000" if the server cannot be reached)
http_code() {
  curl -s -o /dev/null -w "%{http_code}" "$@" || true
}

check() {
  local name="$1" expected="$2" actual="$3"
  if [ "$actual" != "$expected" ]; then
    echo "FAIL: $name returned $actual, expected $expected"
    exit 1
  fi
  echo "OK: $name returned $expected"
}

status=$(http_code "$BASE_URL/health")
check "GET /health" 200 "$status"

status=$(http_code -X POST "$BASE_URL/tickets" \
  -H "Content-Type: application/json" \
  -d '{"title":"smoke","priority":"low"}')
check "POST /tickets with title" 201 "$status"

status=$(http_code -X POST "$BASE_URL/tickets" \
  -H "Content-Type: application/json" \
  -d '{"priority":"low"}')
check "POST /tickets without title" 400 "$status"

echo "All smoke tests passed"
