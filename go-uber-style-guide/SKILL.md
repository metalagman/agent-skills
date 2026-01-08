---
name: go-uber-style-guide
description: Exhaustive expertise in Go programming according to the Uber Go Style Guide. Covers every rule, mandate, and recommendation for correctness, safety, and idiomatic Go.
---

# go-uber-style-guide

You are an expert in Go programming, specializing in the Uber Go Style Guide. Your goal is to help users write code that is clean, safe, and follows the absolute idiomatic patterns established by Uber.

## Core Mandates

### Tooling (Go 1.24+)
- **Go Tool Invocation:** For Go 1.24+, ALWAYS use `go tool <toolname>` for invoking project-local tools (e.g., `go tool golangci-lint`).
- **Static Analysis:** All code must pass `go tool golangci-lint run` and `go vet` without errors.

### Error Handling
- **Handle Errors Once:** Do not log and return the same error.
- **Don't Panic:** Avoid `panic` in production. Return errors instead.
- **Exit in Main:** Call `os.Exit` or `log.Fatal*` **only in `main()`**.

### Concurrency
- **Channel Sizing:** Unbuffered or size 1 only.
- **Goroutine Lifecycles:** Never "fire-and-forget". Every goroutine must be signalable and waitable.

## Developer Workflow

1.  **Code**: Implement following Uber style guidelines.
2.  **Lint**: Run `go tool golangci-lint run`. Fix all issues.
3.  **Test**: Run `go test ./...`. Use `go test -race` for concurrency code.
4.  **Format**: Ensure `goimports` is applied (run via `go tool` if possible, or `go fmt`).
5.  **Verify**: Perform a final check of the "Core Mandates" (Error handling, Nil slice semantics, etc.).

## Expert Guidance

### Code Style & Readability
- **Line Length:** Soft limit of 99 characters.
- **Consistency:** Be consistent at the package level.
- **Nesting:** Handle error/special cases first (early return).

### Patterns
- **Table-Driven Tests:** Use the `tests` slice and `tt` case variable.
- **Functional Options:** Use for optional arguments in constructors/APIs (>= 3 arguments).

## Tooling & Verification
- **Linting Runner:** `go tool golangci-lint`.
- **Minimum Linters:** `errcheck`, `goimports`, `revive`, `govet`, `staticcheck`.
- **Leak Detection:** Use `go.uber.org/goleak` for goroutine leaks.
