# Runtime modes and examples

Use this file when users ask how to run, deploy, or choose an ADK pattern.

## Runtime choices
- **CLI loop**: fast local iteration.
- **Web UI**: visual local debugging (`adk web` or launcher `web` mode); development only.
- **API server**: serve agent over HTTP (`adk api_server` or launcher `api` mode).
- **Programmatic runner**: integrate ADK into existing Go services.

## Command-line tooling
ADK docs describe these CLI commands:
- `adk run`
- `adk web`
- `adk api_server`

For Go launcher-based projects, equivalent local commands are commonly:
- `go run agent.go`
- `go run agent.go web`
- `go run agent.go api`

## A2A interoperability
- Go ADK examples include an A2A basic setup (`examples/go/a2a_basic`).
- Agent cards are typically served from `/.well-known/agent-card.json`.
- Keep app naming stable and human-readable for discovery.

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
