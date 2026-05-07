---
title: Crèche Vault
aliases: [Crèche Vault, Creche Vault]
type: source
tags: [cluster/sources, technology, product, framework, architecture, philosophy, personal-crm]
sources: [Crèche Vault]
created: 2026-05-01
updated: 2026-05-01
---

## Summary

The Crèche Vault is the canonical Obsidian-formatted reference for [[Crèche]] as of Phase 0 — 71 documents across 14 topic folders covering philosophy, architecture, agent posture, privacy and transparency standards, current state, business and legal structure, naming conventions, modules, and open questions. It supersedes the [[Crèche Prior Art]] ingest as the source of truth for design and architecture; the prior art is now a historical snapshot.

The vault is structured for external readers and contributors — personal content (journals, founder profile) is intentionally absent. What remains is what an external reader, contributor, or AI agent needs to understand the project. Folder numbers are reading order rather than strict dependencies.

The vault formalizes several concepts that were implicit or only partially expressed in the prior art: the four merge-conflict states (`resolved`, `open-deferred`, `wontfix`, `stale`) with `stale` as the load-bearing failure mode; the three-data-layer model orthogonal to the three-tier scope model; pattern resolution by tier (instance / definition / scaled-definition); the hybrid `journal_count OR time_floor` cadence as the reference pattern across the system; Pebble's full posture toolkit (Virgil, Sean Not Fletcher, Two-Layer Diagnostic, Sequencing, Paternalism by Design, Commissioning Layers); layered transparency; and the asymmetry argument on surveillance. The personality and config files have advanced from 0.1.0 to 0.2.0 with three additional doctrine guardrails.

The Phase 0 stack has shifted from the prior art's WhatsApp / Twilio / AWS Lambda design to **Claude app + Google Calendar + GitHub + Pebble-as-Claude-project**. The original messaging stack is deferred. Pengwin Labs LLC is the parent entity; Forage is named explicitly as the parallel SaaS product (revenue-generating training ground for Crèche capabilities); AGPL-3.0 is positioned as structural defense against drift toward closed forks.

## Key Points

- "Love yourself to the degree you love others" remains the foundational principle; mission is *resource recovery, not wealth creation*
- Crèche is a connections tool, not a real-time solving tool — the architectural expression of [[Connections vs Solving]]
- Pebble is read-path; Observer is write-path *and* category formation *and* anonymization *and* architecture maintenance
- Three-tier promotion: notes promote, journals don't (default); merging via active refinement, not separate publish; merge-conflict states apply
- Three layers of data (orthogonal to the tier model): source / shaped artifacts / generic shape and category
- "Agree to disagree" is structurally not available — `no_agree_to_disagree` is doctrine; alignment names what merge work would require
- Hybrid cadence `journal_count OR time_floor` is the reference pattern for refinement, scrum, retros, reminders
- Phase 0 stack: Claude app + Google Calendar + GitHub + Pebble-as-Claude-project; founder is both builder and first user
- Pebble posture is now a full toolkit: Virgil (guide/traveler), Sean Not Fletcher (presence-first), Paternalism by Design (commissioning grounds standing), Two-Layer Diagnostic (pattern-vs-frame), Sequencing (position before alternatives)
- Universal accessibility is a moral requirement; reflection spectrum lower end (like/dislike) is the access floor
- Independent weighting at the community layer = soft truth, signal not authority; structural Sybil resistance via decentralization
- Naming convention: penguin behavior + human meaning + role-fit; Crèche is a working name subject to revision
- AGPL-3.0 is structural defense; Pengwin Labs LLC is the parent; Forage is the parallel SaaS product

## Entities Mentioned

[[Crèche]], [[Pebble]], [[Observer]], [[Cache]], [[Rookery]], [[Journal]], [[Pengwin Labs]], [[Forage]]

## Concepts Discussed

Foundational: [[Connections vs Solving]], [[Founder as First User]], [[Doctrine Practice Expression]], [[Guardrails]] (now 11)

