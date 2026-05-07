---
title: Privacy as Structural Property
type: concept
tags: [cluster/privacy, architecture, privacy, philosophy, framework]
sources: [Crèche Prior Art, Crèche Vault]
created: 2026-04-30
updated: 2026-05-03
---

## Definition

Privacy in [[Crèche]] is a structural property, not a feature or a promise. The system is designed so that the maintainers, the hosting provider, and even a hostile actor with hosting-level access cannot read user data without the user's keys. "We promise not to look" is not a privacy model; ciphertext at rest with keys the user controls is.

## How It Works / Mechanism

### Two distinct threat models addressed separately

**IP absorption**: a large provider acquiring the project and closing the source. Defense: AGPL-3.0, which requires any modified or network-exposed derivative to carry the same license and make source available. This doesn't prevent hosting acquisition but prevents the project being absorbed into a closed product.

**User data at rest**: private CRM data sitting readable on a third-party server. Defense: end-to-end encryption with user-held keys. The host stores ciphertext only.

### Operational pattern
```
Pebble reads and writes plaintext locally
On push: files are encrypted
Host stores ciphertext only
Any device with the key decrypts on pull
Repo structure unchanged; cross-device access preserved
```

### Key recovery: the Rookery
Because user-held keys create a single point of failure (lost key = lost data), recovery is handled via [[Rookery]] — Shamir's Secret Sharing distributes the key across trusted contacts. The trust network built for social signal is reused for key recovery — architectural reuse rather than a new burden on the user.

### Anonymization at community tier
[[Observer]] strips identifying detail (names, locations, relationships, dates, institutions) before any record is promoted to community scope. This is anonymization, not encryption — community records are readable, but their authorship is not reconstructible. This is why Observer must be the sole writer at that boundary: distributed anonymization logic is impossible to audit; concentrated logic is.

The structural reason this works — and the reason it isn't a logistical override layered on top of an otherwise leaky system — is that **households are stable and communities are fluid.** The unit being promoted across the boundary is **shape, not membership-roster.** There is no stable membership roster on the community side to attach identifying detail to: communities are joined and unjoined, contexts overlap, the same person is simultaneously in several. Anonymization is clean because there is no place for identity to land at the destination. See [[Three-Tier CRM Model#Why anonymization works structurally at this boundary]] for the scope-side framing of the same fact.

### Authenticity without exposure
A related commitment at a different layer: [[Crèche]] never emits names, specific locations, specific relationships, precise dates, or institutional identifiers by default. The emotional truth of an experience is always available; the autobiography is not. Encoded as the `authenticity_without_exposure` guardrail — this is doctrine, cannot be changed without forking.

### Source / summary / relay — three layers, one chokepoint

An earlier framing implied the chokepoint was "strip personal details on the way out" — at relay-write time. That was wrong. The corrected mapping has three layers:

| Layer | What it is | Privacy property |
|---|---|---|
| Source | Chat thread / in-conversation working memory | Private; personal context lives here legitimately because that's what makes the conversation alive |
| Summary | The commit / per-chat or end-of-day extraction | Stripped; this is the artifact; chokepoint governs its contents |
| Relay | What promotes outward (across tiers, across surfaces) | Carries the summary, not the source |

The chat thread is the source: private, holding personal context as working memory. The summary is the commit: shaped, clean, and the first thing that counts as an artifact. The relay is what the architecture promotes outward. **The thread is never the artifact.** The chokepoint governs what the summary contains — not what lives inside an in-conversation draft pre-commit, which is still inside the source layer and protected by the working-memory frame.

The encrypted link (or equivalent) to source makes the chain auditable without exposing the source. Automation creates the summary; substitution markers (next subsection) are how the summary names what the source held.

### Typed substitution markers

Identity substitution slots into the same family as the existing `[reframe: ...]` marker (visible language transformation). Bracket families:

- `[relationship: ...]` — `cousin`, `partner`, `sibling`, `extended_family`, `family_member`
- `[role: ...]` — `employer`, `client`, `collaborator`, `workplace`
- `[place: ...]` — `hometown`, `workplace`, `hub_city`, `origin_region`

