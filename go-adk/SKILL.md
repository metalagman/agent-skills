---
name: go-adk
description: Use this skill to build, run, deploy, evaluate, and troubleshoot Go agents with Google's Agent Development Kit (`google.golang.org/adk`), including `llmagent` config, toolsets/skills, callbacks/plugins, sessions/state/memory, workflows, MCP/A2A, and current runtime/deployment patterns.
metadata:
  short-description: Build, run, and operate Go ADK agents.
---

# go-adk

Expert guidance for developing agents with `google.golang.org/adk` (Go ADK).

## When to trigger
- The user mentions Go ADK, `google.golang.org/adk`, `adk-go`, or asks how to build agents in Go.
- The task involves ADK concepts like `llmagent`, tools, callbacks, sessions/state/memory, workflow agents, streaming, MCP, A2A, ADK web/API runtime, launchers, deployment, evaluation, or safety controls.

## Core rules
- Treat [references/llms-index.md](references/llms-index.md) as the required ADK coverage map.
- Target the current stable Go ADK v1.x surface; as of May 5, 2026, use `v1.2.0` as the default baseline unless the repo pins an older tag.
- Prefer official ADK Go APIs, package docs, and examples over ad-hoc wrappers.
- Follow existing repository patterns first (imports, launcher style, layout, env handling).
- For version-sensitive behavior, check package docs and release/docs pages before giving definitive guidance.
- Prioritize Go-specific ADK docs first; if a feature is documented only in another SDK doc, call that out explicitly and avoid presenting it as established Go API.
- Keep agent names unique and never use `user` as an agent name.
- Use concise `Description` fields so delegation and tool selection remain reliable.
- Treat ADK Web as development-only unless the user explicitly asks for production runtime choices.
- Do not mix older pre-v1 snippets with current v1 launcher/runtime patterns in the same answer.

## Workflow
1. **Map task to ADK domain**:
   - Build, run, deploy, evaluate, safety, components, protocols, or reference.
   - Load only the relevant sections from [references/llms-index.md](references/llms-index.md).
2. **Confirm execution style**:
   - Launcher-first app (`cmd/launcher/full` for local development, `cmd/launcher/prod` for production-facing launchers) or embedded runtime (`runner.New(...)` + `Runner.Run(...)`).
   - Local CLI, dev web UI, REST/API server, or custom service loop.
3. **Build the first working agent**:
   - `llmagent.New(llmagent.Config{...})` with a concrete model (commonly `gemini.NewModel(ctx, ..., &genai.ClientConfig{...})`).
   - Add minimum viable `Instruction`, `Description`, and either `Tools` or `Toolsets`.
4. **Add tools safely**:
   - Use `functiontool.New(...)` for typed custom tools.
   - Use `mcptoolset.New(...)`, skills, or other ADK-native integrations only when needed.
   - For sensitive tools, apply confirmations, auth, and policy callbacks; prefer `tool.WithConfirmation(...)` for grouped toolsets.
5. **Wire stateful execution**:
   - Sessions via `session.Service` (often `session.InMemoryService()` for local dev).
   - Add `memory.Service` only when cross-session retrieval is required.
   - Add artifact/state/context management only when required by the workflow.
6. **Apply control points**:
   - Use callbacks (`Before/After Agent`, `Before/After Model`, `OnModelError`, `Before/After Tool`, `OnToolError`) for logging, caching, guardrails, and overrides.
   - Prefer plugins for reusable security policy enforcement.
7. **Scale composition**:
   - Use workflow agents for deterministic orchestration (`sequentialagent`, `parallelagent`, `loopagent`).
   - Use multi-agent delegation (descriptions + transfer behavior) only when specialization is clear.
   - Use remote agents/A2A only when process or host boundaries are intentional.
8. **Select runtime/deployment posture**:
   - Local dev: `full.NewLauncher()` with `go run agent.go`, `go run agent.go web api`, or `go run agent.go web api webui`.
   - Production: `prod.NewLauncher()` or embedded server/runtime plus deployment target, observability, and safety posture.
9. **Verify behavior end-to-end**:
   - Validate happy-path conversation, tool errors, callbacks, session lifecycle, confirmation behavior, and evaluation criteria.

## Output expectations
- Provide exact Go imports, runnable snippets, and command lines that match the chosen runtime mode.
- Call out version-sensitive behavior if the user targets older ADK tags or the repo mixes docs from multiple ADK generations.
- Mention the relevant ADK doc section when guidance comes from `llms-index` categories beyond core Go quickstart pages.
- Prefer small, testable incremental changes over large rewrites.

## References
- Quickstart and launcher baseline: [references/quickstart.md](references/quickstart.md)
- Core APIs and agent config: [references/core-primitives.md](references/core-primitives.md)
- Tools, callbacks, and guardrails: [references/tools-and-guardrails.md](references/tools-and-guardrails.md)
- Runtime modes, examples, and A2A: [references/runtime-and-examples.md](references/runtime-and-examples.md)
- Models, versioning, and operations posture: [references/models-and-operations.md](references/models-and-operations.md)
- Required ADK source map (`llms.txt`-derived curated index): [references/llms-index.md](references/llms-index.md)
