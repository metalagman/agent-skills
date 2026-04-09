# Recovery & Troubleshooting

## Quick diagnostics
- `bd context --json`: Verify repo root, backend, Dolt mode, database name, and version.
- `bd status --json`: Get a structured snapshot of issue health.
- `bd doctor`: General installation and graph health checks.
- `bd doctor --agent --json`: Rich diagnostics for agent workflows.
- `bd bootstrap --dry-run --json`: Safe preview of how Beads would recover or initialize the workspace.
- `bd dolt show`, `bd dolt status`, `bd dolt test`: Inspect the Dolt layer.
- `bd backup status`: Check whether off-machine backup is configured and healthy.

## Safe first responses
- **Fresh clone or moved machine**: run `bd bootstrap` before trying destructive repair.
- **Need a portable snapshot before experimenting**: run `bd export -o beads-export.jsonl` or `bd backup sync`.
- **Need to inspect without writing**: use `--json`, `--readonly`, and dry-run flags where available.
- **Docs say "sync" but the command is missing**: determine whether you actually need `bd dolt pull/push`, `bd backup sync`, `bd repo sync`, `bd federation sync`, or `bd import`.
- **Generated snippet or repo docs disagree with installed behavior**: check `bd --help`, `bd <command> --help`, `bd onboard --help`, and `bd prime --help` before following the prose.

## Common fixes
- **No `.beads/` or no local DB**: `bd bootstrap` or `bd init --non-interactive`.
- **Fresh clone with git-tracked JSONL present**: `bd import` or `bd bootstrap`.
- **Remote replication issue**: inspect with `bd dolt status` and `bd dolt show`, then use `bd dolt pull` / `bd dolt push`.
- **Server mode connectivity issue**: use `bd dolt test` and `bd doctor --server`.
- **Schema or migration problem**: use `bd doctor --migration=pre|post` and review the output before changing data.
- **Broken worktree routing**: inspect with `bd worktree info` and recreate with `bd worktree create` if needed.
- **Multi-repo hydration confusion**: inspect `bd repo list` and rerun `bd repo sync`.
- **Peer town federation issue**: inspect with `bd federation status` and retry with `bd federation sync`.

## Repair commands that can modify data
- `bd doctor --fix`
- `bd init --force`
- `bd backup restore --force`
- Any manual cleanup of `.beads/`

Use these only after you have:
1. Captured the current state with diagnostics.
2. Created a backup or export if possible.
3. Determined that a safer command such as `bd bootstrap`, `bd import`, or `bd dolt pull` will not solve the problem.

## Recovery heuristics for agents
- Prefer `bd bootstrap` over reinitializing a workspace from scratch.
- Prefer `bd doctor` over `bd doctor --fix`.
- Prefer `bd export` / `bd backup sync` before destructive operations.
- Prefer the installed CLI help over older prose examples if the command tree disagrees.
