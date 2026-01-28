# Goose library and Provider API

## Basic library usage (database/sql)
1. Connect with `database/sql`.
2. Ensure the database driver is imported in your binary.
3. Call `goose.SetDialect("postgres")` (or your dialect), and keep driver/dialect aligned.
4. Run migrations:
   - `goose.Up(db, "migrations")`
   - `goose.UpTo(db, "migrations", version)`
   - `goose.Down(db, "migrations")`
   - `goose.Status(db, "migrations")`
   - `goose.Version(db, "migrations")`

## Embedded migrations
- Use `//go:embed` and `goose.SetBaseFS(fsys)` to read migrations from an embedded `fs.FS`.
- Then call `goose.Up(db, "migrations")` with the directory inside the FS.

## Provider API (fs.FS-first)
- Create a provider with `goose.NewProvider(dialect, db, fsys, options...)`.
- `fsys` can be `os.DirFS`, `embed.FS`, a `fs.Sub(...)`, or `nil` if you only register Go migrations.
- Common methods include `Up`, `UpByOne`, `UpTo`, `Down`, `DownTo`, `Status`, and `GetDBVersion`.

## Provider options (selected)
- `WithVerbose(true)`
- `WithAllowOutofOrder(true)`
- `WithDisableVersioning(true)`
- `WithDisableGlobalRegistry(true)`
- `WithExcludeNames(names...)`
- `WithExcludeVersions(versions...)`
- `WithGoMigrations(goose.NewGoMigration(version, up, down), ...)`
- `WithSessionLocker(...)` for session-based locking when supported
