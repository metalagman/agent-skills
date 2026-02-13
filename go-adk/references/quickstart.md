# Go ADK quickstart

Use this when a user asks for a "start from scratch" Go ADK setup.

## Baseline setup
1. Initialize module and add ADK:
   - `go mod init <module>`
   - `go get google.golang.org/adk@latest`
2. Configure model credentials (for Gemini, set `GOOGLE_API_KEY`).
3. Start with a single `llmagent` and one tool.

## Minimal launcher pattern (official)
Use `cmd/launcher` to run with ADK runtime modes:

```go
package main

import (
	"context"
	"log"

	"google.golang.org/adk/agent"
	"google.golang.org/adk/agent/llmagent"
	"google.golang.org/adk/cmd/launcher"
	"google.golang.org/adk/model/gemini"
	"google.golang.org/adk/tool/geminitool"
)

func main() {
	ctx := context.Background()

	rootAgent, err := llmagent.New(ctx, llmagent.Config{
		Name:        "basic_assistant",
		Model:       gemini.NewModel("gemini-2.5-flash"),
		Description: "Helpful assistant",
		Instruction: "Be concise and accurate.",
		Tools:       []agent.Tool{&geminitool.GoogleSearch{}},
	})
	if err != nil {
		log.Fatal(err)
	}

	if err := launcher.Run(ctx, rootAgent); err != nil {
		log.Fatal(err)
	}
}
```

## Common run modes
- `go run agent.go`: interactive CLI mode.
- `go run agent.go web`: dev web UI (development only).
- `go run agent.go api`: API server mode.
- `go run agent.go web api webui`: combined mode for local development.

## When to use embedded runner instead
Use `runner.Run(...)` directly when the user needs:
- Custom event loop integration.
- Explicit handling of user/session IDs.
- Fine-grained control over stream/event processing.
