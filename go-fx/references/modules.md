# Modules

An Fx module is a shareable Go library or package that provides self-contained functionality.

## Defining a Module
Use `fx.Module` to bundle providers, invokes, and other modules.

```go
var Module = fx.Module("server",
    fx.Provide(
        NewHandler,
        NewMux,
    ),
    fx.Invoke(RegisterRoutes),
)
```

## Naming Conventions
- **Packages:** Standalone Fx modules should have an `fx` suffix (e.g., `package redisv8fx`).
- **Internal Modules:** Single-serving modules within an app can omit the suffix.

## Best Practices
1. **Be Lean:** Modules should focus on wiring. Business logic should stay in plain Go packages.
2. **Don't Re-Export:** Avoid providing types you don't own. Instead, provide your module and let users include the dependencies' modules themselves.
3. **Private Providers:** Use `fx.Private` to prevent a constructor's output from being visible outside the module. This is great for internal helpers.
   ```go
   fx.Module("auth",
       fx.Provide(fx.Private, NewInternalTokenVerifier),
       fx.Provide(NewAuthService), // AuthService can see Verifier, but other modules can't.
   )
   ```
4. **Export Boundary Functions:** Ensure constructors used in `fx.Provide` are exported. This allows users to use your code without Fx (e.g., in simple scripts or unit tests).

---
*Derived from the [official Fx modules documentation](https://github.com/uber-go/fx/blob/master/docs/src/modules.md).*
