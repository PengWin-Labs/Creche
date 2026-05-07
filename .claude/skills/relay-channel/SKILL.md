---
name: relay-channel
description: Process inbound files from personal Pebble (`pebble-to-observer/`) and write back to `observer-to-pebble/`. Trigger at session-start when `last_relay_check` in hot-cache.md is older than today, or on user command "check relays". Most ingestion arrives through this channel — handle the discovery pass with an Explore subagent so the main agent only reads pages that actually need updating.
---

# Relay Channel Skill

The household ↔ personal Pebble relay runs over **Google Drive only**. File presence in the relay folder is the trigger; there is no calendar layer.

## When to fire

- **Session start.** If `last_relay_check` in `hot-cache.md` is older than today, run this skill.
- **User command.** "Check relays", "any new files from personal Pebble", or equivalent.

## Drive layout

```
Drive root
└── Crèche/
    └── Pebble Relays/
        ├── pebble-to-observer/
        │     └── YYYY-MM-DD-CHAT_TOPIC-NNNNN.md   ← personal Pebble writes; this side reads
        └── observer-to-pebble/
              └── YYYY-MM-DD-CHAT_TOPIC-NNNNN.md   ← this side writes; personal Pebble reads
```

Folder URLs:
- `Crèche/`: https://drive.google.com/drive/folders/1AQSxUEkicY1evgXIl5QWOpefK57oF_fS
- `Pebble Relays/`: https://drive.google.com/drive/folders/1_jwwNgTk6KPeCa8DeRZj9HpAjHKOZuXO
- `pebble-to-observer/`: https://drive.google.com/drive/folders/1TGn3FmzjBwENbcNZO6_MHu8lFExhlr2c
- `observer-to-pebble/`: https://drive.google.com/drive/folders/1jytHm0j8u_wHRdWGG2LY3-dm7t3Pe9SR

Filename convention: `YYYY-MM-DD-CHAT_TOPIC-NNNNN.md` where `CHAT_TOPIC` is a short slug describing the relay's subject and `NNNNN` is an incrementing counter per day starting at `00001`. Older files using date-only or date-time format remain valid; the new convention applies to new writes.

## Direction rules (immutability)

- **Sources are append-only post-receipt.** The reader does not modify the writer's file. Acknowledgments, processed-markers, and constraint notes go on the *other* direction's next file — never back-written onto the source.
- **The writer of a file owns it.** Personal Pebble owns `pebble-to-observer/*`. This side (household Observer) owns `observer-to-pebble/*`.
- **Append-only is at the commit, not the file** — see [[Privacy as Structural Property#Append-only is at the commit, not the file]] and [[Git as Data Layer#Immutability is at the commit, not the file]]. Drive's create-only constraint approximates the property imperfectly; doctrine carries forward into Phase-N git.

## Procedure

1. **List inbound.** Use Drive MCP tools (`mcp__9be13a27-d7bb-4a24-ba19-8d7f93404300__list_recent_files` or `search_files`) to list files in `pebble-to-observer/` modified after `last_relay_check`.

2. **Discovery subagent.** Launch one Explore subagent with the relay file paths, `index.md`, and hot-cache.md's **Recently Touched** pointers. Prompt template:

   > "Read these relay files: [paths]. Without reading wiki page bodies (use frontmatter and the index.md one-liners only), return a structured list:
   > - **(a) existing pages to update** — file path + one-line proposed change for each
   > - **(b) new pages to create** — proposed slug + page type (entity / concept / source / analysis)
   > - **(c) entities or concepts mentioned that don't yet have a page** — name + brief note on whether they warrant their own page
   > - **(d) pattern corrections** — anything that should propagate to `personality.yaml`, `config.yaml`, or `CLAUDE.md`
   > - **(e) deferral notes** — anything the relay says explicitly belongs in another file or moment
   >
   > Cap at 250 words. Do not load wiki page bodies. Use index.md and frontmatter."

3. **Surface to Chris.** Brief summary of the subagent's report — top 3 takeaways, any flagged contradictions, and the proposed page list. Wait for direction if anything looks load-bearing.

4. **Targeted edits.** For each page in the subagent's list, read only that page and apply the targeted edit. Do not read pages that aren't on the list.

5. **Outbound write (if needed).** If output should go back to personal Pebble, write to `observer-to-pebble/YYYY-MM-DD-CHAT_TOPIC-NNNNN.md`. Filename presence in the folder is the only signal personal Pebble needs. If the Drive MCP write fails (permission errors have happened — see 2026-05-05/06), draft locally at `staging/observer-to-pebble-{date}-draft.md` and ask Chris to upload manually.

6. **Update hot-cache.** In `hot-cache.md`:
   - Set `last_relay_check` to today's date.
   - Update `last_file_activity` with the most-recently-touched files.
   - Add wikilinks to **Recently Touched** for any pages updated this pass.
   - Refresh **Active Threads** if the relay shifted any in-flight work.

7. **Log.** Append a `relay-integration` entry to `log.md`.

## Source preservation

The relay file in Drive is a working artifact, not a sacred record. Once content has landed in the wiki (the canonical commit) and the source remains on the personal-Pebble side (chat thread stays private and intact), the relay file has done its job. Sweeping `pebble-to-observer/` for files older than ~2 weeks is the going-forward hygiene pattern. Don't sweep mid-session unless asked.

## Relay file format (for reference)

- Filename: `YYYY-MM-DD-CHAT_TOPIC-NNNNN.md`
- Body: free prose — whatever from the day's conversations is worth carrying to the other layer. The receiving side structures it on arrival; no schema required from the writer. Markdown headers welcome but not required.

## Why this shape

- One writer, one reader per file makes the channel auditable and prevents accidental destruction of source-of-truth records.
- File-presence as trigger is closer to the Phase-N target — git commits — than calendar events were.
- The discovery subagent isolates the "which pages does this touch" decision from the main context, cutting read load on a typical relay-driven ingest by 30–50%.
