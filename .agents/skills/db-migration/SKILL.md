---
name: db-migration
description: >-
  Use this skill whenever the user or task requires modifying the database schema, creating
  or running migrations, altering tables or columns, or inspecting database migration status.
---

# Database Migration Runbook

This procedural skill guides the agent through safely applying database schema changes without data loss or application downtime.

---

## Prerequisites & Policy Check

Before writing any DDL or migration code, review the migration guidelines:
- Consult [migration-policy.md](./references/migration-policy.md) for zero-downtime rules (expand-contract pattern).
- Verify that the change does not introduce locking operations on large tables.

---

## Execution Steps

### Step 1: Inspect Current Migration Status
Run the migration status check to understand current database state:
```bash
# Example for Prisma / Node:
npx prisma migrate status

# Example for Alembic / Python:
# alembic current
```

### Step 2: Generate Migration Script
Make declarative changes in the schema definition file (e.g., `schema.prisma` or model class).
Generate the migration files using the framework CLI:
```bash
# Example for Prisma:
npx prisma migrate dev --create-only --name <descriptive_migration_name>

# Example for Alembic:
# alembic revision --autogenerate -m "<descriptive_migration_name>"
```

### Step 3: Run Mechanical Verification
Execute the verification helper script to validate the migration SQL:
```bash
bash .agents/skills/db-migration/scripts/verify-migration.sh
```
Verify that:
1. All new columns are either nullable or specify a safe default value.
2. No tables or columns are dropped in the same migration that introduces new code.
3. Indexes are created concurrently if required by the target database engine.

### Step 4: Apply Migration in Test Environment
```bash
# Example:
npx prisma migrate deploy
# or: alembic upgrade head
```

### Step 5: Run Automated Tests
Execute the test suite to confirm all repositories, models, and queries pass cleanly:
```bash
npm test -- tests/db
```
Report the exact migration filename, affected tables, and test output to the user.
