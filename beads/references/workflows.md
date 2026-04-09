# Beads Workflows: Formulas, Molecules, Gates, and Coordination

Beads 1.0 keeps the workflow system, but the command surface is broader and more explicit than older `formula`/`mol` examples suggest.

## Formulas and cooking
- `bd formula list`: list workflow templates from project, user, and orchestrator search paths.
- `bd formula show <name>`: inspect steps, variables, and composition rules.
- `bd cook <formula>`: compile a formula into a proto bead.
- Use formulas when work is repeatable, parameterized, or should encode a standard execution graph.

## Molecules
- `bd mol pour <proto-id>`: instantiate a persistent molecule.
  - Use for work that should remain in durable history and be visible across sessions.
- `bd mol wisp <proto-id>`: instantiate an ephemeral molecule.
  - Use for operational, release, or one-shot flows that should not become normal durable backlog.
- `bd mol show`, `bd mol progress`, `bd mol current`, `bd mol ready`, `bd mol last-activity`: inspect a running molecule.
- `bd mol squash`, `bd mol burn`, `bd mol bond`, `bd mol distill`: compress, discard, combine, or extract workflow structure.

## Wisps and ephemeral work
- `bd create --ephemeral`: create a temporary issue directly.
- `bd mol wisp list` / `bd mol wisp gc`: inspect and clean up wisps.
- `bd promote` or `bd update --persistent`: convert temporary work into durable work when it proves worth keeping.

## Gates
- `bd gate list`: view open or all gates.
- `bd gate check`: re-evaluate gates and close resolved ones.
- `bd gate resolve <id>`: manually close a gate.
- `bd gate discover`: help resolve GitHub workflow-linked gates.
- Common gate types in 1.0:
  - `human`
  - `timer`
  - `gh:run`
  - `gh:pr`
  - `bead`

## Swarms and merge serialization
- `bd swarm create`: create a swarm molecule from an epic.
- `bd swarm validate`: check whether an epic is safe for swarming.
- `bd merge-slot create|check|acquire|release`: serialize merge conflict resolution when many agents converge on the same branch.

## Multi-repo and cross-project coordination
- `bd repo add|list|remove|sync`: hydrate multiple repositories into one local Beads view.
- `bd federation add-peer|list-peers|status|sync`: synchronize peer towns/workspaces.
- `bd ship <capability>`: publish a capability once the providing issue is closed.
- `bd dep add <issue> external:<project>:<capability>`: depend on work in another project.

## Worktrees
- `bd worktree create`: create a git worktree with correct Beads redirect configuration.
- `bd worktree info`: inspect the current worktree’s relationship to the shared Beads state.
- `bd worktree remove`: remove a worktree safely.

## Drift warning
- Some high-level docs still mention commands like `bd pin`, `bd hook`, or top-level `bd sync`.
- Do not assume those commands exist in the installed 1.0 binary unless `bd --help` or `bd <command> --help` confirms them.
