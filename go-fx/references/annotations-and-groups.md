# Annotations & Value Groups

Use `fx.Annotate` to adapt plain Go constructors/consumers without changing their signatures.

## Annotations (`fx.Annotate`)
- Works with `fx.Provide`, `fx.Supply`, `fx.Invoke`, `fx.Decorate`, and `fx.Replace`.
- Use `fx.As` to provide concrete implementations as interfaces.
- Use tags (`fx.ParamTags`, `fx.ResultTags`) when adding names/groups to plain functions.

### Interface Cast (`fx.As`)
```go
fx.Provide(
    fx.Annotate(
        NewConcreteStore,
        fx.As(new(Store)),
    ),
)
```

### Result Tag Example
```go
fx.Provide(
    fx.Annotate(
        NewReadOnlyDB,
        fx.ResultTags(`name:"ro"`),
    ),
)
```

## Value Groups
Value groups aggregate many values of the same type.

### Feed a Group
```go
type HandlerResult struct {
    fx.Out
    Handler http.Handler `group:"server"`
}
```

### Consume a Group
```go
type ServerParams struct {
    fx.In
    Handlers []http.Handler `group:"server"`
}
```

### Feed with Annotations
```go
fx.Provide(
    fx.Annotate(
        NewEchoHandler,
        fx.ResultTags(`group:"server"`),
    ),
)
```

Important: Do not rely on the order of consumed value-group slices. Fx randomizes order.

---
*Derived from official Fx docs: [annotations](https://github.com/uber-go/fx/blob/master/docs/src/annotate.md), [feeding value groups](https://github.com/uber-go/fx/blob/master/docs/src/value-groups/feed.md), [consuming value groups](https://github.com/uber-go/fx/blob/master/docs/src/value-groups/consume.md).*
