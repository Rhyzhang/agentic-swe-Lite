# Coding Standards & Code Health

> **Scope**: Applied to all code authored or modified across the repository.

---

## 1. Clean Code & Modularity
- **Single Responsibility Principle**: Each function, class, or module must have a single clear purpose. Keep functions under 50 lines where possible.
- **Explicit over Implicit**: Avoid magic strings, untyped maps, and ambiguous variable names. Use descriptive naming that matches the domain vocabulary defined in `@docs/spec.md`.
- **Pure Core, Impure Shell**: Separate pure business logic (computations, state transitions, validation) from side effects (database queries, network calls, filesystem I/O).

---

## 2. Type Safety
- **Strict Typing**: Never use `any` (TypeScript) or untyped `Any` / missing type hints (Python).
- **Domain Modeling**: Represent domain entities using immutable types or read-only properties wherever feasible.
- **Exhaustive Handling**: When switching on union types or enums, handle all cases exhaustively.

---

## 3. Error Handling
- **Specific Errors**: Throw typed or domain-specific exceptions. Never swallow exceptions or use empty `catch` blocks.
- **Fail Fast**: Validate preconditions, arguments, and state invariants at the entry of functions and methods.
- **Safe Propagation**: Log errors at the application boundary (e.g., middleware or top-level worker), not redundantly inside internal helpers.

---

## 4. Documentation & Comments
- **Preserve Existing Docs**: Never delete or degrade existing comments, docstrings, or architectural notes unless directly replacing deprecated code.
- **Explain 'Why', Not 'What'**: Write comments to explain business reasons, trade-offs, or non-obvious edge cases, not what standard syntax already conveys.
