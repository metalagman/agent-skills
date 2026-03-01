---
name: beads
description: Use this skill to manage work in Beads (bd), a git-backed issue tracker for AI agents, including issue lifecycle, dependencies, sync, and agent hooks.
metadata:
  short-description: Expert guidance for Beads (bd) CLI workflows and agent integration.
---

# Beads Skill

Expert guidance for using Beads (`bd`) to track tasks, dependencies, and workflows in a git-backed issue graph.

## When to trigger
- The user mentions Beads, `bd`, or wants dependency-aware task tracking for agents.
- The task involves Beads CLI operations (init, ready, sync), formulas/molecules, or agent hooks.

## Core rules
- Prefer CLI + hooks (`bd --no-daemon setup <recipe>`) when shell access exists; use MCP only when CLI is unavailable.
- For all non-daemon agent commands, use direct mode: `bd --no-daemon <command> ...`.
- Never emit bare `bd <command>` for non-daemon operations.
- Use `--json` for machine parsing where supported: `bd --no-daemon --json <command> ...`.
- Use `bd --no-daemon ready` (or `bd --no-daemon list --ready`) to select unblocked work; add dependencies with `bd --no-daemon dep add` before starting.
- Run `bd --no-daemon sync` to export DB state to JSONL; it does **not** commit/push by default.
- Use `bd daemon ...` (with `--auto-commit/--auto-push`) or `bd --no-daemon sync --full` only when background automation is explicitly needed.
- Default backend is SQLite; use `bd --no-daemon init --backend dolt` for Dolt-backed storage.

## Workflow
1. **Initialize**: verify with `bd --no-daemon status`; if needed, run `bd --no-daemon init` (choose backend and branch). See [references/cli-reference.md](references/cli-reference.md).
2. **Integrate**: install hooks with `bd --no-daemon setup <recipe>` or configure manually. See [references/integrations.md](references/integrations.md).
3. **Manage issues**: create, update status, close with reason; maintain dependencies; use `bd --no-daemon list`, `bd --no-daemon ready`, `bd --no-daemon blocked`, `bd --no-daemon stats`.
4. **Sync + context**: `bd --no-daemon prime` on session start; `bd --no-daemon sync` after issue changes and `bd --no-daemon sync --import` after pull; use `bd --no-daemon sync --status` to verify state.
5. **Advanced workflows**: formulas, molecules, gates (`bd --no-daemon formula`, `bd --no-daemon mol`, `bd --no-daemon gate`). See [references/workflows.md](references/workflows.md).
6. **Recovery**: use `bd --no-daemon status`, `bd daemon status`, and `bd --no-daemon doctor` when sync or database issues appear. See [references/recovery.md](references/recovery.md).

## Output expectations
- Provide exact commands with flags and IDs; default to `bd --no-daemon ...` and use `--json` where supported.
- If daemon timeout warnings appear, rerun the same command in direct mode with `--no-daemon`.
- Ask for backend, repo location, and desired workflow if ambiguous.
- Call out whether a command affects git-tracked JSONL vs local DB.

## References
- CLI commands and options: [references/cli-reference.md](references/cli-reference.md)
- Core concepts and storage: [references/concepts.md](references/concepts.md)
- Workflows: formulas, molecules, gates: [references/workflows.md](references/workflows.md)
- Editor/agent integrations + MCP: [references/integrations.md](references/integrations.md)
- Recovery and troubleshooting: [references/recovery.md](references/recovery.md)
