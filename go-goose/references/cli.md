# Goose CLI quick reference

## Basic usage
- Command shape: `goose [flags] DRIVER DBSTRING <command>`
- If `GOOSE_DRIVER` and `GOOSE_DBSTRING` are set, you can omit those arguments.
- For compatibility, put flags before the command (recent releases may accept flags anywhere).

## Common flags
- `-dir <path>`: migrations directory (default: current dir)
- `-table <name>`: version table name (default: `goose_db_version`)
- `-v`: verbose output
- `-allow-missing`: allow out-of-order (missing) migrations
- `-no-versioning`: run without recording versions
- `-env <file|none>`: load env vars from file (default: `.env`; use `none` to disable)
- `-no-color`: disable color output (also honors `NO_COLOR`)
- `-timeout <duration>`: max allowed query time (e.g., `1h13m`)
- `-s`: create sequential migration numbers (used with `create`)
- MySQL TLS flags may include `-ssl-cert`, `-ssl-key`, `-ssl-ca`, and `-ssl-disable`.

## Commands
- `up`: migrate to latest
- `up-by-one`: migrate up by one
- `up-to <version>`: migrate up to a target version
- `down`: roll back one
- `down-to <version>`: roll back to a target version
- `redo`: re-run latest migration
- `reset`: roll back all migrations
- `status`: show applied/pending versions
- `version`: print current version
- `create <name> <sql|go>`: create a new migration stub
- `fix`: re-number to sequential ordering
- `validate`: check migrations for format issues

## Environment variables
- `GOOSE_DRIVER`: CLI driver (e.g., `postgres`)
- `GOOSE_DBSTRING`: connection string
- `GOOSE_MIGRATION_DIR`: default directory for migrations
- `GOOSE_TABLE`: override version table name
- `NO_COLOR`: disable color output

## Supported drivers (CLI)
- clickhouse, mssql, mysql, postgres, sqlite3, turso (libsql), vertica, ydb
