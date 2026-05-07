# Crèche User-Repo Template (Working)

This is the **active, evolving** template for a Crèche user-repo. It is the minimum scaffold a new user gets when they onboard. As the schema and Crèche design refine, this template refines with them.

## Relationship to other locations

- **`raw/creche-prior-art/creche/templates/user-repo/`** — the historical snapshot of the prior art, frozen as ingested. Read-only.
- **`templates/user-repo/`** (this folder) — the current working template, edited as Crèche evolves. The version this should match if/when shipped.
- **The vault root itself** — the founder's actual Crèche user-repo (current and future). The wiki layer (`wiki/`) is additive — it's the synthesis-and-refinement workspace that lives alongside the user-repo.

## Rules

- No personal details. Everything in this folder must be transferable to any user without modification.
- Comments in YAML files are load-bearing — preserve them.
- The seed personality (`pebble/personality.yaml`) is the founder's voice as doctrine-made-visible. Keep it. New users fork it if they want a different shape.
- The guardrails in `pebble/config.yaml` are doctrine and immutable in user-side files.

## Structure

```
templates/user-repo/
├── pebble/
│   ├── config.yaml            agent behavior; mostly practice, guardrails are doctrine
│   └── personality.yaml       seed personality (practice, forkable)
├── skills/
│   └── config.yaml            skills marketplace config (practice)
├── journal/.gitkeep           expression — user content
├── tasks/.gitkeep             expression — user content
├── memory/.gitkeep            expression — user content
├── observers/.gitkeep         doctrine logic + expression outputs
├── agents/.gitkeep            doctrine — agent definitions
└── equipment/.gitkeep         expression — user inventory
```

See `wiki/concepts/Doctrine Practice Expression.md` for what each category means.
