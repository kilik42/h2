#!/bin/bash
# The Hollow Oak Estate - checks whether the official will has been
# corrected to reflect the authentic beneficiary.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FILE="$SCRIPT_DIR/records/official-will.txt"

if [ ! -f "$FILE" ]; then
  echo "FAILED: Could not find $FILE"
  exit 1
fi

if grep -q "niece, Clara Hollow" "$FILE"; then
  echo "MATCH: Official record now reflects the authentic beneficiary (Clara Hollow)."
  exit 0
else
  echo "MISMATCH: Official record does not yet match the authentic codicil."
  exit 1
fi
