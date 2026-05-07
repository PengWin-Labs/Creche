---
title: Git as Data Layer
type: concept
tags: [cluster/architecture, architecture, technology, framework]
sources: [Crèche Prior Art]
created: 2026-04-30
updated: 2026-05-06
---

## Definition

The architectural decision at the core of [[Crèche]]: git is the data layer. No separate relational database. The folder structure of the user's repository is the schema. Git's graph topology — commits as events, branches as parallel narratives, repos as scopes, orgs as collections of scopes — already describes the structure that CRM systems spend enormous effort emulating in relational databases.

## How It Works / Mechanism

### Folder structure as schema
Each user repo has a fixed top-level shape that is the data model:
```
pebble/       — agent behavior config and seed personality
journal/      — daily/event journals
tasks/        — tasks and task state
memory/       — named memory entries and snippets
observers/    — Observer outputs for this user
agents/       — installed agent definitions
equipment/    — user-owned inventory, vendors, receipts
skills/       — marketplace config
```

### Branch conventions
- **Daily branch** (`day/YYYY-MM-DD`): created at first interaction of the day, trigger keywords cause commits during the day, merged to main at end of day
- **Topic branches**: long-running reflections or projects, merge when the user is ready
- **Observer branches**: Observer writes outputs on dedicated branches, promotes to household/community by pushing to the appropriate org repo

### Immutability is at the commit, not the file

The immutable unit is the commit hash. Files mutate freely; history is what gets preserved. This is "git is the database" at the right granularity — file-level append-only would be a substrate quirk; commit-level append-only is the structural property.

Pre-write enforcement is structurally required at any persistent surface, regardless of whether the substrate allows file edits — committed-then-corrected still leaves the original in history. The chokepoint sits at the commit boundary.

Phase 0's Drive-based relay channel happens to be create-only-no-update on the file level, which looks like file-level immutability but is a substrate artifact that approximates commit-level immutability imperfectly. When the channel collapses into actual git commits (Phase N), the doctrine carries unchanged; what changes is that files become editable while the commit graph stays append-only. See [[Privacy as Structural Property#Append-only is at the commit, not the file]] for the privacy-side framing of the same point.

### Working tree compounds shape; git holds the lineage

Architectural corollary for the working tree itself: pages and files exist for connection-finding, not completeness. Synthesis is the load-bearing artifact; sources are scaffolding to be dismantled once integrated. Redundant pages get merged or deleted outright — commit history is the archive, so an `_archive/` folder inside the repo would be belt-and-suspenders that just clutters the graph. The skill `.claude/skills/consolidate-dont-accumulate/` operationalizes this for the wiki layer; each canonical file declares its own cleanup posture in `wiki/.schema.md` conventions (e.g. `log.md` is git-redundant and prunable; `dispatch.md` is historical record and immortal). Personal repos hold this loosely; community/household tiers hold it strictly.

### Why git instead of a relational database
- Relational databases are optimized for point queries; [[Crèche]]'s access pattern is shallow reads of a handful of files in a known layout — which git handles well
- GitHub's per-repo/per-org access control maps exactly to the [[Three-Tier CRM Model]] — row-level security in a relational DB would re-invent what git already provides
- Self-hosting is trivially supported — a git remote is easy to self-host; a relational database is not
- Promotion between tiers is a commit — visible, auditable, not an opaque database operation

## Evidence & Examples

The `.gitkeep` files in template directories are described as "load-bearing" — they preserve the schema even before content exists ([[Crèche Prior Art]]).

Promotion from household to community scope appears in git history as a commit: "this record was promoted from household X to community on date Y by Observer" — a git object, not a database operation ([[Crèche Prior Art]]).

## Connections

Git as Data Layer is how [[Cache]] is implemented — Cache is not a separate service, it is the conventions by which the git repo functions as addressable memory. It is also what makes [[Privacy as Structural Property]] achievable without a new infrastructure layer: encryption can be applied as a git-level convention (git-crypt, age, or SOPS) without changing the repo structure.

## Evolution

Extended 2026-05-03 from Observer relay (`pebble-to-observer/2026-05-03-0840`) and Chris's worked resolution (Q1 in `relay-integration-context.md`): added `### Immutability is at the commit, not the file`. Doctrine is commit-level immutability; file mutability is acceptable. Drive's create-only constraint approximates the property imperfectly because of substrate, not because immutability applies to the file. Cross-linked to [[Privacy as Structural Property#Append-only is at the commit, not the file]].

First ingested source. No prior evolution.

## Open Questions

- How does Cache handle the performance of shallow reads as repo history grows over years of daily journals?
- What is the retrieval mechanism for "named memories matching conversation cues" at query time?
- How does merge conflict resolution work for household-scope repos when two members write simultaneously?
