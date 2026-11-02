# API Design & Contract Invariants

> **Scope**: Applied to HTTP REST endpoints, RPC services, and external integrations.

---

## 1. Request & Response Validation
- **Boundary Validation**: Every public endpoint must parse and validate incoming inputs (parameters, query strings, headers, request bodies) using a strict schema validator (e.g. Zod, Pydantic, Joi).
- **Reject Unexpected Properties**: Enforce strict schema parsing that strips or rejects undeclared fields to prevent parameter injection attacks.

---

## 2. Response Formats & Error Handling
- **Consistent Envelope**: All responses should follow standard structures:
  ```json
  // Success Response
  {
    "data": { ... },
    "meta": { "timestamp": "...", "page": 1, "pageSize": 20 }
  }

  // Error Response
  {
    "error": {
      "code": "RESOURCE_NOT_FOUND",
      "message": "User with ID '123' does not exist.",
      "details": []
    }
  }
  ```
- **Semantic Status Codes**:
  - `200 OK`: Successful retrieval or synchronous operation.
  - `201 Created`: Successful creation of a new resource.
  - `400 Bad Request`: Validation or malformed input error.
  - `401 Unauthorized`: Missing or invalid authentication token.
  - `403 Forbidden`: Authenticated user lacks permission.
  - `404 Not Found`: Target resource does not exist.
  - `409 Conflict`: Unique constraint violation or concurrency collision.
  - `422 Unprocessable Entity`: Business invariant failure.
  - `500 Internal Server Error`: Unexpected server fault (log stack trace, mask internal details in response).

---

## 3. Versioning & Backward Compatibility
- **Never Break Consumers**: Avoid removing or renaming fields on existing endpoint responses. Deprecate fields with notices before removal.
- **URL or Header Versioning**: Major architectural changes or breaking contract rewrites must be introduced under a new version (e.g. `/api/v2/...`).
