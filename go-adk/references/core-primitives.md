# Core primitives (Go ADK)

Use this file when implementing core architecture or reviewing API choices.

## Primary packages
- `google.golang.org/adk/agent`
- `google.golang.org/adk/agent/llmagent`
- `google.golang.org/adk/model/gemini`
- `google.golang.org/adk/runner`
- `google.golang.org/adk/session`
- `google.golang.org/adk/memory`

## Model/provider posture
- Start with Gemini unless the project already uses another provider.
- If the user requests other providers/proxies (Claude, LiteLLM, Ollama, Vertex AI hosted, vLLM, Apigee gateway), route to the corresponding ADK model docs and verify Go support level before implementation.

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

## Context/state lifecycle
- Treat session, state, and memory as separate concerns.
- Consider context caching/compaction if prompts or state become too large.
- If users ask about long-lived or mutable conversation history, include session lifecycle operations (resume, migrate, rewind) in the design.

## Additional core components
- `Events`: use for stream-driven orchestration and diagnostics.
- `Artifacts`: use for non-text outputs or durable blobs associated with runs.
- `Apps`: use when explicit workflow management/class orchestration is needed.
- `Plugins`: use for reusable cross-agent behavior and policy logic.

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
- Add advanced components (`Artifacts`, `Plugins`, session rewind/migrate flows) only when the use case requires them.
