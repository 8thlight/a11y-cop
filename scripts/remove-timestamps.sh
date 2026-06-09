#!/usr/bin/env bash

# remove-timestamps.sh
# Removes timestamp references in format: ([HH:MM:SS](#HH:MM:SS)) from CoP meeting notes
# Usage: ./remove-timestamps.sh <file-path>

set -euo pipefail

# Check if file path argument provided
if [[ $# -eq 0 ]]; then
    echo "Error: No file path provided"
    echo "Usage: $0 <file-path>"
    exit 1
fi

FILE_PATH="$1"

# Check if file exists
if [[ ! -f "$FILE_PATH" ]]; then
    echo "Error: File not found: $FILE_PATH"
    exit 1
fi

# Check if file is readable and writable
if [[ ! -r "$FILE_PATH" ]] || [[ ! -w "$FILE_PATH" ]]; then
    echo "Error: File is not readable/writable: $FILE_PATH"
    exit 1
fi

# Create a temporary file for the cleaned content
TEMP_FILE=$(mktemp)

# Remove timestamp patterns using perl for reliable regex support
# Pattern 1: space + ([HH:MM:SS](#HH:MM:SS))
# Pattern 2: space + ([HH:MM:SS](?tab=...#heading=h.xxx)) — Google Docs deep links
perl -pe 's/ \(\[[0-9]{2}:[0-9]{2}:[0-9]{2}\]\(#[0-9]{2}:[0-9]{2}:[0-9]{2}\)\)//g;
          s/ \(\[[0-9]{2}:[0-9]{2}:[0-9]{2}\]\(\?[^)]*\)\)//g' "$FILE_PATH" > "$TEMP_FILE"

# Replace original file with cleaned content
mv "$TEMP_FILE" "$FILE_PATH"

echo "✓ Successfully removed timestamps from: $FILE_PATH"
