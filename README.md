# Agentic Software Engineering (SWE) Template

A lightweight, production-grade starter template designed for **Agentic Software Engineering** with AI pair programmers and autonomous coding agents (such as Google Antigravity / Gemini).

This repository implements the **4-Tier Harness Architecture**, eliminating the common failure modes of monolithic prompt files ("Big Context Markdown") such as attention dilution, stale rules, and context budget bloat.

---

## The 4-Tier Harness Architecture

```text
├── AGENTS.md                  # Tier 1: Table of contents & critical invariants (~80 lines)
├── .agents/
│   ├── README.md              # Harness directory guide
│   ├── mcp_config.json        # MCP Server declarations (DB, browser automation, remote docs)
│   ├── rules/                 # Tier 2: Granular declarative constraints (auto-discovered)
│   │   ├── README.md          # Rules guide & sizing limits
│   │   ├── coding-standards.md
│   │   ├── database.md
│   │   ├── api-design.md
│   │   └── security.md
│   └── skills/                # Tier 3: Procedural workflows (SKILL.md lazy-loaded packages)
│       ├── README.md          # Skills anatomy & authoring guide
│       └── db-migration/      # Canonical skill example
│           ├── SKILL.md
│           ├── scripts/verify-migration.sh
│           └── references/migration-policy.md
├── docs/                      # Tier 4: Deep reference docs (lazy-loaded on demand)
│   ├── README.md              # Documentation index
│   ├── prd.md                 # Product Requirements Document (business goals & user stories)
│   └── spec.md                # Tech Lead Architectural Specification (system design, models & ADRs)
├── src/                       # Application source code
│   └── README.md              # Clean architecture & layer guidelines
└── tests/                     # Verification test harness (unit, integration, regression)
    └── README.md              # Mechanical verification & regression guidelines
```

---

## Why This Architecture?

| Failure Mode in Flat Repos | How This Harness Solves It |
| :--- | :--- |
| **Attention Dilution** (LLMs lose critical rules in 500+ line instruction files) | **Tier 1 (`AGENTS.md`)** is kept lean (<100 lines) with only non-negotiable invariants and pointers. |
| **The "Graveyard of Stale Rules"** (Outdated fixes applied to refactored code) | **Tier 2 (`.agents/rules/`)** isolates rules into granular, single-topic files with size caps. |
| **Context Window Bloat** (Prompt overhead burns budget on every turn) | **Tier 3 (`.agents/skills/`)** and **Tier 4 (`docs/`)** use **progressive disclosure** (lazy-loaded only when triggered). |
| **Hallucinated "Self-Verified" Fixes** | **Mechanical Verification (`tests/`)** enforces a strict **Validate → Observe → Report** feedback cycle. |

---

## 5-Minute Quickstart: Using This Template for a New Project

When you clone or fork this template to start a new project:

1. **Step 1: Define the Business Goals in `docs/prd.md`**  
   Fill in the Problem Statement, Target Personas, Core User Stories (P0/P1), and explicitly document **Non-Goals** to keep the agent focused.

2. **Step 2: Define the Tech Architecture in `docs/spec.md`**  
   Document the system diagram, component boundaries, domain entities, database schema (ERD), API endpoints, and ADRs.

3. **Step 3: Customize Root `AGENTS.md`**  
   Update the tech stack description, verification commands (`npm test`, `pytest`, etc.), and project-specific non-negotiable guardrails.

4. **Step 4: Configure Tools in `.agents/mcp_config.json`**  
   Enable any local or remote Model Context Protocol (MCP) servers your project needs (e.g. Postgres DB inspector, Playwright browser runner).

5. **Step 5: Code & Verify**  
   Prompt your agent to work against the PRD and Spec. The agent will automatically reference rules and run verification tests in `tests/`.

---

## Directory Walkthrough

### 1. `AGENTS.md` (Tier 1: Table of Contents & Invariants)
The primary entrypoint read by AI agents on startup. Contains:
- Summary of tech stack and directory map.
- Strict invariants (security rules, schema lockouts, layer isolation).
- Verification protocol (`Validate → Observe → Report`).
- Pointers to deeper documentation via `@docs/spec.md` and `@docs/prd.md`.

### 2. `.agents/rules/` (Tier 2: Modular Rules)
Declarative constraints automatically discovered by Antigravity:
- [`coding-standards.md`](.agents/rules/coding-standards.md): Modularity, type safety, error handling conventions.
- [`database.md`](.agents/rules/database.md): Safe migration rules, transaction requirements, index guidelines.
- [`api-design.md`](.agents/rules/api-design.md): Endpoint standards, schema validation, consistent response envelopes.
- [`security.md`](.agents/rules/security.md): Secret management, authorization checks, injection prevention.

### 3. `.agents/skills/` (Tier 3: Procedural Skills)
Action-oriented runbooks packaged with YAML frontmatter:
- [`db-migration`](.agents/skills/db-migration/SKILL.md): Safe zero-downtime migration steps with a validation helper script and policy guidelines.

### 4. `.agents/mcp_config.json` (MCP Tool Integrations)
Pre-configured Model Context Protocol servers for database access, browser testing, and documentation lookup.

### 5. `docs/` (Tier 4: Deep Reference Docs)
Comprehensive documentation lazy-loaded on demand:
- [`prd.md`](docs/prd.md): Product Requirements Document written for product & business alignment.
- [`spec.md`](docs/spec.md): Technical Architecture Specification written by a Tech Lead (system architecture, layered boundaries, domain entities, API contracts, and ADRs).

### 6. `src/` & `tests/` (Application & Test Harness)
- [`src/`](src/README.md): Structured into presentation, application, domain, and infrastructure layers.
- [`tests/`](tests/README.md): Unit, integration, and regression test suites for mechanical verification.

---

## Agent Interaction Rules of Thumb

- **Rules say what must always be true** (invariants, conventions).
- **Skills say how to do an action** (runbooks, multi-step procedures).
- **Docs provide deep background on demand** (specifications, schemas, requirements).
- **Tests provide the mechanical ground truth** (agents verify fixes with real test execution).
