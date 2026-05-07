#!/usr/bin/env bash
# git_ops.sh — branch, commit, push, and open a GitHub PR for nightly retro
#
# Usage:
#   bash git_ops.sh [--dry-run] [--date YYYY-MM-DD]
#
# Token resolution order (first found wins):
#   1. GITHUB_TOKEN env var
#   2. macOS Keychain  (security find-generic-password -s nightly-retro -a github_token)
#   3. ~/.nightly-retro.env file  (GITHUB_TOKEN=ghp_xxx)
#
# Optional env vars:
#   GITHUB_REPO   — owner/repo  (default: PengWin-Labs/Creche)
#   RETRO_BASE    — base branch for PR (default: main)
#   BRAIN_PATH    — absolute path to vault (default: auto-detected)

set -euo pipefail

# ---------------------------------------------------------------------------
# Flags
# ---------------------------------------------------------------------------
DRY_RUN=false
TODAY=$(date +%F)

while [[ $# -gt 0 ]]; do
  case "$1" in
    --dry-run) DRY_RUN=true ;;
    --date)    TODAY="$2"; shift ;;
    *) echo "Unknown arg: $1" >&2; exit 1 ;;
  esac
  shift
done

# ---------------------------------------------------------------------------
# Token resolution (never store plain text in the repo)
# ---------------------------------------------------------------------------
resolve_github_token() {
  # 1. Env var (already exported by caller or shell)
  if [[ -n "${GITHUB_TOKEN:-}" ]]; then
    echo "$GITHUB_TOKEN"; return
  fi

  # 2. macOS Keychain — works natively; no-op in Linux sandbox
  if command -v security &>/dev/null; then
    local kc_token
    kc_token=$(security find-generic-password -s "nightly-retro" -a "github_token" -w 2>/dev/null || true)
    if [[ -n "$kc_token" ]]; then
      echo "$kc_token"; return
    fi
  fi

  # 3. ~/.nightly-retro.env  (chmod 600, never committed)
  local env_file="$HOME/.nightly-retro.env"
  if [[ -f "$env_file" ]]; then
    local file_token
    file_token=$(grep -E "^GITHUB_TOKEN=" "$env_file" | cut -d= -f2- | tr -d '"' | tr -d "'" || true)
    if [[ -n "$file_token" ]]; then
      echo "$file_token"; return
    fi
  fi

  echo ""  # no token found
}

GITHUB_TOKEN=$(resolve_github_token)

# ---------------------------------------------------------------------------
# Config
# ---------------------------------------------------------------------------
GITHUB_REPO="${GITHUB_REPO:-PengWin-Labs/Creche}"
RETRO_BASE="${RETRO_BASE:-main}"
BRANCH="retro/${TODAY}"

