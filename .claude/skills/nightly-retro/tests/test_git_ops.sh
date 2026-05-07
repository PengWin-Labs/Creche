#!/usr/bin/env bash
# Integration tests for git_ops.sh  (dry-run only — no commits/pushes)
# Run: bash tests/test_git_ops.sh

SKILL_DIR="$(cd "$(dirname "$0")/.." && pwd)"
GIT_OPS="$SKILL_DIR/git_ops.sh"
PASS=0; FAIL=0

green() { printf "\033[32m✓ %s\033[0m\n" "$1"; }
red()   { printf "\033[31m✗ %s\033[0m\n" "$1"; }

pass() { green "$1"; PASS=$((PASS + 1)); }
fail() { red   "$1"; FAIL=$((FAIL + 1)); }

assert_contains() {
  local label="$1" needle="$2" haystack="$3"
  if echo "$haystack" | grep -qE "$needle"; then
    pass "$label"
  else
    fail "$label (expected: '$needle')"
    echo "  Got: $haystack"
  fi
}

echo "=== git_ops.sh integration tests (dry-run mode) ==="
echo ""

# Test 1: script is executable
if [[ -x "$GIT_OPS" ]]; then
  pass "git_ops.sh is executable"
else
  fail "git_ops.sh is not executable"
fi

# Test 2: --dry-run flag is accepted (may print "No retro files" or "[DRY RUN]")
OUTPUT=$(bash "$GIT_OPS" --dry-run 2>&1) || true
assert_contains "--dry-run produces expected output" \
  "DRY RUN|No retro files|nothing to commit|Branch:" "$OUTPUT"

# Test 3: unknown flag exits non-zero
bash "$GIT_OPS" --unknown-flag 2>/dev/null
CODE=$?
if [[ $CODE -ne 0 ]]; then
  pass "Unknown flag exits non-zero (exit $CODE)"
else
  fail "Unknown flag should exit non-zero"
fi

# Test 4: --date flag is accepted
OUTPUT=$(bash "$GIT_OPS" --dry-run --date 2026-01-01 2>&1) || true
assert_contains "--date flag accepted" "2026-01-01|No retro files|DRY RUN" "$OUTPUT"

# Test 5: BRAIN_PATH with no .git exits non-zero
BRAIN_PATH=/tmp bash "$GIT_OPS" --dry-run 2>/dev/null
CODE=$?
if [[ $CODE -ne 0 ]]; then
  pass "No .git dir exits non-zero (exit $CODE)"
else
  fail "Should exit non-zero when BRAIN_PATH has no .git"
fi

echo ""
echo "=== Results: $PASS passed, $FAIL failed ==="
exit $FAIL
