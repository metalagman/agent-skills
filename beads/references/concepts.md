# Beads Core Concepts

Beads (`bd`) 1.0+ is a Dolt-backed, AI-native issue tracker for dependency-aware coding workflows.

## Issue IDs
- Uses hash-based IDs (e.g., `bd-a3f8e9`) to avoid collisions across branches.
- Supports hierarchical IDs for epics (e.g., `bd-a3f8e9.1`, `bd-a3f8e9.2`).

## Storage modes
- **Embedded Dolt (default)**: `bd init` creates `.beads/embeddeddolt/`. This is the common single-writer local mode.
- **Server mode**: `bd init --server` connects to an external `dolt sql-server` for multi-writer setups.
- **Workspace metadata**: `.beads/config.yaml`, `.beads/metadata.json`, `.beads/hooks/`, `.beads/interactions.jsonl`, and generated agent files such as `AGENTS.md` / `CLAUDE.md`.

## Collaboration model
- **Primary sync** is Dolt-native: `bd dolt commit`, `bd dolt pull`, and `bd dolt push`.
- **Backup** is separate: `bd backup ...` is for off-machine recovery, not day-to-day issue updates.
- **JSONL still exists**, but mainly for portability and interop: `bd export` and `bd import` round-trip issues and memories. It is no longer the primary live storage model.

## Relationships
- **Blocks**: hard dependency; blocked issues are not "ready".
- **Parent/Child**: epic → task structure.
- **Discovered-from**: issues found while working on another issue.
- **Related**: soft linkage for context.
- **Duplicate / Supersedes**: graph links for de-duplication and replacement.

## Status semantics
- `bd ready` is dependency-aware and excludes blocked, deferred, and active work already in progress.
- `bd list --status open` is not equivalent to `bd ready`; it is a raw filter, not a scheduler.
- `bd statuses` exposes categories such as `active`, `wip`, `done`, and `frozen`, which control whether a status participates in ready-queue selection.

## Ephemeral vs persistent work
- **Persistent beads**: normal issues stored in Dolt history and intended to survive across sessions.
- **Ephemeral beads / wisps**: temporary operational work created with `bd create --ephemeral` or `bd mol wisp`; they are stored locally and are not intended for normal remote sharing.
- **Promotion**: `bd update --persistent`, `bd promote`, or molecule commands can convert temporary work into durable history when needed.

## Agent context and memory
- `bd prime` is the runtime workflow reference for agents.
- `bd remember`, `bd memories`, `bd recall`, and `bd forget` provide durable memory across sessions and account rotations.
- `bd onboard` and `bd setup <recipe>` generate lean agent instructions that point back to `bd prime`.

## Worktree and multi-repo behavior
- `bd worktree create` configures worktrees to share Beads state correctly.
- `bd repo ...` supports multi-repo hydration into one local database.
- `bd federation ...` synchronizes peer Beads workspaces.
- `bd ship <capability>` and `external:<project>:<capability>` dependencies support cross-project coordination.

## Workflow primitives
- **Formulas**: reusable workflow templates (`bd formula ...`, `bd cook`).
- **Molecules**: instantiated multi-step work graphs (`bd mol ...`).
- **Wisps**: ephemeral molecule executions.
- **Gates**: async coordination (`human`, `timer`, `gh:run`, `gh:pr`, `bead`).
- **Swarms**: structured parallel work on epics.
- **Merge slots**: serialized conflict-resolution access for merge-heavy workflows.
