---
title: Cache
type: entity
tags: [cluster/agents, technology, product, framework]
sources: [Crèche Prior Art, Crèche Vault]
created: 2026-04-30
updated: 2026-05-02
---

## Overview

Cache is the memory and intelligence layer of [[Crèche]] — the substrate where what the user actually engages with crystallizes into recognizable patterns. Not a separate data store. The set of conventions by which the user's repository, the household shared repository, and the community mirrors function as addressable memory for [[Pebble]]. Named after where penguins store.

Cache is not just *what gets remembered*; it is *what shapes itself into prominence as the user keeps engaging*. Memory is the substrate; shape is the output.

## What Cache Is and Isn't

- Cache is a **behavior, not a database** — the substrate is git ([[Git as Data Layer]])
- **Read-side** — Pebble reads from Cache; all writes flow through commits, either by [[Pebble]] journaling or by [[Observer]] for cross-tier promotion
- **No live in-memory state** that diverges from committed state — auditability over speed; the commit log is the record
- Spans all three tiers of the [[Three-Tier CRM Model]] — individual, household, and community repos all function as addressable memory

## Cache as Pebble's Continuity Layer

Without Cache, every conversation starts cold. With Cache, [[Pebble]] fields vague incoming shapes — *"that thing I keep doing,"* *"that feeling from last week,"* *"the one I was on the fence about"* — without cold-reading the entire repo on each invocation.

The user arrives with partial signal. Cache has already surfaced the most relevant references. Pebble starts from there, not from zero. **This is the mechanism that makes Pebble feel continuous across sessions rather than amnesiac.**

## Emergent Shape from Accumulation

Important nodes shape themselves through density of engagement, not through user declaration.

- The user who logs every movie they watch — without ever calling themselves a critic — has produced the data that makes the *critic* shape visible. The volume of engagement is the signal.
- The user constantly logging frustration with work — without ever stating *work is the central theme of my life* — has already made the pattern legible. Cache holds it; it doesn't have to be named to be there.

