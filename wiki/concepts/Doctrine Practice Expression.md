---
title: Doctrine Practice Expression
type: concept
tags: [cluster/doctrine, framework, architecture, philosophy]
sources: [Crèche Prior Art]
created: 2026-04-30
updated: 2026-04-30
---

## Definition

The three-category system in [[Crèche]] that governs what is immutable, what ships with intent but is user-editable, and what is fully owned by the user. Without this split, every change to a user-facing file reads as a change to the framework, and disagreements about values become code-level arguments.

## How It Works / Mechanism

### Doctrine
Framework-level commitments. Immutable in user-side files. Changing doctrine requires forking the project. The existence of this category is what makes the framework's values verifiable — users can see exactly what they are subscribing to.

Examples: crisis suspends the philosophical framework; [[Read-Path Write-Path Split]]; authenticity without exposure; [[Three-Tier CRM Model]] mapped to git; free-path connector tier as default.

### Practice
Defaults shipped with intent. The framework's hand is visible in the starting values; the user is free to refine, adjust, or replace. Most user-facing config is practice.

Examples: the seed personality in `pebble/personality.yaml` (the founder's voice, explicitly forkable); cold-start voice values; refinement cadences; onboarding questions; skills marketplace defaults.

### Expression
Fully owned by the user. The framework provides the structure; the content belongs to the person.

Examples: journals, tasks, memory entries, Rookery designations, connector choices, Observer outputs.

## Evidence & Examples

File-level mapping from the prior art ([[Crèche Prior Art]]):

| File | Category | Notes |
|---|---|---|
| `pebble/config.yaml` | mostly practice; guardrails block is doctrine | Comments mark each block |
| `pebble/personality.yaml` | practice | Founder seed; user can replace |
| `skills/config.yaml` | practice | Toggle per skill |
| `journal/` | expression | User content |
| `tasks/`, `memory/` | expression | User content |
| `observers/` | doctrine (logic) + expression (outputs) | Observer logic ships with framework |
| `agents/` | doctrine | Agent definitions ship with framework |

## Connections

This split is load-bearing for [[Crèche]]'s open-source governance. Doctrine changes require forking — a user who disagrees with the guardrails can fork rather than filing a PR that argues about values. Practice changes are PR-welcome. Expression never goes upstream.

The [[Founder as First User]] concept sits at the practice/doctrine boundary: the personality file is practice (forkable, replaceable), but the founder's use of their own system as a first test is doctrine-like in spirit.

## Evolution

First ingested source. The responsibilities doc (doc 10) is explicitly marked as a stub — the full per-feature mapping is incomplete. Will update as more sources arrive.

## Open Questions

- Where does a user-contributed skill live? The prior art names it as an open question — skills marketplace defaults are practice, but a user-originated skill that ships in the framework... is that practice or doctrine?
- How does the doctrine/practice split apply to the department layer (civic, procurement, community) — those span both framework logic and community operation?
