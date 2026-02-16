# Application Lifecycle

The lifecycle of an Fx application has two high-level phases: **initialization** and **execution**.

## Initialization Phase (`fx.New`)
During initialization, Fx constructs the dependency graph:
1. **Registration:** All constructors passed to `fx.Provide` and `fx.Supply` are registered.
2. **Decoration:** All decorators passed to `fx.Decorate` are registered.
3. **Invocation:** All functions passed to `fx.Invoke` are executed. This triggers the instantiation of all required dependencies in the graph.

## Execution Phase (`app.Run` or `app.Start`)
During execution, Fx manages the startup and shutdown of the application:
1. **Startup:** All `OnStart` hooks are executed in the order they were appended.
2. **Waiting:** Fx waits for a signal (e.g., SIGINT, SIGTERM) to stop.
3. **Shutdown:** All `OnStop` hooks are executed in the **reverse** order they were appended.

---

## Lifecycle Hooks
Hooks are scheduled via the `fx.Lifecycle` object, which is automatically available in the container.

### `OnStart`
- **Purpose:** Start background tasks, open connections, start servers.
- **Constraints:** Block only as long as needed to schedule startup work. Use goroutines for long-running processes.
- **Timeout:** Fx enforces a startup timeout (default 15s).

### `OnStop`
- **Purpose:** Graceful shutdown, closing connections, stopping workers.
- **Constraint:** Should stop work started in `OnStart`.
- **Timeout:** Fx enforces a shutdown timeout (default 15s).

### Example
```go
func NewServer(lc fx.Lifecycle, logger *zap.Logger) *http.Server {
    srv := &http.Server{Addr: ":8080"}
    
    lc.Append(fx.Hook{
        OnStart: func(ctx context.Context) error {
            logger.Info("Starting HTTP server", zap.String("addr", srv.Addr))
            go srv.ListenAndServe()
            return nil
        },
        OnStop: func(ctx context.Context) error {
            logger.Info("Stopping HTTP server")
            return srv.Shutdown(ctx)
        },
    })
    
    return srv
}
```

---
*Derived from the [official Fx lifecycle documentation](https://github.com/uber-go/fx/blob/master/docs/src/lifecycle.md).*
