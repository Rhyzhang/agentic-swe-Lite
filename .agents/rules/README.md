# Tier 2: Modular Rules (`.agents/rules/`)

This directory contains **granular declarative constraints** for your project.

---

## How Rules Work in Antigravity

Antigravity automatically discovers and loads rules located in `.agents/rules/*.md`.

Unlike monolithic instruction files, modular rules provide:
1. **Context Separation**: Domain-specific constraints (e.g. database safety vs API contracts) live in isolated files.
2. **Context Budget Protection**: Rules are deduplicated and automatically budgeted (up to a 20,000 token aggregate budget across rules).
3. **Per-File Size Limits**: Individual rule files must remain under 24KB (24,000 bytes) to maintain high agent attention.

---

## When to Create a Rule vs. a Skill

- **Rule**: Declares **what must always be true** (invariants, conventions, forbidden patterns). Example: "All DB queries in mutation handlers must use transactions."
- **Skill**: Defines **how to execute a procedure** (multi-step workflows, scripts, runbooks). Example: "How to run zero-downtime database migrations step-by-step."

---

## Standard Template Files in This Directory

- [`coding-standards.md`](./coding-standards.md): Code structure, typing, naming, and quality expectations.
- [`database.md`](./database.md): Schema management, migration rules, and transaction safety.
- [`api-design.md`](./api-design.md): REST/RPC contracts, schema validation, and error payload structures.
- [`security.md`](./security.md): Secret management, access control, and injection prevention.

You can add new rule files (e.g. `frontend-components.md`, `event-streaming.md`) as your project grows.
