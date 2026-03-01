# Beads CLI Reference Summary

## Agent defaults (recommended)
- Use `bd --no-daemon <command> ...` for all non-daemon agent operations.
- Use `bd --no-daemon --json <command> ...` when structured output is supported.
- Reserve daemon mode for explicit background sync needs (`bd daemon ...`, auto-commit/push workflows).
- If you see daemon startup timeout warnings during normal CRUD commands, rerun with `--no-daemon`.

## Initialization & Status
- `bd --no-daemon init`: Initialize Beads (wizard-driven).
  - `--backend sqlite|dolt`: select storage backend (default: sqlite).
  - `-b, --branch <name>`: git branch for beads commits (default: current branch).
  - `-p, --prefix <prefix>`: issue ID prefix (default: current directory name).
  - `--from-jsonl`: import from current `.beads/issues.jsonl`.
  - `--stealth` / `--setup-exclude`: keep beads local or hidden from repo.
  - `--skip-hooks` / `--skip-merge-driver`: disable hook/merge driver setup.
  - `--force`, `--contributor`, `--team`, `--quiet`.
- `bd --no-daemon status`: Overall health + sync state.
- `bd daemon status`: Check daemon health.
- `bd --no-daemon info`: Show project info.

## Issue Lifecycle
- `bd --no-daemon create "Title"`: Create a new issue.
  - `-t, --type`: bug, feature, task, epic, chore.
  - `-p, --priority`: 0 (highest) to 4 (lowest).
  - `-l, --label`: add labels.
  - `--description`: detailed description.
  - `--deps discovered-from:<id>`: record discovered-from relationships.
  - `--json`: machine-readable output.
- `bd --no-daemon list`: List issues (use `--json` for agents).
  - `--status open`
  - `--label <label>`
  - `--ready`: show only ready issues (also available as `bd --no-daemon ready`).
- `bd --no-daemon show <id>`: Show issue details (`--json` supported).
- `bd --no-daemon update <id> --status in_progress`: Update status.
- `bd --no-daemon close <id> --reason "..."`: Close issue with reason.
- `bd --no-daemon ready`: Show ready (unblocked) issues.
- `bd --no-daemon blocked`: Show blocked issues.
- `bd --no-daemon stats`: Summary statistics.

## Dependencies
- `bd --no-daemon dep add <child> <parent>`: Add dependency (blocks by default).
- `bd --no-daemon dep tree <id>`: Visualize dependency tree.
- `bd --no-daemon dep cycles`: Detect circular dependencies.

## Sync & Agent Context
- `bd --no-daemon prime`: Inject current issue context into the agent session.
- `bd --no-daemon sync`: Export DB to JSONL (does not commit/push by default).
  - `--import`: import from JSONL after pull.
  - `--status`: show pending changes/conflicts.
  - `--resolve`: resolve JSONL conflicts.
  - `--full`: legacy full sync (pull → merge → export → commit → push).
- `bd --no-daemon setup <recipe>`: Install editor/agent integration (`--list`, `--check`, `--remove`).
- `bd --no-daemon hooks install|list|uninstall`: Manage git hooks for auto-sync.
