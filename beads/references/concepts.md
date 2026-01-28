# Beads Core Concepts

Beads (`bd`) is a Git-backed, AI-native issue tracker designed for dependency-aware workflows.

## Issue IDs
- Uses hash-based IDs (e.g., `bd-a3f8e9`) to avoid collisions across branches.
- Supports hierarchical IDs for epics (e.g., `bd-a3f8e9.1`, `bd-a3f8e9.2`).

## Storage + Architecture
- **SQLite backend**: `.beads/*.db` is the primary store; `bd sync` exports to `.beads/issues.jsonl` for git sync.
- **JSONL export**: `.beads/issues.jsonl` is line-delimited JSON for git synchronization.
- **Config metadata**: `.beads/config.json` and `.beads/metadata.json`.
- The daemon can auto-import/export JSONL and optionally auto-commit/push when enabled.

## Backends
- **SQLite (default)**: local DB with JSONL export for git sync.
- **Dolt**: `bd init --backend dolt` stores data in `.beads/dolt/` with versioned history.

## Relationships
- **Blocks**: hard dependency; blocked issues are not "ready".
- **Parent/Child**: epic → task structure.
- **Discovered-from**: issues found while working on another issue.
- **Related**: soft linkage for context.

## Workflow Primitives
- **Formulas**: declarative workflow templates (TOML or JSON).
- **Molecules**: instantiated workflow graphs created from formulas.
- **Gates**: async coordination (human approval, timers, CI/GitHub signals).