# Auto-detect vault path
if [[ -z "${BRAIN_PATH:-}" ]]; then
  BRAIN_PATH=$(find /sessions/*/mnt -maxdepth 1 -name "Chris Brain" -type d 2>/dev/null | head -1 || true)
  [[ -z "$BRAIN_PATH" ]] && BRAIN_PATH="$HOME/Documents/PengWin/Chris/Chris Brain"
fi

if [[ ! -d "$BRAIN_PATH/.git" ]]; then
  echo "ERROR: No git repo at $BRAIN_PATH" >&2; exit 1
fi

cd "$BRAIN_PATH"

RETRO_DIR="retro/${TODAY}"

# ---------------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------------
run() {
  if $DRY_RUN; then echo "[DRY RUN] $*"; else "$@"; fi
}

github_api() {
  local method="$1" endpoint="$2" body="${3:-}"
  if [[ -z "$GITHUB_TOKEN" ]]; then
    echo "ERROR: GITHUB_TOKEN not set — see setup instructions in SKILL.md" >&2; exit 1
  fi
  curl -s -X "$method" \
    -H "Authorization: token $GITHUB_TOKEN" \
    -H "Accept: application/vnd.github.v3+json" \
    -H "Content-Type: application/json" \
    ${body:+-d "$body"} \
    "https://api.github.com/${endpoint}"
}

# ---------------------------------------------------------------------------
# 1. Check for files to commit
# ---------------------------------------------------------------------------
if [[ ! -d "$RETRO_DIR" ]] || [[ -z "$(ls -A "$RETRO_DIR" 2>/dev/null)" ]]; then
  echo "No retro files found in $RETRO_DIR — nothing to commit."
  exit 0
fi

# ---------------------------------------------------------------------------
# 2. Create / switch to retro branch
# ---------------------------------------------------------------------------
echo "→ Branch: $BRANCH"
if git show-ref --verify --quiet "refs/heads/$BRANCH"; then
  run git checkout "$BRANCH"
else
  run git checkout -b "$BRANCH"
fi

# ---------------------------------------------------------------------------
# 3. Commit each digest file individually
# ---------------------------------------------------------------------------
for filepath in "$RETRO_DIR"/*.md; do
  [[ -f "$filepath" ]] || continue
  filename=$(basename "$filepath")
  label="${filename%.md}"

  run git add "$filepath"

  if $DRY_RUN; then
    echo "[DRY RUN] Would commit: $filename"
  elif ! git diff --cached --quiet -- "$filepath" 2>/dev/null; then
    run git commit -m "retro(${TODAY}): concept digest — ${label}"
    echo "  ✓ committed $filename"
  fi
done

# Catch any remaining staged files
if ! $DRY_RUN && ! git diff --cached --quiet; then
  run git commit -m "retro(${TODAY}): supplemental files"
fi

# ---------------------------------------------------------------------------
# 4. Push branch
# ---------------------------------------------------------------------------
echo "→ Pushing $BRANCH"
run git push origin "$BRANCH" --force-with-lease

# ---------------------------------------------------------------------------
# 5. Open GitHub PR (idempotent)
# ---------------------------------------------------------------------------
if [[ -z "$GITHUB_TOKEN" ]]; then
  echo "No GITHUB_TOKEN resolved — skipping PR. Push complete."
  echo "  → To enable PRs: store token in macOS Keychain (see SKILL.md setup)"
  exit 0
fi

echo "→ Checking for existing PR on $BRANCH"
EXISTING=$(github_api GET "repos/${GITHUB_REPO}/pulls?head=${GITHUB_REPO%%/*}:${BRANCH}&state=open" | \
           python3 -c "import json,sys; prs=json.load(sys.stdin); print(prs[0]['html_url'] if prs else '')" 2>/dev/null || true)

if [[ -n "$EXISTING" ]]; then
  echo "PR already open: $EXISTING"
  exit 0
fi

DIGEST_LIST=$(ls "$RETRO_DIR"/*.md 2>/dev/null | xargs -I{} basename {} .md | sed 's/^/- /')

PR_BODY=$(cat <<PREOF
## Nightly Retro — ${TODAY}

Automated concept digest from Cowork sessions and mobile chat exports.
Each commit is one digest file. Review and merge to promote concepts into the wiki.

### Files in this PR
${DIGEST_LIST}

---
_Generated by the nightly-retro skill at 2:00 AM_
PREOF
)

PR_PAYLOAD=$(python3 -c "
import json, sys
print(json.dumps({
  'title': 'Retro ${TODAY}',
  'body':  sys.argv[1],
  'base':  '${RETRO_BASE}',
  'head':  '${BRANCH}'
}))
" "$PR_BODY")

if $DRY_RUN; then
  echo "[DRY RUN] Would create PR for branch $BRANCH"
else
  RESPONSE=$(github_api POST "repos/${GITHUB_REPO}/pulls" "$PR_PAYLOAD")
  PR_URL=$(echo "$RESPONSE" | python3 -c \
    "import json,sys; d=json.load(sys.stdin); print(d.get('html_url','ERROR: '+d.get('message','unknown')))" 2>/dev/null || echo "$RESPONSE")
  echo "✓ PR created: $PR_URL"
fi
