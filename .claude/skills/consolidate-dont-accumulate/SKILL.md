---
name: consolidate-dont-accumulate
description: Vault cleanup. Two modes — `lint` (default, mechanical hygiene: dead links, orphans, index drift, frontmatter, fully-integrated sources, skill file format, vault-root path references) and `consolidate` (explicit, structural: redundant pages, nested-cluster candidates, stubs, source deletion). Trigger only on explicit user request.
---

# Consolidate Don't Accumulate

Working tree compounds shape; git holds the lineage. This skill keeps the vault consolidating instead of accumulating — pages and files exist for connection-finding, not completeness. See [[Git as Data Layer]] for the architectural commitment.

## When to fire

Explicit user request only. Phrases like "lint the wiki," "consolidate," "clean up the vault," "wiki cleanup," "consolidate-don't-accumulate." Never on session start. Never as a side effect of other work.

## Modes

**`lint` (default).** Mechanical hygiene across `wiki/`, `.claude/skills/*/SKILL.md`, and vault-root canonical files. Mechanical fixes propose as a single batch-approval; substantive moves propose one-at-a-time.

**`consolidate` (explicit: "deep consolidate" / "not just lint" / "shape pass").** Runs `lint` first, then structural shape work — merges, nested-cluster proposals, source retirement.

## What `lint` finds

### In `wiki/`

1. **Dead wikilinks** — `[[Page]]` targets that don't exist in `wiki/`.
2. **Orphans** — pages with zero inbound links from other wiki pages (excluding `overview.md` and `index.md`).
3. **Index drift** — entries in `index.md` pointing at missing files; files in `wiki/` not catalogued in `index.md`.
4. **Frontmatter violations** — missing required fields, missing exactly one `cluster/*` tag, stale `updated` dates relative to last edit.
5. **Sources fully integrated** — for each `wiki/sources/` page, check whether each Key Point is present in the entity/concept pages it links to. If yes, flag for deletion.

### In `.claude/skills/*/SKILL.md`

6. **Frontmatter format** — file must start with `---` on line 1 (no leading blank line, no BOM); YAML must parse; required fields (`name`, `description`) present.
7. **Indentation drift** — paragraphs and list items at unintended indent levels (e.g. a paragraph with leading whitespace that turns it into a code block by accident).

### In vault-root files

8. **Path-reference integrity** — scan `log.md`, `hot-cache.md`, `CLAUDE.md`, `setup.md`, `considering.md`, `dispatch.md` for path references like `` `.claude/skills/X/SKILL.md` `` or `` `wiki/...md` `` and flag any reference to a file that doesn't exist on disk.

## What `consolidate` adds

1. **Redundant pages** — high topical overlap measured by shared cluster, shared load-bearing wikilinks, and concept coverage. Proposes merge with a draft of the consolidated page; result lives at the more canonical slug, redundant slug is deleted.
2. **Nested-cluster candidates** — when 3+ pages share a topical center under one flat cluster, proposes a parent hub with descriptive children (the finance → eating-out / home-purchase / bills shape, with simple notes like "indian meal price" rolling up). Pre-v2 nested tagging this surfaces as a recommendation only.
3. **Stub-vs-section calls** — pages too thin to stand alone that would land cleaner as sections of a parent hub.

## Procedure

1. Read `wiki/.schema.md` — cluster table, page formats, conventions.
2. Read `index.md` — enumerate wiki pages.
3. Walk:
   - `wiki/` — collect frontmatter, wikilinks, page bodies.
   - `.claude/skills/*/SKILL.md` — collect frontmatter and structural format.
   - Vault-root canonical files — extract path-reference candidates.
4. Build inbound-link graph (wiki); compute findings per the lists above.
5. Present findings in one chat block:
   - **Mechanical (batch-confirm):** dead links, index drift, frontmatter gaps, skill-file format issues, broken path references. One approval covers all.
   - **Substantive (per-item):** each move — delete source, merge pages, retire page, propose nested cluster — gets its own block with rationale, affected pages, and (for merges) a draft of the consolidated content.
6. Wait for approval. Per-item yes/no for substantive; batch-yes for mechanical.
7. Execute approved changes:
   - Delete outright. No `_archive/`. Git holds the lineage.
   - Update `index.md` for any wiki page that moved or was deleted.
   - Update `wiki/.schema.md` only if a convention shift was approved (rare; usually a separate `schema-update` operation).
8. Append to `log.md` an entry of the form `## [YYYY-MM-DD] lint | <one-line summary>` followed by a bullet per change. Use `consolidate` instead of `lint` when run in deep mode.
9. Update `hot-cache.md` `last_file_activity`.
10. **Cluster surface check.** If any approved change added, removed, or renamed a cluster tag, end the report with: "Cluster table touched — consider running `graph-colors` to re-project." Do not invoke `graph-colors` automatically.

## What this skill does NOT do

- Run automatically. Always explicit.
- Modify pages without approval (mechanical batch-fixes still require the one batch-yes).
- Create archive folders. Deletion means deletion.
- Re-tag pages. Cluster tag corrections belong to a separate retag pass.
- Apply nested cluster tags. v2 convention is not yet implemented; this skill surfaces candidates only.
- Rewrite the schema. Schema changes happen in `wiki/.schema.md` first via discussion, not here.
- Re-project the Obsidian graph. Cluster tag changes flag a recommendation to run `graph-colors`; the projection itself stays explicit.
- Touch `log.md` or `dispatch.md` content semantically. Path-reference integrity is checked, but cleanup posture for log/dispatch lives in `wiki/.schema.md` conventions and is not skill-driven.

## Source of truth

`wiki/.schema.md` for cluster table, page formats, and operations vocabulary. The existing `LINT` and `consolidate` entries in `.schema.md` reduce to one-line pointers to this skill rather than parallel procedures.
