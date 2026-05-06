# ADK docs index (curated from llms.txt)

Source: https://adk.dev/llms.txt
Synced: 2026-05-05

Use this as the routing map for Go ADK questions.

Notes:
- URLs use the current `adk.dev` docs host.
- This file is intentionally curated for the Go ADK v1.x surface instead of copying every entry from `llms.txt`.
- ADK 2.0 pages are orientation material only; do not present them as the default Go API surface.

# Agent Development Kit

> Build powerful multi-agent systems with Agent Development Kit

An open-source, code-first toolkit for building, evaluating, and deploying sophisticated AI agents with flexibility and control.

## Build Agents

- [Get started](https://adk.dev/get-started/)
- [Technical overview](https://adk.dev/get-started/about/)
- [Go quickstart](https://adk.dev/get-started/go/)
- [Advanced setup](https://adk.dev/get-started/installation/)
- [Multi-tool agent](https://adk.dev/get-started/quickstart/)
- [Coding with AI](https://adk.dev/tutorials/coding-with-ai/)
- [LLM agents](https://adk.dev/agents/llm-agents/)
- [Custom agents](https://adk.dev/agents/custom-agents/)
- [Multi-agent systems](https://adk.dev/agents/multi-agents/)
- [Workflow agents](https://adk.dev/agents/workflow-agents/)
- [Sequential agents](https://adk.dev/agents/workflow-agents/sequential-agents/)
- [Loop agents](https://adk.dev/agents/workflow-agents/loop-agents/)
- [Parallel agents](https://adk.dev/agents/workflow-agents/parallel-agents/)
- [Agent config](https://adk.dev/agents/config/)

## Models and tools

- [Models for agents](https://adk.dev/agents/models/)
- [Gemini](https://adk.dev/agents/models/google-gemini/)
- [Gemma](https://adk.dev/agents/models/gemma/)
- [Claude](https://adk.dev/agents/models/anthropic/)
- [Agent Platform hosted](https://adk.dev/agents/models/agent-platform/)
- [Apigee AI Gateway](https://adk.dev/agents/models/apigee/)
- [Ollama](https://adk.dev/agents/models/ollama/)
- [vLLM](https://adk.dev/agents/models/vllm/)
- [LiteLLM](https://adk.dev/agents/models/litellm/)
- [Tools and Integrations](https://adk.dev/integrations/)
- [Custom tools overview](https://adk.dev/tools-custom/function-tools/)
- [Action confirmations](https://adk.dev/tools-custom/confirmation/)
- [MCP tools](https://adk.dev/tools-custom/mcp-tools/)
- [OpenAPI tools](https://adk.dev/tools-custom/openapi-tools/)
- [Authentication](https://adk.dev/tools-custom/authentication/)
- [Tool limitations](https://adk.dev/tools/limitations/)
- [Skills for Agents](https://adk.dev/skills/)

## Run Agents

- [Agent Runtime](https://adk.dev/runtime/)
- [Command Line](https://adk.dev/runtime/command-line/)
- [Web Interface](https://adk.dev/runtime/web-interface/)
- [API Server](https://adk.dev/runtime/api-server/)
- [Ambient Agents](https://adk.dev/runtime/ambient-agents/)
- [Resume Agents](https://adk.dev/runtime/resume/)
- [Runtime Config](https://adk.dev/runtime/runconfig/)
- [Event Loop](https://adk.dev/runtime/event-loop/)
- [Deployment](https://adk.dev/deploy/)
- [Standard deployment](https://adk.dev/deploy/agent-runtime/deploy/)
- [Test deployed agents](https://adk.dev/deploy/agent-runtime/test/)
- [Cloud Run](https://adk.dev/deploy/cloud-run/)
- [GKE](https://adk.dev/deploy/gke/)
- [Observability](https://adk.dev/observability/)
- [Logging](https://adk.dev/observability/logging/)
- [Metrics](https://adk.dev/observability/metrics/)
- [Traces](https://adk.dev/observability/traces/)
- [Evaluation](https://adk.dev/evaluate/)
- [Criteria](https://adk.dev/evaluate/criteria/)
- [User Simulation](https://adk.dev/evaluate/user-sim/)
- [Environment Simulation](https://adk.dev/evaluate/environment_simulation/) (cross-SDK guidance; verify Go support before recommending implementation details)
- [Custom Metrics](https://adk.dev/evaluate/custom_metrics/) (Python-focused today; do not present as established Go ADK API)
- [Optimization](https://adk.dev/optimize/)
- [Safety and Security](https://adk.dev/safety/)

## Components

- [Context](https://adk.dev/context/)
- [Context caching](https://adk.dev/context/caching/)
- [Context compression](https://adk.dev/context/compaction/)
- [Sessions and Memory](https://adk.dev/sessions/)
- [Sessions](https://adk.dev/sessions/session/)
- [Rewind sessions](https://adk.dev/sessions/session/rewind/)
- [Migrate sessions](https://adk.dev/sessions/session/migrate/)
- [State](https://adk.dev/sessions/state/)
- [Memory](https://adk.dev/sessions/memory/)
- [Callbacks](https://adk.dev/callbacks/)
- [Types of callbacks](https://adk.dev/callbacks/types-of-callbacks/)
- [Callback patterns](https://adk.dev/callbacks/design-patterns-and-best-practices/)
- [Artifacts](https://adk.dev/artifacts/)
- [Events](https://adk.dev/events/)
- [Apps](https://adk.dev/apps/)
- [Plugins](https://adk.dev/plugins/)
- [MCP](https://adk.dev/mcp/)
- [A2A Protocol](https://adk.dev/a2a/)
- [A2A introduction](https://adk.dev/a2a/intro/)
- [A2A quickstart, consuming, Go](https://adk.dev/a2a/quickstart-consuming-go/)
- [A2A quickstart, exposing, Go](https://adk.dev/a2a/quickstart-exposing-go/)
- [Gemini Live API Toolkit](https://adk.dev/streaming/)
- [Streaming configuration](https://adk.dev/streaming/configuration/)
- [Streaming tools](https://adk.dev/streaming/streaming-tools/)
- [Grounding](https://adk.dev/grounding/)
- [Google Search grounding](https://adk.dev/grounding/google_search_grounding/)
- [Grounding with Search](https://adk.dev/grounding/grounding_with_search/)

## Reference

- [Release Notes](https://adk.dev/release-notes/)
- [API Reference](https://adk.dev/api-reference/)
- [Go ADK package docs](https://pkg.go.dev/google.golang.org/adk)
- [CLI Reference](https://adk.dev/api-reference/cli/)
- [REST API](https://adk.dev/api-reference/rest/)
- [Community](https://adk.dev/community/)
- [Contributing Guide](https://adk.dev/contributing-guide/)

## ADK 2.0 orientation

- [ADK 2.0 overview](https://adk.dev/2.0)
- [Graph-based workflows](https://adk.dev/workflows/)
- [Collaborative agents](https://adk.dev/workflows/collaboration/)
