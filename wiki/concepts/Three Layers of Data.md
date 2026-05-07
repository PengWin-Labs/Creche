---
title: Three Layers of Data
type: concept
tags: [cluster/architecture, architecture, framework, privacy, technology, accessibility]
sources: [Crèche Vault]
created: 2026-05-01
updated: 2026-05-05
---

## Definition

The data-shape model in [[Crèche]]: three layers describing *what kind of thing* is being held — source (raw input), shaped artifacts, and generic shape and category. The data-layer model is **orthogonal** to the [[Three-Tier CRM Model]] (which describes *who is in the conversation*). The two axes apply simultaneously to the same content.

## The Three Layers

### Layer 1 — Source (raw input)
Pebble threads, conversations, personal files, original uploads. The deepest tier.

- **Encrypted to the user's key only.** Never promoted (default).
- **Access by anyone other than the user requires N-of-defined-set consent** ([[Rookery]] by default) — the same primitive as account recovery, applied to the deepest data tier
- This is also the override mechanism for elevation: if a user *wants* a journal at the household layer, that requires the same N-of-X consent
- EOL recovery for source follows this path or a user-designated heir if configured

### Layer 2 — Shaped artifacts
What the user has authored — notes, summaries, refined PDFs, docs, uploads.

- Gated by community sets per folder or per artifact (e.g. a home remedies summary visible to a community set; the full PDF visible only to a household subset)
- Sane tiered defaults (anyone / household / community / private) with per-artifact override
- Parent categories aggregate high-level access from children where children have promoted

### Layer 3 — Generic shape and category
Doctrine-aligned vocabulary. Anonymized shape and category references that have settled at community or framework level.

- Inherited shapes, shared categories, common patterns
- This layer is **materially valuable on its own** — basic business steps, common household practices, generic reflection vocabulary — without requiring access to anyone's specific artifacts

## Shape vs Biography

