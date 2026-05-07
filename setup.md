# Chris Brain — Stack & Setup

What's currently running, how to operate it, and the change log. Active stack only — bookmarks for tools under evaluation live in `considering.md`; lineage and build narrative live in `dispatch.md`.

---

## Current Stack

| Layer | Tool | Purpose |
|---|---|---|
| Vault host | Obsidian (macOS) | Browse wiki, follow links, graph view |
| LLM agent | Claude Code — `claude-sonnet-4-6` (default) / `claude-opus-4-6` (synthesis) | Reads sources, writes and maintains all wiki pages |
| Agent interface | VSCode extension (Claude Code) | Chat interface to the agent |
| Session law | `CLAUDE.md` (vault root) | Identity, role mapping, session protocol, pointers |
| Posture | `templates/user-repo/pebble/personality.yaml` + `config.yaml` | Canonical stance, voice, guardrails (loaded at session start) |
| Schema reference | `wiki/.schema.md` | Page formats, operations, conventions, tagging (loaded on demand) |
| Source format | Markdown + YAML frontmatter | All wiki pages; compatible with Obsidian natively |
| Cross-linking | Obsidian `[[wikilinks]]` | All entity and concept references throughout wiki |
| Navigation | `hot-cache.md` (Recently Touched + Active Threads) | Working attention layer; index.md + log.md drill-down only |
| Relay channel | Google Drive — `Crèche/Pebble Relays/` | Inbound `pebble-to-observer/` (read at session start via skill); outbound `observer-to-pebble/` (write only) |

### Model switching

`/model claude-opus-4-6` for synthesis passes. `/model claude-sonnet-4-6` to switch back.

When Chris names a task, the agent checks the heuristic below and **proactively says** "this is an Opus task — want to switch before we start?" if it matches. Don't wait for Chris to ask.

**Use Sonnet (default):**
- Targeted edits to a single page
- Session queries — answering a question from the index
- Hot-cache refresh or log append
- Short construction: adding a section, filing an analysis, updating frontmatter
- Anything that fits in 1–3 tool reads

**Switch to Opus — prompt Chris first:**
- Ingesting a new source (reads source + touches 5–15 pages)
- Consolidation / lint pass (reads all or most wiki pages)
- Writing a new hub page that has to reconcile multiple existing pages
- Pattern analysis or synthesis across more than ~5 pages
- Any pass where the output is load-bearing wiki content that will persist

**Rule of thumb:** if the task requires holding more than ~5 pages in tension simultaneously and producing something that stays in the wiki, it's Opus territory.

---

## Directory Structure

```
vault root/
├── CLAUDE.md              ← session-law and pointers
├── index.md               ← content catalog (drill-down only; not preemptively loaded)
├── log.md                 ← machine-readable operation log (append-only; drill-down only)
├── dispatch.md            ← human-readable build journal (outside-reader voice)
├── hot-cache.md           ← working attention: Recently Touched + Active Threads + Pending + posture staging
├── setup.md               ← active stack — what's running, model heuristic, change log (this file)
├── considering.md         ← bookmarked tools and patterns with surfacing metadata; not an install queue
├── raw/                   ← immutable source documents (currently empty post-cleanup)
│   └── assets/            ← downloaded images referenced by sources
├── wiki/                  ← LLM-generated synthesis pages (LLM owns this entirely)
│   ├── .schema.md         ← page formats, operations, conventions, tagging (load on demand)
│   ├── overview.md        ← high-level synthesis and evolving thesis
│   ├── sources/           ← one summary page per ingested source
│   ├── entities/          ← people, places, organizations, products, works
│   ├── concepts/          ← ideas, frameworks, themes, open questions
│   └── analyses/          ← query/spar/draft outputs worth keeping
├── templates/             ← active, evolving Crèche templates
│   └── user-repo/         ← minimum scaffold for any Crèche user
│       └── pebble/        ← canonical posture (personality.yaml) and behavior (config.yaml)
└── .claude/
    └── skills/
        └── relay-channel/ ← inbound/outbound relay protocol
```

