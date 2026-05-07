# Solo Scrum Playbook
> 4-week sprints · Solo founder edition · Crèche / Pebble

---

## Why Scrum Solo

Scrum at N=1 isn't about ceremony for ceremony's sake. It's about:
- **Cadence** — a rhythm that prevents indefinite drift
- **Intentionality** — committing to a sprint goal forces prioritization
- **Reflection** — retros surface what's actually slowing you down
- **Accountability** — you're the team *and* the stakeholder

The adaptations below strip scrum to its load-bearing walls.

---

## Tool Recommendation

**Linear** (free tier) is the recommended tracker.

- Free for solo / up to 3 members
- Native sprint support ("Cycles") — 4-week cycles map directly
- Kanban + list + roadmap views
- GitHub integration
- Fast keyboard-driven UI built for developers

Setup: [linear.app](https://linear.app) → create workspace → set default cycle length to **28 days**.

**Alternative:** GitHub Projects (free, lives inside your repo, good if you want everything in one place).

---

## Sprint Structure — 4-Week Cycle

```
Week 1 Day 1   →  Sprint Planning          (~1 hr)
Weeks 1–4      →  Daily Standup            (~10 min/day)
Week 2 Day 1   →  Backlog Refinement #1    (~30 min)
Week 3 Day 1   →  Backlog Refinement #2    (~30 min)
Week 4 Day 5   →  Sprint Review            (~30 min)
Week 4 Day 5   →  Sprint Retrospective     (~30 min)
```

Total ceremony overhead: ~6 hrs per sprint (~1.5 hrs/week). Everything else is build time.

---

## Roles at N=1

You wear all three hats. Switching hats deliberately matters more than it sounds.

| Role | Hat | What you're doing |
|---|---|---|
| **Product Owner** | Strategy hat | Deciding *what* to build and *why* — backlog ownership, sprint goal |
| **Scrum Master** | Process hat | Running ceremonies, removing blockers, protecting the sprint |
| **Developer** | Build hat | Executing the work |

**Practical tip:** Start planning as PO (what needs doing, why), then switch to SM (how much fits, what the goal is), then execute as Dev. The handoff between hats is where most solo founder scope creep happens.

---

## Sprint Goal

Every sprint has exactly one sprint goal — a single sentence stating the valuable outcome you're committing to.

**Format:**
> By end of sprint, [users/I] can [do/see/experience] [outcome], which enables [next step / business value].

**Example:**
> By end of sprint, a new user can sign up, create their first Pebble, and receive their first reflection — enabling the first live user test.

The goal is the north star. Individual issues serve the goal. If an issue doesn't serve the goal, it belongs in a future sprint or the backlog, not this sprint.

---

## Definition of Done

A task is **Done** when:

- [ ] Code is written and committed
- [ ] It works as described in the acceptance criteria
- [ ] No known regressions introduced
- [ ] Relevant docs / comments updated (if applicable)
- [ ] Merged to main (or equivalent)

A sprint is **Done** when the sprint goal is met, not when every issue is closed. Partial completion with goal achieved > all issues closed with goal missed.

---

## Velocity & Metrics

**Story points:** Use the Fibonacci scale: 1, 2, 3, 5, 8, 13. If a task is larger than 8 points, split it.

| Metric | What it tells you | How often |
|---|---|---|
| **Velocity** | avg points completed per sprint | After each sprint |
| **Sprint goal hit rate** | % of sprints where goal was met | After each sprint |
| **Carryover rate** | % of committed points that slipped | After each sprint |
| **Cycle time** | avg days from "In Progress" → "Done" per issue | Monthly |

Track these in a simple table in `journal/metrics.md` or in Linear's built-in analytics. Don't obsess over them at N=1 — trend matters more than absolute numbers.

---

## Backlog Health Rules

- **Backlog ≠ wishlist.** If an item hasn't been touched in 2 sprints, archive it.
- **Issues have acceptance criteria before sprint planning.** Vague issues cause mid-sprint scope debates with yourself.
- **The top 10 backlog items are always refinement-ready** (sized, described, criteria written).
- **Epics** group related work across sprints. Keep them updated.

---

## Sprint Health Signals

| Signal | What it means |
|---|---|
| Closing issues faster than expected | Sprint was under-committed — pull from backlog |
| Hitting mid-sprint and goal feels unreachable | Something's blocking — surface it, adjust scope |
| Same types of tasks keep slipping | Process problem, not capacity — address in retro |
| Backlog refinement keeps getting skipped | Will hurt planning; protect it |

---

## Carrying Work Over

Carryover is normal. Rules:

1. Re-evaluate before auto-pulling into next sprint — does it still serve the next sprint goal?
2. If it's been in 2 consecutive sprints without progress, it's blocked or mis-scoped. Break it apart.
3. Don't pad next sprint's capacity to absorb carryover — that defeats the commitment model.

---

*Ceremony runbooks live in `scrum/ceremonies/`.*
*Schema for sprint notes lives in `scrum/templates/`.*
