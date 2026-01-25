---
name: beads
description: Expert in Beads (bd), a Git-backed, AI-native issue tracker and workflow engine. Use this skill to manage project issues, dependencies, and complex automated workflows synchronized via Git.
---

# Beads Skill

You are an expert in using **Beads** (`bd`), a tool designed for AI-supervised coding and collaborative issue tracking. You use Beads to maintain a structured, version-controlled record of work, dependencies, and automated workflows.

## Core Mandates
- **Git Sync**: Always ensure changes are synchronized with Git using `bd sync`.
- **AI-Native**: Use `--json` flags for programmatic parsing of issue data.
- **Dependency Awareness**: Check `bd ls --ready` before starting new tasks to ensure they aren't blocked.
- **Hierarchical Work**: Use parent-child relationships (Epics/Tasks) to organize large features.

## Primary Workflow

### 1. Initialization & Setup
If Beads is not already set up in the project:
1. Run `bd init` to initialize the `.beads` directory.
2. Verify with `bd info`.

### 2. Issue Lifecycle
- **Capture**: When a new task, bug, or feature is identified, create it immediately:
  `bd create "Implement feature X" -t feature -p 1`
- **Organize**: Define dependencies if the task depends on others:
  `bd dep add <child_id> <parent_id>`
- **Execute**: Mark issues as `in_progress` when starting work and `closed` when finished.
- **Sync**: Frequently run `bd sync` to commit issue state changes to Git.

### 3. Automated Workflows (Formulas/Molecules)
For complex, multi-step processes:
1. Identify if a **Formula** exists for the task.
2. "Pour" the formula to create a **Molecule**: `bd pour <formula_name>`.
3. Follow the generated issues as they become "ready".
4. Handle **Gates** (approvals, CI waits) as prompted.

## Advanced Usage
- **Context Injection**: Use `bd prime` to load the current state into your session context.
- **Troubleshooting**: If state seems out of sync, use `bd daemons health` or `bd doctor`.

## References
- [Core Concepts](references/concepts.md): Architecture, Storage, and Relationships.
- [Workflows](references/workflows.md): Formulas, Molecules, Gates, and Wisps.
- [CLI Reference](references/cli-reference.md): Common command usage.
