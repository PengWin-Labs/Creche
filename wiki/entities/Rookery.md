---
title: Rookery
type: entity
tags: [cluster/social, technology, product, framework, privacy]
sources: [Crèche Prior Art, Crèche Vault]
created: 2026-04-30
updated: 2026-05-05
---

## Overview

The Rookery is the trusted inner-circle layer of [[Crèche]]. It serves two roles: social signal (the people the user designates as their closest trusted contacts) and key recovery (those same people hold the fragments needed to reconstruct the user's encryption key). Named after a penguin colony — the close community. Deferred to Phase 1.

## Key Facts

- Dual-purpose by design: the trust structure built for social signal is reused for key recovery — architectural reuse, not coincidence ([[Crèche Prior Art]])
- Key recovery mechanism: Shamir's Secret Sharing splits the user's encryption key into N fragments distributed to Rookery members; threshold (e.g. 3 of 5) reconstructs the key ([[Crèche Prior Art]])
- No single Rookery member can unlock the user's data alone; below-threshold collusion cannot either ([[Crèche Prior Art]])
- The trust relationship precedes the key-management role — the framework reuses an already-established trust network rather than asking the user to create a new one ([[Crèche Prior Art]])
- Also receives notification from [[Pebble]] in crisis contexts when appropriate ([[Crèche Prior Art]])
- Deferred to Phase 1 ([[Crèche Prior Art]])

## Two Layers Working Together

### User-designated
People the member explicitly identifies as their circle. Conscious, named.

### Pebble-inferred
People [[Pebble]] notices the member talks about, spends time with, lights up around. **Built quietly from real behavior.**

### Overlap is highest priority
People who appear in both layers — explicitly designated *and* showing up in behavioral signal — are the strongest Rookery presence. Pebble's inferred list provides a default when the user hasn't set anything up — there's always someone to reach out to.

## Notifications Carry No Specifics

> *"Hey — when did you last check in with [member]?"*

Just a signal to show up. **The visit happens. That's often enough.** The notification doesn't carry the reason, the context, the concern, or the specifics. It's a nudge, not a report.

### Life context is critical
Pebble knows when a Rookery member is unavailable (passed away, estranged, recently in conflict) and adjusts. **Without that context the reach-out can cause real harm.** A nudge to a person no longer in the user's life isn't just useless — it's a wound. The architecture takes life context seriously as a precondition, not a nicety.

## Inbound Concern Channel

Outbound is Rookery — Pebble reaching out when it notices something. **Inbound is the channel by which people who love or know a member can flag what they noticed outside the system.**

### Tiered weight

- **Anyone in the community** can raise an anonymous concern. Weak signal, gentle check-in.
- **Rookery members** raising a concern is a stronger signal — they have context Pebble doesn't.
- **Pattern of concerns from the same source about the same member** is flagged for review — protects against weaponization.

### Where concerns go

To the **member's own Pebble**, not to other members. The member's privacy is intact; the observation is honored. The member's Pebble decides what (if anything) to surface, when, and how. **The reporting party doesn't get a status report.**

Symmetric channels turn into surveillance. The reporting party knowing whether their concern produced action makes the channel a tool for control rather than care. The asymmetry preserves the channel's actual function: a way for people who love someone to add signal to that person's care system without becoming part of the management of them.

The pattern detection on repeat concerns is structural defense. A single concern from a stranger registers as weak signal. Repeated concerns from the same source about the same member trigger review — not amplification.

## Role in Wiki

The Rookery is what makes [[Privacy as Structural Property]] possible without a central recovery authority. It's also the mechanism that ensures [[Crèche]] can't be compelled to unlock user data — the maintainers simply don't have the keys. The Rookery is deferred to Phase 1 partly because it depends on the household tier existing — Rookery members are most naturally drawn from the household and trusted-contacts layer of the [[Three-Tier CRM Model]]. Understanding the Rookery is necessary to understand why Crèche's privacy model holds even against a subpoena to the maintainers.

## Source-Share Recovery

Rookery also serves as the social form of source-recognition — the people who can vouch for who the user is across instances. **N-of-defined-set consent on Rookery shares is the default recovery path for the source data layer at EOL.** User-designated heir is an opt-in alternative. Same primitive enables journal elevation when a user wants to share at the household layer (see [[Three-Tier CRM Model]]).

Implementation deferred; architectural commitment is that any recovery path requires consent at minimum and N-of-N for the most protected layer.

## Appearances

- [[Crèche Prior Art]] — defined in docs 05, 07; noted as deferred to Phase 1 in doc 08
- [[Crèche Vault]] — full Two-Layers design, Inbound Concern Channel, source-share recovery

## Open Questions

- What is the UX for designating Rookery members and setting thresholds?
- What happens when Rookery membership changes — a member departs, a new one is added?
- How does the key-recovery flow work in practice without exposing the process to the user as a technical operation?
- Is Rookery notification in crisis contexts opt-in or on by default?
- **Source recovery path selection** — Rookery N-of-N consent vs designated heir opt-in. Both paths committed architecturally; UX and default selection deferred until external users surface the friction.
