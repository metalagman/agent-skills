# Beads CLI Reference Summary

## Agent defaults (recommended)
- Use `bd --no-daemon --json <command>` for routine agent operations (create/list/show/update/close).
- Reserve daemon mode for explicit background sync needs (`bd daemon ...`, auto-commit/push workflows).
- If you see daemon startup timeout warnings during normal CRUD commands, rerun with `--no-daemon`.

## Initialization & Status
- `bd init`: Initialize Beads (wizard-driven).
  - `--backend sqlite|dolt`: select storage backend (default: sqlite).
  - `-b, --branch <name>`: git branch for beads commits (default: current branch).
  - `-p, --prefix <prefix>`: issue ID prefix (default: current directory name).
  - `--from-jsonl`: import from current `.beads/issues.jsonl`.
  - `--stealth` / `--setup-exclude`: keep beads local or hidden from repo.
  - `--skip-hooks` / `--skip-merge-driver`: disable hook/merge driver setup.
  - `--force`, `--contributor`, `--team`, `--quiet`.
- `bd status`: Overall health + sync state.
- `bd daemon status`: Check daemon health.
- `bd info`: Show project info.

## Issue Lifecycle
- `bd create "Title"`: Create a new issue.
  - `-t, --type`: bug, feature, task, epic, chore.
  - `-p, --priority`: 0 (highest) to 4 (lowest).
  - `-l, --label`: add labels.
  - `--description`: detailed description.
  - `--deps discovered-from:<id>`: record discovered-from relationships.
  - `--json`: machine-readable output.
- `bd list`: List issues (use `--json` for agents).
  - `--status open`
  - `--label <label>`
  - `--ready`: show only ready issues (also available as `bd ready`).
- `bd show <id>`: Show issue details (`--json` supported).
- `bd update <id> --status in_progress`: Update status.
- `bd close <id> --reason "..."`: Close issue with reason.
- `bd ready`: Show ready (unblocked) issues.
- `bd blocked`: Show blocked issues.
- `bd stats`: Summary statistics.

## Dependencies
- `bd dep add <child> <parent>`: Add dependency (blocks by default).
- `bd dep tree <id>`: Visualize dependency tree.
- `bd dep cycles`: Detect circular dependencies.

## Sync & Agent Context
- `bd prime`: Inject current issue context into the agent session.
- `bd sync`: Export DB to JSONL (does not commit/push by default).
  - `--import`: import from JSONL after pull.
  - `--status`: show pending changes/conflicts.
  - `--resolve`: resolve JSONL conflicts.
  - `--full`: legacy full sync (pull → merge → export → commit → push).
- `bd setup <recipe>`: Install editor/agent integration (`--list`, `--check`, `--remove`).
- `bd hooks install|list|uninstall`: Manage git hooks for auto-sync.
