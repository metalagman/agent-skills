# Beads Workflows: Formulas and Molecules

Beads uses a declarative approach to define and execute multi-step workflows.

## Formulas
A **Formula** is a blueprint or template for a workflow. It defines:
- **Variables**: Inputs required for the workflow.
- **Steps**: Individual tasks (issues) to be created.
- **Dependencies**: How steps relate to each other (e.g., Step B blocks Step C).
- **Gates**: Conditions that must be met to proceed.

Formulas are defined in TOML or JSON and can be shared across projects.

## Molecules
A **Molecule** is a persistent instance of a Formula.
- When you "pour" a formula (`bd pour <name>`), it creates a Molecule.
- The Molecule instantiates the steps as real Issues in the tracker.
- It tracks the progress of the overall workflow graph.

## Gates
Gates are coordination primitives that pause workflow execution:
- **Approval**: Requires a human to run `bd gate approve <id>`.
- **CI**: Waits for a GitHub Action or other CI status.
- **Merge**: Waits for a specific PR to be merged.
- **Timer**: Pauses for a specified duration.

## Wisps
**Wisps** are lightweight, ephemeral workflows.
- They are **not** Git-synced.
- They auto-expire after a period of inactivity.
- Ideal for local experimentation or temporary task lists that don't need to be shared with the team.
