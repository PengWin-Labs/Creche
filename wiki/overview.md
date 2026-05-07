---
title: Overview
type: overview
tags: [cluster/foundation, technology, product, framework, personal-crm]
sources: [Crèche Prior Art, Crèche Vault]
created: 2026-04-30
updated: 2026-05-01
---

## What This Wiki Is About

This is the thinking layer for [[Crèche]] — an open-source home and community management framework being built by Chris (Pengwin Labs LLC). The wiki exists to synthesize and refine the design before and during implementation, and to help prepare the public-facing README. Sources are the founder's own design documents and conversations. Projects emerge as ideas accumulate and cluster.

## Evolving Thesis

Crèche is built on the premise that most people show up reliably for others but lack the infrastructure to show up for themselves. The tools that help organize a life — pattern detection, record-keeping, automated advocacy — were built for businesses. Crèche brings those home, for free, using infrastructure the user already owns.

The framework's most important design decision is not architectural — it's philosophical: Crèche is a *connections* tool, not a *solving* tool. It surfaces patterns, opens space, and connects observations. It does not optimize a life on demand. This distinction constrains every feature, and drift toward solving-mode is named explicitly as a recurring risk to guard against.

The architecture honors the same shape across layers. The relational principle (divergence is a moment in the merge process; *agree to disagree* is not available) and the architectural principle (independent weighting at the community layer; promotion is merging, not publishing) are not analogous — they are *the same shape*. This coherence is what makes the wiki recursion legible: relational pages and architectural pages cross-cite because the model is the same.

## Two Axes

The architecture rests on two orthogonal axes that always apply together:

- **Scope** ([[Three-Tier CRM Model]]) — Individual / Household / Community; who is in the conversation
- **Data shape** ([[Three Layers of Data]]) — source / shaped artifacts / generic shape and category; what kind of thing is being held

Together they describe both *who sees* and *what kind of thing* travels — and what stays sealed at the source layer (override via N-of-X consent through [[Rookery]]).

## Key Concepts

The eleven hubs:

1. [[Connections vs Solving]] — the load-bearing design constraint
2. [[Three-Tier CRM Model]] — scope axis; promotion as merging; pattern resolution; subscription; contribution as persistence
3. [[Three Layers of Data]] — data-shape axis; shape vs biography; reflection spectrum; passive signal; wiki of wikis
4. [[Alignment]] — the work of holding the weight of trying to merge; four merge-conflict states; cadence
5. [[Read-Path Write-Path Split]] — Pebble reads, Observer writes; doctrine
6. [[Privacy as Structural Property]] — ciphertext at rest, user-held keys, Rookery recovery
7. [[Doctrine Practice Expression]] — what is immutable, what ships with intent, what the user owns
8. [[Guardrails]] — the 11 doctrine-level behavioral commitments in `pebble/config.yaml` v0.2.0
9. [[Founder as First User]] — the seed personality; N=1 valid at every tier
10. [[Package JSON for a Person]] — the dependency-graph metaphor; structural, not managerial
11. [[Git as Data Layer]] — folder structure as schema; no separate database

## Key Entities

- [[Crèche]] — the framework itself
- [[Pebble]] — the conversational agent (read-path); Phase 0 surface is Claude app + Google Calendar + GitHub
- [[Observer]] — the write-path agent; sole writer for cross-tier promotion, anonymization, and category formation
- [[Cache]] — the memory layer; git conventions, not a separate service
- [[Rookery]] — trusted inner circle; social signal + N-of-X consent primitive (recovery and elevation)
- [[Journal]] — primary capture surface; spans micro-entries to long reflection

## Recent Additions

- [[Crèche Vault]] (2026-05-01) — canonical 71-document vault superseding the prior art; introduced merge-conflict states, three-data-layer model, full Pebble posture toolkit, 11-guardrail doctrine, Phase 0 stack as Claude app + Google Calendar + GitHub. Triggered Phase A sync update and a wiki consolidation pass (24 thin concept pages folded into 11 dense hubs).
- [[Crèche Prior Art]] (2026-04-30) — initial founding architecture documents; preserved as historical snapshot

## Open Questions

- Does *connections not solving* hold under real user pressure for immediate answers — and what structural safeguards exist beyond guardrails?
- What is the right framing for the public README?
- How does the household tier work in practice once a second member arrives — adding, removing, splitting, conflict resolution?
- Phase 0 defers Observer's write-path to Phase 1 — what early-signal does the single-user pipeline produce that validates the tier model before household and community come online?
- The asymmetry argument on surveillance sharpens the question rather than closing it: state-level vertical surveillance already exists; Crèche adds horizontal capability into a pre-existing asymmetry. The threshold question stays empirical.

## Phase 0 Stack

| Layer | Tool | Status |
|---|---|---|
| Channel | Claude app | active |
| Scheduling | Google Calendar | active |
| State | GitHub | active |
| Agent | Pebble (Claude project) | active |
| Encryption | git-crypt / age / SOPS (under evaluation) | open |
| Observer write-path | — | deferred to Phase 1 |
| Anonymization pipeline | — | deferred to Phase 2+ |

WhatsApp / Twilio / AWS Lambda are deferred from the original prior-art design. The Phase 0 stack is treated as **learning vehicles, not permanent commitments** — the adapter pattern applies to every external dependency.
