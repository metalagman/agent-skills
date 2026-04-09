---
name: beads
description: Use this skill to manage work in Beads (`bd`) 1.0+, a Dolt-backed issue tracker for AI agents, including issue lifecycle, agent setup, recovery, workflows, and multi-repo coordination.
metadata:
  short-description: Expert guidance for Beads (`bd`) 1.0 CLI workflows and agent integration.
---

# Beads Skill

Expert guidance for using Beads (`bd`) 1.0+ to track work, dependencies, memory, and structured workflows in a Dolt-backed issue graph.

## When to trigger
- The user mentions Beads, `bd`, or wants dependency-aware task tracking for agents.
- The task involves Beads CLI operations (`init`, `bootstrap`, `ready`, `dolt`, `setup`), formulas/molecules, or agent hooks.
- The task involves agent instructions, persistent memories, worktrees, cross-repo planning, or recovery of a Beads workspace.

## Core rules
- Prefer the installed `bd` CLI when shell access exists. Use MCP only when the CLI cannot be used.
- Treat `https://github.com/gastownhall/beads` and `https://gastownhall.github.io/beads/` as the upstream home. Older `steveyegge/beads` links may redirect.
- Default to plain `bd ...` commands in 1.0+. Do not assume pre-1.0 patterns like `bd --no-daemon ...`, `bd sync`, or SQLite-backed storage still apply.
- Use `--json` for machine parsing where supported, and prefer non-interactive flags over editor-based flows.
- Use `bd ready`, `bd show <id>`, `bd update <id> --claim`, `bd dep add`, and `bd close <id> --reason "..."` for the core issue lifecycle.
- Use `bd onboard` for the minimal snippet that belongs in `AGENTS.md` or equivalent agent instructions files.
- Use `bd prime` as the single source of truth for session workflow and context recovery after compaction or agent restart.
- Prefer `bd bootstrap` for fresh clones or broken local setup, and reserve `bd init --force` or `bd doctor --fix` for explicit repair work after reviewing the impact.
- Treat `bd setup ... --print` output as an install template, not the authoritative command reference.
- When high-level docs, generated snippets, or repo prose disagree with the installed binary, trust `bd --help` and `bd <command> --help`.

## Workflow
1. **Detect context**: check `bd context`, `bd status`, and `bd --help`; if `.beads/` is missing or the clone is fresh, start with `bd bootstrap --dry-run --json` or `bd init`. See [references/cli-reference.md](references/cli-reference.md).
2. **Integrate agents**: use `bd init` or `bd setup <recipe>` to install AGENTS/CLAUDE/editor integration; use `bd onboard` for the minimal snippet that belongs in agent instructions files; use `bd prime` during sessions for live workflow context. See [references/integrations.md](references/integrations.md).
3. **Manage work**: create issues with explicit descriptions, claim work atomically, keep dependencies accurate, and use `bd ready` rather than raw status filtering when choosing unblocked work.
4. **Collaborate and persist**: use `bd dolt push` and `bd dolt pull` for primary sync, `bd backup` for off-machine recovery, and `bd export`/`bd import` for JSONL portability or interop.
5. **Use structured workflows when needed**: formulas, molecules, wisps, gates, swarms, merge slots, worktrees, repo hydration, federation, and capability shipping all have first-class commands. See [references/workflows.md](references/workflows.md).
6. **Recover carefully**: prefer diagnostics (`bd doctor`, `bd bootstrap`, `bd context`, `bd dolt status`, `bd backup status`) before auto-fix commands. See [references/recovery.md](references/recovery.md).

## Output expectations
- Provide exact commands with flags, IDs, and the correct 1.0 command group (`bd`, `bd dolt`, `bd backup`, `bd repo`, `bd federation`, `bd mol`, etc.).
- State whether a command changes local issue state, Dolt history/remotes, JSONL import/export, or agent/editor integration.
- Prefer safe/read-only inspection first when diagnosing breakage.
- Ask for repository path, embedded vs server mode, remote/backups, and agent/editor target if those affect the workflow.

## References
- CLI commands and options: [references/cli-reference.md](references/cli-reference.md)
- Core concepts, storage, and modes: [references/concepts.md](references/concepts.md)
- Workflows: formulas, molecules, wisps, gates, swarms, worktrees: [references/workflows.md](references/workflows.md)
- Editor/agent integrations, hooks, and memory: [references/integrations.md](references/integrations.md)
- Recovery and troubleshooting: [references/recovery.md](references/recovery.md)
