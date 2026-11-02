# Security & Safeguards

> **Scope**: Applied to authentication, authorization, data handling, and external communication.

---

## 1. Secrets & Credentials
- **Zero Secrets in Code**: Never hardcode credentials, API tokens, encryption keys, or private certificates in source files, comments, or tests.
- **Environment Variables**: Load secrets exclusively through validated environment variables (e.g., via a typed config module).
- **Masking in Logs**: Ensure sensitive fields (passwords, tokens, PII, payment info) are filtered out of application and access logs.

---

## 2. Authentication & Authorization
- **Authenticate Early**: Enforce authentication middleware on all private routes before any controller or business service is executed.
- **Defense in Depth**: Verify authorization (RBAC/ABAC) at both the route layer and domain service layer.
- **Tenant Isolation**: In multi-tenant environments, every query must explicitly filter by `tenant_id` or `workspace_id`. Never rely on client-supplied IDs without verifying ownership.

---

## 3. Input Sanitization & Injection Prevention
- **Parameterized Queries**: Never concatenate raw strings into SQL queries. Always use parameterized queries or trusted ORM abstraction.
- **Cross-Site Scripting (XSS)**: Sanitize and escape all user-generated content rendered into HTML or returned in web contexts.
- **Path Traversal**: Validate and canonicalize all file paths provided by users before opening or writing to files on the host filesystem.
