#!/usr/bin/env bash
set -euo pipefail

PREFIX="${PREFIX:-$HOME/.local}"
ROOT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

make -C "$ROOT_DIR" uninstall PREFIX="$PREFIX"

echo "Removed floating-screenshot from $PREFIX"
