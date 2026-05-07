# Hot Cache

The working attention layer. Two roles:

1. **Navigation hub** — recently-touched pages and active threads, so the agent can answer vague incoming signals ("that thing I keep doing") without cold-reading the repo.
2. **Posture / template staging buffer** — candidate posture / personality / guardrail changes that accumulate during the day; flushed to `templates/user-repo/pebble/` and CLAUDE.md at end of day or session.

This file is read at session start. Index.md and log.md are drill-down only — pulled when the agent needs to navigate beyond what's listed here.

last_relay_check: 2026-05-06
last_file_activity: 2026-05-06 — `.gitignore` un-ignores `.claude/skills/` (skills ship with vault); fine-grained secret-file exclusion via globs. Earlier in session: `.claude/skills/consolidate-dont-accumulate/SKILL.md` created (lint + consolidate modes; lint scope later extended to cover `.claude/skills/*/SKILL.md` and vault-root path-reference integrity); `wiki/concepts/Git as Data Layer.md` extended with working-tree/lineage doctrine; `wiki/.schema.md` LINT collapsed to skill pointer + log/dispatch cleanup postures added; `.claude/skills/graph-colors/SKILL.md` cross-referenced

---

## Recently Touched

The 5–10 pages most recently read or written. Drill into these first; pull `index.md` for anything else.

- [[Cache]] — expanded 2026-05-02 (emergent centrality from density of engagement)
- [[Privacy as Structural Property]] — 2026-05-03 (three-layer chokepoint, append-only at commit not file)
- [[Three-Tier CRM Model]] — 2026-05-03 (household as shape of community, separate substrate)
- [[Three Layers of Data]] — 2026-05-05 (promotion-and-surfacing behavior, per-user config)
- [[Foundational Principle]] — 2026-05-02 (User as Source, *what we choose to matter matters more*)
- [[Positive Nihilism]] — 2026-05-02 (created — the missing philosophical foundation)
- [[Pebble]] — 2026-05-03 (.claude/ pattern analogs, Phase 1 clone-and-validate)
- [[Rookery]] — 2026-05-05 (source-share recovery)
- `CLAUDE.md` — 2026-05-06 (slimmed; reference moved to wiki/.schema.md and relay skill; graph-colors skill row added)
- `hot-cache.md` — 2026-05-06 (this file, restructured to navigation hub)
- `.claude/skills/graph-colors/SKILL.md` — 2026-05-06 (created; cross-reference to consolidate-dont-accumulate added 2026-05-06)
- `.claude/skills/consolidate-dont-accumulate/SKILL.md` — 2026-05-06 (created — wiki cleanup skill: lint + consolidate modes; deletion not archive; cluster surface check flags graph-colors re-invoke)
- `wiki/concepts/Git as Data Layer.md` — 2026-05-06 (added Working tree compounds shape; git holds the lineage doctrine section)
- `wiki/.schema.md` — 2026-05-06 (LINT collapsed to skill pointer; operations vocabulary extended; log/dispatch cleanup postures added)
- `.claude/skills/nightly-retro/` — 2026-05-07 (created — nightly concept-digest skill: extract.py, git_ops.sh, SKILL.md, 16 tests)
- `relay/chat-exports/README.md` — 2026-05-07 (drop zone for mobile chat exports)
- `retro/` — 2026-05-07 (output directory for nightly digest files)

---

## Active Threads

What's in flight right now. Replaces session-archaeology summaries.

