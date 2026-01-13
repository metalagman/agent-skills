# Gitflow Branching Model

This document defines the standard branch types and their lifecycles.

## 1. Feature Branches (`feature/*`)
-   **Purpose**: Develop new features for the upcoming release.
-   **Source**: `develop`
-   **Merge Target**: `develop`
-   **Naming Convention**: `feature/<ticket-id>-<short-description>` (e.g., `feature/JIRA-123-user-login`).
-   **Lifecycle**: Created when working on a new feature. Deleted after merging to `develop`.

## 2. Bugfix Branches (`bugfix/*`)
-   **Purpose**: Fix non-critical bugs during development.
-   **Source**: `develop`
-   **Merge Target**: `develop`
-   **Naming Convention**: `bugfix/<ticket-id>-<short-description>`
-   **Lifecycle**: Created to fix a bug in `develop`. Deleted after merging.

## 3. Release Branches (`release/*`)
-   **Purpose**: Prepare a new production release. No new features, only documentation and minor bug fixes.
-   **Source**: `develop`
-   **Merge Target**: `develop` AND `master` (or `main`)
-   **Naming Convention**: `release/v<major>.<minor>.<patch>` (e.g., `release/v1.2.0`).
-   **Lifecycle**: Created when `develop` is feature-complete for the next release. Deleted after merging to `master` and tagging.

## 4. Hotfix Branches (`hotfix/*`)
-   **Purpose**: Fix critical bugs in the live production version.
-   **Source**: `master` (or `main`)
-   **Merge Target**: `master` AND `develop`
-   **Naming Convention**: `hotfix/v<major>.<minor>.<patch>` (e.g., `hotfix/v1.2.1`).
-   **Lifecycle**: Created immediately upon discovery of a critical production bug. Deleted after merging.
