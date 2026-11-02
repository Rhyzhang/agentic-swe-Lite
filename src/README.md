# Application Source (`src/`)

This directory contains the primary application codebase.

---

## Recommended Directory Structure

For clean architecture and clear layer boundaries:

```text
src/
├── presentation/      # API controllers, CLI commands, router definitions
├── application/       # Use case handlers, business workflows, service interfaces
├── domain/            # Core business models, entities, value objects, exceptions
└── infrastructure/    # Database repositories, external API clients, storage drivers
```

---

## Agent Guidelines for Editing Code in `src/`

1. **Follow Existing Conventions**: Match the established directory structure and design patterns.
2. **Type Safety**: Maintain strict type annotations across all files. Do not use `any` or untyped signatures.
3. **Keep Invariants Intact**: Ensure edits respect the rules in `.agents/rules/` (e.g. database safety, clean layer boundaries).
4. **Mechanical Verification**: Always verify your changes by executing the test suite in `tests/` before marking tasks complete.
