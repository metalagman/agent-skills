# Go migrations

## Creating
- Use `goose create <name> go` to generate a timestamped `.go` migration file.
- File names are usually `YYYYMMDDHHMMSS_<name>.go` unless you later re-number with `fix`.

## Registration pattern
- Define `Up` and `Down` functions that receive a `*sql.Tx` (and optionally `context.Context`).
- Register them in `init()` using goose helpers (e.g., `AddMigration` or context-aware variants).
- Keep the migration in a non-`_test.go` file and ensure the package is imported by the binary that runs migrations.

## Running Go migrations
- The standard `goose` CLI does **not** compile and run your Go migration files.
- To run Go migrations, either:
  - build a custom goose binary that imports your migration packages, or
  - run migrations inside your application/test using the goose library or Provider API.
