# AGENTS.md

## Cursor Cloud specific instructions

This is a **macOS dotfiles repository** (shell scripts + config files). There are no runtime services, databases, or application servers. The repo targets macOS exclusively — most install scripts (`install.sh`, `brew.sh`) require Homebrew, Xcode CLI tools, and zsh.

### Linting

The following linters are used to validate shell scripts and markdown:

| Tool | Command | Purpose |
|---|---|---|
| `shellcheck` | `shellcheck -s bash <file>` | Shell script static analysis |
| `shfmt` | `shfmt -d -i 2 <file>` | Shell script formatting (2-space indent) |
| `markdownlint-cli2` | `markdownlint-cli2 README.md` | Markdown linting |

To lint all shell scripts at once:

```bash
shellcheck -s bash install.sh brew.sh git_setup.sh hooks.sh .githooks/commit-msg .githooks/pre-commit
shfmt -d -i 2 install.sh brew.sh git_setup.sh hooks.sh .githooks/commit-msg .githooks/pre-commit
```

### Git hooks

The repo uses custom git hooks in `.githooks/`. Set them up by running `bash hooks.sh` (or `zsh hooks.sh` on macOS). The hooks enforce:

- **commit-msg**: Conventional Commit format required. Valid types: `build`, `chore`, `ci`, `docs`, `feat`, `fix`, `perf`, `refactor`, `style`, `test`. Example: `feat(login): add user authentication`.
- **pre-commit**: Auto-regenerates `Brewfile` when `brew.sh` is staged (requires Homebrew — will fail on Linux, which is expected).

### Gotchas

- All `.sh` scripts use `#!/bin/zsh` shebang. On Linux, use `bash` to run them (most are compatible), or install zsh.
- The pre-commit hook calls `brew bundle dump` which only works on macOS with Homebrew installed. On Linux, it will fail if `brew.sh` is staged — this is expected and non-blocking for other changes.
- The commit-msg hook is pure shell and works on both macOS and Linux.
