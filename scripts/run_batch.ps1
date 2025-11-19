#!/bin/bash
set -e

APP="/opt/cobol-app/cobol-app"

if [ ! -f "$APP" ]; then
    echo "❌ Cobol executable not found at $APP"
    exit 1
fi

echo "▶️ Running COBOL batch process…"
$APP

echo "✅ COBOL batch completed"
