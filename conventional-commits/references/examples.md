# Conventional Commit Examples

## Good Examples

### Simple Feature
```text
feat: allow provided config object to extend other configs
```

### Feature with Scope
```text
feat(lang): add polish language support
```

### Bug Fix with Body
```text
fix: correct parsing of nested JSON objects

The previous parser failed when encountering arrays within objects.
This patch recursively handles all JSON types.
```

### Breaking Change (using `!`)
```text
feat!: send an email to the customer when a product is shipped
```

### Breaking Change (using footer)
```text
feat: allow provided config object to extend other configs

BREAKING CHANGE: `extends` key in config file is now reserved
```

## Bad Examples

### Vague or Non-Standard
-   `Fixed bug` (Missing type, too vague)
-   `Update README` (Missing type `docs`)
-   `Added cool feature` (Type should be lower case `feat`)
-   `WIP` (Not a commit message)