Architecture: [[Three-Tier CRM Model]], [[Git as Data Layer]], [[Read-Path Write-Path Split]], [[Three Layers of Data]], [[Three-Tier CRM Model#Promotion is Merging]], [[Three-Tier CRM Model#Pattern Resolution by Tier]], [[Three Layers of Data#How Shape Gets Formed (Reflection and Shape Vocabulary)]], [[Three Layers of Data#Topical Categorization (the orthogonal axis to shape)]], [[Alignment#Cadence (When Alignment Runs)]], [[Three-Tier CRM Model#Subscription and Refinement]], [[Three Layers of Data#Passive Signal]], [[Three Layers of Data#Passive Signal]], [[Three-Tier CRM Model#Contribution as Persistence]]

Merge and divergence: [[Alignment#Orientation: Walkways and Subscription]], [[Alignment#The Four Merge-Conflict States]], [[Alignment#Open-Ticket Surfacing]], [[Alignment#Operational Forms]], [[Alignment]]

Pebble posture: [[Pebble#Pebble as Virgil]], [[Pebble#Sean Not Fletcher]], [[Pebble#Paternalism by Design]], [[Pebble#Commissioning Layers]], [[Pebble#Two-Layer Diagnostic]], [[Pebble#Sequencing]], [[Pebble#Existential Conversations]], [[Pebble#Identity and Naming]]

Privacy and transparency: [[Privacy as Structural Property]], [[Privacy as Structural Property#Layered Transparency]], [[Privacy as Structural Property#Confidence Levels]], [[Three Layers of Data#Cross-Log Perspective Angling]], [[Rookery#Inbound Concern Channel]], [[Foundational Principle#Authenticity Without Exposure]]

Standards: [[Pebble#Recommendation Integrity]], [[Pebble#Prompt Injection Defense]], [[Pebble#Abuse Prevention]]

Philosophy: [[Foundational Principle]], [[Foundational Principle#Mission Frame]], [[Foundational Principle#Universal Accessibility]], [[Foundational Principle#Coordination Labor]], [[Connections vs Solving#Perspective Expansion]], [[Foundational Principle#Reasoning and Inheritance]], [[Foundational Principle#Identity Fluidity]], [[Foundational Principle#Holding Both]], [[Foundational Principle#User as Source]], [[Foundational Principle#Relational Condition]], [[Foundational Principle#On Authorship]], [[Connections vs Solving#Design Intent (What the Timescale Is)]]

Business and legal: [[Pengwin Labs#License: AGPL-3.0]], [[Pengwin Labs#Vendor Selection Standard]], [[Pengwin Labs#Naming Convention]]

Open questions: [[Privacy as Structural Property#The Surveillance Problem (Asymmetry Argument)]], [[Foundational Principle#The Safety Valve Counter-Argument]], [[Privacy as Structural Property#Foreseeable Abuse]], [[Connections vs Solving#The Purpose Question]]

Modules: [[Crèche#Functional Scope (canonical module list)]]

Community: [[Three-Tier CRM Model#Community Layer as Soft Truth]], [[Package JSON for a Person]], [[Three Layers of Data#Wiki of Wikis (Synthesis Surface)]]

## Connections

Supersedes [[Crèche Prior Art]] as design source of truth. The prior art remains valid as historical snapshot — Phase 0 thinking before Claude-as-channel pivot, before personality.yaml 0.2.0, before the merge-conflict states and shape-vs-biography refinements.

The vault confirms and sharpens [[Founder as First User]]: "the founder is engaging at the upper end of the reflection spectrum across all dimensions" — Phase 0 is built around this engagement level by design, with lower-capacity onboarding paths designed second. This is a sequencing choice about who the system is built for first.

The asymmetry argument on [[Privacy as Structural Property#The Surveillance Problem (Asymmetry Argument)]] sharpens the question rather than closing it: state-level vertical surveillance already exists; Crèche adds horizontal capability into a pre-existing asymmetry. Doesn't eliminate the misuse concern; reframes it.

[[Foundational Principle#Reasoning and Inheritance]] applies to the wiki itself: the vault carries the *why* alongside the *what*, so future readers (including future agents) inherit the reasoning, not just the form.

## Raw Source

Originally ingested from `raw/creche-vault/` (71 files in 14 topic folders). Local copy removed 2026-05-01 once synthesis was mature; canonical zip preserved externally by founder. This page is the synthesis-side record of what was ingested.
