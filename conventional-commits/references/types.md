# Conventional Commit Types

This document defines the standard types used in Conventional Commits.

## Primary Types

-   **`feat`**: A new feature (corresponds to `MINOR` in Semantic Versioning).
-   **`fix`**: A bug fix (corresponds to `PATCH` in Semantic Versioning).
-   **`BREAKING CHANGE`**: (Footer or `!` after type) Introduces a breaking API change (corresponds to `MAJOR` in Semantic Versioning).

## Secondary Types (No version bump recommended)

-   **`docs`**: Documentation only changes.
-   **`style`**: Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc).
-   **`refactor`**: A code change that neither fixes a bug nor adds a feature.
-   **`perf`**: A code change that improves performance.
-   **`test`**: Adding missing tests or correcting existing tests.
-   **`build`**: Changes that affect the build system or external dependencies (example scopes: gulp, broccoli, npm).
-   **`ci`**: Changes to our CI configuration files and scripts (example scopes: Travis, Circle, BrowserStack, SauceLabs).
-   **`chore`**: Other changes that don't modify src or test files.
-   **`revert`**: Reverts a previous commit.

## Format Structure

```text
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```
