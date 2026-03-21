#!/usr/bin/env node

const { spawnSync } = require("node:child_process");
const fs = require("node:fs");
const path = require("node:path");

const repoRoot = path.resolve(__dirname, "..");
const args = process.argv.slice(2);
const command = args[0] || "full";

const scriptMap = {
  install: ["install.sh"],
  git: ["git_setup.sh"],
  hooks: ["hooks.sh"],
  brew: ["brew.sh"],
  full: ["install.sh", "git_setup.sh", "hooks.sh", "brew.sh"],
};

function printHelp() {
  console.log(`
Usage:
  dotfiles [command]

Commands:
  full     Run complete setup (default)
  install  Run dotfiles installer (symlinks, SSH, plugins, Homebrew, etc.)
  git      Configure git user.name and user.email
  hooks    Install and enable git hooks
  brew     Install Homebrew packages from brew.sh
  help     Show this message
`);
}

if (command === "help" || command === "--help" || command === "-h") {
  printHelp();
  process.exit(0);
}

const scripts = scriptMap[command];

if (!scripts) {
  console.error(`Unknown command: "${command}"`);
  printHelp();
  process.exit(1);
}

for (const scriptName of scripts) {
  const scriptPath = path.join(repoRoot, scriptName);

  if (!fs.existsSync(scriptPath)) {
    console.error(`Missing script: ${scriptName}`);
    process.exit(1);
  }

  console.log(`\n==> Running ${scriptName}\n`);
  const result = spawnSync("zsh", [scriptPath], {
    cwd: repoRoot,
    stdio: "inherit",
  });

  if (result.error) {
    console.error(`Failed to run ${scriptName}:`, result.error.message);
    process.exit(1);
  }

  if (typeof result.status === "number" && result.status !== 0) {
    process.exit(result.status);
  }
}
