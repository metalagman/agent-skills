# Agent & Editor Integrations

## CLI hooks (recommended when shell access exists)
- `bd setup <recipe>` installs integration files for your editor/agent.
- Built-in recipes include: `claude`, `cursor`, `gemini`, `aider`, `codex`, `windsurf`, `cody`, `kilocode`, `factory`.
- Use `bd setup --list` to see all recipes, `--check` to verify, `--remove` to uninstall.
- Hooks typically:
  - **SessionStart** → `bd prime` (injects current state into context).
  - **PreCompact** → `bd sync` (saves state before compaction).
- Verify with `bd setup <recipe> --check`.

## Manual hook configuration (Claude Code)
```json
{
  "hooks": {
    "SessionStart": [{
      "matcher": "*",
      "hooks": [{"type": "command", "command": "bd prime"}]
    }],
    "PreCompact": [{
      "matcher": "*",
      "hooks": [{"type": "command", "command": "bd sync"}]
    }]
  }
}
```

## MCP server (when CLI is unavailable)
- Install: `uv tool install beads-mcp` or `pip install beads-mcp`.
- Configure your MCP client to run `beads-mcp` from the repo root.
- MCP uses the same Beads data, but tends to consume more tokens than direct CLI use.

## Git hook integration
- `bd hooks install` sets up git hooks for auto-sync.
- `bd hooks list` shows hook status; `bd hooks uninstall` removes them.
