# Beads CLI Reference Summary

## Agent defaults (recommended)
- Use plain `bd ...` commands in 1.0+. Do not assume `bd --no-daemon ...` or `bd sync` still exist.
- Use `bd <command> --json` for machine parsing when supported.
- Prefer non-interactive commands and flags; avoid editor-opening flows like `bd edit` or `bd create-form` unless the user explicitly wants them.
- Use `bd ready` to select work, not `bd list --status open`, because `ready` is dependency-aware.
- Use `bd update <id> --claim` to atomically take work.
- Use `bd close <id> --reason "..."` to complete work cleanly.
- Use `bd onboard` when you need the minimal snippet for an agent instructions file.
- Use `bd prime` when the agent needs workflow context after restart, compaction, or handoff.
- Treat `bd setup ... --print` output as a generated install template. It may lag behind the installed CLI in links or prose.
- If someone says "sync", determine which 1.0 surface they mean:
  - Dolt remote sync: `bd dolt pull`, `bd dolt push`
  - Backup sync: `bd backup sync`
  - Multi-repo hydration: `bd repo sync`
  - Peer federation: `bd federation sync`
  - JSONL portability: `bd export`, `bd import`

## Agent file vs runtime context
- `bd onboard`: emit the small snippet that belongs in `AGENTS.md`, `CLAUDE.md`, or an equivalent agent instructions file.
- `bd prime`: emit live workflow guidance for the current session.
- `bd init --agents-profile minimal`: generate a lean agent file that points back to `bd prime`.
- `bd init --agents-profile full`: embed a fuller command reference for agents without hook support.

## Initialization, bootstrap, and context
- `bd init`: Initialize a Beads workspace in the current repository.
  - `--server`: use an external Dolt SQL server instead of embedded mode.
  - `--prefix`: set the issue ID prefix.
  - `--from-jsonl`: import from `.beads/issues.jsonl`.
  - `--stealth` / `--setup-exclude`: keep Beads local to the user.
  - `--skip-hooks` / `--skip-agents`: opt out of generated hooks or agent files.
  - `--agents-profile minimal|full`: choose compact vs embedded agent instructions.
  - `--non-interactive`: safe default for CI and agents.
- `bd bootstrap`: Safe setup and repair entry point for fresh clones and broken local state.
  - Use `--dry-run --json` first to inspect the plan.
- `bd context`: Show repository path, backend, Dolt mode, database name, role, and version.
- `bd status`: Snapshot of project health, ready work, and recent activity.
  - `bd stats` is an alias of `bd status`.
- `bd info`: Show database information.
- `bd where`: Show the active Beads location.

## Issue lifecycle
- `bd create "Title"`: Create a new issue.
  - Common flags: `--description`, `--type`, `--priority`, `--assignee`, `--labels`, `--deps`, `--parent`, `--acceptance`, `--design`, `--notes`, `--ephemeral`.
  - Use `--deps discovered-from:<id>` to link work discovered while implementing another issue.
  - Use `--validate` when the issue should satisfy type-specific sections.
- `bd q "Title"`: Quick capture that returns only the new issue ID.
- `bd list`: List issues with filters like `--status`, `--priority`, `--label`, `--assignee`, `--type`.
- `bd show <id>`: Show details, dependencies, and history for a single issue.
- `bd search <query>` / `bd query ...`: Search or query issues.
- `bd update <id>`: Update issue fields.
  - `--claim`: set assignee to the current actor and mark `in_progress`.
  - `--status`, `--priority`, `--assignee`, `--description`, `--title`, `--notes`, `--design`, `--parent`, `--ephemeral`, `--persistent`.
- `bd assign <id> <name>`: Shorthand for setting assignee.
- `bd close [id...]`: Close one or more issues.
  - Useful flags: `--reason`, `--suggest-next`, `--claim-next`, `--continue`.
- `bd reopen [id...]`: Reopen closed work.
- `bd note <id> <text>` / `bd comments ...`: Add or manage discussion.
- `bd label ...`, `bd priority ...`, `bd defer ...`, `bd undefer ...`: Manage status-adjacent workflow details.

## Dependencies and structure
- `bd dep add <child> <parent>`: Add a blocking dependency.
- `bd dep <blocker> --blocks <blocked>`: Equivalent shorthand.
- `bd dep tree <id>`: Visualize dependency structure.
- `bd dep list <id>` / `bd dep cycles`: Inspect relationships and detect cycles.
- `bd dep relate` / `bd dep unrelate`: Manage non-blocking related links.
- `bd children <id>`: List child issues.
- `bd blocked`: Show blocked work and bottlenecks.
- `bd graph`: Render issue graph.
- `bd duplicate`, `bd supersede`, `bd orphans`: Maintain graph hygiene.

## Quality, validation, and memory
- `bd statuses`: List valid statuses and categories.
- `bd types`: List valid issue types.
- `bd lint`: Check recommended sections by issue type.
- `bd stale`: Find issues with no recent activity.
- `bd preflight`: Contributor-facing PR readiness checklist.
- `bd remember "<insight>"`: Store persistent knowledge that `bd prime` can inject later.
- `bd memories [query]`, `bd recall <key>`, `bd forget <key>`: Inspect persistent memory.

## Collaboration, storage, and history
- `bd dolt show|status|test`: Inspect Dolt configuration and connection.
- `bd dolt start|stop`: Control the project Dolt server when explicit lifecycle control is needed.
- `bd dolt remote add|list|remove`: Manage Dolt remotes.
- `bd dolt commit|pull|push`: Commit and replicate Beads data through Dolt.
- `bd backup init|status|sync|restore|remove`: Off-machine backup and restore.
- `bd export`: Export issues and memories to JSONL for portability or interop.
- `bd import [file]`: Import from JSONL; defaults to `.beads/issues.jsonl`.
- `bd branch`, `bd vc status|commit|merge`, `bd history`, `bd diff`: Inspect or manage Beads history.

## Advanced workflow primitives
- `bd formula ...`, `bd cook`, `bd mol ...`, `bd gate ...`, `bd swarm ...`, `bd merge-slot ...`, `bd worktree ...`, `bd repo ...`, `bd federation ...`, `bd ship ...`
- See [workflows.md](workflows.md) for when to use each.
