---
name: go-adk
description: Use this skill to build, run, and troubleshoot Go agents with Google's Agent Development Kit (google.golang.org/adk), including llmagent config, tools, callbacks, sessions/memory, workflow agents, and launcher/runtime patterns.
metadata:
  short-description: Build and operate Go ADK agents.
---

# go-adk

Expert guidance for developing agents with `google.golang.org/adk` (Go ADK).

## When to trigger
- The user mentions Go ADK, `google.golang.org/adk`, `adk-go`, or asks how to build agents in Go.
- The task involves ADK concepts like `llmagent`, tools, callbacks, sessions, memory, workflow agents, A2A, ADK web/API runtime, or ADK launchers.

## Core rules
- Prefer official ADK Go APIs and examples over ad-hoc wrappers.
- Follow existing repository patterns first (imports, launcher style, layout, env handling).
- Keep agent names unique and never use `user` as an agent name.
- Use concise `Description` fields so delegation and tool selection remain reliable.
- Treat ADK Web as development-only unless the user explicitly asks for production runtime choices.

## Workflow
1. **Confirm execution style**:
   - Launcher-first app (`cmd/launcher`, `cmd/launcher/full`) or embedded runtime (`runner.Run` loop).
   - Local dev UI, CLI-only, or REST/API server flow.
2. **Build the first working agent**:
   - `llmagent.New(llmagent.Config{...})` with a concrete model (commonly `gemini.NewModel(...)`).
   - Add minimum viable `Instruction`, `Description`, and `Tools`.
3. **Add tools safely**:
   - Use `functiontool.New(...)` for typed custom tools.
   - Use `geminitool.GoogleSearch{}` or other ADK/native integrations only when needed.
4. **Wire stateful execution**:
   - Sessions via `session.Service` (often `session.NewInMemoryService()` for local dev).
   - Add `memory.Service` only when cross-session retrieval is required.
5. **Apply control points**:
   - Use callbacks (`Before/After Model`, `Before/After Tool`, agent callbacks) for logging, caching, guardrails, and overrides.
   - Prefer plugins for reusable security policy enforcement.
6. **Scale composition**:
   - Use workflow agents for deterministic orchestration (`sequentialagent`, `parallelagent`, `loopagent`).
   - Use multi-agent delegation (descriptions + transfer behavior) only when specialization is clear.
7. **Verify runtime behavior**:
   - Validate happy-path conversation, tool errors, callback behavior, and session resume/replay behavior.

## Output expectations
- Provide exact Go imports, runnable snippets, and command lines that match the chosen runtime mode.
- Call out version-sensitive behavior if the user targets older ADK tags.
- Prefer small, testable incremental changes over large rewrites.

## References
- Quickstart and launcher baseline: [references/quickstart.md](references/quickstart.md)
- Core APIs and agent config: [references/core-primitives.md](references/core-primitives.md)
- Tools, callbacks, and guardrails: [references/tools-and-guardrails.md](references/tools-and-guardrails.md)
- Runtime modes, examples, and A2A: [references/runtime-and-examples.md](references/runtime-and-examples.md)
