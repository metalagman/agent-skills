# Dependency Objects (`fx.In` / `fx.Out`)

Use parameter and result objects to keep constructor signatures stable as modules evolve.

## Parameter Objects (`fx.In`)
- Embed `fx.In`.
- Keep fields exported.
- Pass the object by value.
- Use `optional:"true"` for backwards-compatible new dependencies.

```go
type Params struct {
    fx.In

    Logger *zap.Logger
    DB     *sql.DB `optional:"true"`
}

func New(p Params) (*Service, error) {
    // ...
}
```

## Result Objects (`fx.Out`)
- Embed `fx.Out`.
- Keep fields exported.
- Return the object by value.
- Add new fields to extend results without changing function signatures.

```go
type Result struct {
    fx.Out

    HTTP http.Handler
    GRPC *grpc.Server
}

func New(Params) (Result, error) {
    // ...
}
```

## Naming Convention
- Name objects after the function.
- For `Run`, use `RunParams` / `RunResult`.
- For constructors starting with `New`, strip the `New` prefix:
  - `New` -> `Params` / `Result`
  - `NewFoo` -> `FooParams` / `FooResult`

---
*Derived from official Fx docs: [modules](https://github.com/uber-go/fx/blob/master/docs/src/modules.md), [parameter objects](https://github.com/uber-go/fx/blob/master/docs/src/parameter-objects.md), [result objects](https://github.com/uber-go/fx/blob/master/docs/src/result-objects.md).*
