# Considering

Tools, patterns, and ideas bookmarked for retro surfacing. Active stack lives in `setup.md`. Adding something here is **not an install queue** — it's a bookmark with surfacing context, so [[Pebble]] or [[Observer]] can raise it later when the work matches the trigger shape.

This file is the build-side analog of how shape vocabulary works in the wiki: structure that gets surfaced when context is ready for it, not pushed when it isn't. See [[Three Layers of Data#Inherited shape vocabulary]] (shapes available at onboarding, surfaced when relevant), [[Foundational Principle#Why the meta-cognitive ceiling doesn't apply]] (readiness gate — availability separated from surfacing), and [[Crèche]] (founder-as-first-community-host applies here too — these bookmarks become inheritable when the framework ships).

**Schema for entries:**

```
### {Tool / Pattern Name}
- Source: url, repo, paper
- What it is: 1–2 sentences
- Surface when: trigger shape — what context, decision-type, or stuck-point should cause this to come up. Written so Observer can match against current work.
- Adjacent in the wiki: [[Page]] connections covering related ground (so retros can chain through them)
- Status: under-eval | held | rejected
- Why this status: 1 sentence
- Considered date: YYYY-MM-DD
```

---

## Under Evaluation

### Obsidian Breadcrumbs plugin
- **Source:** breadcrumbs-wiki.netlify.app / github.com/SkepticMystic/breadcrumbs
- **What it is:** Typed-link hierarchy for Obsidian. Declares parent/child/sibling relationships via frontmatter (`parent:` field or `BC-up-link` / `BC-down-link`). Renders as tree view, trail view, and matrix view for navigating hierarchies. The `parent:` field simultaneously creates a real wikilink and semantic metadata — hierarchy is declared, not forced; notes without a parent stay flat.
- **Surface when:** implementing nested cluster tags (v2) where hierarchy needs to be navigable and not just visually implied by color. Also: wiki grows past ~50 pages and traversing parent/child category relationships becomes worth explicit tooling. Pairs with Juggl.
- **Adjacent in the wiki:** [[Foundational Principle#Why the meta-cognitive ceiling doesn't apply]] (readiness gate — same declared-not-forced principle); CLAUDE.md Tagging Conventions (v2 nested cluster tags are the planned destination for this).
- **Status:** under-eval
- **Why this status:** researched from a pebble-to-observer relay (2026-05-05); addresses the tree-hierarchy dimension of the multi-cluster graph pending item. Install decision deferred until v2 tagging is ready to move.
- **Considered date:** 2026-05-05

### Obsidian Juggl plugin
- **Source:** github.com/HEmile/juggl
- **What it is:** Renders hierarchical subgraphs as top-down trees using dagre.js. Integrates with Breadcrumbs to visualize parent/child relationships as visual tree structure rather than force-directed webs. Standard `[[wikilinks]]` continue rendering as lateral flat edges in the native graph. Mental model: hierarchy → tree (Juggl); lateral connections → edges (native graph).
- **Surface when:** same as Breadcrumbs — install together. Surface when the v2 nested cluster tag hierarchy is ready and visual tree rendering alongside cluster coloring becomes the next graph-view priority.
- **Adjacent in the wiki:** CLAUDE.md Tagging Conventions (v2); hot-cache.md Pending Chris Check (multi-cluster gradient coloring item — Juggl addresses the tree dimension, not the multi-color-node dimension).
- **Status:** under-eval
- **Why this status:** researched from pebble-to-observer relay (2026-05-05); pairs with Breadcrumbs. Held at same gate.
- **Considered date:** 2026-05-05

### Design Council
- **Source:** github.com/sjsyrek/design-council
- **What it is:** Spawns 11 role-specialized parallel agents to debate a cross-cutting technical decision; each seat has independent context; invoking Claude acts as CEO and arbitrates. Token cost ~10–20× a single-context review.
- **Surface when:** an architectural decision crosses multiple specialist domains and a single-context review is visibly under-resolving it. The consolidation passes (24 → 11 → 13 hubs) and any future merge between this vault and `creche-vault` are the canonical fit.
- **Adjacent in the wiki:** [[Doctrine Practice Expression]] (decisions that need to land cleanly across constraints); [[Crèche]] (framework-level decisions are the same shape, scoped up).
- **Status:** under-eval
- **Why this status:** want it bookmarked for the next cross-domain decision; cost makes it wrong for small calls.
- **Considered date:** 2026-05-05

### Caveman
- **Source:** github.com/JuliusBrussee/caveman
- **What it is:** Cuts ~75% of output token volume by stripping filler prose. Code blocks, technical terms, error messages stay exact. Activates with `/caveman` or "caveman mode."
- **Surface when:** running a high-token operation (Design Council, full lint pass, large consolidation) and budget matters. Pair with Council automatically.
- **Adjacent in the wiki:** none directly — this is operational efficiency, not doctrine.
- **Status:** under-eval
- **Why this status:** paired naturally with Council; on its own, ergonomically interesting but not yet load-bearing.
- **Considered date:** 2026-05-05

### PAUL — Plan-Apply-Unify Loop
- **Source:** github.com/ChristopherKahler/paul
- **What it is:** Structured execution discipline for Claude Code. Every plan closes with a mandatory UNIFY step — explicit reconciliation between what was planned and what happened, no orphan plans. Acceptance-driven development with BDD format (Given/When/Then). State persisted in `.paul/` across sessions. In-session context preferred over subagents for implementation; subagents reserved for discovery.
- **Surface when:** plans are landing without explicit closure, drift between intent and outcome accumulates across passes, or the same kind of "we planned X, did Y, never reconciled" pattern repeats. The UNIFY shape maps to the merge-conflict-states `resolved` state in [[Alignment]] — explicit closure rather than drift.
- **Adjacent in the wiki:** [[Alignment]] (merge-conflict states; UNIFY = `resolved`); [[Doctrine Practice Expression]] (decisions don't park).
- **Status:** under-eval
- **Why this status:** the discipline maps cleanly to existing principles; question is whether to adopt the tool or borrow the pattern. Vendor selection standard applies even though it's open-source.
- **Considered date:** 2026-05-06

### SEED — typed project incubator
- **Source:** github.com/ChristopherKahler/seed
- **What it is:** Pairs with PAUL. Type-aware ideation (application/workflow/client/utility/campaign) producing structured PLANNING.md; `/seed launch` initializes a PAUL build without re-asking questions. Quality gate before graduation: phase breakdown with shippable milestones, tech stack resolved, design decisions documented with rationale.
- **Surface when:** a new project is being scoped and the type-as-container framing would shape which questions to ask first. The "type isn't the content; it's the container that determines questions" principle is structurally similar to topical categorization in [[Three Layers of Data]] — same mechanic, different domain.
- **Adjacent in the wiki:** [[Three Layers of Data#Topical Categorization]] (category as container, not content); [[Doctrine Practice Expression]] (quality gate before graduation matches doctrine-before-ship).
- **Status:** under-eval
- **Why this status:** pairs with PAUL; evaluate together. Same vendor (Christopher Kahler).
- **Considered date:** 2026-05-06

### Claude Boris — Memory Bank + agent specialization
- **Source:** github.com/llcoolblaze/claude-boris
- **What it is:** Persistent context across sessions via Memory Bank (`.claude/memory/` with projectContext, activeContext, progress, decisionLog, conventions, sessionHistory). 14 specialist agents (security-auditor, git-guardian, ci-integrator, mode-controller, audit-logger, etc.). 18 commands including `/checkpoint`, `/rollback`, `/undo`. Mode system (architect/code/debug/review) for behavioral guardrails. Based on Boris Cherny's published workflow.
- **Surface when:** the Cache + Observer + relay protocol shape needs an external comparison point — Memory Bank is essentially a competing implementation of the same primitive (persistent agent context). The mode-controller agent maps directly to the `read_path_only` guardrail; audit-logger maps to alignment-monitoring; memory-bank as a whole maps to [[Cache]]. Worth a careful read for what it does differently, even if not adopted.
- **Adjacent in the wiki:** [[Cache]] (Memory Bank ≈ Cache shape); [[Observer]] (memory-bank agent ≈ Observer); [[Read-Path Write-Path Split]] (mode-controller ≈ read/write split as enforced separation); [[Pebble]] (mode system ≈ scope-switching). Most direct architectural overlap of the three candidates.
- **Status:** under-eval
- **Why this status:** highest-value comparison read of the three; question is whether to mine for patterns or adopt the implementation. Different vendor (llcoolblaze) and philosophy from PAUL/SEED — they're not mutually exclusive but composition has integration cost.
- **Considered date:** 2026-05-06

---

## Considered & Held

(Migrated from `setup.md` "Optional / not yet installed".)

### Obsidian Web Clipper
- **Source:** obsidian.md/clipper
- **What it is:** Browser extension; converts web articles to markdown and saves to vault.
- **Surface when:** actively clipping web sources for ingest.
- **Status:** held
- **Why this status:** not actively clipping right now.
- **Considered date:** 2026-04-30

### qmd
- **Source:** github.com/tobi/qmd
- **What it is:** Local markdown search (BM25 + vector + LLM reranking); CLI or MCP server.
- **Surface when:** wiki exceeds ~100 pages and index navigation feels slow.
- **Status:** held
- **Why this status:** 24 pages — index is fine.
- **Considered date:** 2026-04-30

### Obsidian Dataview plugin
- **What it is:** Dynamic tables from page frontmatter (e.g. "all pages tagged `open-question`").
- **Surface when:** querying across frontmatter would simplify a lint or audit pass.
- **Status:** held
- **Why this status:** no current frontmatter-aggregation needs.
- **Considered date:** 2026-04-30

### Obsidian Marp plugin
- **What it is:** Render markdown slide decks from wiki content.
- **Surface when:** preparing a presentation from wiki material.
- **Status:** held
- **Why this status:** no decks staged.
- **Considered date:** 2026-04-30

### Git
- **What it is:** Version history, branching, multi-device sync.
- **Surface when:** approaching Phase 1; Phase-N relay collapse depends on it (see [[Git as Data Layer]] and the Phase-N evolution note in `.claude/skills/relay-channel/SKILL.md`).
- **Adjacent in the wiki:** [[Git as Data Layer]] (commit-level immutability is the doctrine the file substrate currently approximates).
- **Status:** held
- **Why this status:** build-phase latitude relies on file-edit freedom; Git activates before Phase 1.
- **Considered date:** 2026-04-30

### Superpowers (Claude Code skill for agentic delegation)
- **What it is:** Skill that enables agentic delegation in Claude Code. Personal Pebble had previously misidentified a related concept as a Crèche architecture layer ("Superpiors"); the misidentification is corrected — the agentic-capability concept for Crèche is real but currently unnamed and undesigned.
- **Surface when:** agentic delegation becomes part of Crèche's runtime story, OR the unnamed agentic-capability concept gets named and needs implementation reference.
- **Adjacent in the wiki:** [[Pebble]] (Mode-switch as feature, not hardware); [[Observer]] (subagent shape).
- **Status:** held
- **Why this status:** the underlying Crèche concept isn't designed yet; tool can't be evaluated against an undefined shape.
- **Considered date:** 2026-04-30 (re-recorded 2026-05-05)

### LLM Wiki pattern as a packaged Claude Code skill
- **What it is:** The scaffold this vault uses (Karpathy's LLM Wiki — see `dispatch.md` for the lineage note) packaged as a reusable skill that creates the folder structure, tailored CLAUDE.md, index.md, log.md, and overview.md for a new wiki on demand.
- **Surface when:** someone wants to start a second-brain wiki and the manual scaffold work becomes friction worth removing.
- **Adjacent in the wiki:** [[Crèche]] (template inheritance pattern); [[Founder as First User]] (the founder is the first person to want this skill).
- **Status:** held
- **Why this status:** the founder's vault is the first instance; packaging waits until the scaffold has stabilized through more real use.
- **Considered date:** 2026-04-30

---

## Rejected

*(Empty for now. When something is rejected, record the trigger shape that caused it to surface, the reason for rejection, and the date — so future surfacings can recognize "we already considered this and chose not to.")*
