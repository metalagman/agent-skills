# Versioning and ordering

## Default behavior
- Goose uses timestamp-based versions by default.
- Migrations are applied in version order.
- Use `-s` with `create` to generate sequential numbers when you want a strict sequence.

## Allowing out-of-order migrations
- CLI: pass `-allow-missing`.
- Library: use `goose.WithAllowMissing()` with `Up`, `UpTo`, or `UpByOne`.
- Provider: `WithAllowOutofOrder(true)`.

## Hybrid workflow
- During development, timestamp versions reduce conflicts.
- For production or strict ordering, use `goose fix` to rewrite migrations into a sequential order.
