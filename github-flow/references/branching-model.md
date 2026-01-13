# GitHub Flow Branching Model

This document defines the lightweight branching strategy used in GitHub Flow.

## 1. The Main Branch (`main`)
-   **Purpose**: The single source of truth. Contains production-ready code.
-   **Stability**: Must always be deployable.
-   **Protection**: Direct commits are forbidden. Changes merge only via Pull Requests.

## 2. Feature/Topic Branches
-   **Purpose**: Develop new features, fix bugs, or experiment.
-   **Source**: `main`
-   **Merge Target**: `main`
-   **Naming Convention**: Descriptive names (e.g., `add-user-login`, `fix-header-bug`, `refactor/auth-module`).
    -   *Optional*: You may use prefixes like `feat/`, `fix/`, `chore/` for clarity, but strictly structured names like Gitflow are not mandatory unless specified by team policy.
-   **Lifecycle**:
    1.  Created from `main`.
    2.  Work is committed locally and pushed to the server regularly.
    3.  A Pull Request (PR) is opened for review.
    4.  Deleted after merging to `main`.
