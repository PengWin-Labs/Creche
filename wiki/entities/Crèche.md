---
title: Crèche
aliases: [Creche]
type: entity
tags: [cluster/agents, product, framework, organization, technology, personal-crm]
sources: [Crèche Prior Art, Crèche Vault]
created: 2026-04-30
updated: 2026-05-03
---

## Overview

Crèche is an open-source home and community management framework. It is conversational infrastructure for the home — the same kind of organized records, pattern detection, and automated advocacy that businesses take for granted, brought to individuals and households at no cost, using infrastructure they already own. In Phase 0 users talk to [[Pebble]] through the Claude app, with Google Calendar and GitHub providing scheduling and state. Users' data lives in a private git repository they own.

The framework is built on a single principle: *love yourself to the degree you love others.* Most people show up reliably for others. The gap is not worth — it's infrastructure. Crèche closes the infrastructure gap.

## Naming

Crèche follows a naming convention managed at the [[Pengwin Labs]] level: every component is named after a penguin *behavior*, chosen so the name describes what the thing does in nature and also what it does for the user. **Crèche itself is a working name** — subject to future revision if a better penguin-behavior name fits the standard.

| Name | Penguin behavior | What it does in Crèche |
|---|---|---|
| **Crèche** | Where chicks are collectively cared for while parents forage | The framework as a whole |
| **[[Pebble]]** | The gift penguins offer during courtship | The conversational interface users talk to |
| **[[Cache]]** | Where penguins store | The memory and intelligence layer |
| **[[Observer]]** | Watching — observing cross-colony patterns | The write-path agent; watches for patterns, promotes between tiers |
| **[[Rookery]]** | A colony — the close-knit community | The trusted inner-circle layer; social signal + key recovery |
| **[[Forage]]** | Going out to find what's needed | Parallel SaaS product (separate from Crèche; under [[Pengwin Labs]]) |

## What Users Experience

A user interacts with Crèche entirely through messaging. Day to day:

- They talk to [[Pebble]] the way they'd talk to a thinking partner — journaling, asking questions, flagging things worth remembering
- [[Pebble]] nudges them to journal on their chosen cadence; misses it after 3 days without an entry
- Entries range from long reflection to micro-captures: a rating of an experience, a quick note about a vendor, a single observation
- [[Pebble]] reads the relevant slice of their history to respond with context — it is not starting cold on every message
- The `spa` skill watches journal cadence and language; when it detects depletion it surfaces a deliberate-pause prompt
- Over time, [[Observer]] notices patterns and promotes relevant records to household or community scope (Phase 1+)
- The [[Rookery]] connects the user's trusted inner circle and serves as the key recovery layer (Phase 1+)

## Founder Hosting Activates the Community Tier

Aligning two of one person's own Claudes through one host is the same architectural problem as aligning multiple users in a community, scoped down. Solving it at N=2 produces the runtime everything else runs on. **Not parallel work — the same work.**

This collapses the question of when the community tier activates. It's active **the moment the founder hosts.** The founder is the seed node — first community host, not just first user. Other users either connect to that host (subscribing to its refined definitions and shape vocabulary) or fork the framework and host their own. Both are first-class.

**Hosting a community-shape or household-shape repo doesn't merge it with the founder's personal repo.** It's a separate substrate that other contributors can write into. Same primitive (community), separate repo. The same person can be a member of several repos at different shapes (personal + business + community + friend group) without those collapsing into one. See [[Three-Tier CRM Model#Tiers as Community Shapes]] for the taxonomy-side framing.

[[Pengwin Labs]]'s AGPL-3.0 is the structural defense that makes hosting the canonical distribution path rather than a SaaS-equivalent loophole — anyone running a hosted Crèche must publish modifications, which keeps hosting and forking on equal footing.

**MCP is the current target for hosting infrastructure, not the goal.** The goal is the least-friction path; MCP fits now. Documenting the setup process is what makes the path repeatable regardless of which runtime ends up canonical. Future hosts follow the documented path, not the specific tool. This applies the same reasoning-and-inheritance principle to the build process itself.

**Documentation of the setup process is part of the deliverable, not a byproduct.** Without it, the framework inherits but the runtime doesn't, and people end up either dependent on the founder's host or rebuilding from scratch. Neither matches the access principle.

