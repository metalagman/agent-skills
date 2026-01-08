# Agent Skills

A collection of specialized expertise, workflows, and resources for LLM agents.

## Overview

This repository contains "Skills" — self-contained modules that teach AI agents how to perform specific, high-quality tasks or adhere to particular standards.

## Available Skills

- **[Go Google Style Guide](./go-google-style-guide/SKILL.md)**: Expertise in Go programming according to the Google Go Style Guide.
- **[Go Uber Style Guide](./go-uber-style-guide/SKILL.md)**: Exhaustive expertise in Go programming according to the Uber Go Style Guide.
- **[Skill Writer](./skill-writer/SKILL.md)**: Expert at creating, documenting, and structuring new AI agent skills.

## How to Use

AI agents that support skills (like Gemini CLI, Claude Code, or OpenAI Codex) can discover and activate these skills.

### Quick Start (Clone & Symlink)

The most efficient way to use these skills and stay updated is to clone the repository and symlink the desired skills to your agent's global skill directory.

```bash
# Clone the repository
git clone git@github.com:metalagman/agent-skills.git ~/Projects/agent-skills

# Create the skills directory if it doesn't exist (e.g., for Gemini)
mkdir -p ~/.gemini/skills

# Symlink a specific skill
ln -s ~/Projects/agent-skills/go-uber-style-guide ~/.gemini/skills/go-uber-style-guide
```

*Replace `~/.gemini/skills/` with `~/.claude/skills/` for Claude Code or `~/.codex/skills/` for OpenAI Codex.*

### Manual Placement

1.  **Placement**: Clone this repository or copy specific skill folders into your agent's skill directory (e.g., `.gemini/skills/`, `.claude/skills/`, or `.codex/skills/`).
2.  **Activation**: Once placed in the appropriate directory, the agent will automatically discover the skill based on its description in `SKILL.md` and request activation when relevant.

For more technical details on how skills are structured and processed, see [AGENTS.md](./AGENTS.md).
