#!/usr/bin/env bash
# run_tests.sh — runs all nightly-retro tests
# Usage: bash tests/run_tests.sh [--fail-fast]

TESTS_DIR="$(cd "$(dirname "$0")" && pwd)"
FAIL_FAST=false
[[ "${1:-}" == "--fail-fast" ]] && FAIL_FAST=true

PASS=0; FAIL=0

run_suite() {
  local name="$1" cmd="$2"
  echo ""
  echo "━━━ $name ━━━"
  if eval "$cmd"; then
    PASS=$((PASS + 1)); echo "  → PASS"
  else
    FAIL=$((FAIL + 1)); echo "  → FAIL"
    $FAIL_FAST && exit 1
  fi
}

run_suite "extract.py unit tests" \
  "python3 '$TESTS_DIR/test_extract.py'"

run_suite "git_ops.sh integration tests" \
  "bash '$TESTS_DIR/test_git_ops.sh'"

echo ""
echo "══════════════════════════════════"
echo " Total: $PASS suite(s) passed, $FAIL suite(s) failed"
echo "══════════════════════════════════"
exit $FAIL
