# Go ADK quickstart

Use this when a user asks for a "start from scratch" Go ADK setup.

## Baseline setup
1. Initialize module and add ADK:
   - `go mod init <module>`
   - `go get google.golang.org/adk@v1.2.0`
   - `go mod tidy`
2. Use Go 1.24.4 or later.
3. Configure model credentials (for Gemini, set `GOOGLE_API_KEY`).
4. Confirm runtime prerequisites from ADK installation docs when local launcher commands fail.
5. Start with a single `llmagent` and one tool.

## Minimal launcher pattern (official)
Use `cmd/launcher/full` to run with current ADK runtime modes:

```go
package main

import (
	"context"
	"log"
	"os"

	"google.golang.org/adk/agent"
	"google.golang.org/adk/agent/llmagent"
	"google.golang.org/adk/cmd/launcher"
	"google.golang.org/adk/cmd/launcher/full"
	"google.golang.org/adk/model/gemini"
	"google.golang.org/adk/tool"
	"google.golang.org/adk/tool/geminitool"
	"google.golang.org/genai"
)

func main() {
	ctx := context.Background()

	model, err := gemini.NewModel(ctx, "gemini-flash-latest", &genai.ClientConfig{
		APIKey: os.Getenv("GOOGLE_API_KEY"),
	})
	if err != nil {
		log.Fatalf("failed to create model: %v", err)
	}

	rootAgent, err := llmagent.New(llmagent.Config{
		Name:        "basic_assistant",
		Model:       model,
		Description: "Helpful assistant",
		Instruction: "Be concise and accurate.",
		Tools: []tool.Tool{
			geminitool.GoogleSearch{},
		},
	})
	if err != nil {
		log.Fatalf("failed to create agent: %v", err)
	}

	config := &launcher.Config{
		AgentLoader: agent.NewSingleLoader(rootAgent),
	}

	l := full.NewLauncher()
	if err := l.Execute(ctx, config, os.Args[1:]); err != nil {
		log.Fatalf("run failed: %v\n\n%s", err, l.CommandLineSyntax())
	}
}
```

## Common run modes
- `go run agent.go`: interactive CLI mode.
- `go run agent.go web api`: local API and web surfaces.
- `go run agent.go web api webui`: combined local development flow with dev UI.

## Notes
- Load env before running, for example `source .env` on macOS/Linux.
- `ADK Web` is development-only; do not recommend it as the production runtime.
- If the repo already uses `prod.NewLauncher()` or an embedded `runner`, match that style instead of forcing `full.NewLauncher()`.
- If the user explicitly asks for the newest tag instead of the current stable baseline, re-check the published module version before changing the install command.

## When to use embedded runner instead
Use `runner.New(...)` + `Runner.Run(...)` when the user needs:
- Explicit handling of app/user/session IDs.
- Custom event loop or service integration.
- Fine-grained control over stream/event processing.
- Direct control over session, memory, artifact, or plugin services.

## Quickstart extensions from ADK docs map
Use these when the request is no longer "minimal setup":
- Advanced environment/runtime setup: ADK advanced setup docs.
- Streaming/live app behavior: ADK Gemini Live API Toolkit docs.
- Multi-tool starter pattern: ADK multi-tool quickstart.
- Skills: ADK skills docs and the `examples/skills` package.
