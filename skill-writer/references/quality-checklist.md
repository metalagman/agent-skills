# Skill Quality Assurance Checklist

Use this checklist to verify your skill before deployment.

## 1. Structure & Naming
- [ ] **Directory Name**: Is it kebab-case? (e.g., `my-cool-skill`, not `MyCoolSkill`)
- [ ] **File Structure**: Does it have `SKILL.md` at the root?
- [ ] **Cleanliness**: Are there any disallowed files (e.g., `scripts/` if not using scripts, or random `.DS_Store` files)?

## 2. SKILL.md Frontmatter
- [ ] **Name**: Does the `name` field match the directory name?
- [ ] **Description**:
    - [ ] Does it start with a verb or clearly state the capability?
    - [ ] Does it include specific trigger keywords a user might say?
    - [ ] Is it concise (under 2-3 sentences)?

## 3. Content & Instructions
- [ ] **Context Efficiency**: Did you move large static tables or schemas to `references/`?
- [ ] **Clarity**: Are instructions imperative? ("Do this", not "You could do this")
- [ ] **Degrees of Freedom**: Is the strictness appropriate?
    - *High Freedom*: "Write a poem..."
    - *Low Freedom*: "Run this exact command..."

## 4. Resources
- [ ] **Paths**: Do all links in `SKILL.md` point correctly to `references/` or `assets/`?
- [ ] **Formats**: are reference files in Markdown (`.md`)?

## 5. Simulation
- [ ] **Mental Walkthrough**: If you were the agent, would you know *exactly* what to do after reading just the `SKILL.md`?
- [ ] **Ambiguity Check**: Is there any step that relies on "common sense" that the model might lack context for?
