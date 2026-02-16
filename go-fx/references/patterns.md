# Advanced Patterns

## Parameter Objects (`fx.In`)
Use a struct embedding `fx.In` to manage many dependencies. All fields must be exported.

```go
type Params struct {
    fx.In

    Config *Config
    Logger *zap.Logger
    DB     *sql.DB `optional:"true"`
}

func New(p Params) *Service {
    // ...
}
```

## Result Objects (`fx.Out`)
Use a struct embedding `fx.Out` to return multiple values. All fields must be exported.

```go
type Result struct {
    fx.Out

    Handler http.Handler `group:"handlers"`
    Admin   http.Handler `group:"handlers"`
}

func New() Result {
    // ...
}
```

## Annotations (`fx.Annotate`)
`fx.Annotate` allows modifying how a function is treated by the container without changing the function's signature.

### Interface Casting (`fx.As`)
```go
fx.Provide(
    fx.Annotate(
        NewConcreteStore,
        fx.As(new(Store)),
    ),
)
```

### Tagging & Naming
```go
fx.Provide(
    fx.Annotate(
        NewReadOnlyDB,
        fx.ResultTags(`name:"ro"`),
    ),
)
```

## Value Groups (`group:"..."`)
Value groups allow you to collect multiple values of the same type into a slice.

### Feeding a Group
```go
type HandlerResult struct {
    fx.Out
    Handler http.Handler `group:"server"`
}
```

### Consuming a Group
```go
type ServerParams struct {
    fx.In
    Handlers []http.Handler `group:"server"`
}
```
Using `fx.Annotate` with groups:
```go
fx.Provide(
    fx.Annotate(
        NewEchoHandler,
        fx.ResultTags(`group:"server"`),
    ),
)
```

---
*Derived from the official Fx documentation on [annotations](https://github.com/uber-go/fx/blob/master/docs/src/annotate.md), [parameter objects](https://github.com/uber-go/fx/blob/master/docs/src/parameter-objects.md), and [result objects](https://github.com/uber-go/fx/blob/master/docs/src/result-objects.md).*