The mechanism for one host serving multiple clients is the [[Pebble#Operational Shape — `.claude/` Pattern Analogs]] table. The readiness diagnostic for a new host is [[Pebble#Phase 1 Ship Test]] (clone-and-validate). Both currently underway.

## Feature Taxonomy

Crèche uses a deliberate taxonomy. These categories are not interchangeable.

### Agents
Long-running roles with behavioral commitments. Framework-level; doctrine.
- **sequence** — the main conversational loop: read, respond, commit when asked
- **onboard** — runs once at provisioning; asks voice questions, explains guardrails
- **observer** — the write-path agent; cross-tier promotion and anonymization

### Skills
Bounded domain capabilities [[Pebble]] draws on. Toggleable per user.
- **spa** — deliberate-pause prompts; only skill enabled by default *(Phase 0)*
- **tax** — filing awareness, structural options; not advice
- **legal** — rights surfacing across consumer, workplace, housing
- **health** — general wellness patterns; `no_medical_advice` guardrail applies
- **home** — operations, maintenance, vendor records
- **education** — learning support, resource discovery
- **insurance** — coverage literacy, claim navigation
- **investment** — structural literacy; not recommendations

### Features
User-facing capabilities that compose agents, skills, and connectors.
- **[[Rookery]]** — trusted inner circle; social signal + key recovery
- **[[Journal]]** — the core reflective surface; nudge, write, commit, merge
- **Superpowers** — agentic delegation against external systems *(Phase 1)*
- **counter-tactics** — automatic defenses against extractive patterns (dynamic pricing, dark patterns, pre-checked upsells) *(Phase 1)*

### Departments
Cross-cutting coordination at household or community scope.
- **civic** — housing code, utilities, local services, legal filings
- **procurement** — shared purchasing, bulk-buy coordination, price intelligence
- **community** — anonymous pooling, pattern alerts, connection matching

### Functional Scope (canonical module list)

The full set of modules under design. Each one either absorbs coordination labor (see [[Foundational Principle]]) or recovers margin from systemic friction.

**Personal & household**
- Personal reflection and struggle logging — first-class feature, equally valued with achievement
- Family scrum — weekly standup adapted for home life
- Chore engine + recognition system
- Family memory & values — living institutional memory of the household
- Screen-time tokens for children — chores and reflections both earn tokens

**Civic & advocacy**
- Civic services & accountability — three-tier (logged / concern / verified violation), passive documentation as default, coordinated multi-channel filing for verified violations, follow-up loops
- Workplace rights & protections — extra caution layer because retaliation is real; documentation always before visible action
- Counter-tactics — automatic where possible, layered transparency on every action

**Community**
- Community matching — anonymous double opt-in
- Community alerts — natural behavior patterns become collective signal
- Home remedies / potion system — three-tier (personal / household / community), feedback-tracked, never medical advice
- Community price intelligence (future) — being explored, not committed

**Quality and integrity** (structural defenses, not user-facing features)
- Communication coach + prompt-engineering monitor
- Thinking partner agent (founder-facing)
- Supervisor / Observer — quality, epistemological integrity, cross-log perspective integration
- Behavioral personalization per member — communication style and behavioral pattern learning, location-based triggers (opt-in)

### Connectors (tiered)
- **Free path** — calendar + GitHub + messaging; uses infrastructure the user already owns; default; non-negotiable
- **Standard path** — optional hosted convenience (hosted runtime, managed key escrow)
- **Self-hosted path** — no third-party anywhere; fully supported

## What It Is Not

From the README — these are architectural, not marketing:
- Not a SaaS product
- Not a data broker
- Not a surveillance tool
- Not a real-time solving tool — this distinction is load-bearing; see [[Connections vs Solving]]
- Not locked to one family shape, household shape, or use case
- Not required to be hosted by the maintainers

## Key Architectural Properties

- **[[Three-Tier CRM Model]]** — Individual, Household, Community; each a separate git repo/org
- **[[Git as Data Layer]]** — folder structure is the schema; no separate relational database
- **[[Privacy as Structural Property]]** — ciphertext at rest, user-held keys, Rookery recovery
- **[[Read-Path Write-Path Split]]** — Pebble reads, Observer writes; makes anonymization auditable
- **[[Doctrine Practice Expression]]** — governs what is immutable, what ships with intent, what the user owns
- **[[Guardrails]]** — 11 doctrine-level behavioral commitments encoded in `pebble/config.yaml` v0.2.0
- **[[Foundational Principle]]** — *love yourself to the degree you love others*; mission frame; universal accessibility; coordination labor absorbed

## Phase 0 MVP

Single user. **Stack**: Claude app (channel) → Google Calendar (scheduling) → GitHub (state) → Pebble-as-Claude-project. The original WhatsApp / Twilio / AWS Lambda design is deferred. GitHub OAuth provisioning. Daily branch journaling. Guardrails enforced at the prompt level. Founder is both builder and first user. Five exit criteria defined — see [[Crèche Prior Art]].

## Appearances

- [[Crèche Prior Art]] — founding architecture documentation; philosophy, three-tier model, agents taxonomy, privacy model, MVP plan, open questions; template files (personality.yaml, config.yaml, skills/config.yaml)

## Open Questions

- Does [[Connections vs Solving]] hold under real user pressure for immediate answers?
- Does the free-path default survive infrastructure costs at scale?
- What abuse vectors haven't been anticipated? (Controlling partner surveilling via concern channel; harassment via complaints; matching used to locate someone who doesn't want to be found — these are named; others are not)
- Does the surveillance problem have sufficient architectural mitigations?
- Documentation of the setup process: what's the minimum viable form for a second host to follow without coaching?

## Evolution

Extended 2026-05-03 from Observer relay (`pebble-to-observer/2026-05-03` morning) and Chris's worked resolutions in `relay-integration-context.md`: added `## Founder Hosting Activates the Community Tier`. Solving alignment at N=2 (two of the founder's own Claudes through one host) produces the runtime that scales to multi-user community. Founder hosting is what activates the community tier — the founder is the first community host, not just the first user. Hosting a community-shape repo doesn't merge it with the founder's personal repo; same primitive, separate substrate. MCP is the current target for hosting, not the goal — the goal is the least-friction path. Documentation of the setup process is treated as load-bearing deliverable, not byproduct. Cross-links to [[Three-Tier CRM Model#Tiers as Community Shapes]], [[Pebble#Operational Shape — `.claude/` Pattern Analogs]], and [[Pebble#Phase 1 Ship Test]].

File renamed 2026-05-03 from `Creche.md` (ASCII) → `Crèche.md` (with diacritic) so wikilinks resolve to the canonical filename. Aliases line trimmed to `[Creche]` for the ASCII fallback.

Cluster tag moved 2026-05-03 from `cluster/business` → `cluster/agents`. Crèche is structurally Pebble + Cache + Observer plus the framework around them — the agent ecosystem is what Crèche IS, so the cluster should reflect that. Business and organizational dimensions (Pengwin Labs as parent LLC, AGPL, Forage as parallel SaaS) are still represented via wikilinks but no longer drive the cluster color. CLAUDE.md cluster table updated to match.
