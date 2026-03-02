---
name: omnidist
description: Use this skill to initialize, configure, and run omnidist release workflows for Go projects (`init`, `ci`, `build`, `stage`, `verify`, `publish`) including npm and uv publishing setup.
metadata:
  short-description: Expert workflow for omnidist-based multi-registry releases.
---

# omnidist

Expert guidance for bootstrapping and running `@omnidist/omnidist` in a Go repository.

## When to trigger
- The user mentions omnidist or asks for `omnidist init`, `omnidist ci`, or release pipeline setup.
- The task involves distributing Go binaries through npm and/or uv (PyPI-style index).
- The user needs generated release workflow files for GitHub Actions.

## Core rules
- Run commands from the repository root.
- Use `npx -y @omnidist/omnidist@latest` for all omnidist commands to avoid stale versions and global install assumptions.
- Treat generated files as templates: review and customize before committing.
- Before generating CI, set `tool.main` to the project's real command path (for example `./cmd/<project-binary>`), never leave `./cmd/omnidist` unless that is truly the project command.
- Before generating CI, set distribution package names to the project's real packages:
  - `distributions.npm.package` must match the intended npm scoped package (for example `@org/project`).
  - `distributions.uv.package` must match the intended uv/PyPI package name.
- Do not keep omnidist defaults for package names when they do not match the project.

## Workflow
1. **Initialize omnidist**
   - Run `npx -y @omnidist/omnidist@latest init`.
   - Confirm generated files and output; examples are in [references/quickstart.md](references/quickstart.md).
2. **Review generated config**
   - Open `.omnidist/omnidist.yaml`.
   - Update required fields first:
     - `tool.main` to the correct project command path.
     - `distributions.npm.package` to the real npm scoped package name.
     - `distributions.uv.package` to the real uv/PyPI package name.
   - Then update:
     - `version.source` strategy as needed.
     - `targets` matrix for required OS/arch support.
     - `distributions` registries/tags/access settings.
   - Verify these three fields are correct before running `npx -y @omnidist/omnidist@latest ci`: `tool.main`, `distributions.npm.package`, `distributions.uv.package`.
3. **Generate CI workflow**
   - Run `npx -y @omnidist/omnidist@latest ci`.
   - Verify `.github/workflows/omnidist-release.yml` matches your release policy.
4. **Validate release steps locally**
   - Run `npx -y @omnidist/omnidist@latest build`.
   - Run `npx -y @omnidist/omnidist@latest stage`.
   - Run `npx -y @omnidist/omnidist@latest verify`.
5. **Prepare publishing in CI**
   - Ensure required secrets exist before tag-based releases:
     - `NPM_PUBLISH_TOKEN`
     - `UV_PUBLISH_TOKEN`
   - Use tag pushes (for example `v1.2.3`) to trigger the generated workflow.

## Output expectations
- Provide exact commands to run in order.
- Call out every file generated or modified by omnidist commands.
- If the repository is already configured, avoid re-running `init` unless the user explicitly wants regeneration.

## References
- Command outputs and generated defaults: [references/quickstart.md](references/quickstart.md)
