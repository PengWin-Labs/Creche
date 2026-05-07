---
name: nightly-retro
description: >
  Nightly concept-digest retro. Reads Cowork session transcripts and mobile
  chat exports, extracts core concepts and decisions (no personal details),
  writes one Markdown digest per source, commits each file to a dated retro
  branch, and opens a GitHub PR for review. Also runs on the manual phrase
  "review and draft the pr for new notes".
manual_trigger: "review and draft the pr for new notes"
schedule: "0 2 * * *"  # 2:00 AM local time
---

# Nightly Retro Skill

You are running the **nightly-retro** pipeline for the Chris Brain vault.

## Objective

Extract intellectual signal from today's conversations, commit digests to a
dated git branch, and open a GitHub PR on PengWin-Labs/Creche for review.

## Vault Location

The vault lives at:
- Native macOS: `~/Documents/PengWin/Chris/Chris Brain/`
- Cowork sandbox: auto-detected via `find /sessions/*/mnt -name "Chris Brain"`

All paths below are relative to the vault root.

## Step 1 — Discover Sources

### A. Cowork session transcripts
Use `mcp__session_info__list_sessions` to list today's sessions.
For each session created or active today, use `mcp__session_info__read_transcript`
to get the full transcript text.

Skip sessions that are less than 500 characters (too short to extract from).

### B. Mobile chat drop zone
Check `relay/chat-exports/` for any `.md` or `.txt` files modified today.
Read each file's content. After processing, move it to `relay/chat-exports/processed/YYYY-MM-DD/`.
If the processed directory doesn't exist, create it.

## Step 2 — Extract Concepts

For each source discovered above:

1. Determine a `source_label`:
   - Cowork sessions: `cowork-{session_id_short}` (first 8 chars of session ID)
   - Drop-zone files: the filename without extension

2. Run the extraction script:
   ```bash
   BRAIN_PATH=$(find /sessions/*/mnt -maxdepth 1 -name "Chris Brain" -type d 2>/dev/null | head -1)
   python3 "$BRAIN_PATH/.claude/skills/nightly-retro/extract.py" \
     --source-label "SOURCE_LABEL" \
     INPUT_FILE_OR_STDIN
   ```
   Or pipe content:
   ```bash
   echo "TRANSCRIPT_TEXT" | python3 extract.py - --source-label "cowork-abc12345"
   ```

3. Write the output to:
   `retro/YYYY-MM-DD/YYYY-MM-DD-SOURCE_LABEL.md`

   Create the directory if it doesn't exist.

4. If a digest file already exists for this source, skip it (idempotent).

## Step 3 — Git Workflow

After writing all digest files, run the git workflow script:

```bash
BRAIN_PATH=$(find /sessions/*/mnt -maxdepth 1 -name "Chris Brain" -type d 2>/dev/null | head -1)
export GITHUB_TOKEN="$(cat "$BRAIN_PATH/.claude/skills/nightly-retro/config.local.yaml" \
  2>/dev/null | python3 -c "import sys,re; m=re.search(r'github_token:\s*(.+)', sys.stdin.read()); print(m.group(1).strip() if m else '')" 2>/dev/null || true)"
bash "$BRAIN_PATH/.claude/skills/nightly-retro/git_ops.sh"
```

The script handles: branch creation, per-file commits, push, and PR creation.

## Step 4 — Report Back

After the run, output a brief summary:

```
Nightly Retro — YYYY-MM-DD
  Sources processed: N (M Cowork sessions, K drop-zone files)
  Digests written: N files in retro/YYYY-MM-DD/
  Branch: retro/YYYY-MM-DD
  PR: <URL or "skipped — no GITHUB_TOKEN">
  Skipped: X (empty / already processed)
```

## Configuration File

Read GitHub token from `config.local.yaml` (never committed — in .gitignore):
```yaml
github_token: ghp_xxxxxxxxxxxxxxxxxxxx
```

If `GITHUB_TOKEN` env var is set, that takes precedence.

## Error Handling

- If no sources are found: log "No new content today" and exit cleanly.
- If a single extraction fails: log the error, continue with other sources.
- If git push fails (auth): log the error, leave files committed locally.
- Always exit cleanly — never crash the scheduler.

## Dry Run Mode

When triggered manually with `--dry-run` appended, or when the phrase includes
"dry run", run `git_ops.sh --dry-run` and do not push or create a PR.
Print what would happen instead.

## Tests

Run the test suite to verify the skill is working:
```bash
BRAIN_PATH=$(find /sessions/*/mnt -maxdepth 1 -name "Chris Brain" -type d 2>/dev/null | head -1)
bash "$BRAIN_PATH/.claude/skills/nightly-retro/tests/run_tests.sh"
```
