# Runtime modes and examples

Use this file when users ask how to run, deploy, or choose an ADK pattern.

## Runtime choices
- **CLI loop**: fast local iteration.
- **Web UI**: visual local debugging (`adk web` or launcher `web` mode); development only.
- **API server**: serve agent over HTTP (`adk api_server` or launcher `api` mode).
- **Programmatic runner**: integrate ADK into existing Go services.
- **Event loop**: explicit event processing for custom runtime control.

## Command-line tooling
ADK docs describe these CLI commands:
- `adk run`
- `adk web`
- `adk api_server`

For Go launcher-based projects, equivalent local commands are commonly:
- `go run agent.go`
- `go run agent.go web`
- `go run agent.go api`

## Runtime state management
- Use run config for reproducible local and server behavior.
- Use resume flows when long-running tasks or interruptions are expected.
- Test replay/resume and failure recovery explicitly.

## A2A interoperability
- Go ADK examples include an A2A basic setup (`examples/go/a2a_basic`).
- Agent cards are typically served from `/.well-known/agent-card.json`.
- Keep app naming stable and human-readable for discovery.

## Protocols, streaming, and grounding
- MCP: use for tool interoperability with MCP servers.
- A2A: use for agent-to-agent interoperability.
- Bidi streaming: use when low-latency/live interaction is required.
- Grounding: use search/retrieval grounding when answers must be anchored to external data.

## Example map (official adk-go package docs)
Common example families in `google.golang.org/adk/examples`:
- `basic`
- `multi_agent`
- `runners`
- `streaming`
- `tools`
- `callbacks`
- `memory`
- `mcp`
- `a2a`

## Selection guide
- Need deterministic order across workers: workflow agents.
- Need specialization/delegation: multi-agent with clear `Description`.
- Need external capability calls: tools + callbacks.
- Need long-lived context: session service first, then memory.

## Deployment, operations, and quality gates
- Deployment targets in ADK docs include Cloud Run, GKE, and Vertex AI Agent Engine.
- Include observability (at minimum logging) before production rollout.
- Use ADK evaluation guidance (criteria and user simulation) before broad release.
- Apply ADK safety/security guidance for prompt/tool policies and external action controls.
