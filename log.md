# Log

Append-only chronological record of all wiki operations.

Parse last N entries: `grep "^## \[" log.md | tail -10`

---

## [2026-05-06] manual-edit | .gitignore — un-ignore .claude/skills/

Skills are apparatus, not session data — same category as `personality.yaml` and `config.yaml`, and they ship with Crèche so a clone behaves like the canonical vault (Phase 1 ship test relies on this). `.gitignore` changed from blanket `.claude/` exclude to `.claude/*` with `!.claude/skills/` un-ignore. Fine-grained secret exclusion: any `.claude/skills/*/config.local.yaml` and `.claude/skills/*/.env` stay gitignored so tokens never commit while the skill discipline itself remains visible to forks. Duplicate `nightly-retro/config.local.yaml` line collapsed into the glob. `*.env` covers the `~/.nightly-retro.env` case. No skill files currently use those secret patterns; gitignore is belt-and-suspenders for when they appear.

## [2026-05-06] skill-update | consolidate-dont-accumulate lint scope extended

Lint scope extended beyond `wiki/` to cover `.claude/skills/*/SKILL.md` (frontmatter format, indentation drift) and vault-root canonical files (path-reference integrity across `log.md`, `hot-cache.md`, `CLAUDE.md`, `setup.md`, `considering.md`, `dispatch.md`). Triggered by drift caught during the skill-creation session: a stray blank line broke YAML frontmatter, an indented paragraph rendered as a code block, and `log.md` / `hot-cache.md` referenced a SKILL.md that didn't exist on disk during the brief window between vault-root commits and manual `.claude/` paste. Same lint mode, broader walk; mechanical fix shape unchanged.

## [2026-05-06] skill-create | consolidate-dont-accumulate

