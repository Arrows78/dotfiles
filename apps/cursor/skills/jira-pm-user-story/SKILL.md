---
name: jira-pm-user-story
description: Drafts Jira user stories using a fixed French template (user story, context, Gherkin acceptance criteria). Use when creating backlog items, user stories, critères d'acceptation, or Jira stories as a Product Manager.
---

# Jira PM — User Story (French template)

## Instructions

When the user asks to draft or create a **user story** for Jira (or similar), produce the full body in **French** using the template below. Keep section headings and emoji labels exactly as shown so paste into Jira preserves structure.

- Fill placeholders with concrete product details; use `[…]` only when information is missing and note open questions in **QUESTIONS**.
- **Critères d'acceptation**: use Gherkin-style lines (`Etant donné que` / `Quand` / `Alors`) per scenario; add more scenarios (Scénario 2, …) as needed.
- **TRACKING**: analytics events, flags, or tickets to create—leave a short bullet or `—` if none.
- **WIREFRAMES**: link or `—`; **Localisation** / **Impact**: short phrases or bullets.

## Template (copy as-is, then replace content)

```markdown
📝 **USER STORY**

En tant que … je veux …, afin de …


📚 **CONTEXTE**
- …


📍 **Localisation** : …
💥 **Impact** : …


🚀 **SOLUTION**
- …


🔍 **TRACKING**
- …


🎨 **WIREFRAMES**
- …


❓ **QUESTIONS**
- …


🧾 **CRITÈRES D'ACCEPTATION**

**Scénario 1 : [titre]**

- Etant donné que …
- Quand …
- Alors …
```

## Example (minimal)

```markdown
📝 **USER STORY**

En tant qu'utilisateur connecté, je veux enregistrer mes préférences de notification, afin de ne recevoir que les alertes utiles.


📚 **CONTEXTE**
- Les emails actuels sont trop fréquents et augmentent le désabonnement.

📍 **Localisation** : Paramètres > Notifications
💥 **Impact** : Réduction du bruit, meilleure rétention

🚀 **SOLUTION**
- Écran de préférences avec cases à cocher par canal (email, push, in-app).

🔍 **TRACKING**
- Événement `notification_prefs_saved`

🎨 **WIREFRAMES**
- Lien Figma : …

❓ **QUESTIONS**
- Les préférences s'appliquent-elles par produit ou globalement ?

🧾 **CRITÈRES D'ACCEPTATION**

**Scénario 1 : Enregistrement réussi**

- Etant donné que je suis sur la page des préférences de notification
- Quand je désactive l'email et j'enregistre
- Alors mes préférences sont sauvegardées et confirmées à l'écran
```

## Jira tips

- Put the **📝 USER STORY** block (or the first line) in the **Summary** if the team prefers a short title; keep the full template in the **Description**.
- If the project uses a custom field for acceptance criteria, duplicate **🧾 CRITÈRES D'ACCEPTATION** there when required.
