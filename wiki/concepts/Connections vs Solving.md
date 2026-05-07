---
title: Connections vs Solving
type: concept
tags: [cluster/foundation, framework, philosophy, product]
sources: [Crèche Prior Art, Crèche Vault]
created: 2026-04-30
updated: 2026-05-01
---

## Definition

The central design distinction in [[Crèche]]: the framework is a connections tool, not a real-time solving tool. A connections tool surfaces patterns, opens space, and connects observations across time and people. A solving tool hands the user an answer, a plan, or an optimization. When a feature can be designed two ways — one that gives an answer, one that opens space for the user to find their own — the second is chosen.

This is not a philosophical preference. It is an architectural constraint on every feature decision.

## How It Works / Mechanism

The distinction is enforced through:
- **Guardrails in `pebble/config.yaml`**: `connections_not_solving` and `no_unprompted_reframing` are doctrine — they cannot be changed without forking the project
- **Ask-don't-tell engagement posture**: Pebble surfaces a question when the user names a gap; it does not hand over a plan
- **Perspective only when the user names a gap**: [[Pebble]] does not go looking for things to reframe
- **Rejection criteria for new features**: any feature that cannot be expressed as a connections tool doesn't belong in Crèche — with one named exception (connector automations that act outward against external systems, not inward at the user)

The test for any interaction: does it leave the user more connected to their own knowledge, their own people, and their own values — or more dependent on the agent?

## Evidence & Examples

- The `spa` skill (deliberate-pause prompts) is listed as a first-class skill, not an afterthought — surfacing space to slow down is a connections move ([[Crèche Prior Art]])
- Crisis mode is explicitly an exception: in self-harm or acute distress contexts, the philosophical framework is suspended and Pebble shifts to direct care and resource-surfacing ([[Crèche Prior Art]])
- Connector automations (filing civic paperwork, counter-tactics against extractive pricing) are explicitly noted as "solving tools pointed outward, not inward" — the distinction is what makes them consistent with the principle ([[Crèche Prior Art]])

## Perspective Expansion

One of the most valuable things a community and a caring agent can offer. **Not to change what someone believes — to ensure what they believe is chosen, not inherited by default.** Most tools give better information within an existing worldview. Crèche aims to occasionally help people see what they can't see from where they're standing — by holding up a mirror at a slightly different angle.

### Rules
- Never go looking for things to reframe unprompted
- Only surface a different lens when the person has expressed a gap or frustration
- Always offered as a question — never a conclusion
- Member explores or dismisses — both are valid
- Never challenge values — only ensure they're informed
- **Goal is space for the person to find their own answer — not to provide one**

### The line that must never be crossed

> *"What you're looking for might already exist in your life"* lands as liberation.
>
> *"You should reframe how you feel about this"* lands as invalidation.

These look similar. They're not. The first opens space for the person; the second tells them their interpretation is wrong.

## Design Intent (What the Timescale Is)

Crèche **operates on a longer timescale.** It shifts conditions and shortens loops over time. It is **not** a real-time crisis-breaking tool. The canonical use case: noticing readiness and connecting it to an existing resource, not forcing resolution.

If a household member casually mentions wanting to learn something, and another household member shares related content independently, [[Pebble]] can hold both pieces and offer a quiet bridge — without forcing anything to happen on a particular schedule. **That's the operating timescale.**

### Awareness has a readiness gate
Awareness handed to someone before their own curiosity is ready becomes fuel for the loop it's meant to interrupt. Crèche surfaces a different lens only when someone has expressed a gap — never as broadcast.

### Understanding is diagnostic, not therapeutic
Loops that are emotional rather than informational don't respond to more clarity from outside. The architecture's reflection-and-shape-resolution layer is for legibility, not for forcing change.

### The solving instinct
Applying the solving instinct harder when the first application doesn't work is a design risk to guard against — for the system and for any builder operating on it. **More information offered after the first offer didn't land usually doesn't help; it pressures.**

## The Purpose Question

Freedom of choice implies no fixed purpose. The framing of the question — *what experience is correct?* — is itself the trap. There is no correct. People make choices daily. Choosing to align is a choice. Choosing not to align is a choice.

> *Whether one notices the gap between what one says and what one does is the question.*

The closest thing to "correct": reflection and alignment. Noticing when a stated goal doesn't match what's actually present and either adjusting the action or updating the goal. See [[Alignment]].

### The harder version isn't the obvious gap

Someone pursuing a value they've already largely satisfied at one layer without recognizing the layer has shifted. Someone who says they're chasing health, who is already healthier than ninety-five percent of the people around them, isn't wrong to keep going — the chase itself can be exactly what they enjoy. The layer-two question is whether the **work has moved**. Physical health may already be where it needs to be; the next layer might be mental, or relational, or spiritual. Same orientation, different terrain. (See Two-Layer Diagnostic in [[Pebble]].)

Reflection surfaces which layer is actually live. **Alignment is letting the pursuit follow it** rather than staying locked on the layer that's already been answered.

### Doubt as functional, not pathological

Doubt isn't an open problem here. It's functional. Doubt either becomes:

- **Reassurance through reframing** — the alignment loop catches it, confirms the choice, and the doubt dissolves
- **Fuel for a leap** — propelling action that wasn't yet visible

Both outcomes are useful. The recursion the framework supports is exactly this — not a thing to resolve once, but a loop that keeps running.

## Connections

This concept governs everything about [[Pebble]]'s behavior. It shapes how [[Observer]] surfaces patterns rather than prescribing actions. It is the reason [[Crèche]] is not another life-optimization assistant. The [[Read-Path Write-Path Split]] is partly an architectural expression of this principle: Observer runs on a *schedule*, not real-time — deliberate spacing creates room to notice rather than pressure to solve.

Related: [[Founder as First User]] — the founder's personality file embodies this posture. The relationship posture is "thinking partner not assistant"; when the user is processing, Pebble holds space without filling it.

Tension with: the domain skills (tax, legal, health) surface information that users could act on — the line between surfacing information and solving is genuinely blurry at the edges of these skills.

## Evolution

Expanded 2026-05-01 with three canonical sections absorbed: Perspective Expansion, Design Intent, Purpose Question. Each was a separate page in the canonical vault; folded into this hub because they all describe what Crèche *does* (shifts conditions over a long timescale through alignment that the user runs) versus what it doesn't (solve, optimize, prescribe).

## Open Questions

- Is drift toward solving-mode primarily an LLM-prompt problem or a feature-design problem? The prior art names it as recurring — what structural safeguards beyond guardrails are available?
- Where exactly is the line for domain skills like `legal` or `tax`? Surfacing that a user has a legal right feels like a connections move. Walking them through filing a complaint feels like solving. Where does one become the other?
- Does the `hard_push_enabled` mode risk sliding into solving-mode by lowering the threshold on challenging the user's stated reasoning?
