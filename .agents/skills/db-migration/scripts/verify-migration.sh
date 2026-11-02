#!/usr/bin/env bash
# verify-migration.sh
# Verifies that recent migration files do not violate safety invariants.

set -euo pipefail

echo "==> [db-migration] Checking migration safety invariants..."

# Look for dangerous operations in uncommitted or latest migration files
MIGRATION_FILES=$(git status --porcelain | awk '{print $2}' | grep -E 'migrations/.*\.sql$' || true)

if [ -z "$MIGRATION_FILES" ]; then
    echo "No pending migration files detected in git working tree. Checking latest committed migration..."
    MIGRATION_FILES=$(git log -n 1 --name-only --diff-filter=A | grep -E 'migrations/.*\.sql$' || true)
fi

if [ -z "$MIGRATION_FILES" ]; then
    echo "Notice: No migration SQL files found to inspect. Skipping static lint."
    exit 0
fi

for FILE in $MIGRATION_FILES; do
    if [ -f "$FILE" ]; then
        echo "Inspecting $FILE..."
        # Check for non-concurrent index creation in Postgres
        if grep -qi "CREATE INDEX" "$FILE" && ! grep -qi "CONCURRENTLY" "$FILE"; then
            echo "WARNING: $FILE contains non-concurrent index creation: consider 'CREATE INDEX CONCURRENTLY'."
        fi
        # Check for DROP COLUMN / DROP TABLE
        if grep -qi "DROP COLUMN" "$FILE" || grep -qi "DROP TABLE" "$FILE"; then
            echo "CAUTION: $FILE contains DROP operations. Ensure prior deprecation phase has concluded."
        fi
    fi
done

echo "==> [db-migration] Verification complete."