The user-repo activates at the vault root when the founder begins using Crèche directly. When that happens, `pebble/`, `journal/`, etc. appear at the root alongside `wiki/` and `templates/`.

Ownership rules and synchronization rule live in `CLAUDE.md`.

---

## Operations and Session Protocol

Session Start Protocol → `CLAUDE.md`. Operations (INGEST, QUERY, LINT, DRAFT) → `wiki/.schema.md`. Sparring posture is always on — see `personality.yaml`.

Everyday triggers:
- `ingest raw/filename` — INGEST operation
- Question about wiki content — QUERY operation
- `lint the wiki` — LINT operation
- `draft the README` / `write a doc for X` — DRAFT operation
- `file this as an analysis` — save current output as `wiki/analyses/`
- `check for new relays` — invoke `relay-channel` skill mid-session

---

## Vault Configuration (Obsidian)

**Files and links:**
- "Attachment folder path" → `raw/assets/`
- "Automatically update internal links" → enabled

**Hotkeys:**
- "Download attachments for current file" → `Ctrl+Shift+D`

---

## Change Log

| Date | Change |
|---|---|
| 2026-04-30 | Initial setup — scaffold created, first ingest (Crèche Prior Art), first lint pass |
| 2026-04-30 | Model upgraded (global settings.json); DRAFT operation added |
| 2026-04-30 | Sparring posture made always-on (default register, not a triggered op). Role mapping (user/household/community) baked into CLAUDE.md. `templates/user-repo/` created at vault root as the active evolving Crèche template — synchronized with CLAUDE.md going forward, no personal details. |
| 2026-05-01 | Phase A sync update against canonical creche-vault: `templates/user-repo/pebble/config.yaml` and `personality.yaml` upgraded 0.1.0 → 0.2.0 (3 new guardrails, expanded stance/patterns/avoids). CLAUDE.md Default Posture synced. Wiki [[Guardrails]] page extended 8 → 11. Phase 0 stack on [[Pebble]] and [[Crèche]] corrected from WhatsApp/SMS/Lambda to Claude app + Google Calendar + GitHub + Pebble-as-Claude-project (WhatsApp / Twilio / Lambda deferred). |
| 2026-05-02 | Model strategy clarified: Sonnet as default, Opus for synthesis passes. Correct strings: `claude-sonnet-4-6` / `claude-opus-4-6`. Switch in Claude Code with `/model <string>`. Agent prompts Chris to switch when task qualifies — see hot-cache.md for heuristic. |
| 2026-05-03 | Relay channel moved to Google Drive (`Crèche/Pebble Relays/{pebble-to-observer,observer-to-pebble}/`). Calendar events removed from the protocol entirely; file presence in Drive is the trigger. |
| 2026-05-05 | setup.md restructured to package.json discipline — active stack only. Tooling bookmarks moved to new `considering.md` (with surfacing metadata per entry). Pattern Reference (Karpathy LLM Wiki lineage) and "How This Was Set Up" narrative moved to `dispatch.md`. CLAUDE.md drift fixes: Session Start step 5 clarified to inbound-only; `considering.md` added to directory structure. |
| 2026-05-06 | Token-load reduction. CLAUDE.md slimmed (627 → ~180 lines): Page Formats / Operations / conventions moved to new `wiki/.schema.md` (loaded on demand); Default Posture deleted (canonical lives in `personality.yaml` + `config.yaml`, now loaded directly at session start); Workflow Patterns folded into `personality.yaml`. Relay Channel section moved to new `.claude/skills/relay-channel/SKILL.md` with subagent-driven discovery step. hot-cache.md stripped to navigation pointers (**Recently Touched**, **Active Threads**, Pending). Session Start Protocol updated: `index.md` and `log.md` are drill-down only, no longer preemptive reads. Model heuristic moved here from hot-cache. |
