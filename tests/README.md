# Verification Harness & Tests (`tests/`)

This directory houses the mechanical verification suite for the project.

---

## The Mechanical Verification Imperative

In Agentic Software Engineering, **agents must not rely on self-assessment alone**. Code modifications are verified through automated, reproducible test execution: the **Validate → Observe → Report** cycle.

---

## Test Directory Structure

```text
tests/
├── unit/              # Pure unit tests (fast, isolated, in-memory)
├── integration/       # Integration tests (database queries, service contracts)
└── e2e/               # End-to-end / full system tests
```

---

## Agent Guidelines for Writing and Running Tests

1. **Bug Fixes Require Regression Tests**:
   - Whenever fixing a defect, write a test in `tests/` reproducing the exact failure before applying your code fix.
   - Run the test to observe the red/failing assertion.
   - Apply the fix and run the test to observe green/passing assertion.
2. **Deterministic Assertions**: Tests must not rely on real network calls or unpredictable timers. Use mocks, fakes, or local containerized test databases.
3. **Execution Commands**:
   - Fast unit test run: `npm test -- tests/unit/`
   - Specific test file: `npm test -- tests/unit/example.test.ts`
   - Full regression suite: `npm test`
