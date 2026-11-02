# Database & Data Integrity Rules

> **Scope**: Applied to all database interactions, schemas, repositories, and migrations.

---

## 1. Schema Modifications
- **No Direct Schema Edits**: Never alter database schemas, DDL, or ORM model definitions directly without following the `db-migration` procedural skill (`.agents/skills/db-migration/SKILL.md`).
- **Backward Compatibility**: All schema changes in production branches must follow the expand-contract pattern:
  - Phase 1: Add new column/table as nullable or with a default.
  - Phase 2: Dual-write or backfill data.
  - Phase 3: Switch readers to new structure.
  - Phase 4: Deprecate and drop old structure.
- **Foreign Keys & Cascades**: Foreign keys must be explicitly defined with appropriate `ON DELETE` semantics (`RESTRICT` or `CASCADE` with deliberate consideration).

---

## 2. Transactions & Concurrency
- **Mandatory Transactions**: Any business action modifying more than one table, row, or related entity must run inside an explicit ACID transaction.
- **Idempotency**: All mutation endpoints and worker jobs must support idempotent execution via unique request/operation tokens where applicable.
- **Lock Contention**: Keep transaction scopes as small as possible. Never perform long-running network calls or external API requests inside an open database transaction.

---

## 3. Query Performance & Safety
- **No N+1 Queries**: Always eager-load or batch-fetch related associations (e.g., using ORM joins, `include`, or dataloaders).
- **Index All Filtered Keys**: Columns frequently used in `WHERE`, `ORDER BY`, or `JOIN` clauses must be indexed.
- **Pagination**: All list or search queries returning multiple records must enforce pagination with hard limits (e.g., `LIMIT 100`). Never run unbounded `SELECT * FROM table`.
