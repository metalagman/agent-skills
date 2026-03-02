# Omnidist Quickstart (Observed Example)

These commands were executed in this repository to validate baseline behavior.

## Init

Command:

```bash
npx -y @omnidist/omnidist@latest init
```

Observed output:

```text
Created .omnidist/omnidist.yaml
Created .omnidist workspace and .omnidist/.gitignore
```

Generated files:
- `.omnidist/omnidist.yaml`
- `.omnidist/.gitignore`

## CI

Command:

```bash
npx -y @omnidist/omnidist@latest ci
```

Observed output:

```text
Created .github/workflows/omnidist-release.yml
```

Generated file:
- `.github/workflows/omnidist-release.yml`

## Generated defaults snapshot

From `.omnidist/omnidist.yaml`:
- `tool.main`: `./cmd/omnidist`
- `version.source`: `git-tag`
- targets include `darwin/linux/windows` with `amd64` and `arm64` combinations (Windows `amd64`)
- distributions include:
  - npm package `@omnidist/omnidist`
  - uv package `omnidist`

Important: these are generator defaults from this repository run. In real projects, update `tool.main`, `distributions.npm.package`, and `distributions.uv.package` to the project's actual command/package names before running `omnidist ci`.

From `.github/workflows/omnidist-release.yml`:
- Workflow name: `omnidist-release`
- Trigger: push tags matching `v*`
- Steps: checkout, setup-go, setup-node, setup-uv, install omnidist, `build`, `stage`, `verify`, `publish`
- Required env secrets: `NPM_PUBLISH_TOKEN`, `UV_PUBLISH_TOKEN`
