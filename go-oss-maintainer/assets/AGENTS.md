# AGENTS Guidelines

## Branching & Commits
- Branch from `master` for new work.
- Use imperative, present-tense commit messages (e.g. `Add feature X`).

## Preferred Workflow
- Use Go 1.24+.
- Run `go tool golangci-lint run ./...` before pushing.
- Ensure `go test ./...` passes.

## Code Style (Google Go Style)
- Adhere to the [Google Go Style Guide](https://google.github.io/styleguide/go/).
- **Naming**: Avoid repetition (e.g., `user.Type` not `user.User`). Use noun-like names for getters.
- **Errors**: Wrap with `%w` only if programmatic inspection is needed. Avoid redundant logging.
- **Testing**: Use table-driven tests. Ensure failures are actionable and descriptive.
- **Documentation**: Focus on "why" for non-obvious logic. Document concurrency safety.