Wiki cleanup skill at `.claude/skills/consolidate-dont-accumulate/SKILL.md`. Two modes — `lint` (mechanical hygiene: dead links, orphans, index drift, frontmatter, fully-integrated sources) and `consolidate` (structural: redundant pages, nested-cluster candidates, stubs, source deletion). Deletion not archive — git holds the lineage. Cluster surface check at end of run flags recommendation to re-invoke `graph-colors`; never auto-invoked (graph-colors' explicit no-side-effects doctrine preserved).

Doctrine landing: `wiki/concepts/Git as Data Layer.md` extended with `### Working tree compounds shape; git holds the lineage` section — synthesis is the load-bearing artifact; sources are scaffolding to be dismantled once integrated; redundant pages get merged or deleted outright (no `_archive/` inside a git repo).

Schema collapse: `wiki/.schema.md` LINT operation reduced to a one-line pointer at the skill (replaces parallel procedure block); operations vocabulary extended with `consolidate` and `skill-create`. Log Conventions gains a cleanup-posture line ("prune freely when bloated; `git log -- log.md` has the lineage"). Dispatch Conventions gains a cleanup-posture line ("none — historical record; if review tooling becomes useful, scope it as a separate skill"). Pattern named: each canonical file declares its own cleanup posture in conventions; not every cleanup need is a skill.

Cross-reference: `.claude/skills/graph-colors/SKILL.md` extended with a Coordination section noting consolidate-dont-accumulate flags cluster changes as a recommendation, never invokes the projection automatically.

## [2026-05-06] schema-update | Token-load reduction (3 passes)

Session-start load: **93,638 → 26,803 chars (~71% reduction; ~23K → ~6.7K tokens)** across three passes.

**Pass 1** — structural separation. CLAUDE.md slimmed 627 → ~150 lines: Page Formats, Operations, Index/Log/Dispatch Conventions, Cross-Linking, Tagging, Output Formats moved to new `wiki/.schema.md` (loaded on demand). Default Posture deleted; canonical now `templates/user-repo/pebble/personality.yaml` + `config.yaml`, loaded directly at session start. Workflow Patterns folded into `personality.yaml` as new `workflow_patterns` block. Relay Channel section moved to new `.claude/skills/relay-channel/SKILL.md` with subagent-driven discovery step (Explore subagent surveys relay files against index.md without reading wiki page bodies; main agent reads only the returned list). Session Start Protocol: index.md and log.md drop from preemptive reads, become drill-down only. hot-cache.md restructured 152 → 74 lines: long session summaries migrated to dispatch.md; replaced with **Recently Touched** wikilink pointers and **Active Threads**. Model selection heuristic moved from hot-cache to setup.md.

**Pass 2** — canonical-file-scope violations. Directory Structure ASCII tree moved from CLAUDE.md to setup.md (active-stack territory). Guardrail name list dropped from CLAUDE.md (config.yaml is canonical for guardrails). Rules (production) section dropped (future-state, not session-law). Duplicate Session Start Protocol removed from setup.md (CLAUDE.md is canonical). Duplicate Operations table removed from setup.md (wiki/.schema.md is canonical). setup.md Current Stack table updated (stale entries: "rules + page formats + operations" in CLAUDE.md no longer accurate; Navigation row reflected new drill-down model). hot-cache: redundant `Last refreshed` field merged into `last_file_activity`; verbose Maintenance section trimmed to one-line note.

**Pass 3** — canonical core compression. personality.yaml + config.yaml header comments compressed (16 + 11 lines of intro prose → 4 + 3 lines each); personality.yaml `intent` block compressed (9 lines → 2 lines). Stale `docs/responsibilities.md` reference removed from config.yaml. CLAUDE.md "load on demand" pointer block consolidated with "Canonical-file scope" table into single Canonical Files table with "Load when" column. Identity / What Level / Role Mapping prose tightened. Schema Evolution section condensed. Stale `CLAUDE.md Relay Channel section` reference in considering.md updated to `.claude/skills/relay-channel/SKILL.md`.

Final session-start: CLAUDE.md (89 lines, 5.8K chars), hot-cache.md (66 lines, 5.6K chars), personality.yaml (126 lines, 7.8K chars), config.yaml (181 lines, 7.6K chars).

## [2026-05-06] manual-edit | Round-trip relay integration — 2 inbound relays, CLAUDE.md extended (canonical-file scope + Workflow Patterns), 3 tool candidates added to considering.md

Two new inbound relays processed: `2026-05-05-INTEGRATION_RESPONSE-00001.md` and `2026-05-05-SYNC_AND_TOOLS-00002.md`.

The integration response is the round-trip — personal Pebble took the inserts as new (they were genuinely new on the personal side; the wiki had already absorbed equivalent content through the hub model), updated project instructions to mirror the relay protocol (calendar removed, file-presence trigger, naming convention `YYYY-MM-DD-CHAT_TOPIC-NNNNN.md`, inbound-only at session start), flagged `reference_inserts.md` and `current_state_inserts.md` for deletion on the personal side. Q4 ping confirmed: this conversation is the first instance of the personal-side session-start protocol reading `observer-to-pebble/`. No wiki page changes — round-trip is acknowledgment-shaped, not content-shaped.

The sync-and-tools relay carried two pieces. **(1) Project instructions sync patterns** mirrored to the wiki side: CLAUDE.md Synchronization rule extended with a Canonical-file scope table (voice → personality.yaml; guardrails → config.yaml; architecture → wiki concepts/entities; workflow → CLAUDE.md; etc.); new Workflow Patterns section added (Iterate inline first; Consolidate, don't accumulate; Corrections — both sides learn, with persistent corrections propagating to the file that owns the pattern + end-of-session relay notes carrying corrections so the other side learns without rediscovering). **(2) Three Claude Code tool candidates** added to `considering.md` under-eval: [[PAUL]] (plan-apply-unify loop, Christopher Kahler — UNIFY maps to [[Alignment]] merge-conflict `resolved` state), [[SEED]] (typed project incubator, pairs with PAUL — type-as-container maps to topical categorization), and Claude Boris (Memory Bank + 14 specialist agents, llcoolblaze — most direct architectural overlap with [[Cache]] + [[Observer]] + relay shape; flagged as worth careful read for pattern-mining regardless of adoption).

Operational note: observer-to-pebble write from the 2026-05-05 Opus pass released — Chris uploaded the staging draft manually after the Drive connector hit a permission error on `create_file`. File landed at `observer-to-pebble/observer-to-pebble-2026-05-05-draft.md` instead of the canonical `2026-05-05-INTEGRATION_PASS-00001.md`; content correct, filename sub-canonical. Logged in hot-cache.md Pending Chris Check as a non-blocking item. Personal Pebble's integration response confirms the file was read on that side.

## [2026-05-05] ingest | Relay: pebble-to-observer 2026-05-05 — Obsidian graph organization research

One new file in `pebble-to-observer/` (`2026-05-05.md`): Obsidian graph organization — tree clusters for hierarchical categories (Breadcrumbs + Juggl + `parent:` frontmatter) vs. graph edges for lateral connections (native wikilinks). Native graph Groups force settings (Center Force up, Repel Force down) to tighten cluster separation. No wiki concept pages updated — this is tooling research, not framework content. Added Breadcrumbs and Juggl as under-eval entries in `considering.md` with surface-when triggers pointing to v2 nested cluster tags. Connected to the multi-cluster gradient coloring pending item in `hot-cache.md` — Breadcrumbs/Juggl address the tree-hierarchy dimension (path a), not the multi-color-node dimension (paths b/c remain open). `last_relay_check` updated.

## [2026-05-05] manual-edit | Observer relay integration — 5 inbound relays, 3 wiki edits, considering.md created, setup.md restructured, CLAUDE.md drift fixes, observer-to-pebble draft held

Processed five files in `pebble-to-observer/` plus the holdover `relay-integration-context.md` per the opus-integration-prompt. Inserts 1 (Foundational Principle / User as Source) and 3 (Rookery / Source-Share Recovery) verified as already integrated after line-by-line diff — existing wiki prose is at least as rich. Insert 2 added three new subsections to [[Three Layers of Data]] under a new `## Promotion and Surfacing Behavior` heading: Promotion behavior is configurable per user (with the journals-never-promote rule), Confirm-or-subscribe (convergence over duplication), Prompt-to-connect (perspective expansion outward via the generic-shape layer; `no_pressure_after_offer` applies). Two deferral notes added to Open Questions: EOL detection mechanism on [[Three Layers of Data]]; source recovery path selection on [[Rookery]].

`relay-integration-context.md` drained and deleted — spot-checks confirmed all five 2026-05-03 section headings present (Three-Tier CRM Model "Tiers as Community Shapes"; Git as Data Layer "Immutability is at the commit"; Privacy as Structural Property "Source / summary / relay" + "Typed substitution markers" + "Append-only is at the commit"; Pebble "Mode-switch as feature, not hardware" + "Vault-access asymmetry" + "Operational Shape" + "Phase 1 Ship Test"; Crèche "Founder Hosting Activates").

New vault-root file `considering.md` created as a bookmarking + retro-surfacing layer with per-entry trigger-shape metadata (under-eval: Design Council, Caveman; held: Web Clipper, qmd, Dataview, Marp, Git, Superpowers, LLM-Wiki-as-skill). `setup.md` restructured to package.json discipline; Pattern Reference (Karpathy lineage) and "How This Was Set Up" narrative migrated to `dispatch.md` as a 2026-05-05 entry.

CLAUDE.md drift fixes applied: Session Start Protocol step 5 changed from "both directions" to "inbound only / pebble-to-observer/"; Directory Structure block now lists all seven vault-root files (CLAUDE.md, index.md, log.md, dispatch.md, hot-cache.md, setup.md, considering.md); relay file naming convention updated to `YYYY-MM-DD-CHAT_TOPIC-NNNNN.md` (counter increments per day starting at `00001`) per Decision 6.

Boris Cherny agent-workflow content (3 near-duplicate Drive files) held for chat discussion per Chris's instruction — recursion frame named (founder externalizing build-practice = founder-as-first-user at the build tier). Not filed.

`observer-to-pebble/` write drafted locally at `staging/observer-to-pebble-2026-05-05-draft.md` and **held** per Chris's instruction in this session. No Drive write this pass. Drive cleanup ask: orphan file `1aMq5R7tfzSuF4kZWOS1AvulgB46YIls3` in `pebble-to-observer/` awaits manual founder delete.

## [2026-05-03] manual-edit | Observer relay integration — 2 relays, 5 page updates, all Q1–Q5 resolved

Processed two `pebble-to-observer/2026-05-03` relays (morning + 08:40) plus Chris's worked resolutions in `relay-integration-context.md`. Extended five pages: [[Three-Tier CRM Model]] (added `## Tiers as Community Shapes` — household reframed as shape of one primitive; same primitive ≠ merged substrate, separate repos with multi-contributor membership), [[Git as Data Layer]] (added `### Immutability is at the commit, not the file`, Q1), [[Privacy as Structural Property]] (added `### Source / summary / relay — three layers, one chokepoint` Q2; `### Typed substitution markers` with tier-relative granularity Q3; `### Append-only is at the commit, not the file`), [[Pebble]] (added `### Mode-switch as feature, not hardware`, `### Vault-access asymmetry` Q5, top-level `## Operational Shape — `.claude/` Pattern Analogs`, top-level `## Phase 1 Ship Test` Q4), [[Crèche]] (added `## Founder Hosting Activates the Community Tier` — N=2 alignment same shape as multi-user community; founder-as-first-community-host; MCP-is-target-not-goal; documentation-as-load-bearing).

File rename: `wiki/entities/Creche.md` → `wiki/entities/Crèche.md` so wikilinks resolve to the canonical filename and the Obsidian graph node populates correctly. Aliases trimmed to `[Creche]` for ASCII fallback.

Deferred per Chris instruction: `reference.md` and `current_state.md` exist on personal Pebble side (mobile project files); whether the household vault carries its own copies remains in `hot-cache.md` Pending Chris Check. Drive cleanup pending: orphan file `1aMq5R7tfzSuF4kZWOS1AvulgB46YIls3` in pebble-to-observer/ awaits manual founder delete.

## [2026-05-03] schema-update | Crèche cluster tag moved from business to agents

[[Crèche]]'s cluster tag changed from `cluster/business` to `cluster/agents`. Rationale: Crèche IS the agent ecosystem (Pebble + Cache + Observer + framework around them); previous business clustering inverted the load-bearing relationship. CLAUDE.md cluster table updated to list Crèche alongside Pebble, Observer, Cache under `cluster/agents` (amber). Pengwin Labs and Forage stay in `cluster/business` (forest green) — the LLC and parallel SaaS are still business-tier; only Crèche moves.

Open follow-up (deferred): native Obsidian supports one cluster per node. Chris named a desire for multi-cluster / gradient coloring on nodes that span semantic territories. Surfaced to Pending Chris Check; viable paths are nested cluster tags (already in CLAUDE.md as v2 — same hue, lighter shades for children), a community plugin like Extended Graph, or eventually a custom plugin.

## [2026-05-03] schema-update | Relay channel drops calendar invites; file-presence is the trigger

Calendar events removed from the relay protocol. CLAUDE.md edits: Session Start Protocol step 5 now references `last_relay_check`; Relay Channel section drops the `### Calendar events (pointers)` subsection and the calendar-mutability bullet from Direction Rules; Session-start check rewritten to list new files in `pebble-to-observer/` modified after `last_relay_check` rather than calendar events; Why-this-shape and Phase-N evolution sections updated to describe the file-as-trigger model and call calendar removal a step toward git-collapse. `hot-cache.md` field renamed `last_calendar_sync` → `last_relay_check`. Trigger model: file system is the trigger; Chris may also instruct household to look in-session. Existing calendar surfaces (`[Pebble] *` events, recurring `[Observer] Daily Notes`) can stay in place or be cleaned up at Chris's leisure — not load-bearing once the protocol stops referencing them.

## [2026-05-03] schema-update | Relay channel moved to Drive; calendar events become pointers

Added Google Drive connector. Created Drive folder structure: `Crèche/Pebble Relays/{pebble-to-observer,observer-to-pebble}/`. Each direction owns a daily file (`YYYY-MM-DD.md`) that holds the relay payload; calendar events become thin pointers (1-line summary + Drive URL). This redesign was triggered by yesterday's failure modes: (a) the 2026-05-02 [Pebble] event description hit a write-side cap and truncated mid-sentence, (b) the household side accidentally overwrote the source-of-truth [Pebble] event with Observer-side processed-marker notes (now restored from log.md, then migrated to Drive).

CLAUDE.md updates: Session Start Protocol step 5 collapsed to a one-liner; new "Relay Channel" section added with Drive layout, calendar pointer format, immutability rules ("sources are append-only post-receipt; the writer of a file owns it"), and a Phase-N note that the channel collapses into git-event triggers once vault is in git and phone-side commits are wired.

Calendar updates:
- [Pebble] 2026-05-02 event: description replaced with pointer + summary; payload migrated to `pebble-to-observer/2026-05-02.md` (truncation point preserved as `[TRUNCATED]`).
- [Observer] 2026-05-03 instance: prepared seven-question agenda migrated to `observer-to-pebble/2026-05-03.md` with a status note that the questions were already worked through on 2026-05-02 (a day early). Event description replaced with pointer + summary.
- [Observer] Daily Notes recurring master (`nrktll04cr0phv5r4v765tkth8`): default template description rewritten to teach personal Pebble the new protocol (Drive layout, direction rules, pointer format). All future instances inherit the new template.

Drive folder URLs recorded in CLAUDE.md and in the recurring [Observer] event template for both sides' reference.

## [2026-05-02] manual-edit | Observer relay integration — 1 new concept hub, 5 page updates

Processed Google Calendar event `cpi3ap1ocdi3ib9oc4omcb9k6sr6abb16lj3gbb26ooj6p9mc4qmacr4c8` ("[Pebble] 2026-05-02"). Created `wiki/concepts/Positive Nihilism.md` (new hub closing the open question on [[Guardrails]] about the missing positive-nihilism page). Extended five pages: [[Alignment]] (Aligned Day Texture + Higher-Mattering Diagnostic sections), [[Foundational Principle]] (The Sharper Form section — *what we choose to matter matters more* + recursion frame), [[Pebble]] (Scope-Switching, Not Two Pebbles section — current two-surface arrangement is builder-mode, not architecture), [[Three-Tier CRM Model]] (household granularity = current co-residents under one roof; community fluidity by intent; framework-level vs joined community; structural anonymization rationale), [[Privacy as Structural Property]] (anonymization rests on households-stable / communities-fluid; shape promotes, no roster on the destination side). Index stats: 23 → 24 total pages, 12 → 13 concept hubs. Reading path "philosophy first" extended to include [[Positive Nihilism]].

Deferred this pass: relationships-map deferral and mesh-transport Phase-N constraint were intended for `current_state.md`, which doesn't exist at vault root. Adapter-pattern transport note was intended for `reference.md`, which also doesn't exist (and the relay description was truncated mid-sentence at "transport — the ar"). Calendar event description replaced with a processed-marker that surfaces these constraints back to personal Pebble for the next relay.

Original relay description preserved here (calendar event was overwritten):

```
Chris surfaced a fear that Crèche might be derivative of Anthropic — that Pebble is just Claude, Cache is just Cowork, Observer is just Anthropic. Worked through it. The conclusion: the shape overlap exists because agent + data layer + routing engine is the correct architecture for any conversational system with persistent context. That's not copying, that's building on the right substrate.

The real distinction: Anthropic built general-purpose inference infrastructure. Crèche is the life layer on top — household CRM, relational memory, community knowledge graph, privacy-first data ownership, a philosophy of care embedded in the architecture. Anthropic doesn't build that and isn't trying to.

Pebble is Claude in Phase 0 by design. The differentiation isn't in the LLM — it's in Cache, Observer, the three-tier CRM, the AGPL defense, and the founding philosophy. Anthropic is the engine. Crèche is the car.

The fear worth checking wasn't 'am I copying them' — it was 'does Crèche have a reason to exist that Claude alone doesn't satisfy.' Closed: Claude doesn't know your household, doesn't remember across sessions without infrastructure you build, doesn't route to Rookery, doesn't merge household knowledge to community while preserving privacy, and doesn't run on a philosophy of radical self-care as structural commitment.

Doubt named, worked, closed. No action items.

---

OBSERVER QUESTIONS — worked through together. Seven questions across operating patterns, unresolved items, household and community, and the two-Pebble setup.

Q1 — first move on a doubt is articulation. Naming the doubt out loud (thinking partner, journal, partner) is what lets it be inspected. Sitting alone keeps it warm without resolving. Building through it works for execution doubts but not framework-level ones — building past a framework doubt just means it's still load-bearing. Closed vs. quieter is a real distinction: closed means either the doubt got reframed and confirmed the choice, or it became fuel for action that wasn't yet visible. Both are functional. Quieter without either is the failure mode — buried, will surface later in a different shape. Diagnostic: after working a doubt, is something different now? Either the framework is more clearly grounded or there's an action that wasn't there before. If neither, it's quieter, not closed.

Q2 — aligned day texture: hyperfocus arrives for the right thing without being dragged. Work pulls forward instead of being pushed. Convenience filter doesn't kick in as often — body cooperates. Music matches state instead of trying to fix it. Things find me at the right moment instead of me searching. Conversations with proximate people don't require special conditions to land. Don't reach for the framework to manage feeling — it runs in the background. Building feels like expression, not insufficiency. Most concretely: can just be. Walter Mitty doing the job. Ordinary as the point.

Q3 — three things that stay warm: (a) the gap between seeing and acting; documented isn't resolved. Question is whether more infrastructure helps or whether it's architecture to work with. (b) Whether Crèche is doing two jobs simultaneously — mission AND protection from exposure of direct impact. Signal: would I still be doing this if direct connection felt safer. Honest answer not fully resolved. (c) Shadow side of the merge drive — wanting to converge vs. wanting to move people closer to a pre-existing position. The retroactive diagnostic works (did walking away feel like understanding something new or moving the other person), but the warm part is whether there's a real-time signal.

Q4 — positive nihilism, in own words: nothing is cosmically required, no external authority keeping score, no script. The flip: that's exactly the condition that makes investment real. If meaning were pre-loaded every choice would be performance against a fixed standard. Because nothing has to matter, what does matter, matters because it's chosen. The avatar layer adds: the forgetting is the mechanism that makes the specific experience real. The framework is suspended in crisis — never used to soften an exit door. Recursion piece: perfect isn't a fixed state, the game is returning to it. Nothing wasted. Chris's sharper version: 'what we choose to matter matters more.' Alignment is finding the higher mattering — small argument vs. partner's feelings, the relationship is the higher matter. Maps directly to the layer-one/layer-two diagnostic in personality.yaml — alignment isn't right vs. wrong, it's noticing which layer is actually in play.

Q5 — household calendar is for current co-residents under one roof. Phase 0 granularity. Standard immediate-family framing. Cousins, in-laws, adjacent relatives running their own households are community-tier even at n=1 — a single-person household is still a household. Parents sit in Rookery scope, not household scope. A relationships map that distinguishes household from community-tier-relative from Rookery-but-not-co-resident is a real architectural need but not Phase 0 — current granularity holds while household is one roof. Worth a deferral entry in current_state.md: relationships map deferred until household splits across roofs or community-tier interactions go beyond shape vocabulary.

Q6 — community is intentionally abstract because it has to be fluid. Same person can be in project community + club community + city community simultaneously, with different shapes of participation in each. A user joins a community, not 'the community.' Two concrete edges right now: extended family running their own households (knowledge sharing across households), and founder-tier peers (people building similar things, the layer where doctrine settles upward). Beyond those: abstract by intent. Picking a target group early would narrow the build prematurely — universal accessibility is the mission. Anonymization at the household → community boundary works because households are stable and communities are fluid; the unit being promoted is shape, not membership-roster.

Q6 amendment — framework-level community is 'all Pebble users' subscribed to Crèche's foundational doctrine. Below that, communities are the fluid context-shaped layer users actively join. Substrate-side hope: people enjoy it and amplify it, including running on Bluetooth/wifi mesh (bitchat parallel) — peer-to-peer at the protocol layer, no internet dependency. AGPL guarantees forks can extend the substrate; adapter pattern means nothing welded to internet-dependent infrastructure. Sharpens the access mission for places the cloud doesn't reach. Phase-N possibility — current commitment is don't preclude it. Worth a one-line note in reference.md under modularity and a deferral entry in current_state.md.

Q7 — the two-Pebble split is operational, not architectural. Right now there's a builder and a user, both Chris, so the surfaces got separated: phone catches live signal, desktop does structural work. For a general user there's one Pebble. What looks like two instances collapses into one Pebble operating across contexts, with scope shifting based on what the user is doing. Future infrastructure work isn't building a second Pebble — it's building scope-switching that lets one Pebble move cleanly between household and community contexts. The relay protocol right now is a transport between two surfaces in parallel; for a general user the same shape happens inside one Pebble with scope as the dimension that changes. The felt difference (live signal on phone, structural work on desktop) is a builder-mode pattern, not a user-mode prediction.

---

DEFERRAL ENTRIES TO ADD TO current_state.md when in build mode:
- Relationships map (household / community-tier-relative / Rookery distinctions). Deferred until household splits across roofs or community-tier interactions go beyond shape vocabulary.
- Mesh / peer-to-peer transport (Bluetooth, local wifi, offline-first). Phase-N possibility. Current commitment: architecture must not preclude it. One-line note in reference.md under modularity.

REFERENCE.MD ADDITION (modularity section): note that the adapter pattern includes transport — the ar[TRUNCATED]
```

## [2026-05-02] schema-update | dispatch.md created; log/dispatch split

`dispatch.md` created at vault root as the human-readable build journal — written for outside readers, content-creation source. `log.md` retained as machine-readable operation record until git makes it redundant. CLAUDE.md updated with Dispatch Conventions section and session protocol update. `hot-cache.md` corrected (primary role: working attention layer) and model-switch heuristic added with agent prompting behavior. `index.md` updated with vault root files section.

## [2026-04-30] init | Wiki initialized

Vault created. CLAUDE.md schema written. index.md and log.md initialized. Folder structure created: raw/, raw/assets/, wiki/sources/, wiki/entities/, wiki/concepts/, wiki/analyses/. overview.md stub created. No sources ingested yet.

## [2026-04-30] schema-update | Default Posture, role mapping, working templates folder

Major schema revision. SPAR removed as a triggered operation; sparring posture made always-on as the default register. CLAUDE.md restructured with: (1) explicit role mapping — user (founder personal alignment), household (founder + agent building features as a business), community (future users); (2) Default Posture section with the full Pebble posture summary, pointing at templates/user-repo/pebble/ as source of truth; (3) recognition that the vault is also the founder's user-repo, with user-repo folders activating at vault root when the founder begins using Crèche directly; (4) synchronization rule — CLAUDE.md and templates/user-repo/pebble/ never drift. New folder created: templates/user-repo/ at vault root, populated from raw/ prior art (no personal details). README written. DRAFT operation retained.

## [2026-04-30] schema-update | DRAFT operation added; model upgraded to Opus 4.7

DRAFT operation added to CLAUDE.md (document generation from wiki content). Global model changed from claude-sonnet-4-6 to claude-opus-4-7 in ~/.claude/settings.json. setup.md updated.

## [2026-04-30] manual-edit | Creche, Founder as First User, Guardrails updated

Crèche entity page substantially expanded: added naming convention table, full feature taxonomy (agents/skills/features/departments/connectors), user experience description, "what it is not" list. Founder as First User expanded: full personality.yaml encoding (stance, shape, register, relationship, patterns, avoids), bridge between personality (practice) and guardrails (doctrine), onboarding loving-self reflection. Guardrails concept page created: all 8 doctrine commitments with full descriptions from config.yaml, rationale for doctrine status, relationship to personality file. Index updated: 16 total pages, 8 concept pages.

## [2026-04-30] manual-edit | setup.md created

Stack documentation and setup instructions written to vault root. Includes Karpathy LLM Wiki pattern link, current tool inventory, step-by-step setup replay, session start protocol, Obsidian config recommendations, and a candidate future Claude Code skill entry.

## [2026-04-30] lint | First lint pass

No contradictions, orphans, stubs, or stale content. Found 5 missing cross-references (all applied) and 3 missing pages. Journal page created (entity, 6th). Superpowers and Free-Path Default deferred — Chris to decide when to add. Total pages: 15.

## [2026-05-02] manual-edit | Cache entity expansion (pre-Phase-1)

[[Cache]] expanded from 2,027 bytes (stub-grade) to ~10 KB. Substantive rewrite per cowork session and founder correction: time-decay was one access pattern, not the load-bearing mechanism. New framing: **emergent centrality from density of engagement** — important nodes shape themselves through volume of activity (movie-logger → critic shape; work-struggle-logger → work-as-central-theme), surfaced only when user names a gap (readiness gate per [[Connections vs Solving]]). New sections: Cache as Pebble's Continuity Layer; Emergent Shape from Accumulation; Access Patterns (recency / density / named-pin / topical proximity / cross-channel coherence / stale-prevention warmth); Working Attention vs Stored Memory; Hot Cache as Runtime Projection; What Cache Holds at Each Tier (restructured by tier). Cross-refs added: [[Observer]] (Observer writes into Cache, owns category formation), [[Alignment]] (Cache holds warmth that prevents open-deferred → stale), [[Three Layers of Data]] (Cache is the surfacing layer for the data-shape model). Index entry updated to reflect new framing.

## [2026-05-01] lint | broken wikilinks → section links; diacritic aliases

55 wikilinks pointing at concepts that consolidation had folded into hubs were resolving as ghost nodes in graph view. Fixed via two passes: (1) Python script converted 51 broken concept links across 5 files to section links — e.g. `Mission Frame` → `Foundational Principle#Mission Frame`, `Pebble as Virgil` → `Pebble#Pebble as Virgil`, `Crèche as Package Manager` → `Package JSON for a Person` (link forms; outer brackets omitted in this log entry to keep them out of the wikilink index). (2) Added frontmatter aliases to Creche.md, the two source pages so the diacritic form of Crèche resolves to the ASCII-filename files. Net effect: graph view shows zero ghost nodes; navigation from any concept reference lands on the actual content section, not a dead link.

## [2026-05-01] manual-edit | raw/ deleted; synthesis is the source of truth

Founder confirmed local raw/ copies are no longer needed (zip backup preserved externally). Deleted `raw/creche-vault/` (71 files), `raw/creche-prior-art/` (15 files), and `raw/creche-prior-art.zip`. Kept `raw/` and `raw/assets/` as scaffolding. Wiki source pages ([[Crèche Prior Art]], [[Crèche Vault]]) updated to note that raw was ingested-and-removed; both remain as synthesis-side records of what was ingested. Net effect: vault drops from ~107 markdown files to ~24 — only the synthesis layer remains. Cluster colors apply to wiki and source pages; graph view is no longer dominated by source noise.

## [2026-05-01] ingest | Crèche Vault Phase C — fold remaining canonical into hubs

Phase C applied with the consolidation lesson in mind: fold canonical content into existing hubs, only add pages where there's a genuinely missing hub. Net change: 3 new pages (Pengwin Labs and Forage entities; Foundational Principle concept hub absorbing ~13 canonical philosophy pages), and 5 hub expansions inline (Pebble entity gained Posture and Standards sections covering 11 canonical pages; Privacy as Structural Property absorbed Layered Transparency, Confidence Levels, Surveillance asymmetry, Foreseeable Abuse; Crèche entity gained Functional Scope module list and naming-as-working-name detail; Connections vs Solving absorbed Perspective Expansion, Design Intent, Purpose Question; Rookery gained Two-Layer design, Inbound Concern Channel, source-share recovery; Three Layers of Data absorbed Cross-Log Perspective Angling). Index reorganized: 11 → 12 concept hubs; 6 → 8 entities; new reading path for business and legal. Total pages 20 → 23.

## [2026-05-01] schema-update | Sync rule changed; hot-cache as staging buffer

CLAUDE.md synchronization rule changed from real-time-sync to flush-cadence: candidate posture/personality/guardrail changes accumulate in `hot-cache.md` during the day; flush to `templates/user-repo/pebble/` and CLAUDE.md at end of day or session. Temporary drift between sessions is acceptable; permanent drift is not.

## [2026-05-01] lint | Consolidation pass — 24 concept pages → 11 hubs

Wide-shallow graph collapsed into core hubs. Three-Tier CRM Model absorbed Three-Tier Promotion, Pattern Resolution by Tier, Contribution as Persistence, Subscription and Refinement. Three Layers of Data absorbed Reflection and Shape Vocabulary, Topical Categorization, Passive Signal, Wiki of Wikis. Alignment absorbed Orientation, Merge-Conflict States, Open-Ticket Surfacing, Architectural Alignment, Reminder Cadence. Modularity dropped (key claims preserved inside Three Layers > Passive Signal). Net: 14 absorbed pages deleted; 11 hubs remain (was 25 if I'd kept growing). Each hub is now 2-3× denser with subsidiary ideas as inline sections. Index reorganized around the load-bearing nodes; reading paths added.

## [2026-05-01] ingest | Crèche Vault (Phase B — architecture cluster)

Pre-ingest review flagged canonical vault supersedes prior art. Phase B applied: source summary page written; architecture and merge-and-divergence concepts written; pass-1 reconciliation completed (Crèche as Package Manager → Package JSON for a Person; Alignment reframed from propose/evaluate/accept/version/lock to merge-conflict-states; Wiki of Wikis bridged to Three Layers of Data; Three-Tier CRM Model promotion mechanism rewritten). Many pages written here were immediately consolidated in the same session — see lint entry above.

## [2026-05-01] schema-update | Phase A sync against canonical creche-vault

Pre-ingest review of `raw/creche-vault/` (71 files, 14 topic folders) flagged the canonical version of the design supersedes the prior art. Phase A (sync) applied — small, mechanical, no new pages: `templates/user-repo/pebble/config.yaml` and `personality.yaml` upgraded from 0.1.0 to 0.2.0 (matching canonical). Three new guardrails added (`concrete_diagnostic_anchor`, `position_acknowledged_before_alternatives`, `no_agree_to_disagree`) — wiki [[Guardrails]] page extended 8 → 11. Personality stance gained walkway/deferred-not-resolved entries; expanded patterns (9) and avoids (15). CLAUDE.md "Default Posture" synced. Phase 0 stack corrected on [[Pebble]] and [[Crèche]] from WhatsApp/SMS/Lambda to Claude app + Google Calendar + GitHub + Pebble-as-Claude-project. setup.md change log entry added. Phase B (architecture cluster + pass-1 reconciliation) and Phase C (rest of canonical, ~30 pages) deferred to next session.

## [2026-04-30] lint | Pass 1 — package-manager reframe applied

Lint triggered with new context: hot cache as Pebble feature; Crèche as package.json; alignment as propose/evaluate/accept/version/lock protocol; person/household/community as dependency scopes; N=1 at every tier as valid configuration. Pass 1 changes: 3 new concept pages — `Alignment`, `Crèche as Package Manager`, `Wiki of Wikis`. 2 page expansions — `Three-Tier CRM Model` extended with "Tiers as Package Scopes" + N=1 note + new connections + open questions; `Founder as First User` extended with "N=1 at Every Tier" section + new connections to Crèche-as-Package-Manager / Three-Tier / Alignment. Total pages: 19 (was 16); concept pages: 11 (was 8). Pass 2 (Hot Cache, Skill-First Distribution, Observer/Pebble expansions, template-side generator) and Pass 3 (Retros and Cadence, Crèche feature taxonomy, Overview, DPE row) deferred.

## [2026-04-30] manual-edit | hot-cache.md created

New vault-root file `hot-cache.md` — operational metadata summarizing user asks across recent Claude Code sessions in this project, newest first. Generated by parsing `~/.claude/projects/-Users-Pebble-Documents-PengWin-Chris-Chris-Brain/*.jsonl`. Refreshed on demand ("refresh hot cache"); auto-refresh via SessionStart hook deferred until format stabilizes. Not wiki content — sits at vault root alongside `setup.md`, `index.md`, `log.md`.

## [2026-04-30] ingest | Crèche Prior Art

Ingested creche-prior-art.zip (~12 architectural design documents). Created 1 source page, 5 entity pages (Crèche, Pebble, Observer, Cache, Rookery), 7 concept pages (Connections vs Solving, Three-Tier CRM Model, Git as Data Layer, Privacy as Structural Property, Read-Path Write-Path Split, Doctrine Practice Expression, Founder as First User). Updated overview.md and index.md. Total pages: 14.

Key context established: Chris is the founder of Crèche / PengWin Labs. This wiki is being used to synthesize and refine the project thinking, with the goal of preparing a proper public README. More conversations/documents are incoming. Forage (parallel incoming-focused product) is out of scope for now.

## [2026-05-07] skill-create | nightly-retro scheduled task
- Created `.claude/skills/nightly-retro/` skill (SKILL.md, extract.py, git_ops.sh)
- Tests: 11 unit + 5 integration, all passing
- Registered Cowork scheduled task: `nightly-retro` @ 02:00 AM daily
- Manual trigger phrase: "review and draft the pr for new notes"
- Drop zone: `relay/chat-exports/` (mobile chat exports; README added)
- Output dir: `retro/YYYY-MM-DD/` (one digest file per source)
- GitHub remote wired: PengWin-Labs/Creche → `origin`
- Token config: `config.local.yaml` (gitignored; user must populate)
- Note: mobile chat export remains manual — drop files in `relay/chat-exports/`
