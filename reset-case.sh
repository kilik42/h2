#!/bin/bash
# Resets hollowoak-case/ back to its original, unsolved state.
set -e

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CASE_DIR="$REPO_ROOT/hollowoak-case"
SEED_DIR="$REPO_ROOT/.seed/hollowoak-case"

if [ ! -d "$SEED_DIR" ]; then
  echo "No seed copy found. Run .devcontainer/setup.sh first (or rebuild the Codespace)."
  exit 1
fi

rm -rf "$CASE_DIR"
cp -r "$SEED_DIR" "$CASE_DIR"
chmod +x "$CASE_DIR/verify-record.sh"
chmod 400 "$CASE_DIR/records/official-will.txt"
chmod 000 "$CASE_DIR/sealed/codicil.txt"

echo "hollowoak-case/ has been reset to its original state."
