---
title: Three-Tier CRM Model
type: concept
tags: [cluster/architecture, architecture, framework, technology]
sources: [Crèche Prior Art, Crèche Vault]
created: 2026-04-30
updated: 2026-05-03
---

## Definition

The scope model underlying [[Crèche]]: three scopes — Individual, Household, and Community — each implemented as a separate git repository or org, with explicit promotion rules governing how content moves between them. Two tiers would be insufficient (no household coordination); four would be unnecessary.

The model is read on two axes that both apply: as data visibility (who is in the conversation) and as the dependency-graph topology that [[Package JSON for a Person]] names. The data-shape axis ([[Three Layers of Data]]) is *orthogonal* to this scope axis — together they describe both *who sees* and *what kind of thing* is being held.

## Tiers as Community Shapes

Individual / household / broader-community describe typical *shapes* of one primitive — community — not a fixed three-step ladder. A household is a community at a specific common shape: smaller, denser, usually co-located. A friend group is a community. The anonymized neighborhood-scale layer is a community. Same primitive, different scopes and densities. The earlier tiers-language was treating "household" and "community" as different *kinds* of thing; they aren't.

**Same primitive does not mean merged substrate.** Each shape gets its own repo. Membership composition differs across them: a household-scope or community-scope repo isn't authored only by the person who commissioned it — other members can write, refine, and promote inside that repo. The same person belongs to several repos at different shapes simultaneously (a personal repo, a business repo where they're one member among several, a friend-group repo) without those repos collapsing into one. Shape and substrate are different axes; the tiers-language was conflating them.

