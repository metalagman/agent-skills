# Recovery & Troubleshooting

## Quick diagnostics
- `bd status`: Overall health and sync state.
- `bd daemon status` / `bd daemon status --all`: Check daemon health.
- `bd blocked`: Identify dependency bottlenecks.
- `bd doctor`: Attempt automatic fixes for common issues.
- `bd sync --status`: Show pending changes and conflicts.

## Common fixes
- **Daemon startup timeout warning**: use direct mode for routine commands, e.g. `bd --no-daemon close <id> --reason "..."`.
- **Stale or stopped daemon**: restart with `bd daemon restart` or `bd daemon start`.
- **Sync issues**: `bd sync --resolve` (or `bd sync --import` after pull), then resolve JSONL conflicts.
- **Database issues (SQLite backend)**: `bd doctor` can repair and rebuild derived state when needed.
