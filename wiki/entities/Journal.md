---
title: Journal
type: entity
tags: [cluster/social, product, feature, framework]
sources: [Crèche Prior Art]
created: 2026-04-30
updated: 2026-04-30
---

## Overview

The Journal is the primary capture surface in [[Crèche]]. It is where users record anything worth remembering — from long-form reflection to micro-entries like a quick rating of an experience, a note about a vendor, or a single observation. [[Pebble]] nudges toward journaling and commits entries on the user's behalf; [[Observer]] reads journal patterns as a signal for cross-tier promotion and alignment monitoring.

## Key Facts

- Lives in the `journal/` folder of the user's individual repo — expression-tier, fully user-owned ([[Crèche Prior Art]])
- Entries span a range: long reflections, quick observations, experience ratings, event notes — the format is intentionally open ([[Crèche Prior Art]] + Chris)
- Implemented via the daily branch (`day/YYYY-MM-DD`): created at first interaction of the day, trigger keywords during the day cause commits, merged to main at end of day or explicit summary ([[Crèche Prior Art]])
- Pebble nudges toward journaling on the user's configured cadence (daily / weekly / monthly / event-based); after `missed_threshold_days` (default: 3) without an entry, [[Pebble]] nudges ([[Crèche Prior Art]])
- Journal entries are the primary signal [[Observer]] reads for: promotion decisions, voice drift detection (every 5 journals), and alignment monitoring (every 25 journals) ([[Crèche Prior Art]])
- The `spa` skill watches journal cadence and language for signs of depletion — low journaling frequency or depleted language triggers a deliberate-pause prompt ([[Crèche Prior Art]])
- One of the five Phase 0 exit criteria: "The journaling loop (nudge, write, commit, merge at end of day) runs without manual intervention" ([[Crèche Prior Art]])

## Role in Wiki

The Journal is the connective tissue of [[Crèche]]. It is how the user's ongoing experience enters [[Cache]] — without journal entries, Pebble has no signal to work with. It is also the primary surface through which the [[Connections vs Solving]] principle is expressed in practice: journaling is a connections move, not an optimization move. The micro-entry format (ratings, quick notes) is important — it keeps the capture barrier low so the journal reflects life as it actually happens rather than only considered reflection.

The Journal feeds: [[Pebble]] (voice context), [[Observer]] (promotion signals, alignment monitoring), [[Cache]] (named memories, recent context), and the `spa` skill (depletion detection).

## Appearances

- [[Crèche Prior Art]] — defined in agents/skills taxonomy (doc 07); daily branch conventions (doc 03); nudge config in pebble/config.yaml; Phase 0 exit criteria (doc 08)

## Open Questions

- What does a micro-entry look like in practice — is there a structured format (rating + note) or is it freeform text that Pebble interprets?
- Does the daily branch model suit event-based cadence users, or does it create unnecessary git overhead for infrequent journalers?
- How does Pebble handle the nudge gracefully without becoming nagging — especially for users who journal in bursts rather than daily?
- What constitutes a "trigger keyword" that causes a commit mid-day vs. normal conversational exchange?
