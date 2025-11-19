#!/bin/bash
set -e

echo "🔧 Starting COBOL build (GnuCOBOL)…"

# Output folder
mkdir -p output

# Compile all COBOL programs into one executable
cobc -x cobol/*.cbl -o output/cobol-app

echo "✅ Build complete: output/cobol-app"
