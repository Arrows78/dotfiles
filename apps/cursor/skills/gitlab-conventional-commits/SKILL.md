---
name: gitlab-conventional-commits
description: Formats Git commit messages using Conventional Commits (type, optional scope, body, footer with GitLab issue refs). Use when writing commits, GitLab commits, changelog-style messages, or conventional commits in this workflow.
---

# GitLab — Conventional Commits

## Instructions

When the user asks for a **commit message** aligned with Conventional Commits and GitLab, follow this structure. Skill text is in English; **commit subject and body may stay in English** unless the user asks for another language.

### Subject line (required)

```
<type>(<optional scope>): <short description in imperative mood> #<ticket>
```

- **type** (common): `feat`, `fix`, `docs`, `style`, `refactor`, `perf`, `test`, `chore`, `ci`, `build`, `revert`
- **scope**: optional module or area (e.g. `api`, `auth`, `checkout`)
- **description**: imperative, lowercase subject line, no period at the end, ~50–72 characters
- **ticket**: optional, included only if the ticket number is provided. Format strictly: `#DEV-123`

### Body (optional but recommended for non-trivial changes)

- Blank line after subject
- Explain **what** and **why**, not only **how**
- Wrap at ~72 characters
- Use bullet points if helpful

### Footer (optional)

- **Breaking changes**: start a paragraph with `BREAKING CHANGE:` or use `!` after type/scope: `feat(api)!: remove legacy endpoint`
- **GitLab cross-links**: `Closes #123`, `Fixes group/project#456`, `Refs #789` (use the user's project notation)

### Full example

```
feat(notifications): Add email preference toggles #DEV-123

Prevent brute force attacks by limiting failed login attempts
Store attempts per IP and reset after cooldown

Closes #42
```

### Anti-patterns

- Vague subjects: `fix bug`, `update`, `wip`
- Mixed concerns: split into multiple commits when possible
- Sensitive data in commit messages
- AI / Cursor / LLM signatures (like: Made-with: Cursor)

## Quick reference

| Type     | Use for                             |
|----------|-------------------------------------|
| feat     | New user-facing capability          |
| fix      | Bug fix                             |
| docs     | Documentation only                  |
| refactor | Code change without behavior change |
| chore    | Maintenance, deps, tooling          |
| ci       | CI configuration                    |

## GitLab integration

- Mention issues in footers so GitLab can **close** or **link** work items automatically.
- For merge commits, the MR title often becomes the merge commit subject; keep MR titles conventional too when the team agrees.
