---
name: gitlab-merge-request
description: Builds structured GitLab merge request descriptions (summary, changes, testing, screenshots, related issues, review checklist). Use when opening MRs, merge requests, GitLab MR descriptions, or MR templates as a Product Manager or developer.
---

# GitLab — Merge Request Description

## Instructions

When the user asks for a **merge request** description for GitLab, produce a clear, review-friendly document in **English** by default (switch if the user asks). Use the structure below; omit sections that do not apply, or mark as _N/A_.

## Template

```markdown
## 🎯 Summary

[2–4 sentences: what this MR does and why. Link to requirements or issue.]


## 📝 Changes

- …
- …


## 🧪 How to test

1. …
2. …


## 📸 Screenshots / recordings

[If UI changed: before/after or Loom. Otherwise: _N/A_.]


## Related issues

- Closes #… / Ref #…
- [Optional] Design: …


## Deployment / rollout notes

[Flags, migrations, env vars, ordering with other MRs. _N/A_ if none.]

```

## Guidelines

- **Summary** should let a reviewer understand intent without opening every file.
- **Changes** are high-level bullets; avoid duplicating the entire diff.
- **How to test** is actionable for QA or the reviewer (roles, data, feature flags).
- **Related issues** uses GitLab keywords (`Closes`, `Fixes`, `Refs`) so automation works.

## Optional variants

- **Small fix**: Summary + How to test + `Closes #id` may be enough.
- **Large feature**: add **Architecture / approach** and **Risks & mitigations** sections between Summary and Changes.