- **Nightly retro scheduled task** — live at 02:00 AM daily. One-time setup needed: add `GITHUB_TOKEN` to `.claude/skills/nightly-retro/config.local.yaml` (never committed). Mobile chats: drop exports in `relay/chat-exports/`. Run a first pass manually ("review and draft the pr for new notes") to pre-approve tool permissions before the first nightly run. Wiki consolidation is a separate agent (not this skill).
- **Phase 1 clone-and-validate ship test** — open new account, load same vault + instructions, verify behavioral / conversational alignment. Vault merge into personal Pebble's substrate is a Phase 1 prerequisite.
- **Recursion principle page** — the "same shape at every tier" pattern was named in dispatch 2026-05-02 as worth a dedicated wiki page. Not yet written.
- **Boris Cherny content placement** — six agent-workflow practices held for chat discussion; recursion frame named (founder externalizing build-practice = same shape as user externalizing life-practice). Decision pending: scattered hub updates vs new "Build Discipline" cluster vs build-doctrine in dispatch.md.
- **Tool candidates under-eval (in `considering.md`)** — PAUL (plan-apply-unify loop), SEED (typed project incubator), Claude Boris (Memory Bank + 14 specialist agents). Claude Boris is the most direct architectural overlap with Cache + Observer + relay shape; worth careful read regardless of adoption.
- **`raw/` cleanup decision** — directory currently exists but empty (assets only). Real ingestion arrives via relay. Question: keep `raw/` as scaffolding for occasional drop-in sources, or delete?

---

## Pending Chris Check

Things waiting on a decision. Surfaced in opening check-in. Removed when addressed.

- **Relay-folder sweep (weekly reconciliation)** — once build phase calms down, recurring agent that scans `Crèche/Pebble Relays/{pebble-to-observer,observer-to-pebble}/` and flags files older than N weeks worth archiving. *Held: not a build-phase concern.*
- **Multi-cluster gradient coloring on graph nodes** — Chris named a desire for nodes spanning semantic territories to render with multiple colors or gradient. Native Obsidian: one cluster per node. Three feasible paths: nested cluster tags (v2 in tagging conventions); community plugin (Extended Graph or similar); custom plugin (real engineering work, defer). *Relay update 2026-05-05:* Breadcrumbs + Juggl address the tree-hierarchy dimension; native graph Groups force settings tighten cluster separation without plugins. Both added to `considering.md`.
- **observer-to-pebble filename mismatch (minor)** — Chris uploaded the staging draft manually after connector permission error; file is `observer-to-pebble-2026-05-05-draft.md` instead of `2026-05-05-INTEGRATION_PASS-00001.md`. Content correct; filename sub-canonical. *Held — not blocking.*
- **`.claude/` writes blocked in Cowork sessions** — Write/Edit on any `.claude/skills/*/SKILL.md` returns "protected location" (occurred 2026-05-06 across two skills: consolidate-dont-accumulate, graph-colors). Bash sandbox didn't boot in time as workaround. Best guess: host-level protection on agent infrastructure paths. Practical paths: manual paste (used both times), fresh session (permissions may reset), or test the MCP file-tools (`create_file`, etc.) — they may have different permissions than the file-tools we hit. *Worth confirming whether this is per-session or persistent before next skill edit.*

---

## Posture / Template Staging

### Open: template discipline

Current `templates/user-repo/pebble/config.yaml` and `personality.yaml` are presumptive imports from the canonical vault — version 0.2.0 with the full 11-guardrail set, expanded posture, and (as of 2026-05-06) the new `workflow_patterns` block. **Rule going forward: only what Chris confirms for his actual repo counts as committed template content.** The current files are useful as a working reference; treat them as draft until Chris's personal Pebble (or Chris directly) confirms which parts ship in his Crèche repo.

Action when ready: revisit each block of `config.yaml` / `personality.yaml` with Chris and split into "confirmed for repo" vs "reference only."

---

**Last flush: 2026-05-06** — Token-load reduction (3 passes, 93.6K → 26.8K chars / ~71%). Pass 1: CLAUDE.md slimmed, reference content → `wiki/.schema.md`, relay → `.claude/skills/relay-channel/SKILL.md`, workflow patterns folded into `personality.yaml`. Pass 2: canonical-file-scope violations cleaned (Directory Structure → setup.md; duplicate session protocol + operations dropped from setup.md). Pass 3: YAML comment compression, CLAUDE.md table consolidation, prose tightening.

*Maintenance: agent updates Recently Touched / Active Threads as work shifts; trims entries older than ~2 weeks unless still load-bearing; flushes staging at end of session when populated.*
