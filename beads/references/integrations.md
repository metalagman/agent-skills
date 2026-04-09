# Agent and Editor Integrations

## Preferred model: CLI + generated instructions
- `bd init` now generates lean agent instructions by default unless `--skip-agents` is passed.
- `bd onboard` prints the minimal snippet to add to `AGENTS.md` or an equivalent agent file.
- `bd prime` is the runtime single source of truth for workflow context.
  - In CLI mode it emits a fuller command guide.
  - In MCP mode it emits a shorter reminder.

## `bd onboard` vs `bd prime`
- `bd onboard`: use when you need the small snippet that lives in an agent instructions file.
- `bd prime`: use during an active session to recover or refresh workflow context.
- `bd onboard` keeps agent files lean by pointing back to `bd prime`.
- Do not paste normal `bd prime` output into `AGENTS.md` or `CLAUDE.md` unless the user explicitly wants an embedded full reference.

## Setup recipes
- `bd setup --list` shows built-in recipes. Current 1.0 recipes include:
  - `aider`
  - `claude`
  - `codex`
  - `cody`
  - `cursor`
  - `factory`
  - `gemini`
  - `junie`
  - `kilocode`
  - `mux`
  - `opencode`
  - `windsurf`
- Common flags:
  - `bd setup <recipe>`
  - `bd setup <recipe> --check`
  - `bd setup <recipe> --remove`
  - `bd setup <recipe> --print`
  - `bd setup <recipe> --stealth`
  - `bd setup mux --project|--global`

## Agent instruction profiles
- `bd init --agents-profile minimal`: compact instructions that point agents to `bd prime`.
- `bd init --agents-profile full`: embed a fuller command reference for tools without hooks.
- `bd init --agents-file <name>`: write to a non-default instructions file.
- `bd init --agents-template <path>`: use a custom template.

## Hook behavior
- `bd init` typically installs hooks automatically unless `--skip-hooks` is set.
- `bd hooks install|list|uninstall`: manage git hook shims directly.
- In current 1.0-generated Claude integration, both `SessionStart` and `PreCompact` call `bd prime`.
- Older examples that call `bd sync` on compaction are stale for the 1.0 CLI.

## Generated snippets
- `bd setup codex --print` and `bd setup claude --print` generate the same compact Beads section:
  - Use `bd ready` to find work.
  - Use `bd update <id> --claim` to claim it.
  - Use `bd close <id>` to finish it.
  - Use `bd dolt push` to sync with a configured remote.
  - Use `bd prime` as the operational source of truth.
- Treat printed setup snippets as install helpers, not as the authoritative command reference.
- The installed CLI may be newer than the printed template. For example, printed snippets can still carry older repo links or wording.
- If a printed snippet and the binary disagree, follow `bd --help`, `bd <command> --help`, `bd onboard --help`, and `bd prime --help`.

## Persistent memory
- `bd remember "<insight>"`: store durable knowledge for later sessions.
- `bd memories [query]`: search stored knowledge.
- `bd recall <key>` and `bd forget <key>`: inspect or remove specific memories.
- Prefer this over ad-hoc `MEMORY.md` files when the project uses Beads.

## Stealth and local-only usage
- `bd init --stealth`: keep Beads local to the user and avoid normal repo tracking.
- `bd setup <recipe> --stealth`: install agent integration without exposing Beads files to collaborators.
- Use this for shared repos where the user wants private planning.

## MCP fallback
- Use CLI first when shell access exists.
- If shell access is unavailable, `beads-mcp` remains the fallback server.
  - Install with `uv tool install beads-mcp` or `pip install beads-mcp`.
  - Expect higher token use and less direct control than the CLI.
