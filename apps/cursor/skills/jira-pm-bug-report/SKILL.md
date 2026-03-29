---
name: jira-pm-bug-report
description: Drafts Jira bug reports using a fixed French template (context, reproduction, actual vs expected). Use when filing bugs, reporting defects, reproduction steps, comportement actuel/attendu, or Jira bugs as a Product Manager.
---

# Jira PM — Bug Report (French template)

## Instructions

When the user asks to draft or create a **bug** for Jira, produce the description in **French** using the template below. Preserve headings and emoji labels for consistent formatting in Jira.

- **COMMENT REPRODUIRE**: numbered or bulleted steps in order; include environment (browser, OS, role, feature flag) in **CONTEXTE** if relevant.
- **COMPORTEMENT ACTUEL** vs **COMPORTEMENT ATTENDU**: concrete, observable outcomes (screenshots/links can be noted inline).
- Leave `-` or a short line when a section has nothing to add.

## Template (copy as-is, then replace content)

```markdown
📚 **CONTEXTE**
- …

📝 **COMMENT REPRODUIRE**
- …
- …
- …

❌ **COMPORTEMENT ACTUEL**
- …
- …
- …

✅ **COMPORTEMENT ATTENDU**
- …
- …
- …
```

## Example (minimal)

```markdown
📚 **CONTEXTE**
- Environnement : Chrome 134, macOS, compte utilisateur standard.


📝 **COMMENT REPRODUIRE**
- Ouvrir le tableau de bord
- Cliquer sur "Exporter"
- Choisir le format CSV et valider


❌ **COMPORTEMENT ACTUEL**
- L'export échoue avec une erreur 500
- Aucun fichier n'est téléchargé


✅ **COMPORTEMENT ATTENDU**
- Un fichier CSV est téléchargé
- Aucune erreur serveur
```

## Jira tips

- Add **Summary** separately (short, action-oriented title); paste this template into **Description**.
- Link logs, HAR, or screen recordings in **CONTEXTE** when available.
