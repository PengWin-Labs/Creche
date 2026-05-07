---
title: Alignment
type: concept
tags: [cluster/process, framework, architecture, philosophy, doctrine]
sources: [Crèche Prior Art, Crèche Vault]
created: 2026-04-30
updated: 2026-05-02
---

## Definition

Alignment in [[Crèche]] is the work of holding the weight of trying to merge. It is not a management lifecycle, a registry, or a verdict. It is the ongoing process by which divergence — between people, between scopes, between stated values and lived behavior — gets named, contextualized, returned to, and either reconciled or held in a workable state.

The protocol runs over four merge-conflict states and is governed by a single doctrine commitment: *agree to disagree* is not available. Articulated divergence with what merge work would require *is* available.

## Aligned Day Texture

Alignment described structurally is one thing. Alignment **felt** is another. The texture of an aligned day is the diagnostic from the inside:

- Hyperfocus arrives for the right thing without being dragged toward it
- Work pulls forward instead of being pushed
- The convenience filter doesn't kick in as often — body cooperates
- Music matches state instead of being reached for to fix state
- Things find the user at the right moment instead of the user searching
- Conversations with proximate people land without special conditions
- The framework runs in the background — not reached for to manage feeling
- Building feels like expression, not insufficiency

Most concretely: **can just be.** Walter Mitty doing the job. Ordinary as the point.

This is not a goal state to be optimized toward. It is the readout. When the texture is present, the structural work — merge-conflict states, cadence, deferred-ticket surfacing — is doing what it's supposed to do. When the texture isn't present, the structure is the place to look first; the feeling is downstream.

## Orientation: Walkways and Subscription

Joining a conversation, a community, or a relationship is itself a **subscription to shared practice**. The implicit agreement is that the walkway gets shaped by the sharing, and disagreement is a moment in the merge process — not a permanent fork.

What "walkway" names: the shared definitions and practice that get shaped by participation in a community or relationship. Joining is itself subscription to walkway-shaping. The walkway changes through the sharing; the user's own ground updates from the sharing rather than being overwritten by it.

### "Agree to disagree" is not available

*Agree to disagree* reads as a refusal of that implicit agreement. It exits the shared walkway without doing the merge work. **It is not a move available to [[Pebble]]** — encoded as the `no_agree_to_disagree` doctrine guardrail (see [[Guardrails]]).

### Articulated divergence is workable

> *"We diverge here because I weight X and you weight Y, and reconciling that needs more time / shared context / a different conversation."*

The bare label closes the door. **Naming what merge work would require honors the walkway.**

## The Four Merge-Conflict States

| State | Definition |
|---|---|
| **Resolved** | Divergence reconciled through merge work |
| **Open-deferred** | Unresolved, tracked, both parties still in the conversation, returnable |
| **Wontfix** | Closed without resolution. What "agree to disagree" silently does |
| **Stale** | Open-deferred without preserved surrounding context. Theoretically tracked, practically forgotten — degrades to wontfix without anyone noticing |

`Resolved` and `wontfix` are the obvious endpoints. `Open-deferred` is the legitimate middle. `Stale` is the failure mode masquerading as `open-deferred`.

The fourth category is the load-bearing contribution. Without naming it, every `open-deferred` looks like progress; in practice many have lost the surrounding context that made them returnable. **Naming `stale` separately lets the system catch the failure rather than mistaking it for a stable state.**

These states apply equally to data merges across tiers (see [[Three-Tier CRM Model]]) and to values disagreements within communities — `wontfix` and `stale` are failure modes at every level.

## Operational Forms

Alignment runs in three forms across the system. Same model — only the scope differs.

### Relational alignment
Between people in conversation. [[Pebble]] toward the user; user toward another household member; household toward another household. Articulated divergence is named with what merge work would require; the four states apply; deferred items are surfaced when new context arrives without being auto-resolved.

### Architectural alignment
Between scopes via the [[Three-Tier CRM Model]]. Notes promote through active refinement; shape resolves at each tier; merge-conflict states apply to data the same way they apply to relationships.

**The architectural form and the relational form are the same shape**, not analogous. Independent weighting at the community layer; soft truth (community has a voice; what it says is one input among many); walkways shape through participation; the user's ground updates from sharing rather than being overwritten by it.

This coherence is to be preserved across future design changes. If a feature pulls one layer away from the other, the coherence breaks and the architecture loses one of its core legibility properties.

### Self-alignment (drift monitoring)
Between Pebble's actions and the [[Guardrails]] in `pebble/config.yaml`. [[Observer]] runs alignment monitoring on the cadence below, watching for behavioral drift between what Pebble committed to and what Pebble has been doing. Drift gets surfaced; the user decides what to do about it.

## Open-Ticket Surfacing

Resolution belongs to the user. Two paths surface deferred conflicts. **Neither resolves them automatically.**

- **Self-surfaced** — the user deliberately revisits.
- **System-surfaced** — Observer notices new linked data that re-contextualizes an old ticket; Pebble brings the connection forward; the user does the integration.

Consistent with `connections_not_solving` and `read_path_only` (see [[Guardrails]]).

What this rules out:

- The system marking tickets as resolved on the user's behalf
- Pebble pressuring the user to close open-deferred items
- Re-contextualization being framed as resolution. **The system surfaces; the user processes.**

### Why open-deferred only works when surrounding context is preserved

Without linked data — songs, films, journals, parallel interactions, emotional state — *tracked and returnable* is theoretical. The minimal-category-with-rich-linking model is what makes deferral genuinely returnable. More categories with weaker links → context fragments. Fewer categories with rich cross-linking → picture stays whole. **Deferral only works when the surrounding context is held intact.**

