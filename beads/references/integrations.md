# Agent & Editor Integrations

## CLI hooks (recommended when shell access exists)
- `bd --no-daemon setup <recipe>` installs integration files for your editor/agent.
- Built-in recipes include: `claude`, `cursor`, `gemini`, `aider`, `codex`, `windsurf`, `cody`, `kilocode`, `factory`.
- Use `bd --no-daemon setup --list` to see all recipes, `--check` to verify, `--remove` to uninstall.
- Hooks typically:
  - **SessionStart** → `bd --no-daemon prime` (injects current state into context).
  - **PreCompact** → `bd --no-daemon sync` (saves state before compaction).
- Verify with `bd --no-daemon setup <recipe> --check`.

## Manual hook configuration (Claude Code)
```json
{
  "hooks": {
    "SessionStart": [{
      "matcher": "*",
      "hooks": [{"type": "command", "command": "bd --no-daemon prime"}]
    }],
    "PreCompact": [{
      "matcher": "*",
      "hooks": [{"type": "command", "command": "bd --no-daemon sync"}]
    }]
  }
}
```

## MCP server (when CLI is unavailable)
- Install: `uv tool install beads-mcp` or `pip install beads-mcp`.
- Configure your MCP client to run `beads-mcp` from the repo root.
- MCP uses the same Beads data, but tends to consume more tokens than direct CLI use.

## Git hook integration
- `bd --no-daemon hooks install` sets up git hooks for auto-sync.
- `bd --no-daemon hooks list` shows hook status; `bd --no-daemon hooks uninstall` removes them.
