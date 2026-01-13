# Agent Skills Project

This repository serves as a centralized collection of specialized skills for various LLM (Large Language Model) agents. These skills provide expert procedural guidance, specialized workflows, and bundled resources to enhance the capabilities of AI agents in specific domains.

## Repository Structure

Each skill is contained within its own directory at the root of the repository:

```text
/
├── go-uber-style-guide/    # Skill folder
│   ├── SKILL.md            # Entry point
│   └── ...
├── gitflow/                # Skill folder
└── AGENTS.md               # This file
```

While folders are located at the root for ease of symlinking, they should be logically grouped by tech stack in the `README.md`.

## Development Workflow

When contributing a new skill or modifying an existing one, follow this workflow:

1.  **Placement**: Place the skill folder at the root of the repository.
2.  **Standards**: Adhere to the principles in the [Skill Writer](./skill-writer/SKILL.md) skill (Progressive Disclosure, clear triggers).
3.  **Verification**: Test the skill with an agent to ensure it triggers correctly and provides high-value guidance.
4.  **Documentation**: **Update the root `README.md`** to include the new skill in the "Available Skills" section, logically grouped by tech stack.
5.  **Commit**: Use Conventional Commits for all changes.

## Skill Guides & Specifications

The skills in this project are designed following these industry-standard specifications:

- **Gemini CLI Agent Skills**: [https://geminicli.com/docs/cli/skills/](https://geminicli.com/docs/cli/skills/)
- **Claude Code Agent Skills**: [https://code.claude.com/docs/en/skills](https://code.claude.com/docs/en/skills)
- **OpenAI Codex Agent Skills**: [https://developers.openai.com/codex/skills/](https://developers.openai.com/codex/skills/)