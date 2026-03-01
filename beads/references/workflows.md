# Beads Workflows: Formulas, Molecules, Gates

Beads supports declarative, dependency-aware workflows for multi-step tasks.

## Formulas
- **Formulas** are workflow templates (YAML or JSON).
- Discover formulas with `bd --no-daemon formula list` and inspect with `bd --no-daemon formula show`.
- They define variables, steps, dependencies, and gates.

## Molecules
- **Molecules** are instantiated formulas that create real issues.
- Use `bd --no-daemon mol pour <formula>` to create a persistent molecule.
- Use `bd --no-daemon mol wisp <formula>` for ephemeral (non-synced) wisps.

## Gates
- **Gates** are async coordination primitives that pause a workflow.
- Common gate types include human approval, timers, and GitHub/CI signals.
- Resolve gates with `bd --no-daemon gate resolve <id>`.
