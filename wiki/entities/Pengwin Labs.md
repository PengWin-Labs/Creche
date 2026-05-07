---
title: Pengwin Labs
type: entity
tags: [cluster/business, organization, business, legal]
sources: [Crèche Vault]
created: 2026-05-01
updated: 2026-05-01
---

## Overview

Pengwin Labs LLC is the parent company that houses [[Crèche]], [[Forage]], and any future products. Filed in a privacy-friendly state through a registered agent service. EIN obtained. Built to scale beyond a single product without coupling product fates.

## Why a Parent Company at All

Multiple products under one parent provides:

- **Shared legal infrastructure** without coupling product fates
- **Liability separation** between Crèche (mission product) and Forage (commercial product) once Series amendment lands
- **A naming and values home** that scales beyond a single product

Series LLC structure is planned (Crèche primary, Forage secondary) — pending CPA consultation to land before Forage has formal contracts or invoices.

## Why State Choice Matters

Maximum privacy, no state income tax, strong asset protection. States with weaker structural privacy or default state-access were avoided deliberately.

## License: AGPL-3.0

The Crèche framework is licensed AGPL-3.0 from day one. **Chosen as structural defense against drift toward closed, paid, or misaligned forks** — not legal formality. AGPL specifically closes the loophole where someone takes the code, runs it as a hosted service, and never contributes back.

Most copyleft licenses can be technically satisfied while being practically subverted. Closed forks, vendor lock-in, hosted services that never give back — these are how mission-driven projects get captured. AGPL-3.0 makes the capture structurally harder. Anyone running Crèche as a service has to make their modifications available. **The mission survives someone else picking up the code.**

This is the licensing-layer expression of the same principle that runs through the architecture ([[Read-Path Write-Path Split]], [[Privacy as Structural Property]]) and the philosophy ([[Foundational Principle]]) — the structural property is the protection.

## Vendor Selection Standard

All business decisions for Pengwin Labs are evaluated against the same values framework Crèche applies for users — **practicing what the product preaches.**

Questions asked of any vendor:

- Member or community owned vs shareholder driven?
- History of predatory or discriminatory practices?
- How does it treat its own employees?
- Does it fund causes that conflict with the mission?

The standard is internal consistency — Pengwin Labs operates by the same questions Crèche helps users ask.

### Phase 0 vendor choices

Phase 0 uses specific tools as **learning vehicles, not permanent commitments** ([[Three-Tier CRM Model]] / Phase 0 Stack). The vendor standard applies to any commitment, not to every learning vehicle. Tools selected to surface design bugs aren't held to the same permanence test as load-bearing infrastructure.

But: the moment a learning vehicle becomes load-bearing, the standard applies retroactively. If a Phase 0 vendor would fail the standard, the migration path needs to be visible *before* that vendor becomes hard to leave.

### Application to passive signal

The standard applies to **whether to integrate, not whether to use**. A user's data on a misaligned platform is still the user's data; pulling it into a system the user controls is a reclamation, not an endorsement. See [[Three Layers of Data]] (Passive Signal section).

## In-Flight Decisions vs Intentional Deferrals

Two distinct categories of "not yet done." Mixing them produces a parking lot; separating them keeps the operational state honest.

### In-Flight Decisions
Things deliberately open with a stated reason for waiting *and* a path to closing. **Not a parking lot.** Each one has a specific external trigger that, when resolved, allows closure. If an in-flight item stays in-flight without active progress for too long, it should either close or migrate to Intentional Deferrals with an explicit reason.

| Item | Status | Blocked on |
|---|---|---|
| Series LLC amendment (Crèche primary, Forage secondary) | Pending | CPA consultation; needs to land before Forage has formal contracts or invoices |
| Foreign registration where nexus is triggered | Pending | CPA review on franchise tax implications |
| Encryption tool choice for Cache | Open | git-crypt / age / SOPS — tool not yet selected |
| Banking migration | Placeholder in place | CPA consultation to align with broader tax/structure conversation |