This is [[Three-Tier CRM Model#Pattern Resolution by Tier]] applied at the individual layer — same shape-from-experience mechanism Observer runs across members at the household tier, only here it runs across one person's accumulating activity. The shape exists before any cross-tier promotion; the household and community tiers refine it further when the user belongs to those scopes.

**Surfacing follows the readiness gate.** Pebble offers the emergent shape only when the user names a gap — frustration, dissatisfaction, an unstated want. Never as broadcast. Never *"have you considered being a critic?"* unprompted. The shape is held; the offer waits. See [[Connections vs Solving]] / Perspective Expansion and the `no_unprompted_reframing` doctrine ([[Guardrails]]).

When the offer does come, it follows [[Pebble]] / Sequencing: the user's current position is acknowledged as solid before adjacent terrain is named. Same content, different sequence, different reception.

## Access Patterns

Cache holds everything committed; what gets *surfaced* for any given message depends on multiple patterns operating together. Time-decay is one of these, not the master rule.

- **Recency** — recently-touched content stays warm; the last few interactions influence what's nearby for the next one
- **Density / volume** — frequently-engaged content becomes prominent regardless of recency; the long-term shape of attention shows through even when the surface is quiet
- **Named-pin** — user-marked important; doesn't decay; stays accessible by intent rather than by activity
- **Topical proximity** — linked via [[Three Layers of Data]] / Topical Categorization; subscribing to a category pulls its accumulated context into scope
- **Cross-channel coherence** — the same shape recognized across like/dislike taps, journal entries, media references, and behavior is **stronger signal than any single channel** ([[Three Layers of Data]] / Reflection and Shape Vocabulary)
- **Stale-prevention warmth** — surrounding context for [[Alignment]]'s `open-deferred` items is kept warm so they remain genuinely returnable rather than degrading silently to `stale`. Without warmth, deferral is theoretical; with warmth, it is workable.

Patterns combine. A user named-pin on top of high density on top of recent touch is the strongest possible surfacing signal. Cross-channel coherence multiplies any of them.

## Working Attention vs Stored Memory

Cache stores everything that has been committed. **Working attention** is the slice surfaced for any given message — computed per invocation from the access patterns above. Everything else stays addressable but quiet. The distinction matters: Pebble does not load the full repo; it loads the working slice, with the rest available if the conversation reaches for it.

This is the standard read pattern at the floor — current day's branch, last few main entries, named memories matching conversation cues, active tasks, voice config. Specific access patterns extend it. Long-running density may add a node that hasn't been touched recently. A topical match may pull in a community-tier reference. Cross-channel coherence may light up a shape the user hasn't named yet.

## The Hot Cache as Runtime Projection

`hot-cache.md` (the operational artifact at vault root) is distinct from Cache (the entity / behavioral pattern). The file is **Cache's read-side projection at runtime** — the materialized form of *what Pebble has on hand right now* for the current session.

This maps to the lockfile / manifest split named in [[Package JSON for a Person]]: the manifest declares what is wanted (the substrate of commitments and accepted practices); the lockfile materializes what is currently resolved (the working state). Hot-cache is the lockfile-equivalent for Pebble's session: not the full picture, just the resolved slice in scope right now.

## What Cache Holds at Each Tier

| Tier | Cache holds |
|---|---|
| **Individual** | Journal entries, named/pinned memory, structural preferences, voice drift observations, active tasks, voice config |
| **Household** | Shared notes, vendor records, household-scope shape vocabulary, accepted practices, household scrum context |
| **Community** | Anonymized scaled definitions, shared categories, pricing ledgers, vendor warnings, community walkways |

Cache spans all three. Pebble at the individual tier reads the individual slice; subscribing to a household pulls household-tier context into scope; subscribing to a community pulls community-tier context. See [[Three-Tier CRM Model]] / Tiers and [[Three Layers of Data]] / Topical Categorization for the subscription mechanism.

## Standard Read Pattern

The default attention slice on every message:

- Current day's branch
- Last few main-branch entries
- Named memories matching conversation cues
- Active tasks
- Voice config

Access-pattern extensions add to this floor — density-driven prominence, topical proximity, cross-channel coherence, stale-prevention warmth. The slice is shallow by design. Auditability and cost both favor the floor; the patterns earn their additions.

## Role in Wiki

Cache is the layer that lets [[Pebble]] be more than a chatbot with no memory. It is also the mechanism by which the architecture's promises become operational — without Cache, [[Three-Tier CRM Model]] / Subscription is a configuration with no surface; [[Alignment]] / Open-deferred has no warmth and degrades to stale; [[Three-Tier CRM Model#Pattern Resolution by Tier]] has nothing to resolve from. Cache is the substrate that makes the read-side architecture work.

## Connections

[[Pebble]] — continuity layer; Pebble starts from Cache rather than zero
[[Observer]] — writes into Cache; surfaces emergent shape via [[Three-Tier CRM Model#Pattern Resolution by Tier]]
[[Git as Data Layer]] — the substrate; cache is git conventions, not separate infrastructure
[[Three-Tier CRM Model]] — Cache spans all three tiers
[[Three Layers of Data]] — what kind of thing is held; Topical Categorization governs proximity-based access; Reflection and Shape Vocabulary governs what counts as engagement
[[Alignment]] — cadence governs refresh; stale-prevention warmth keeps deferred items returnable
[[Package JSON for a Person]] — hot-cache file is the lockfile projection of Cache's manifest
[[Connections vs Solving]] — surfacing emergent shape follows readiness gate; never broadcast
[[Founder as First User]] — at N=1, Cache is one author's accumulating engagement; multi-author Cache activates when household tier comes online

## Evolution

Substantively rewritten 2026-05-02 from a 2,027-byte stub. The earlier draft framed Cache as *memory* and surfaced *time-decaying references* as the primary mechanism. Founder corrected: time-decay is one access pattern; the deeper mechanism is **emergent centrality from density of engagement**. Important nodes shape themselves from volume of activity; surfacing follows the readiness gate; multiple access patterns combine.

## Open Questions

- How does Cache handle the performance of shallow reads as the repo history grows over years?
- What is the retrieval mechanism for "named memories matching conversation cues" — keyword match, embedding search, or something else?
- What is the threshold for *this shape has accumulated enough signal to be worth surfacing*?
- How does Cache distinguish a passing interest from an emerging central theme?
- When Pebble surfaces an emergent shape (e.g., *"you've been logging movies a lot — is that something you want to do more deliberately?"*), what governs whether the framing lands as expansion vs displacement? Same diagnostic as [[Pebble]] / Sequencing.
- How do user-pinned memories interact with density-driven prominence — do they amplify each other, or does the pin make the density signal redundant?
