---
title: Read-Path Write-Path Split
type: concept
tags: [cluster/architecture, architecture, framework, privacy, technology]
sources: [Crèche Prior Art]
created: 2026-04-30
updated: 2026-04-30
---

## Definition

The architectural commitment in [[Crèche]] that [[Pebble]] only reads and [[Observer]] is the only agent that writes between tiers. This is doctrine — changing it requires forking the project.

## How It Works / Mechanism

- **[[Pebble]]** reads from the user's individual repository and responds. It may commit journal entries to the user's own individual tier when asked. That is the limit of its write scope.
- **[[Observer]]** is the sole writer for any cross-tier operation: promotion from individual to household, promotion from household to community (with anonymization). It runs on a schedule, not real-time.
- No other module writes between tiers. This is a hard constraint, not a convention.

The concentration is deliberate: anonymization logic spread across an agent that runs on every message is impossible to audit. Concentrated in Observer, it is a single chokepoint — reviewable in isolation, replaceable without touching the conversational surface.

## Evidence & Examples

The prior art states this is "the single most important guarantee Pebble provides" — if Pebble wrote to household or community scope, the anonymization logic would have to live in Pebble, making [[Privacy as Structural Property]] impossible to verify ([[Crèche Prior Art]]).

The CLAUDE.md file for AI agents working in the repo lists "Pebble is the read-path. Observer is the write-path" as the first of six inviolable hard constraints ([[Crèche Prior Art]]).

## Connections

This split is what makes [[Privacy as Structural Property]] achievable — without it, there is no auditable chokepoint for anonymization. It is also what makes [[Pebble]] trustworthy to users: they can verify exactly what it can and cannot do.

The split maps directly to the [[Three-Tier CRM Model]] — tiers need a way to enforce their boundaries, and this split is that enforcement mechanism.

[[Doctrine Practice Expression]]: the read-path / write-path split is listed explicitly as doctrine — it is not a modular component but an architectural commitment.

## Evolution

First ingested source. No evolution to note yet.

## Open Questions

- How does the split hold when Superpowers (agentic delegation against external systems) come online in Phase 1? The prior art says Superpowers act outward only, never cross-tier — but the implementation boundary needs careful attention.
- When Observer is deferred to Phase 1, how is the single-user Phase 0 pipeline structured so the split is exercised and validated before Observer ships?
