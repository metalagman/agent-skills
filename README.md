# Agent Skills

A collection of specialized expertise, workflows, and resources for LLM agents.

## Overview

This repository contains "Skills" — self-contained modules that teach AI agents how to perform specific, high-quality tasks or adhere to particular standards.

## Available Skills

### Go
- **[Google Style Guide](./go-google-style-guide/SKILL.md)**: Expertise in Go programming according to the Google Go Style Guide.
- **[Google Style Decisions](./go-google-style-decisions/SKILL.md)**: Specific choices and trade-offs for consistent Go codebases.
- **[Google Best Practices](./go-google-best-practices/SKILL.md)**: Advanced idiomatic Go patterns and best practices from Google.
- **[Uber Style Guide](./go-uber-style-guide/SKILL.md)**: Exhaustive expertise in Go programming according to the Uber Go Style Guide.
- **[Senior Developer](./go-senior-developer/SKILL.md)**: Expert guidance for senior Go developers on architecture, concurrency, and performance.
- **[OSS Maintainer](./go-oss-maintainer/SKILL.md)**: Expert Go OSS maintainer specializing in repository hygiene, CI/CD, and AI-agent compatibility.
- **[Options Gen](./go-options-gen/SKILL.md)**: Expert in generating functional options for Go structs using the options-gen library.
- **[Goose](./go-goose/SKILL.md)**: Expert guidance for goose CLI and Go library database migrations.

### Git
- **[Gitflow](./gitflow/SKILL.md)**: Expert guidance on the Gitflow branching strategy and release management.
- **[GitHub Flow](./github-flow/SKILL.md)**: Expert guidance on the lightweight GitHub Flow branching strategy.
- **[Conventional Commits](./conventional-commits/SKILL.md)**: Expert at writing semantic, machine-readable commit messages.

### Workflow & Issue Tracking
- **[Beads](./beads/SKILL.md)**: Expert in Beads (bd), a Git-backed, AI-native issue tracker and workflow engine.

### AI & Meta
- **[Skill Writer](./skill-writer/SKILL.md)**: Expert at creating, documenting, and structuring new AI agent skills.

## How to Use

AI agents that support skills (like Gemini CLI, Claude Code, or OpenAI Codex) can discover and activate these skills.

### Using the CLI Tool (Recommended)

The easiest way to install all skills from this repository is using the `add-skill` tool:

```bash
npx add-skill metalagman/agent-skills
```

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
