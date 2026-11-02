# `.agents/` Directory Overview

This directory holds the agent harness configuration for the repository.

---

## Directory Layout

```text
.agents/
├── mcp_config.json        # MCP Server declarations (DB, Browser, Remote Docs)
├── rules/                 # Tier 2: Declarative constraints & invariants
│   ├── coding-standards.md
│   ├── database.md
│   ├── api-design.md
│   └── security.md
└── skills/                # Tier 3: Procedural runbooks & executable helpers
    └── db-migration/
        ├── SKILL.md
        ├── scripts/
        └── references/
```

---

## Component Guide

1. **`mcp_config.json`**:
   Configures Model Context Protocol (MCP) servers. Provides external tools (e.g. database schema querying, headless browser execution, team docs retrieval) directly to the agent.
2. **`rules/`**:
   Declarative guidelines that Antigravity automatically discovers and loads. Rules enforce invariants (e.g. "always use transactions", "sanitize inputs"). Keep each file under 24KB.
3. **`skills/`**:
   Action-oriented runbooks lazy-loaded on demand via progressive disclosure. Skills define multi-step recipes (e.g. how to run migrations safely).