**Granularity is tier-relative.** Each tier up uses a coarser marker as content promotes:

| Tier | Example |
|---|---|
| Personal | `[relationship: cousin]` |
| Household | `[relationship: extended_family]` |
| Community | `[relationship: family_member]` |

Substitution is **legible**, not silent — the brackets are visible in the artifact. A reader with personal context fills in the original; a reader without sees only the category at the appropriate resolution. Absence of brackets implies the category doesn't need substituting (a song title, a public concept, a system component).

This grounds in the same shape-vs-biography logic as [[Three-Tier CRM Model#The promotion unit is shape]] — each tier up holds less personal detail because the higher layer is about aligning, not preserving who-did-what. Substitution markers are how that principle gets enforced at the token level inside the summary.

### Append-only is at the commit, not the file

Pre-write enforcement is structurally required at the commit boundary; file mutability is acceptable. The doctrine being preserved is commit-level append-only, not file-level — committed-then-corrected still leaves the original in history regardless of what happens to the file.

Drive's create-only-no-update constraint approximates the property imperfectly because of substrate, not because the property applies to the file. See [[Git as Data Layer#Immutability is at the commit, not the file]] for the storage-architecture-side framing of the same point.

## Layered Transparency

Crèche is fully transparent — but transparency is delivered at the depth the person wants, never buried, never forced.

```
Layer 1 — What (everyone sees)
Plain statement of what the feature does.

Layer 2 — How (one tap away)
Full honest explanation of the mechanics.

Layer 3 — Full context (always linked, never buried)
The complete philosophy and reasoning.
```

Each layer is complete on its own. Going deeper is always easy. Information lives at the point of contact: you learn what Pebble does with your presence when you're setting up Pebble — **not buried in a document you agreed to years ago. No terms-of-service maze.**

The opposite pattern — full disclosure as a wall of legalese delivered at signup, never referenced again — is technically transparent and practically opaque. Layered transparency inverts it: the surface is complete and short, the depth is available and discoverable.

## Confidence Levels

[[Cache]] holds entries with appropriate uncertainty across four levels:

- **Observed** — Pebble was present, real-time record exists. **Ground truth.**
- **Recalled** — member reported after the fact. *Useful data, not ground truth.* Held as "this is how it was experienced and recalled."
- **Self-assessed** — member's interpretation of their own behavior.
- **Behaviorally evidenced** — what Pebble has actually watched over time.

Self-assessed and behaviorally-evidenced versions are often different. The supervisor / Observer holds both and **uses the gap to inform rather than correct.** The architecture doesn't try to collapse these into a single canonical record — the differences between them are information.

How Pebble surfaces the gap: not as accusation, as reflection. *"You've mentioned X is a value. The recent record shows Y. Worth a look at?"* The user decides whether the gap is meaningful, the value has shifted, the record is incomplete, or the framing is off. Pebble doesn't conclude on the user's behalf.

Recalled data isn't dropped because how something was experienced is itself information about the person — even if the literal facts of the event are imperfect. The architecture preserves both rather than privileging one.

## The Surveillance Problem (Asymmetry Argument)

Radical transparency applied universally cuts both ways. The same infrastructure that lets communities see what meat costs in their neighborhood lets a state actor see what every citizen is doing. The current design choices — self-hosting, open source, community ownership, horizontal flow — create **friction against misuse**. They don't eliminate it.

The counter-argument: the misuse concern assumes the bad actor doesn't already have something equivalent or better. **State-level actors do.** Vertical surveillance capability already exists and is well-funded. Crèche adds horizontal capability into an asymmetry that already runs the other direction — **not creating a tool where none existed, balancing one that already does.**

What stays unresolved:

- Whether the friction is sufficient against actors who genuinely don't have parallel tooling
- What abuse vectors haven't been anticipated
- How the asymmetry argument interacts with the equity principle (lower-resourced groups gaining capability while higher-resourced groups already have it)

The asymmetry argument **sharpens the question rather than closing it.**

## Foreseeable Abuse

Identified abuse vectors have guardrails. **Guardrails against known vectors don't protect against unknown ones.**

Covered:

- Weaponization of the inbound concern channel — see [[Rookery]]
- Volume bias against high-need users — equity principle in [[Pebble]] standards
- Prompt injection from external content — privileged/unprivileged split in [[Pebble]] standards
- Dependency on Pebble for routine validation — dependency detection in [[Pebble]] standards
- Cross-log privacy violations — see Cross-Log Perspective Angling section in [[Three Layers of Data]]

Not covered: what hasn't been seen yet. The abuse cases that will only become visible once real people are using it in conditions that weren't anticipated.

This is fundamentally different from the other open questions — **it's not a tension to hold; it's an acknowledgment that the threat model is incomplete by definition.**

Mitigation posture:

- The architecture is built to make new abuse vectors **legible** when they emerge — anonymization at a single chokepoint, single write-path, clear data layering
- Layered transparency means the user is always within reach of understanding what's happening with their data
- The license keeps the code open so external review can find what internal review missed

These don't solve the foreseeable abuse problem. They make the system inspectable enough that unknown vectors can become known once they're observed.

## Evidence & Examples

Tools under evaluation for encryption: git-crypt, age, SOPS. Decision deferred until Phase 1 — operational experience with the single-user pipeline informs tool choice.

Phase 0 explicitly defers encryption: "Phase 0 stores plaintext in private repos; Phase 1 addresses ciphertext at rest. Documenting this honestly is better than shipping encryption before the operational model is understood."

## Connections

Privacy as a structural property depends on [[Read-Path Write-Path Split]] — if [[Pebble]] could write between tiers, anonymization logic would have to live in Pebble, where it's impossible to audit. The split concentrates write logic in [[Observer]], making the privacy commitment auditable.

Privacy is also why [[Git as Data Layer]] works: git is the substrate, encryption is a git-level convention, no new infrastructure required.

[[Three Layers of Data]] — Layer 1 is encrypted to the user's key only; Layer 2 gated; Layer 3 anonymized. The data-shape model is what privacy operates on.

[[Rookery]] — N-of-X consent primitive for source-layer recovery and journal elevation; Inbound Concern Channel as the tiered-weight signal-in mechanism.

[[Pengwin Labs]] — AGPL-3.0 as licensing-layer expression of the same structural-defense principle.

## Evolution

Extended 2026-05-03 from two Observer relays (`pebble-to-observer/2026-05-03` morning + `2026-05-03-0840`) and Chris's worked resolutions in `relay-integration-context.md`. Three additions: (a) `### Source / summary / relay — three layers, one chokepoint` (Q2 resolution) — chat thread is source, summary is the commit, relay carries the summary; the thread is never the artifact; chokepoint governs the summary, not in-conversation drafts. (b) `### Typed substitution markers` (Q3 resolution) — `[relationship: ...]`, `[role: ...]`, `[place: ...]` bracket families; tier-relative granularity (`cousin` → `extended_family` → `family_member`); legible, not silent. (c) `### Append-only is at the commit, not the file` — pre-write enforcement is structurally required at the commit boundary; file mutability is acceptable; cross-linked to [[Git as Data Layer#Immutability is at the commit, not the file]].

Extended 2026-05-02 from Observer relay (`[Pebble] 2026-05-02`): the anonymization-at-community-tier section gained the structural rationale — anonymization works because households are stable and communities are fluid; shape is the unit promoted, not membership-roster; there is no place for identity to land at the destination. Mirrors the framing added to [[Three-Tier CRM Model]].

Substantially expanded 2026-05-01 with Layered Transparency, Confidence Levels, the surveillance asymmetry argument, and Foreseeable Abuse — absorbing four canonical pages into this hub. Encryption tool choice and Phase 1 timing remain open. The asymmetry argument sharpens the surveillance question rather than closing it.

## Open Questions

- git-crypt vs age vs SOPS — which ships first?
- What is the default tiering of sensitive (reflection logs, medical observations) vs routine (groceries, schedule) data, and is it user-adjustable or per-record-type?
- How does the time-delayed escrow option (sealed recovery path with time delay + Rookery notification) work in practice?
- Does the anonymization at community tier actually hold against re-identification attacks if the community is small?