[[Cache]] is the layer that holds that context warm. Stale-prevention warmth — keeping surrounding context accessible while the deferred item waits — is one of Cache's named access patterns. Without Cache, every `open-deferred` silently degrades to `stale`; with Cache, the picture stays whole long enough for return to be genuine.

## Cadence (When Alignment Runs)

Reminders, scrum, and personality refinement all run on the same hybrid signal:

> `journal_count` **OR** `time_floor`, whichever fires first.

This is the **reference cadence pattern** across the system — surfaced in `pebble/config.yaml` under `refinement` and reused for any periodic check-in.

A pure count signal can stall if the user isn't journaling much; a pure time signal can fire when there's nothing meaningful to refine against. Hybrid is the floor on each — the system never goes too long without checking, and never asks for refinement before there's enough signal to refine against.

### Where this cadence applies
- Voice refinement
- Alignment refinement (drift monitoring)
- Household scrum
- Community scrum (with longer time-floors than household — community shared definitions should stay stable)
- Reminder commitments
- Note promotion retro

### Default values (config.yaml v0.2.0)

| Target | Signal | Interval | Time floor |
|---|---|---|---|
| Voice | journal_count | 5 | 14 days |
| Alignment | journal_count | 25 | 90 days |

User-adjustable. Notifications always on. Defaults are calibrated to the founder's engagement; new users adjust upward.

## Shadow Side

The merge drive applied to close relationships can become **pressure to converge** rather than mutual understanding. The signal that distinguishes them is whether walking away from the conversation feels like having understood something new, or having moved the other person closer to a pre-existing position.

Pebble watches for this in its own behavior toward the user. The user can watch for it in their own relationships. **Same diagnostic, different scope.**

## The Higher-Mattering Diagnostic

Alignment, in the [[Positive Nihilism]] frame, is **finding the higher mattering**. A small argument with a partner about who left the dishes out has both a content layer (the dishes) and a frame layer (the relationship over a long stretch of years). Both can matter. The relationship matters more.

> **Aligned isn't right vs. wrong. It's noticing which layer is actually in play.**

This maps directly onto the [[Pebble#Two-Layer Diagnostic]] — same shape, different scope. Layer one operates inside the current frame; layer two notices when the frame has shifted. The skill is reading which layer the moment is asking for, defaulting to layer one when unclear.

When the layers are confused, the small thing wins by default — the dishes argument escalates because the immediate stake is the only thing being weighted. Naming the higher matter doesn't dismiss the lower one; it places it. The dishes still get talked about. They just stop being the disagreement.

## What Alignment Is Not

It is not propose / evaluate / accept / version / lock. There is no software-style lifecycle. There is no central registry. There is no "correct" version of an aligned manifest that the system holds.

What there *is*:

- A shared walkway shaped by participation
- Four states for any divergence
- A cadence on which deferred items get surfaced (not auto-resolved)
- A doctrine commitment that bare divergence-as-closer is not a valid move

The system holds the work, not the answer. People update their constraints; the system makes the dependency graph legible without flattening it (see [[Package JSON for a Person]]).

## Connections

[[Three-Tier CRM Model]] — same merge-conflict states apply to data merges across tiers
[[Three Layers of Data]] — what travels through merging is shape, not biography
[[Cache]] — holds the warmth that prevents `open-deferred` from going `stale`; keeps surrounding context accessible during deferral
[[Observer]] — runs alignment monitoring; surfaces drift
[[Pebble]] — Pebble's behavior is what alignment monitoring watches
[[Guardrails]] — `no_agree_to_disagree` is the doctrine; `connections_not_solving` and `read_path_only` shape ticket-surfacing behavior
[[Founder as First User]] — at N=1, alignment runs internally; the same model applies
[[Package JSON for a Person]] — the dependency-graph metaphor under which alignment is the load-bearing operation
[[Connections vs Solving]] — alignment surfaces; user processes
[[Positive Nihilism]] — the higher-mattering diagnostic; alignment as recursion (return is the game, not stasis); aligned-day texture as the readout from inside the frame

## Evolution

Extended 2026-05-02 from Observer relay (`[Pebble] 2026-05-02`): added Aligned Day Texture (the felt-from-inside diagnostic) and the Higher-Mattering Diagnostic (alignment as noticing which layer is in play). Both connect to the new [[Positive Nihilism]] hub.

Consolidated 2026-05-01 from six pages: Alignment (existing), Orientation, Merge-Conflict States, Open-Ticket Surfacing, Architectural Alignment, Reminder Cadence. Earlier framing on this wiki (2026-04-30) imposed a propose / evaluate / accept / version / lock lifecycle that the canonical doesn't use. Canonical: alignment is the work of holding the weight of trying to merge. The system holds the work, not the answer.

## Open Questions

- How does Pebble surface a divergence to the user in a way that lands as honest naming rather than confrontation?
- What's the user-surfaced UX for an `open-deferred` item — does it appear in the journal-flow, in retros, both?
- How does Observer detect that an `open-deferred` has gone `stale` — what signal triggers the reclassification?
- For multi-author tiers (households, communities), what's the convention when members disagree on whether a divergence is `resolved` or `open-deferred`?
- How does alignment monitoring distinguish real Pebble drift from real user state change?
- Phase 0 defers Observer's write-path to Phase 1 — how does alignment monitoring run during Phase 0 with only the founder, and what early signal does that surface?
- When the merge drive becomes pressure-to-converge, what's the recovery move — within Pebble's behavior, and within human relationships?
