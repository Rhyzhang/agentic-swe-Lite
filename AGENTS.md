# AGENTS.md

> **Tier 1: Root System Map & Critical Invariants**
> Keep this file lean (~80–150 lines). It serves as the primary entrypoint for AI agents.
> Detailed rules live in `.agents/rules/`, multi-step procedures in `.agents/skills/`, and deep documentation in `docs/`.

---

## 1. Tech Stack & Architecture

<!-- REPLACE: Summarize your core runtime, framework, database, and package structure -->
- **Runtime & Language**: Node.js / TypeScript (or Python 3.11+)
- **Primary Framework**: Modern application framework (e.g., Next.js, FastAPI, NestJS)
- **Database & ORM**: PostgreSQL with Prisma / SQLAlchemy / Drizzle
- **Code Organization**:
  - `src/`: Core application logic (presentation, application, domain, infrastructure)
  - `tests/`: Automated unit, integration, and regression suites
  - `docs/`: Technical specification (`spec.md`) and product requirements (`prd.md`)
  - `.agents/`: Agent harness configuration (rules, procedural skills, MCP servers)

For system architecture, domain models, and technical design, see `@docs/spec.md`.
For business context and feature requirements, see `@docs/prd.md`.

---

## 2. Non-Negotiable Invariants

All agents operating in this codebase must strictly adhere to the following guardrails:

1. **Database Mutations**: Never modify database schema or models directly. Always execute migrations via the `db-migration` skill (`.agents/skills/db-migration/SKILL.md`). All transactional operations must be wrapped in explicit transactions.
2. **Mechanical Verification**: Never mark a task complete without executing and reporting test results. Every bug fix must include an automated regression test.
3. **Boundary Isolation**: Do not bypass layer boundaries (e.g., presentation code must never query database repositories directly). Respect modular constraints outlined in `.agents/rules/coding-standards.md`.
4. **Security & Secrets**: Never commit secrets, API keys, credentials, or `.env` files. Validate all external inputs at the boundary using schema validators (Zod/Pydantic). See `.agents/rules/security.md`.
5. **No Speculative Mass Edits**: Make minimal, targeted changes. Do not reformat unrelated files or remove existing documentation/comments.

---

## 3. Verification Protocol

Follow the **Validate → Observe → Report** cycle before concluding any task:

```bash
# 1. Typecheck & Lint
npm run typecheck    # (or: mypy / pyright / ruff)
npm run lint         # (or: eslint / ruff check)

# 2. Run Test Suite
npm test             # (or: pytest)

# 3. Target Specific Test (fast feedback loop)
npm test -- tests/path/to/test.spec.ts
```

If any step fails:
1. Inspect the mechanical output and stack trace.
2. Formulate a hypothesis and apply a targeted fix.
3. Re-run the verification command until all checks pass cleanly.

---

## 4. Documentation & Rule Map

- **Product Requirements (PRD)**: `@docs/prd.md`
- **Technical Specification & Architecture**: `@docs/spec.md`
- **Coding Standards**: `.agents/rules/coding-standards.md`
- **API Guidelines**: `.agents/rules/api-design.md`
- **Database Rules**: `.agents/rules/database.md`
- **Security Rules**: `.agents/rules/security.md`
- **External Tools & MCP**: `.agents/mcp_config.json`
