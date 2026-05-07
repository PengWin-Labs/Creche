---
name: graph-colors
description: Project the cluster→color table from `wiki/.schema.md` onto `.obsidian/graph.json → colorGroups`. Trigger only on explicit user request. Never run automatically. Touches only the `colorGroups` field; preserves all other graph settings.
---

# Graph Colors Skill

Cluster→color is a documented convention (`wiki/.schema.md` Tagging Conventions). Obsidian persists the projection in `.obsidian/graph.json`. That file is gitignored. This skill rebuilds it from the schema on demand.

## When to fire

Explicit user request only — phrases like "reapply graph colors", "rebuild graph colors", "graph colors are gone." Never on session start. Never as a side effect of other work — the user may be tweaking forces, scale, or filters in graph.json that should not be stomped.

## What this skill does

Reads the cluster table in `wiki/.schema.md` and writes a corresponding `colorGroups` array into `.obsidian/graph.json`, preserving every other field.

## What this skill does NOT do

- Modify any field other than `colorGroups`.
- Add cluster tags to pages or validate page tagging.
- Edit the schema. Schema changes happen in `wiki/.schema.md` first; this skill only projects.

## Procedure

1. Read `wiki/.schema.md`. Locate the cluster table under `## Tagging Conventions → Cluster tags`. Each row has the shape `` | `cluster/<name>` | `#hex` | ... | ``.

2. For each row, build a color group entry:
   ```json
   {"query": "tag:#cluster/<name>", "color": {"a": 1, "rgb": <decimal int of hex>}}
   ```
   The `rgb` value is the hex converted to a decimal integer (e.g. `#1e3a8a` → `1981066`).

3. Read `.obsidian/graph.json`. Replace **only** the `colorGroups` field with the new array. Leave every other key (forces, scale, filters, search, etc.) untouched.

4. Write the file back.

5. Report: number of groups applied, the cluster names, and a reminder to reopen the graph view.

## Coordination with consolidate-dont-accumulate

The cleanup skill (`.claude/skills/consolidate-dont-accumulate/SKILL.md`) reports cluster tag changes at the end of its run as a recommendation to invoke this skill. It does not invoke automatically — projection stays explicit because the user may be tweaking forces, scale, or filters in graph.json that should not be stomped.

## Source of truth

`wiki/.schema.md` cluster table is canonical. To change a color, edit the hex in the schema, then ask for reapply. Do not edit `colorGroups` directly in graph.json — it'll be overwritten next reapply.
