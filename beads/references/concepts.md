# Beads Core Concepts

Beads (`bd`) is an AI-native, Git-backed issue tracker designed for collaborative coding workflows.

## AI-Native Architecture
- **Hash-based IDs**: Uses 128-bit hashes (truncated for display) to prevent ID collisions when multiple agents or humans work concurrently on different branches.
- **Machine-Friendly**: Commands support `--json` output for programmatic access by AI agents.
- **Deterministic**: Workflow execution is designed to be predictable and repeatable.

## Git-Backed Storage
- **JSONL Format**: Issues and metadata are stored in `.beads/state.jsonl`. This line-delimited JSON format is version-control friendly, minimizing merge conflicts.
- **Collaborative**: Issues live with the code. Syncing issues is as simple as `git pull` and `git push`.
- **Branch-Aware**: Issues created on a branch stay on that branch until merged, allowing for branch-specific issue tracking.

## Dual-Storage System
- **Source of Truth**: The Git-tracked `.beads/*.jsonl` files.
- **Query Layer**: A local SQLite database (`.beads/beads.db`) provides fast indexing and complex queries.
- **Rebuildable**: The SQLite database is derived state and can be rebuilt from the JSONL files at any time using `bd init`.

## Issue Relationships
- **Blocks**: A hard dependency. If A blocks B, B is not "ready" until A is closed.
- **Parent-Child**: Hierarchical organization (e.g., Epic -> Task -> Subtask).
- **Discovered From**: Tracks issues found while working on another issue.
- **Related**: Soft link for informational purposes.

## Lifecycle Entities
- **Daemon**: A background process that ensures the SQLite database stays in sync with the JSONL files.
- **Gates**: Asynchronous coordination points (Human approval, CI pass, Timer).
- **Wisps**: Ephemeral, local-only workflows that don't get synced to Git.
