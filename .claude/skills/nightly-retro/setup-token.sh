#!/usr/bin/env bash
# setup-token.sh — store your GitHub token securely (run once)
#
# Usage: bash .claude/skills/nightly-retro/setup-token.sh
#
# Tries macOS Keychain first (best), falls back to ~/.nightly-retro.env.

set -euo pipefail

read -rsp "GitHub personal access token (repo scope): " TOKEN
echo ""

if [[ -z "$TOKEN" ]]; then
  echo "No token entered. Aborted." >&2; exit 1
fi

# -- macOS Keychain (preferred) -------------------------------------------
if command -v security &>/dev/null; then
  # Delete old entry silently if it exists
  security delete-generic-password -s "nightly-retro" -a "github_token" 2>/dev/null || true
  security add-generic-password -s "nightly-retro" -a "github_token" -w "$TOKEN"
  echo "✓ Token stored in macOS Keychain (service: nightly-retro, account: github_token)"
  echo "  Verify with: security find-generic-password -s nightly-retro -a github_token -w"
  exit 0
fi

# -- Fallback: ~/.nightly-retro.env (chmod 600) ---------------------------
ENV_FILE="$HOME/.nightly-retro.env"
echo "GITHUB_TOKEN=${TOKEN}" > "$ENV_FILE"
chmod 600 "$ENV_FILE"
echo "✓ Token stored in $ENV_FILE (permissions: 600)"
echo "  Note: macOS Keychain not available on this system — file is plain text."
echo "  Keep $ENV_FILE outside any git repo and never commit it."
