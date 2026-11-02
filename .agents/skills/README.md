# Tier 3: Procedural Skills (`.agents/skills/`)

Skills are modular packages of procedural knowledge, runbooks, and automation scripts that teach AI agents **how to perform complex workflows reliably**.

---

## Why Skills Instead of Rules?

- **Progressive Disclosure**: Agents do not load the full text of skills into the context window at start-up. Only the YAML frontmatter (`name` and `description`) is registered. The agent dynamically lazy-loads the skill instructions only when a user prompt or task requires it.
- **Context Economy**: Keeps prompt tokens lean during normal turns, reserving full procedural details for when the specific operation is executed.
- **Executable Automation**: Bundles helper scripts directly within the skill package under `scripts/`.

---

## Directory Structure of a Skill

Each skill lives in its own subdirectory inside `.agents/skills/`:

```text
.agents/skills/<skill-name>/
├── SKILL.md            # Required: Main instruction file with YAML frontmatter
├── scripts/            # Optional: Executable automation scripts
├── references/         # Optional: Deep reference documentation lazy-loaded by the skill
├── examples/           # Optional: Reference code snippets and sample inputs
└── resources/          # Optional: Templates or asset files
```

---

## Required Frontmatter Format in `SKILL.md`

Every `SKILL.md` must begin with YAML frontmatter:

```markdown
---
name: your-skill-name
description: >-
  Describe what this skill does and when the agent should trigger it.
  Use third-person voice (e.g., "Use this skill when the user asks to...").
---

# Your Skill Title

Step-by-step instructions...
```

---

## Template Skills Included in This Repository

1. [`db-migration`](./db-migration/SKILL.md): Safe, zero-downtime database migration workflow with verification helper scripts and policy guidelines.
   - Shows how to package procedural runbooks with executable scripts (`scripts/verify-migration.sh`) and deep references (`references/migration-policy.md`).
