# Core primitives (Go ADK)

Use this file when implementing core architecture or reviewing API choices.

## Primary packages
- `google.golang.org/adk/agent`
- `google.golang.org/adk/agent/llmagent`
- `google.golang.org/adk/model/gemini`
- `google.golang.org/adk/runner`
- `google.golang.org/adk/session`
- `google.golang.org/adk/memory`

## `llmagent.Config` essentials
- Identity and routing:
  - `Name`
  - `Description`
- Prompting:
  - `Instruction`
- Model and generation:
  - `Model`
  - `GenerateContentConfig`
- Tooling:
  - `Tools`
- Coordination:
  - `SubAgents`
  - `OutputKey` (store final output in state)
- Lifecycle:
  - `BeforeAgentCallback`
  - `AfterAgentCallback`
  - `BeforeModelCallback`
  - `AfterModelCallback`
  - `BeforeToolCallback`
  - `AfterToolCallback`
  - `OnToolErrorCallback`

## Runner/session/memory model
- `runner.Runner` executes agent turns against a session.
- `session.Service` persists sessions and events.
- `memory.Service` adds retrieval over prior session content.
- Keep these concerns separate:
  - Session service for conversational continuity.
  - Memory service for semantic recall across sessions.

## Deterministic orchestration agents
Prefer workflow agents when execution order must be controlled:
- `workflowagents/sequentialagent`
- `workflowagents/parallelagent`
- `workflowagents/loopagent`

Use these before introducing complex LLM-based delegation.

## Practical defaults
- Start with one root `llmagent` and no sub-agents.
- Add one tool at a time and test error paths.
- Only add memory after session-based behavior is stable.
