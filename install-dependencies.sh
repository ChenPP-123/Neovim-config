#!/usr/bin/env bash

# Run once after cloning to install this Neovim configuration's dependencies.
# Usage: ./install-dependencies.sh

set -euo pipefail

if [[ "$(uname -s)" != "Darwin" ]]; then
    echo "Error: this installer currently supports macOS only." >&2
    exit 1
fi

for required_command in brew git nvim; do
    if ! command -v "$required_command" >/dev/null 2>&1; then
        echo "Error: '$required_command' is required before running this installer." >&2
        exit 1
    fi
done

system_dependencies=(
    "rg:ripgrep"
    "magick:imagemagick"
    "gs:ghostscript"
)

missing_formulas=()

for dependency in "${system_dependencies[@]}"; do
    executable="${dependency%%:*}"
    formula="${dependency#*:}"

    if brew list --formula "$formula" >/dev/null 2>&1; then
        echo "Found Homebrew dependency: $formula"
    else
        missing_formulas+=("$formula")
    fi
done

if (( ${#missing_formulas[@]} > 0 )); then
    echo "Installing Homebrew dependencies: ${missing_formulas[*]}"
    brew install "${missing_formulas[@]}"
else
    echo "All system dependencies are already installed."
fi

for dependency in "${system_dependencies[@]}"; do
    executable="${dependency%%:*}"

    if ! command -v "$executable" >/dev/null 2>&1; then
        echo "Error: '$executable' is unavailable after installation." >&2
        exit 1
    fi
done

mason_packages=(
    "basedpyright"
    "lua-language-server"
    "ruff"
    "stylua"
    "debugpy"
    "prettier"
    "taplo"
)

echo "Checking Neovim plugins..."
nvim --headless "+Lazy! install" "+qa"

mason_package_root="$(nvim --clean --headless "+lua io.write(vim.fn.stdpath('data') .. '/mason/packages')" "+qa")"
missing_mason_packages=()

for package in "${mason_packages[@]}"; do
    if [[ -f "$mason_package_root/$package/mason-receipt.json" ]]; then
        echo "Found Mason package: $package"
    else
        missing_mason_packages+=("$package")
    fi
done

if (( ${#missing_mason_packages[@]} > 0 )); then
    echo "Installing Mason packages: ${missing_mason_packages[*]}"
    nvim --headless "+MasonInstall ${missing_mason_packages[*]}" "+qa"
else
    echo "All Mason packages are already installed."
fi

echo "Neovim dependencies are ready."
