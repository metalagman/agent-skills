# Models, versioning, and operations

Use this file when model choice, version drift, or production posture matters more than the basic quickstart.

## Baseline
- As of May 5, 2026, use Go ADK `v1.2.0` as the default stable planning baseline.
- Current Go quickstart docs require Go 1.24.4 or later.
- If package docs, GitHub release pages, and search snippets disagree, prefer package-specific `pkg.go.dev` pages plus current `adk.dev` docs over stale search snippets.

## Versioning rules
- If the target repo pins an older ADK tag, answer from that pinned version instead of forcing `v1.2.0` guidance.
- Call out mixed-generation code immediately:
  - old docs host `google.github.io/adk-docs`
  - pre-v1 launcher/runtime snippets
  - singular callback field names
  - `session.NewInMemoryService()`
  - older `llmagent.New(ctx, ...)` forms
- When drift matters, compare the exact package page that owns the API:
  - `agent/llmagent`
  - `runner`
  - `session`
  - `tool`
  - relevant subpackage such as `mcptoolset` or `remoteagent`

## Model selection posture
- Default to Gemini unless the repo already standardizes on another provider.
- For starter examples, `gemini-flash-latest` is the safest current default because the official Go quickstart uses it.
- If the user requests another provider, use the matching ADK model docs and verify that the Go SDK actually exposes the needed surface before writing code.
- Keep authentication setup explicit in examples; do not hide provider credentials behind vague placeholders when the runtime path depends on them.

## Runtime and deployment posture
- Local development default:
  - `full.NewLauncher()`
  - `go run agent.go`
  - `go run agent.go web api`
  - `go run agent.go web api webui`
- Production-oriented launcher:
  - `prod.NewLauncher()` when the project wants launcher-managed REST/A2A without the dev UI.
- Embedded runtime:
  - `runner.New(...)` + `Runner.Run(...)` when the application already owns lifecycle, storage, transport, or event handling.

## Operations checklist
- Add logging before production rollout.
- Prefer metrics and traces as soon as the service is multi-user or latency-sensitive.
- Treat evaluation as part of delivery, not optional polish:
  - criteria
  - user simulation
  - environment simulation where external tools matter
- Treat ADK Web as development-only.

## Useful docs
- Models: `https://adk.dev/agents/models/`
- Runtime: `https://adk.dev/runtime/`
- Deployment: `https://adk.dev/deploy/`
- Observability: `https://adk.dev/observability/`
- Evaluation: `https://adk.dev/evaluate/`
