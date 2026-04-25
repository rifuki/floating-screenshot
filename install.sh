#!/usr/bin/env bash
set -euo pipefail

PREFIX="${PREFIX:-$HOME/.local}"
ROOT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

make -C "$ROOT_DIR" install PREFIX="$PREFIX"

echo "Installed floating-screenshot to $PREFIX/bin/floating-screenshot"
echo "Run: floating-screenshot --check"
