# GitHub Flow Policies

## 1. Upstream Synchronization
**Rule**: Always pull the latest `main` before branching.
-   **Why**: To minimize conflicts and build on top of the latest production code.
-   **Command**:
    ```bash
    git checkout main
    git pull origin main
    git checkout -b <descriptive-branch-name>
    ```

## 2. Pull Requests & Review
-   **Open Early**: PRs can be opened as "Draft" for early feedback or discussion.
-   **Review**: Code review is mandatory.
-   **CI/CD**: Tests run on the PR. The branch must pass all checks before merging.
-   **Deploy Preview**: Ideally, the PR is deployed to a staging environment for verification.

## 3. Merge & Deploy
-   **Merge Strategy**: Squash and Merge is often preferred to keep the `main` history clean, but Merge Commits are also valid depending on team preference.
-   **Deployment**: Merging to `main` automatically triggers a deployment to production (or staging -> production).
