# AGENTS.md

## Cursor Cloud specific instructions

This is a **dotfiles repository** (macOS dev environment configuration). It has no application services, no build system, and no test suite. The scripts (`install.sh`, `brew.sh`, `git_setup.sh`, `hooks.sh`) are macOS-specific and cannot be executed on a Linux VM.

### Linting

Three tools are used for code quality:

| Tool | Command | Notes |
|---|---|---|
| `shellcheck` | `shellcheck --shell=bash *.sh .githooks/*` | Must use `--shell=bash` because scripts use `#!/bin/zsh` shebangs which shellcheck doesn't support directly |
| `shfmt` | `shfmt -d *.sh .githooks/*` | Requires `$HOME/go/bin` on `PATH`. Repo uses 2-space indent; shfmt defaults to tabs — diff output is expected |
| `markdownlint-cli2` | `markdownlint-cli2 README.md` | Standard markdown linting |

### Git hooks

The repo has custom hooks in `.githooks/`:
- **commit-msg**: Enforces [Conventional Commits](https://www.conventionalcommits.org/) format (e.g. `feat(scope): description`)
- **pre-commit**: Regenerates `Brewfile` when `brew.sh` changes (requires `brew` — skipped on Linux)

Hooks are activated via `git config core.hooksPath .githooks`. The commit-msg hook **will run** on Linux and reject non-conventional commit messages, so always use the format: `<type>(<scope>)?: <description>`.

### Key caveats

- Do **not** run `install.sh` or `brew.sh` on Linux — they depend on macOS-only tools (`xcode-select`, `pbcopy`, `mas`, Homebrew casks, etc.)
- The `Brewfile` is auto-generated from `brew.sh`; do not edit it manually
- `zsh` must be installed for git hooks to execute (the hooks use `#!/bin/zsh` shebangs)
