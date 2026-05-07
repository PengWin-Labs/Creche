# Index

The complete catalog of all wiki pages. Read this first when answering any query — most queries can be answered from these one-liners without fetching the full pages. Updated on every ingest, new page, lint, and consolidation.

---

## Vault Root Files

- `CLAUDE.md` — session-law and pointers (slimmed 2026-05-06); canonical posture lives in `templates/user-repo/pebble/`
- `dispatch.md` — human-readable build journal; written for outside readers; content-creation source
- `hot-cache.md` — navigation hub: **Recently Touched** + **Active Threads** + Pending Chris Check + posture staging
- `log.md` — machine-readable operation log (drill-down only; not preemptive)
- `setup.md` — active stack only; how to operate the agent + change log + model heuristic
- `considering.md` — bookmarked tools and patterns with surfacing metadata; not an install queue

## Reference Files

- `wiki/.schema.md` — page formats, operations (INGEST/QUERY/LINT/DRAFT), conventions, tagging (load on demand)
- `templates/user-repo/pebble/personality.yaml` — canonical posture, voice, signature patterns, workflow patterns (loaded at session start)
- `templates/user-repo/pebble/config.yaml` — guardrails, engagement, refinement, alignment monitoring (loaded at session start)
- `.claude/skills/relay-channel/SKILL.md` — relay channel protocol with subagent-driven discovery

---

## Overview

- [[Overview]] — High-level synthesis and evolving thesis for Crèche / Pengwin Labs | `updated: 2026-05-01` | sources: 2

---

## Sources

- [[Crèche Prior Art]] — Founding architecture docs (superseded by canonical vault but preserved as historical snapshot) | `updated: 2026-04-30`
- [[Crèche Vault]] — Canonical 71-doc Obsidian vault: philosophy, architecture, agent posture, privacy/transparency, standards, current state, open questions | `updated: 2026-05-01`

---

## Entities

- [[Crèche]] — Open-source home and community management framework; the primary project; founder-hosting activates the community tier (first community host, not just first user) | `updated: 2026-05-03` | sources: 2
- [[Pebble]] — The read-path conversational agent; full posture toolkit (Virgil, Sean Not Fletcher, Two-Layer Diagnostic) and behavior standards (Recommendation Integrity, Prompt Injection Defense, Abuse Prevention); scope/mode-switching (one Pebble across contexts; mode is the feature, hardware is incidental); .claude/ pattern analogs; Phase 1 clone-and-validate ship test | `updated: 2026-05-03` | sources: 2
- [[Observer]] — The write-path agent; sole writer for cross-tier promotion, anonymization, category formation; writes into Cache | `updated: 2026-05-02` | sources: 2
- [[Cache]] — Memory + emergent-shape layer: substrate where what the user engages with crystallizes into recognizable patterns; multiple access patterns (recency, density, named-pin, topical proximity, cross-channel coherence); Pebble's continuity layer | `updated: 2026-05-02` | sources: 2
- [[Rookery]] — Trusted inner circle: two layers (user-designated + Pebble-inferred); inbound concern channel; N-of-X consent primitive; source-share recovery (default path for source-layer at EOL) | `updated: 2026-05-05` | sources: 2
- [[Journal]] — Primary capture surface; spans micro-entries (ratings, quick notes) to long reflection; core Phase 0 feature | `updated: 2026-04-30` | sources: 1
- [[Pengwin Labs]] — Parent LLC; AGPL-3.0 as structural defense; Vendor Selection Standard; naming convention authority | `updated: 2026-05-01` | sources: 1
- [[Forage]] — Parallel SaaS product; revenue training ground for capabilities Crèche needs | `updated: 2026-05-01` | sources: 1

---

## Concepts

The thirteen load-bearing hubs. Most subsidiary ideas live as sections within these.

