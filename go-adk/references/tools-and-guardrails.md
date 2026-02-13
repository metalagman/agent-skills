# Tools, callbacks, and guardrails

Use this file when users ask about custom tools, policy controls, or execution hooks.

## Tool strategy
1. Start with the smallest tool surface possible.
2. Add strong argument typing and validation.
3. Return structured data when downstream agents consume tool output.
4. Check tool limitations and performance guidance before adding many tools to one agent.

## Custom tools in Go
- Primary package: `google.golang.org/adk/tool/functiontool`.
- Use function tools for deterministic side effects or data fetches.
- Keep tool handlers idempotent where possible.

## Tool implementation choices
- Function tools: best default for strongly typed custom logic.
- MCP tools: use when capability should come from external MCP servers.
- OpenAPI tools: use when integrating stable external APIs with schema-driven tool generation.
- Built-in integrations: use only when they match an explicit product requirement.

## Authentication and sensitive actions
- Decide authentication strategy up front for external tools.
- Use action confirmations for write/delete/transactional operations.
- Keep read-only tools confirmation-free unless the user requires explicit approvals.

## Action confirmations
- ADK supports requiring confirmation before sensitive tool actions.
- Use confirmation for write/delete/external side-effect operations.
- Keep read-only tools confirmation-free unless explicitly requested.

## Callback usage pattern
Use callbacks to avoid prompt bloat and centralize control.

- `BeforeModelCallback`:
  - Short-circuit with cached answer.
  - Reject unsafe input before model call.
- `AfterModelCallback`:
  - Validate output schema/content.
  - Normalize format before tool routing.
- `BeforeToolCallback`:
  - Enforce allow/deny policy.
  - Apply dynamic throttling/quota checks.
- `AfterToolCallback`:
  - Sanitize tool outputs before model sees them.
  - Attach telemetry metadata.
- `OnToolErrorCallback`:
  - Convert raw errors into user-safe messages.
  - Route retries/fallback behavior.

## Plugins vs callbacks
- Use callbacks for local, agent-specific control.
- Use plugins for reusable policy stacks across agents/apps.

## Integrations and observability
- ADK exposes a large integrations catalog (MCP tools, cloud data tools, observability integrations, and others).
- Start from the integrations index and choose the narrowest integration that satisfies the requirement.
- For observability, define logs/trace expectations before wiring third-party integrations.

## Guardrail checklist
- Validate all tool args.
- Bound network/file access in tool implementations.
- Log tool name, latency, and failure class.
- Do not leak secrets in tool return payloads.