The three-layer model rests on a more fundamental distinction: **shape** belongs to source (the pattern, the structure, the abstract resonance); **biography** belongs to the avatar (the lived, specific, time-bound experience). The shape of a Finding Nemo experience — *father fights with son, son gets lost, father finds son* — is the unit that travels upward without the biography. See [[Foundational Principle#User as Source]].

This is why anonymization at the household → community boundary is structurally possible rather than a privacy add-on: shape is already extractable on its own terms.

## How Shape Gets Formed (Reflection and Shape Vocabulary)

Shapes can't be defined until a member is reflecting. **Naming feelings is the precondition** — and "naming" is wide. A like or dislike tapped on a moment counts. A journal entry counts. Both are valid inputs from day one.

A member who isn't reflecting yet generates instances [[Observer]] can record but not patterns Observer can resolve.

### Media as shape pointer
Once reflection is practiced, media engagement becomes one of the primary ways shapes get named. Songs, films, books, shows. Sometimes the user names the connection explicitly (*"this felt like me"*); more often the parallel exists in the data without the user articulating it — a kid who keeps returning to a particular show, an episode someone rewatches, a song on repeat during a hard week.

Observer can resolve shape across the media's content and the user's life **without the user bridging it consciously.** The bridge gets offered later, gently, when conditions are right. This is the access point for users who aren't yet in a reflective mode. Requiring conscious articulation would re-introduce the meta-cognitive ceiling the rest of the architecture is built to avoid.

### The reflection spectrum
- **Lower end** — like/dislike taps, passive engagement, media signal. The access floor; what makes Crèche usable for people who aren't doing meta-cognitive work on themselves.
- **Upper end** — structured notes, user-defined groupings, deliberate refinement. Intentionally second-brain-shaped.

**Both are required** for the system to do what it's meant to do. Inheriting the conclusion is one thing. Inheriting the **reasoning, the sources, and the framework** someone built to get there is the actual cross-tier value. The lower end protects access; the upper end produces durable value.

### Inherited shape vocabulary
Pre-existing shape vocabulary travels with the framework — the founder's, the household's, the community's. New members encounter inherited shapes as a starting point. Personal shape-formation is always available regardless: a member can name a shape that doesn't exist in any tier they've joined, and that shape lives at their individual layer.

### Cross-channel coherence
The same shape recognized across like/dislike signals, journal entries, media references, and behavioral patterns is **stronger signal** than any single channel.

## Topical Categorization (the orthogonal axis to shape)

Where **shape** names the emotional or pattern resonance of an experience, **topical category** names where it sits in the user's domain map — entertainment, learning, work, health, whatever the user actually groups things into. The axes are independent and both apply to the same content.

Categories are automatic, lightweight, connection-oriented. [[Observer]] forms them actively. Sub-categories surface as content accumulates (rock and pop within music). Cross-cutting tags emerge naturally (favorites, workout playlists). The user doesn't have to define these in advance.

**Cross-category patterns are where new shape vocabulary often forms**; alignment work happens within a category once the shape exists. Topical categories resolve at the community tier the same way shapes do: same category, different concrete content. One user's entertainment is movies and music; another's is art. The category is shared even though the experiences aren't. This is what makes one household member's promoted notes findable to another household working on a similar topic.

**Subscription pulls context into scope.** Subscribing to a community-level category pulls its accumulated context into Pebble's reference scope. The current chat-and-push setup with project files is the workflow example at Phase 0: project files like `reference.md` function as the in-scope subscribed context Pebble references during chat; pushes to those files are the merging step.

## Passive Signal

Shape resolution benefits from passive data — engagement the user didn't have to articulate. A kid returns to a show without naming why; an adult saves recipes for months without cooking them. The parallel is resolvable from the engagement itself; the user doesn't need to confess it.

Pulling years of existing engagement at onboarding gives Observer a running start — Pandora-style prefill rather than waiting months for signal to accumulate from scratch. **Forcing the user to be conscious about what they share going forward re-introduces the meta-cognitive ceiling.** Passive only works if it stays passive.

Constraints:

- **Adapter pattern applies.** Any specific platform integration is one source among many, never load-bearing
- **Storage stays user-controlled.** Synced data lives in the user's own repo
- **Vendor selection standard applies to whether to integrate, not whether to use.** The user's data on a misaligned platform is still the user's data; pulling it into a system the user controls is **reclamation, not endorsement**

Specific platform integrations deferred to Phase 2+; needs Observer write-path before any sync target is built.

## Wiki of Wikis (Synthesis Surface)

The synthesis surface mirrors the data layers. Each tier in Crèche has its own LLM Wiki; parent-tier wikis are *composed from* their child-tier wikis under what the parent's members have accepted.

- **Personal wiki** — synthesizes across all three layers for that user, including the source layer
- **Household wiki** — generated from member personal wikis filtered through what the household has accepted; layer 1 stays sealed (override via N-of-X), layer 2 conditional, layer 3 always travels
- **Community wiki** — same composition pattern; identifying detail stripped at the boundary by Observer

Composition is not concatenation. The household wiki contains pages that synthesize across member persons (vendor records built from multiple members' notes), pages corresponding to practices the household has accepted, and shape definitions resolved across members. The community wiki carries scaled definitions visible across the community without exposing any one household.

[[Pebble]] writes the personal wiki; [[Observer]] writes the household and community wikis (Pebble writing higher tiers would violate [[Read-Path Write-Path Split]]). The merge of `Chris Brain` (this wiki) with `creche-vault` is itself an instance of the pattern at the household-tier scale — two brains becoming one synthesis under what was accepted between them.

## Cross-Log Perspective Angling

When multiple members log the same event privately, [[Pebble]] can use both logs to improve the perspective it offers each person — **without either person seeing the other's data.**

> The insight crosses. The privacy doesn't.

### The boundary
- Pebble offers angles **informed by** the cross-log data
- Pebble **never cites** the other person's log as a source

Informed suggestion protects privacy. Revealed data violates it.

### Example shape

A household member logs frustration about a recent interaction. Another household member logs feeling shut out from the same interaction. Pebble can surface:

> *"There's a pattern in how recent moments together have been landing. Worth a conversation?"*

What Pebble does **not** do:

> ~~*"They felt shut out. Here's what they wrote."*~~

The first surfaces the connection. The second crosses the privacy line.

### Why this works structurally

The shape resolution layer separates pattern from biography. Pebble can know that a shape is forming across two members' logs without exposing either log's specifics — same primitive that makes anonymization at the community boundary possible. This is [[Foundational Principle#User as Source]] applied within the household tier: shape crosses, biography stays.

## Promotion and Surfacing Behavior

How the layers behave at runtime — promotion across tiers, convergence with existing community vocabulary, and how Pebble offers connections without pressuring artifact-sharing.

### Promotion behavior is configurable per user

A power-user config promotes simultaneously to all tiers the user has joined; a more reserved config promotes deliberately, one tier at a time. **Journals never promote regardless of config** — the journal-stays-at-origin rule is structural, not a setting.

### Confirm-or-subscribe

When someone else in a shared community surfaces a shape the user has independently been living, [[Pebble]] offers the existing community-tier shape as a subscription rather than re-promoting in parallel. Same mechanic as inherited shape vocabulary at onboarding (see *Inherited shape vocabulary* above) — **convergence rather than duplication.** This keeps the community wiki from filling with near-duplicate shape entries that describe the same pattern in slightly different words.

### Prompt-to-connect

Pebble proactively surfaces connections using the generic shape and category layer — *not* by pushing users to share their artifacts. A cousin mentioned needing help with his business surfaces existing community-level business-steps vocabulary that already lives in shared scope. The connection is made through doctrine-aligned shared resources, not through cross-exposing private artifacts.

This is [[Connections vs Solving]]'s perspective expansion principle pointing **outward**. The `no_pressure_after_offer` guardrail (see [[Guardrails]]) applies the same way as it does to inward-facing perspective offers — the user is shown what's available; they decide whether to engage.

## EOL is the Catch-All Merge

Anything Crèche has processed during a user's active period eventually merges upward at EOL — at minimum as generic shape and category contribution to the framework, even for users who never explicitly pushed artifacts. Source layer remains gated by its recovery path; shaped artifacts inherit their last-set tier; generic shape always merges.

## Source-Link Disambiguation

"Source" carries two senses:

- **Philosophically** — the user as source, biography as avatar (see [[Foundational Principle#User as Source]])
- **Cryptographically** — the deepest data tier (Layer 1, raw input, encrypted)

For an individual Crèche the two collapse. For a commissioned multi-household entity at the community tier, the cryptographic source is jointly held while the philosophical source remains per-person. Use `source-link` when disambiguation is needed.

## Connections

[[Three-Tier CRM Model]] — orthogonal axis: tiers describe scope, layers describe data shape; the two together describe the architecture
[[Alignment]] — the protocol over divergence; layers determine what travels and what doesn't
[[Cache]] — the layer where the data shape becomes addressable; access patterns (recency, density, topical proximity, cross-channel coherence) govern what gets surfaced from each layer at runtime
[[Privacy as Structural Property]] — Layer 1 encryption + Rookery N-of-X recovery is the structural defense
[[Rookery]] — N-of-defined-set consent as the recovery primitive *and* the elevation primitive
[[Observer]] — resolves shape from experience at each layer
[[Foundational Principle#User as Source]] — the philosophical foundation for the shape/biography split
[[Read-Path Write-Path Split]] — Pebble reads layers; Observer writes between them and across tiers
[[Foundational Principle#Universal Accessibility]] — the lower end of the reflection spectrum is the access floor

## Evolution

Consolidated 2026-05-01 from five pages: Three Layers of Data (existing), Reflection and Shape Vocabulary, Topical Categorization, Passive Signal, Wiki of Wikis. Each absorbed page was substantively about *what kind of thing* gets held or how shape gets formed within the layer model — the split made the load-bearing claims hard to find.

## Open Questions

- What is the default tiering of sensitive (reflection logs, medical observations) vs routine (groceries, schedule) data, and is it user-adjustable or per-record-type?
- How does the time-delayed escrow option (sealed recovery path with time delay + Rookery notification) work in practice?
- Does anonymization at the community tier hold against re-identification attacks if the community is small?
- Phase 0 defers encryption — until then, even the override path (journal elevation via N-of-X) cannot run; what is the operational boundary while encryption is open?
- What is the minimal viable lower-end onboarding experience for someone who isn't journaling yet?
- What's the first concrete passive-signal platform integration to ship?
- How does cross-tier wikilinking work when names are anonymized at the community boundary?
- **EOL detection mechanism for source-layer recovery** — trigger logic (Rookery declares, multi-signal absence, explicit user pre-config) deferred to Phase 3 alongside the rest of the recovery UX. Architectural commitment: see Layer 1 + EOL is the Catch-All Merge above.
