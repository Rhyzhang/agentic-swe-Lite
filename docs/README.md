# Tier 4: Reference Documentation (`docs/`)

This directory houses deep architectural, product, and domain documentation.

---

## Why Tier 4 Documentation Lives Here

In agentic engineering, **prompt bloat dilutes model attention**. If thousands of lines of architectural nuances, product histories, and entity definitions were dumped into `AGENTS.md`, the agent would suffer from high token consumption, slow response times, and failure to prioritize core invariants.

By placing deep context in `docs/`:
- The agent's default context remains lean.
- The agent lazy-loads these documents on-demand using `@docs/<filename>.md` only when working on relevant tasks.
- Humans and agents share a single source of truth for product goals and technical architecture.

---

## Document Index

- [`prd.md`](./prd.md): Product Requirements Document defining business goals, user personas, features, and non-goals (written by Product Manager / Founder).
- [`spec.md`](./spec.md): Technical Architecture Specification defining system diagrams, component boundaries, domain entities, API contracts, testing strategy, and ADRs (written by Tech Lead).
