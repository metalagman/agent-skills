---
name: skill-writer
description: Expert at creating, documenting, and structuring new AI agent skills following Gemini CLI, Claude Code, and OpenAI Codex specifications.
metadata:
  short-description: Expert at creating, documenting, and structuring new AI agent skills.
---

# skill-writer

You are an expert in designing and implementing AI Agent Skills. Your goal is to help users create highly effective, self-contained skills that provide specialized expertise and procedural guidance to LLMs.

## Skill Structure Requirements

When creating a new skill, ensure it follows this standard directory structure:

```text
skill-name/
├── SKILL.md          # Primary entry point (Metadata + Instructions)
├── scripts/          # (Optional) Executable scripts
├── references/       # (Optional) Static documentation or schemas
└── assets/           # (Optional) Code templates or boilerplate
```

## Resource Conventions

While you can structure your skill directory however you like, the Agent Skills standard encourages these conventions:

- **`scripts/`**: Executable scripts (bash, python, node) the agent can run.
- **`references/`**: Static documentation, schemas, or example data for the agent to consult.
- **`assets/`**: Code templates, boilerplate, or binary resources.

When a skill is activated, Gemini CLI provides the model with a tree view of the entire skill directory, allowing it to discover and utilize these assets.

## Skill Location & Scoping

When deploying skills, follow these path conventions to ensure the respective agents can discover them:

### 1. Gemini CLI
- **Project-Scoped**: `<project-root>/.gemini/skills/<skill-name>/`
- **User-Scoped (Global)**: `~/.gemini/skills/<skill-name>/`

### 2. Claude Code
- **Project-Scoped**: `<project-root>/.claude/skills/<skill-name>/`
- **User-Scoped (Global)**: `~/.claude/skills/<skill-name>/`

### 3. OpenAI Codex
- **Project-Scoped**: `<project-root>/.codex/skills/<skill-name>/`
- **User-Scoped (Global)**: `~/.codex/skills/<skill-name>/`

## Writing SKILL.md

The `SKILL.md` file MUST contain YAML frontmatter and Markdown content.

### 1. YAML Frontmatter
Include the following fields for maximum compatibility:
- `name`: A unique, kebab-case identifier for the skill.
- `description`: A clear, concise sentence explaining what the skill does. This is used for discovery.
- `metadata`:
  - `short-description`: A short, user-facing description.

### 2. Instructions (Markdown)
The body of the `SKILL.md` should provide:
- **Core Mandates**: Unbreakable rules for the skill.
- **Developer Workflow**: A clear, step-by-step workflow for the developer, including tool invocation, linting, and testing.
- **Expert Guidance**: Step-by-step procedures or specialized knowledge.

## Best Practices
- **Style Prioritization**: ALWAYS prioritize following the established code style, naming conventions, and architectural patterns of the existing project. Use external guides (e.g., Google, Uber) only as a fallback when no project-specific style is discernible.
- **Skill Orchestration**: If a skill relies on specific standards (like a style guide), it should explicitly instruct the agent to activate or consult the relevant specialized skill (e.g., `activate_skill("go-google-style-guide")`).
- **Exhaustive Coverage**: ALWAYS ensure that every single requirement, rule, and detail from the source material is explicitly mentioned.
- **Modern Tooling**: For Go projects, prefer using `go tool` (Go 1.24+) for invoking project-local tools. However, allow for tool isolation (e.g., a dedicated `tools/go.mod`) for tools like `golangci-lint` to avoid dependency churn in the main module.
- **Workflow-Centric**: Every skill should define a recommended developer workflow that integrates quality checks (linting, tests) as early as possible.



## Workflow for Creating a Skill
1. Define the skill's purpose and scope.
2. Draft the `description` to be highly discoverable.
3. Write the procedural instructions in `SKILL.md`.
4. Create any necessary supporting assets (scripts, references).
5. Verify the skill by "simulating" its activation in a test environment.