The architecture treats shapes differently in a few specific places — anonymization at the household → broader boundary, journals staying at the originating shape, multi-contributor membership at household and broader scopes — but those are operational distinctions, not categorical ones. See [[Crèche#Founder Hosting Activates the Community Tier]] for the runtime side of the same point, and [[Privacy as Structural Property#Source / summary / relay — three layers, one chokepoint]] for how this maps to the chokepoint.

## Tiers

### Individual
- One private git repository per user
- Contains: journal, tasks, memory, Pebble config, Observer outputs for this user, inventory/equipment
- Default surface for all [[Pebble]] interactions — Pebble is constrained to this tier; it never reads or writes at household or community scope
- Source-layer content (raw chats, journals, original uploads) stays sealed here by default

### Household
- Shared repository inside a household GitHub org; visible to all household members
- Contains shaped artifacts the household has accepted, household-scope shape vocabulary, shared notes, vendor records, household-wide preferences
- Multi-user write access; merging happens through participation, not a separate publish step
- **Granularity (Phase 0)**: current co-residents under one roof. Standard immediate-family framing. **A single-person household is still a household** — N=1 is a valid configuration. Cousins, in-laws, parents, and adjacent relatives running their own households are **community-shaped**, not household-shaped, even at n=1. The household boundary is the shared-roof + active-coordination boundary, not the kinship boundary. A more nuanced relationships map (household / community-tier-relative / Rookery-but-not-co-resident distinctions) is a real architectural need but is deferred until household composition splits across roofs or community-tier interactions go beyond shape vocabulary. See [[#Tiers as Community Shapes]] above — household is one shape of the community primitive, distinguished operationally from broader-community by co-residence and active coordination, not categorically.

### Community
- Opt-in
- Second org containing consolidated, anonymized mirrors of household-tier shared content
- All identifying detail stripped by [[Observer]] before records leave the household org
- Community-tier records become collective signal: shared pricing ledgers, vendor warnings, scaled shape definitions, remedies with sufficient independent attestation
- Writes from [[Observer]] only — never directly from users
- **Fluidity is intentional.** Community is abstract because it has to be. The same person can be in a project community, a club community, a city community simultaneously, with different shapes of participation in each. **A user joins *a* community, not *the* community.** Picking a single target group early would narrow the build prematurely; universal accessibility requires the scope to stay open.

## Promotion is Merging

There is no separate publish step. Active usage drives promotion through participation — notes get refined, categorized, reflected on, and that refinement is what flows upward across tiers. The same merge-conflict states ([[Alignment]]) that apply to relational divergence apply here.

### The granularity rule

| What | Promotes? |
|---|---|
| **Journals** | No — stay at origin tier (default). Override via N-of-X consent (Phase 1+) |
| **Notes** | Yes — individual → household → community, through active refinement |
| **Yearly-no-push** | Backstop for inactive accounts: next merge cycle picks up what was left |

The granularity rule does two things at once: surfacing what would otherwise be hoarded (notes promote) and protecting what would otherwise be exposed (journals stay).

### The promotion unit is shape

What promotes is not biography. *"Father fights with son, son gets lost, father finds son"* — that's the shape of Finding Nemo without the biography. The shape is shareable; the names and specifics stay at the user's tier. Each layer up has less personal detail because the higher layer is about aligning, not about preserving who-did-what. See [[Foundational Principle#User as Source]].

Original sources (chats, journals, raw uploads) remain the data truth at the bottom. Everything traces back to them. References persist independently of any single source's activity.

### Journal elevation via N-of-X

The default rule is journals stay individual. The override path: a user who *wants* to share a journal at the household layer does so through N-of-defined-set consent — the same [[Rookery]] / Shamir primitive used for source-layer recovery. Same cryptographic mechanism, different direction:

- **Recovery direction** — moves data outward to designated trustees on EOL or key loss
- **Elevation direction** — moves data upward to a tier the user explicitly selects

**In Phase 0 this path is not yet available** — encryption tooling is still being selected, so even the override cannot run. Journals stay individual *also* because the privacy infrastructure isn't built yet, not just because authenticity-without-exposure says it should.

### Cadence

Subscription / retro based, varies by tier:

- **Individual** is continuous through participation
- **Household and community merges** happen at retro on the same hybrid signal as voice and alignment refinement (`journal_count` OR `time_floor`) — see [[Alignment]] for the cadence pattern
- **Community merges happen less frequently than household** — shared definitions should stay stable

### Failures travel like successes

Notes surface the why — or the least-suspected why — until a similar shape from another user confirms or refines it. The architecture treats failure documentation as first-class because the **why-it-failed-for-this-shape** is what actually has to inherit; the conclusion alone teaches nothing.

### Framework evolution is separate

Improvements to Crèche itself flow through AGPL-3.0 contributions to the upstream repo, **not** through the merging of community-tier patterns into the framework. The two paths are kept separate so that the user-data layer never becomes a backdoor source of code changes.

## Pattern Resolution by Tier

[[Observer]]'s job at each tier is to resolve **shape from experience**. The unit being promoted upward is shape, not biography — which is what makes anonymization at the community boundary structurally possible rather than a privacy add-on.

| Tier | What Observer resolves |
|---|---|
| **Individual** | Instance recognition — a pattern surfacing across two or more occasions for the same person |
| **Household** | Pattern definition — the same shape held across members with different experiences |
| **Community** | Scaled definition — the same shape held across households; ongoing refinement of shared values |

A second member having the same shape with a *different* experience is what defines the pattern at the household tier rather than just recording another instance. Same logic scales upward: same shape, different households, different experiences = scaled definition. **This is what makes household and community tiers materially valuable rather than just bigger personal wikis.**

## Subscription and Refinement

Using Crèche is itself a subscription to the foundational values. Joining a specific community is a subscription to that community's refined shared definitions. **Walkways shape through participation** — what "presence" or "showing up for yourself" means in a given community gets refined over time by the people in it.

Members are held against the shared definitions of the tiers they've joined. Deviations don't get filed as opt-outs — they surface as questions during retro, on the cadence above. **Retro is where divergence becomes workable**: named, contextualized, returned to. Disagreement is expected; context is what makes resolution possible. *Agree to disagree* is not available — see [[Alignment]] and the `no_agree_to_disagree` doctrine ([[Guardrails]]).

## Community Layer as Soft Truth

The community layer functions as **soft truth — signal, not authority.** Each individual [[Cache]] independently weights incoming community signals against the user's own ground.

### Two layers of community

There are two community layers in the model, nested:

- **Framework-level community** = all Pebble users subscribed to Crèche's foundational doctrine. The widest scope. Shared by every user simply by running the framework.
- **Joined communities** = the fluid, context-shaped layer users actively join. A project community, a club community, a city community, a founder-tier peer community. Multiple at once is the norm, not the exception.

The first is given by using Crèche at all. The second is constructed by participation.

### Concrete community edges currently visible

Two genuine community-tier edges are already in scope, even at the founder's current single-household configuration:

- **Extended family running their own households** — knowledge sharing across households (kinship-adjacent but not shared-roof, so community-tier, not household-tier)
- **Founder-tier peers** — people building similar things; the layer where doctrine settles upward through conversation

Beyond those, community remains **abstract by intent**. Naming specific target communities early would narrow the build prematurely.

### Why independent weighting

Independent weighting provides **Sybil resistance without centralized control**. The architecture says: the community has a voice; what it says is one input among many; the user's instance decides what to do with it. This is the structural form of the same respect for the user that governs everything else — *the user is the ground, the community is signal.*

### Joining a community

Joining a community subscribes the user to its shared practice and lets the walkway reshape through participation — and lets the user's ground **update from the sharing rather than be overwritten by it.** The same orientation as relational divergence applies at this scale (see [[Alignment]] / Orientation section).

### Why anonymization works structurally at this boundary

Anonymization at the household → community boundary works **because households are stable and communities are fluid.** The unit being promoted across the boundary is **shape, not membership-roster.** There is no stable membership roster on the community side to attach identifying detail to — communities are joined and unjoined, contexts overlap, the same person is simultaneously in several. This is what makes anonymization architecturally clean rather than a logistical override layered on top of an otherwise leaky system. See [[Privacy as Structural Property]] for the privacy-side framing of the same fact.

### Same bones, different scope

Pebble's behavior toward the user is the same in household and community contexts: Pebble reads, Observer writes; shapes resolve from experience; walkways shape through participation; divergence is named as deferred, not resolved.

What changes by tier is *what the user is being aligned to*:

- **Household**: shared arc to align to
- **Community**: shared practice to align to

Independent weighting becomes more visibly load-bearing at community scale because **the signal is thinner**. With fewer independent attestations, each one carries more weight; the user's ground is the only stable anchor.

## Contribution as Persistence

Notes can promote because useful knowledge — a good wholesaler, research someone took time to do, a remedy that worked — shouldn't get gatekept or buried when the person stops actively participating. Notes-level contributions outlive active participation; the value stays accessible to people who come later. **This is structurally how the project becomes more than the founder.**

A user goes inactive. Or moves on. Or, eventually, dies. The notes they refined and shared upward stay accessible. The reasoning they carried forward stays inheritable. The journal layer stays sealed. This is the long-form expression of [[Foundational Principle#On Authorship]] — what's been released stops belonging entirely to the person who made it; what's stayed at the source layer stays theirs.

## Tiers as Dependency Scopes

The three-tier structure also describes a dependency-graph topology. Each tier holds what the people at that scope have declared and accepted from the scopes below. See [[Package JSON for a Person]] for the metaphor: people depend on other people, places, practices, values; compatibility constraints exist whether or not anyone has named them; conflicts surface as friction that looks interpersonal but is structurally a peer-dep mismatch. The architecture's job is to make the dependency graph legible without flattening it.

**Forking is the dissent move at every tier.** A person who rejects the household's accepted shape vocabulary forks (operationally: leaves the household). A household that rejects community-tier shared definitions forks. Same cost profile as forking a software upstream: costly enough to deter casual splits, clean enough to make principled disagreement structurally possible.

**N=1 is a valid configuration at every tier.** A household of one is still a household; a community of one household is still a community. The structural properties hold; multi-author merging just collapses to internal decision. See [[Founder as First User]]: N=1 at all three tiers in this vault, by design until a second member arrives anywhere.

## Evidence & Examples

Why not two tiers? Household coordination (budgets, calendars, shared spaces, vendors) needs a scope narrower than community but broader than individual. Collapsing household into community would either leak household detail or prevent useful coordination ([[Crèche Prior Art]]).

Why not four? The Rookery is a signal layer, not a data layer — it carries notifications, authorizations, and recovery consent, not a separate CRM pool. The three-tier model covers the coordination problem ([[Crèche Prior Art]]).

## Connections

[[Three Layers of Data]] — orthogonal axis: who sees what (this page) × what kind of thing (data layers)
[[Alignment]] — the protocol that operates over divergence at every tier boundary; merge-conflict states; cadence
[[Package JSON for a Person]] — the dependency-graph metaphor under which the tiers compose
[[Git as Data Layer]] — tiers are repos and orgs; promotion is a commit
[[Privacy as Structural Property]] — operates at the community tier boundary; Observer is the sole writer
[[Read-Path Write-Path Split]] — Pebble reads, Observer writes; doctrine
[[Founder as First User]] — N=1 case; current configuration at all three tiers
[[Connections vs Solving]] — anti-flattening principle that constrains tier behavior

[[Crèche]] Phase 0 is single-user only — the household and community tiers are deferred to Phase 1.

## Evolution

Extended 2026-05-03 from Observer relay (`pebble-to-observer/2026-05-03`) and Chris's worked resolutions in `relay-integration-context.md`: added `## Tiers as Community Shapes` framing — household and broader-community are shapes of one primitive (community), not categorically distinct tiers. Same primitive does not mean merged substrate: each shape gets its own repo because membership composition differs (multi-contributor at household and broader scopes; same person can belong to several repos at different shapes). Corrects an earlier drift toward treating household as categorically distinct *and* the opposite over-correction toward implying the substrate collapses. The existing `## Tiers` section structure preserved; granularity paragraph cross-links to the new framing.

Extended 2026-05-02 from Observer relay (`[Pebble] 2026-05-02`): household tier gained Phase 0 granularity definition (current co-residents under one roof; relatives outside the roof are community-tier even at n=1; relationships-map deferral noted). Community tier gained the fluidity-by-intent statement, two concrete current edges (extended family, founder-tier peers), the framework-level vs. joined-community distinction, and the structural anonymization rationale (shape promotes; no stable roster to identify against on the community side).

Consolidated 2026-05-01 from five pages: Three-Tier CRM Model (existing), Three-Tier Promotion, Pattern Resolution by Tier, Subscription and Refinement, Contribution as Persistence. The original split spread one architectural idea across five page-sized fragments and made the load-bearing claims hard to find. This page is now the hub.

Substantively rewritten earlier 2026-05-01 against [[Crèche Vault]] — the previous framing imposed a propose / evaluate / accept / version / lock lifecycle that the canonical doesn't use. Canonical: there is no separate publish step; promotion is merging through participation; what Observer resolves at each tier (instance / definition / scaled-definition) is the actual semantics.

## Open Questions

- How does household membership change work in practice — adding a member, removing a member, splitting a household? What happens to promoted household records when a member departs?
- Is "community tier" governed by any legal structure or is it purely technical?
- Does a person hold multiple household memberships? If so, how do conflicting household-tier shape definitions resolve?
- What constitutes "active refinement" concretely — what crosses the threshold from journal to note?
- What is the threshold for "scaled definition" at community tier — how many households at the same shape before it crosses?
- Phase 0 defers Observer's write-path to Phase 1 — what early-signal does the single-user pipeline produce that validates the tier model before household and community come online?