### Intentional Deferrals
Things deliberately *not* being designed yet, with the reason. Sequencing choices, not external blockers. Each one names what's deferred and why; none of these are "we forgot" or "we're not sure" — they are decisions to defer until the right context exists. If an entry no longer has a real reason to wait, it should close — either by being designed or by being marked out of scope.

- **Daily branch commit logic** — keyword/trigger definition. Post-MVP by design.
- **Onboarding question set** — will be linked to folder structure; designing it before the structure stabilizes would ship a flow about to drift. Reflection practice (range from like/dislike to journal entry) is committed as the first onboarding capability; specific question set deferred.
- **Full responsibilities mapping** — stub by design until features stabilize. Per-feature mapping needs a dedicated thread later.
- **Templates / `templates/user-repo/README.md`** — deferred until [[Observer]] firms up the folder structure.
- **Passive signal integrations** (existing-platform syncs — Meta, streaming, listening history). Architecture committed under [[Three Layers of Data]] / Passive Signal. Specific platform integrations deferred to Phase 2+; needs Observer write-path before any sync target is built.
- **EOL semantics for user notes** — bandaid: yearly-no-push triggers next merge cycle upward; references persist independently of any single source's activity, so the community mirror holds when a user goes inactive. Full design (involuntary EOL, signal source diversity, quarantine periods, bad-actor protection) deferred until usage signal indicates real need.
- **EOL detection mechanism for source-layer recovery** — trigger logic (Rookery declares vs multi-signal absence vs explicit user pre-config) deferred to Phase 3 alongside the rest of the recovery UX. Architectural commitment lives in [[Three Layers of Data]].
- **Source recovery path selection** — Rookery N-of-N vs designated heir opt-in. User-config-dependent. Both paths committed architecturally; specific UX and default selection deferred until external users surface the friction.

## Naming Convention

Names follow penguin behaviors that carry layered human meaning. The standard was set by [[Pebble]] — gifting pebbles as courtship maps to sharing experiences and giving to others.

A name is acceptable if and only if:

1. It corresponds to a real penguin behavior
2. The behavior maps to a clear human meaning
3. The human meaning matches the role the name will fill

A constraint produces coherence. A naming system that just picks evocative words drifts toward branding rather than meaning. The penguin behaviors anchor the metaphors; the metaphors anchor the architecture; the architecture stays legible because the names are.

**Crèche is a working name.** Subject to future change if a better penguin-behavior name fits the standard. Reasoning is preserved at the same standard as all naming.

## Banking and Pending Items

### Banking
A business checking account is in place as a **placeholder**. Pending CPA consultation and potential migration. Earlier research into other banking options is set aside for now; the active arrangement is the placeholder. **Why placeholder is acceptable**: the current banking arrangement is functional. Migration is a follow-up, not a blocker. The infrastructure work that *does* block — LLC formation, EIN, license, GitHub org — is done. Holding the question of banking optimization for after CPA consultation prevents premature optimization and aligns the decision with the broader tax and structure conversation.

### What's pending
- **Series LLC amendment** — Crèche as primary series, Forage as secondary. Needed before Forage has formal contracts or invoices. Pending CPA consultation.
- **Foreign registration** in any state where physical presence creates a nexus — pending CPA review on franchise tax implications.

These are **not settled** — they are open questions waiting on professional input.

## GitHub

Pengwin Labs org is live. Crèche repo licensed AGPL-3.0. Prior art clock running.

## Connections

[[Crèche]] — primary product
[[Forage]] — parallel SaaS product
[[Privacy as Structural Property]] — same structural-defense principle at the architecture layer
[[Founder as First User]] — Pengwin Labs operates by the same questions Crèche helps users ask

## Open Questions

- Series LLC amendment timing — when does CPA consultation land?
- Encryption tool choice — git-crypt vs age vs SOPS — which ships first?
- Foreign registration in any state where physical presence creates a nexus
