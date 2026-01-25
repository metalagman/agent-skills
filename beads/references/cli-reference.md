# Beads CLI Reference Summary

## Project Management
- `bd init`: Initialize Beads in the current directory.
- `bd sync`: Export changes to JSONL, commit, and push.
- `bd info`: Show project status and configuration.
- `bd doctor`: Check and fix common state issues.

## Issue Management
- `bd create "Title"`: Create a new issue.
    - `-t, --type`: bug, feature, task, epic, chore.
    - `-p, --priority`: 0 (highest) to 4 (lowest).
    - `-l, --label`: Add labels.
- `bd ls`: List issues.
    - `--ready`: Show only unblocked issues.
    - `--json`: Machine-readable output.
- `bd show <id>`: Show details of a specific issue.
- `bd update <id>`: Update issue properties (status, priority, etc.).
- `bd close <id>`: Mark an issue as closed.

## Dependencies
- `bd dep add <child> <parent>`: Add a dependency relationship.
- `bd dep rm <child> <parent>`: Remove a dependency.

## Workflows
- `bd pour <formula>`: Instantiate a workflow formula.
- `bd molecules`: List active molecules.
- `bd gate approve <id>`: Manually approve a gate.

## Agent Integration
- `bd prime`: Inject current context/issues into the agent's prompt.
- `bd context`: Get context information for AI consumption.