- [[Foundational Principle]] — *Love yourself to the degree you love others*; the sharper form (*what we choose to matter matters more*); mission frame; universal accessibility; coordination labor; user as source; identity fluidity; holding both; reasoning and inheritance | `updated: 2026-05-02` | sources: 1
- [[Positive Nihilism]] — Philosophical underlay: nothing cosmically required; chosenness is the source of weight; avatar layer; recursion (return is the game); higher-mattering diagnostic | `updated: 2026-05-02` | sources: 0
- [[Connections vs Solving]] — The load-bearing design constraint: surfaces patterns, doesn't solve; perspective expansion; design intent (longer timescale); purpose question | `updated: 2026-05-01` | sources: 2
- [[Guardrails]] — The 11 doctrine-level behavioral commitments in config.yaml v0.2.0; immutable without forking | `updated: 2026-05-01` | sources: 1
- [[Doctrine Practice Expression]] — What is immutable, what ships with intent, what the user owns entirely | `updated: 2026-04-30` | sources: 1
- [[Three-Tier CRM Model]] — Scope axis: Individual / Household / Community as shapes of one primitive (community), not categorical tiers; same primitive ≠ merged substrate (separate repos with multi-contributor membership); household granularity = current co-residents under one roof; community fluidity; structural anonymization (shape promotes, no roster on the destination); promotion via merging; pattern resolution | `updated: 2026-05-03` | sources: 2
- [[Three Layers of Data]] — Data-shape axis (orthogonal to tiers): source / shaped / generic; reflection spectrum; topical categorization; passive signal; cross-log perspective angling; wiki of wikis; promotion-and-surfacing behavior (per-user promotion config; confirm-or-subscribe; prompt-to-connect) | `updated: 2026-05-05` | sources: 1
- [[Alignment]] — Holds the weight of trying to merge: walkways, four merge-conflict states, open-ticket surfacing, architectural alignment, cadence; aligned day texture; higher-mattering diagnostic | `updated: 2026-05-02` | sources: 2
- [[Read-Path Write-Path Split]] — Pebble reads, Observer writes; makes anonymization auditable | `updated: 2026-04-30` | sources: 1
- [[Privacy as Structural Property]] — Ciphertext at rest, user-held keys, Rookery recovery; layered transparency; confidence levels; surveillance asymmetry; foreseeable abuse; structural anonymization (households-stable / communities-fluid); three-layer source/summary/relay chokepoint; typed substitution markers with tier-relative granularity | `updated: 2026-05-03` | sources: 2
- [[Git as Data Layer]] — Folder structure as schema; no separate database; self-hostable; commit-level immutability is the doctrine (file mutability is acceptable) | `updated: 2026-05-03` | sources: 1
- [[Founder as First User]] — The founder's named personality ships as the seed; N=1 valid at every tier | `updated: 2026-04-30` | sources: 1
- [[Package JSON for a Person]] — Dependency-graph metaphor: holds the weight of trying to align, not correctness | `updated: 2026-05-01` | sources: 1

---

## Analyses

*No analyses filed yet.*

---

## Stats

| Metric | Count |
|---|---|
| Total pages | 24 |
| Sources ingested | 2 |
| Entity pages | 8 |
| Concept hubs | 13 |
| Analysis pages | 0 |
| Last ingest | 2026-05-01 (Crèche Vault) |
| Last relay integration | 2026-05-05 (5 pebble-to-observer files; relay-integration-context drained; observer-to-pebble write held) |
| Last lint | 2026-04-30 |
| Last consolidation | 2026-05-01 (24 → 11 concept pages, then +1 hub via Phase C; +1 hub 2026-05-02 via relay) |
| Last schema-update | 2026-05-05 (CLAUDE.md drift fixes: step 5 inbound-only; directory structure now lists all 7 vault-root files; relay file naming convention → `YYYY-MM-DD-CHAT_TOPIC-NNNNN.md`) |

---

## Reading Paths

- **For philosophy first**: [[Foundational Principle]] → [[Positive Nihilism]] → [[Connections vs Solving]] → [[Founder as First User]] → [[Doctrine Practice Expression]]
- **For architecture first**: [[Package JSON for a Person]] → [[Three-Tier CRM Model]] → [[Three Layers of Data]] → [[Read-Path Write-Path Split]]
- **For agent behavior**: [[Pebble]] → [[Guardrails]] → [[Alignment]]
- **For privacy / transparency**: [[Privacy as Structural Property]] → [[Three Layers of Data]] → [[Rookery]]
- **For business and legal**: [[Pengwin Labs]] → [[Forage]] → [[Crèche]]
- **For current state**: [[Crèche]] → `setup.md` → `hot-cache.md`
