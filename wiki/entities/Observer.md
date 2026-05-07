---
title: Observer
type: entity
tags:
  - cluster/agents
  - agent
  - technology
  - product
sources:
  - Crèche Prior Art
  - Crèche Vault
created: 2026-04-30
updated: 2026-05-02
---

## Overview

Observer is the write-path agent in [[Crèche]]. It is solely responsible for all cross-tier writes: detecting patterns in a user's data, promoting records to household scope, and anonymizing records for community promotion. It does not converse with users. Named after the penguin behavior of watching — it watches for cross-layer patterns.

## Key Facts

- The only agent allowed to write between tiers — this concentration of the write-path is what makes anonymization auditable ([[Crèche Prior Art]])
- Runs on a schedule, not in real time — deliberate: scheduled promotion creates space to notice; real-time would create pressure to solve ([[Crèche Prior Art]])
- Handles anonymization at the community tier boundary — strips names, locations, relationships, and identifying detail before any record leaves the household org ([[Crèche Prior Art]])
- Observer's promotion rules are visible in the framework — users can inspect what it's watching for, what it promotes, and what it strips ([[Crèche Prior Art]])
- Observer's outputs are visible in each user's repo under `observers/` ([[Crèche Prior Art]])
- Deferred to Phase 1 — not needed in Phase 0 because there are no cross-tier writes with a single user ([[Crèche Prior Art]])
- Also responsible for alignment monitoring: watching for [[Pebble]] behavioral drift from guardrails ([[Crèche Prior Art]])
- Writes into [[Cache]] — Observer is what makes emergent shape from accumulated activity legible; the density / topical-proximity / cross-channel patterns that surface in Cache are Observer's work
- Owns category formation — when contributions across entities are coherent enough to constitute a pattern that doesn't yet have a name, Observer detects the coherence and names it

## Role in Wiki

Observer is the architectural counterpart to [[Pebble]]. The [[Read-Path Write-Path Split]] only works because Observer is the sole writer — this is doctrine in [[Crèche]]. Observer is the agent that makes the [[Three-Tier CRM Model]] functional: without Observer handling cross-tier writes, data would never move from individual to household to community scope. Observer is also the mechanism by which [[Privacy as Structural Property]] is enforced at the community boundary: anonymization concentrated in one auditable place. Understanding Observer is necessary for understanding why [[Crèche]]'s privacy model is structural rather than promissory.

## Appearances

- [[Crèche Prior Art]] — role defined in docs 02, 07; alignment monitoring in config.yaml

## Open Questions

- What behavioral signals count as drift? How are they weighted? What is the numeric cutoff for each `drift_threshold` level?
- How does Observer distinguish real user state change from agent drift?
- How does Observer's promotion logic handle household membership changes (new member, departed member)?
