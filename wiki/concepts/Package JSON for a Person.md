---
title: Package JSON for a Person
type: concept
tags: [cluster/architecture, framework, architecture, philosophy]
sources: [Crèche Vault]
created: 2026-05-01
updated: 2026-05-01
---

## Definition

A structural metaphor for what [[Crèche]]'s architecture is doing. A `package.json` declares dependencies — what a project needs to function, version constraints for compatibility, peer dependencies that require multiple parties to agree on a shared version. The lockfile captures the actual current state. Conflicts surface when declared requirements don't fit together; the failure is often invisible until something breaks.

Crèche is the same shape at the relational layer. The metaphor names the *dependency-graph shape* — it does not claim that Crèche manages packages, holds correctness, or resolves conflicts on the user's behalf. Crèche only holds the weight of trying to align.

## The Mapping

- **People depend on other people, on places, on practices, on values.**
- **Compatibility constraints exist whether or not anyone has named them.**
- **Peer dependencies are everywhere** — a relationship requires both parties to align on something; a household requires its members to share enough; a community requires shared definitions to function.
- **Conflicts surface as friction, exhaustion, or breakdowns** that look interpersonal but are structurally a peer-dep mismatch.

## The Architecture's Job

Make the dependency graph legible without flattening it.

- [[Cache]] holds the lockfile — the actual current state ([[Git as Data Layer]])
- [[Pebble]] surfaces conflicts when conditions warrant ([[Read-Path Write-Path Split]])
- Merging is how shared definitions get aligned across parties ([[Alignment#Orientation: Walkways and Subscription]], [[Alignment#The Four Merge-Conflict States]])
- The graph topology of git is the same shape as the dependency graph the metaphor names

## Limits of the Metaphor

`package.json` doesn't update its own constraints. People do. The masses in this dependency graph can shift weight, and the system supports that shifting through reflection, alignment work, and merge mechanics. **Dependency graphs in software are static; relational graphs aren't.**

This is also why the metaphor is structural, not normative. There is no "correct" `package.json` for a person. Crèche doesn't try to compute one. It holds what's been declared, surfaces conflicts when conditions warrant, and supports the work of trying to align — that work belongs to the people, not to the system.

## The Lockfile and the Hot Cache

In package management, the manifest declares *what is wanted*; the lockfile declares *what is currently resolved*. Crèche has the same split:

- The personal manifest declares what the user has subscribed to (practices, voice, skills, accepted parent-tier shared definitions)
- The lockfile materializes this into the actual current state Pebble needs on hand
- The Hot Cache is the lockfile's read-side projection at runtime — what gets preloaded when Pebble starts a session, so Pebble's infrastructure is current without reasoning from raw manifests on every invocation

## Connections

[[Three-Tier CRM Model]] — three scopes, each emitting a manifest
[[Three-Tier CRM Model#Promotion is Merging]] — how shared definitions move between manifests via merging, not management
[[Alignment#Orientation: Walkways and Subscription]] — the relational form of dependency-graph alignment
[[Alignment#The Four Merge-Conflict States]] — the four states that apply when peer-deps don't fit
[[Git as Data Layer]] — git provides the topology that makes the metaphor mechanical rather than only metaphorical
[[Three Layers of Data#Wiki of Wikis (Synthesis Surface)]] — the synthesis layer over the manifest structure
[[Founder as First User]] — at N=1 the manifest has one author; the structural properties still apply

## Evolution

Concept articulated in [[Crèche Vault]] under this title. Replaces an earlier framing on this wiki (`Crèche as Package Manager`) that imposed a software-style propose / evaluate / accept / version / lock lifecycle. The canonical framing is more honest: Crèche is not a package manager. It is infrastructure that holds the shape of the dependency graph and supports the *work* of alignment, which belongs to the people doing it.

## Open Questions

- The metaphor's limit (people update constraints, packages don't) is named — what does the architecture surface when constraints shift faster than retros catch them?
- Where does the metaphor break for non-software-literate users? The mapping needs to be accessible without explanation, or it functions as a developer-only legibility aid.
- Are there structural properties of relational dependency graphs (e.g., transitive closures, conflict types) that don't have software analogues and need their own vocabulary?
