# Agent Skills

A collection of specialized expertise, workflows, and resources for LLM agents.

## Overview

This repository contains "Skills" — self-contained modules that teach AI agents how to perform specific, high-quality tasks or adhere to particular standards.

## Available Skills

- **[Go Google Style Guide](./go-google-style-guide/SKILL.md)**: Expertise in Go programming according to the Google Go Style Guide.

## How to Use

AI agents that support skills (like Gemini CLI, Claude Code, or OpenAI Codex) can discover and activate these skills.

1.  **Placement**: Clone this repository or copy specific skill folders into your agent's skill directory (e.g., `.gemini/skills/`, `.claude/skills/`, or `.codex/skills/`).
2.  **Activation**: Once placed in the appropriate directory, the agent will automatically discover the skill based on its description in `SKILL.md` and request activation when relevant.

For more technical details on how skills are structured and processed, see [AGENTS.md](./AGENTS.md).
