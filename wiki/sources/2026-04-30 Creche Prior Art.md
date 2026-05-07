---
title: Crèche Prior Art
aliases: [Crèche Prior Art, Creche Prior Art]
type: source
tags: [cluster/sources, technology, product, framework, architecture, personal-crm]
sources: [Crèche Prior Art]
created: 2026-04-30
updated: 2026-05-01
---

## Summary

The Crèche prior art is a collection of architectural design documents covering the philosophy, structure, and MVP plan for an open-source home and community management framework. The core premise is that the tools used to organize businesses — CRM systems, task tracking, pattern detection, automated advocacy — should be available to individuals and households at no cost, using infrastructure they already own.

The framework is built on a single principle: *love yourself to the degree you love others.* Most people show up reliably for others; the gap is not worth but infrastructure. Crèche brings that same care infrastructure home. Every feature decision flows from this principle — if it cannot be expressed as a connections tool (surfacing patterns, opening space, connecting observations), it doesn't belong in Crèche.

The architecture is distinct from standard AI assistant products in several ways. Data lives in a git repository the user owns. No central server. No separate relational database. Privacy is structural, not promised — the host stores ciphertext, the user holds the key. The read-path and write-path are split across two named agents (Pebble and Observer) to make the anonymization logic auditable as a single chokepoint. The default connector tier uses infrastructure the user already owns, so the core product is permanently free.

The prior art captures approximately Phase 0 thinking: a working design ready to build, with clear exit criteria for the first milestone, explicit open questions documented, and a named taxonomy for agents, skills, features, departments, and connectors.

## Key Points

- Central principle: "Love yourself to the degree you love others" — not a tagline, an architectural constraint
- "Connections, not solving" is the most load-bearing design distinction — drift toward solving-mode is named as a recurring risk
- Three-tier CRM model: Individual (private repo), Household (shared org repo), Community (anonymized mirrors)
- Two agent roles: Pebble (read-path only, converses with user) and Observer (write-path only, cross-tier promotion)
- Git is the data layer — folder structure IS the schema; no separate relational database
- Privacy is structural: ciphertext at rest, user-held keys, Rookery-based key recovery via Shamir's Secret Sharing
- Free-path default: any feature not expressible on calendar + GitHub + messaging is rejected as default
- Naming follows penguin behaviors — Crèche, Pebble, Cache, Observer, Rookery each describe what the thing does in nature and what it does for the user
- Phase 0 MVP: single user, WhatsApp/SMS, Lambda, GitHub OAuth onboarding, daily branch journaling
- Doctrine / Practice / Expression split governs what is immutable, what ships with intent but is user-editable, and what is fully user-owned
- Founder as first user: named seed personality shipped in `pebble/personality.yaml`, visible and forkable
- Open questions explicitly documented: encryption tool choice, connections-vs-solving drift, surveillance problem, alignment drift thresholds

## Entities Mentioned

[[Crèche]], [[Pebble]], [[Observer]], [[Cache]], [[Rookery]]

## Concepts Discussed

[[Connections vs Solving]], [[Three-Tier CRM Model]], [[Git as Data Layer]], [[Privacy as Structural Property]], [[Read-Path Write-Path Split]], [[Doctrine Practice Expression]], [[Founder as First User]]

## Connections

This is the founding document set for Crèche. No prior wiki content to connect or contradict. All subsequent source ingests should be read against the architecture and philosophy established here.

Key tensions worth watching as more sources arrive:
- Whether "connections not solving" holds under real user pressure for answers
- Whether the free-path default survives contact with infrastructure costs
- Whether the single-user Phase 0 pipeline reveals architecture bugs before household/community tiers are built

## Raw Source

Originally ingested from `raw/creche-prior-art/creche/`. Local copy removed 2026-05-01 once synthesis was mature; canonical zip preserved externally by founder. This page is the synthesis-side record of what was ingested.
