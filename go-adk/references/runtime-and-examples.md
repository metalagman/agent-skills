# Runtime modes and examples

Use this file when users ask how to run, deploy, or choose an ADK pattern.

## Runtime choices
- **Full launcher**: best default for local Go development; `full.NewLauncher()` supports console, API, and dev web UI flows from one entrypoint.
- **Prod launcher**: production-oriented launcher without console or ADK Web UI; use `prod.NewLauncher()` when the project explicitly wants launcher-managed REST/A2A only.
- **CLI loop**: fast local iteration.
- **Web UI**: visual local debugging (`adk web` or launcher `web ... webui` mode); development only.
- **API server**: serve agent over HTTP (`adk api_server` or launcher `web api` mode).
- **Programmatic runner**: integrate ADK into existing Go services.
- **Event loop**: explicit event processing for custom runtime control.
- **Ambient agents**: docs taxonomy for long-lived runtime patterns; mention only when the user is explicitly designing around runtime-managed long-running agents.

## Command-line tooling
ADK docs describe these CLI commands:
- `adk run`
- `adk web`
- `adk api_server`

For Go launcher-based projects, equivalent local commands are commonly:
- `go run agent.go`
- `go run agent.go web api`
- `go run agent.go web api webui`

## Runtime state management
- Use run config for reproducible local and server behavior.
- Use resume flows when long-running tasks or interruptions are expected.
- Test replay/resume and failure recovery explicitly.
- Use embedded `runner.Config` when the app must control session storage, artifact storage, memory, or plugin wiring directly.

## A2A interoperability
- Go ADK examples include an A2A basic setup (`examples/go/a2a_basic`).
- Agent cards are typically served from `/.well-known/agent-card.json`.
- Keep app naming stable and human-readable for discovery.
- For remote A2A consumption in Go, the relevant agent package is `agent/remoteagent`.

## Protocols, streaming, and grounding
- MCP: use for tool interoperability with MCP servers.
- A2A: use for agent-to-agent interoperability.
- Gemini Live API Toolkit: use when low-latency/live interaction is required.
- Grounding: use search/retrieval grounding when answers must be anchored to external data.

## Example map (official adk-go package docs)
Common example families and commands in the Go module/docs:
- `quickstart`
- `rest`
- `telemetry`
- `toolconfirmation`
- `mcp`
- `skills`
- `tools/loadartifacts`
- `tools/loadmemory`
- `a2a_basic`

## Selection guide
- Need deterministic order across workers: workflow agents.
- Need specialization/delegation: multi-agent with clear `Description`.
- Need external capability calls: tools/toolsets + callbacks.
- Need long-lived context: session service first, then memory.
- Need launcher-managed local iteration: `full.NewLauncher()`.
- Need production launcher without dev UI: `prod.NewLauncher()`.
- Need total control inside an existing service: embedded `runner`.

## Deployment, operations, and quality gates
- Deployment targets in ADK docs include Cloud Run, GKE, and Vertex AI Agent Engine.
- Include observability (at minimum logging; ideally metrics and traces) before production rollout.
- Use ADK evaluation guidance (criteria and user simulation) before broad release.
- Apply ADK safety/security guidance for prompt/tool policies and external action controls.
