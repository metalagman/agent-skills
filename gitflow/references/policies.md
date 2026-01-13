# Gitflow Policies

These rules must be followed to ensure repository health and history cleanliness.

## 1. Upstream Synchronization
**Rule**: You MUST fetch and rebase/merge from upstream before creating a new branch or raising a PR.
-   **Why**: To avoid merge conflicts and ensure you are working on the latest code.
-   **Command**:
    ```bash
    git checkout <source-branch>
    git pull origin <source-branch>
    # Then create your branch
    git checkout -b <new-branch>
    ```

## 2. Pull Requests (PRs)
-   **Target**: Ensure the PR targets the correct branch (e.g., `feature/*` -> `develop`, `hotfix/*` -> `master`).
-   **Review**: Code must be reviewed by at least one other developer.
-   **CI/CD**: All automated tests must pass before merging.

## 3. Commit Messages
-   Follow the Conventional Commits specification.
-   Format: `<type>(<scope>): <subject>`
