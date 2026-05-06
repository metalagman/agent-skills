# Core primitives (Go ADK)

Use this file when implementing core architecture or reviewing API choices.

## Primary packages
- `google.golang.org/adk/agent`
- `google.golang.org/adk/agent/llmagent`
- `google.golang.org/adk/agent/remoteagent`
- `google.golang.org/adk/workflowagents/sequentialagent`
- `google.golang.org/adk/workflowagents/parallelagent`
- `google.golang.org/adk/workflowagents/loopagent`
- `google.golang.org/adk/model/gemini`
- `google.golang.org/adk/runner`
- `google.golang.org/adk/session`
- `google.golang.org/adk/memory`
- `google.golang.org/adk/artifact`
- `google.golang.org/adk/tool`
- `google.golang.org/adk/tool/functiontool`
- `google.golang.org/adk/tool/mcptoolset`
- `google.golang.org/adk/tool/skilltoolset`
- `google.golang.org/adk/tool/skilltoolset/skill`
- `google.golang.org/adk/cmd/launcher/full`
- `google.golang.org/adk/cmd/launcher/prod`

## Model/provider posture
- Start with Gemini unless the project already uses another provider.
- If the user requests other providers/proxies (Claude, LiteLLM, Ollama, Agent Platform hosted, vLLM, Apigee gateway), route to the corresponding ADK model docs and verify Go support level before implementation.

## `llmagent.Config` essentials
- Construction:
  - `llmagent.New(llmagent.Config{...})`
  - Model instances are created separately and passed in via `Model`.
- Identity and routing:
  - `Name`
  - `Description`
  - `SubAgents`
- Prompting:
  - `Instruction`
- Conversation shaping:
  - `IncludeContents`
- Model and generation:
  - `Model`
  - `GenerateContentConfig`
- Schemas:
  - `InputSchema`
  - `OutputSchema`
- Tooling:
  - `Tools`
  - `Toolsets`
- Lifecycle:
  - `BeforeAgentCallbacks`
  - `AfterAgentCallbacks`
  - `BeforeModelCallbacks`
  - `AfterModelCallbacks`
  - `OnModelErrorCallbacks`
  - `BeforeToolCallbacks`
  - `AfterToolCallbacks`
  - `OnToolErrorCallbacks`
- Coordination and output:
  - `OutputKey`
  - `DisallowTransferToParent`
  - `DisallowTransferToPeers`

## Important `llmagent` constraints
- `Name` must be unique in the agent tree and cannot be `user`.
- `Description` should stay short and capability-oriented because the LLM uses it for delegation.
- `Toolsets` are the right surface for grouped or dynamic tool inventories such as MCP-backed tools and skill-backed tool collections.
- Go skills use `skilltoolset.New(ctx, skilltoolset.Config{...})` and are currently experimental.
- `OutputSchema` is reply-only mode: when set, the agent cannot use tools or transfers.

## Runner/session/memory model
- `runner.New(runner.Config{...})` builds the runtime.
- `Runner.Run(ctx, userID, sessionID, msg, ...)` executes a turn and yields events.
- `runner.Config` centers around:
  - `AppName`
  - `Agent`
  - `SessionService`
  - optional `ArtifactService`
  - optional `MemoryService`
  - optional `PluginConfig`
  - optional `AutoCreateSession`
- `session.Service` persists sessions and events.
- `session.InMemoryService()` is the local-dev default.
- `memory.Service` adds retrieval over prior session content.
- Keep these concerns separate:
  - Session service for conversational continuity.
  - Memory service for semantic recall across sessions.
  - Artifact service for durable non-text outputs.

## Context/state lifecycle
- Treat session, state, and memory as separate concerns.
- Consider context caching/compaction if prompts or state become too large.
- If users ask about long-lived or mutable conversation history, include session lifecycle operations (resume, migrate, rewind) in the design.
- For launcher-based apps, `agent.NewSingleLoader(...)` is the baseline loader for a single root agent.

## Additional core components
- `Events`: use for stream-driven orchestration and diagnostics.
- `Artifacts`: use for non-text outputs or durable blobs associated with runs.
- `Apps`: use when explicit workflow management/class orchestration is needed.
- `Plugins`: use for reusable cross-agent behavior and policy logic.
- `Remote agents`: use `remoteagent.NewA2A(...)` when another ADK agent should be consumed across an A2A boundary.

## Deterministic orchestration agents
Prefer workflow agents when execution order must be controlled:
- `workflowagents/sequentialagent`
- `workflowagents/parallelagent`
- `workflowagents/loopagent`

Use these before introducing complex LLM-based delegation.

## Practical defaults
- Start with one root `llmagent` and no sub-agents.
- Add one tool or toolset at a time and test error paths.
- Only add memory after session-based behavior is stable.
- Use `full.NewLauncher()` for local development and `prod.NewLauncher()` only when the project explicitly needs a production-oriented launcher without dev UI.
- Add advanced components (`Artifacts`, `Plugins`, session rewind/migrate flows, remote agents) only when the use case requires them.
