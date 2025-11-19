#!/bin/bash
set -e

echo "🚀 Running database migrations…"

if [ -z "$DB_HOST" ] || [ -z "$DB_USER" ] || [ -z "$DB_NAME" ]; then
  echo "❌ Missing DB_HOST / DB_USER / DB_NAME environment variables"
  exit 1
fi

for file in migrations/*.sql; do
    echo "📌 Applying migration: $file"
    PGPASSWORD="$DB_PASS" psql \
      -h "$DB_HOST" \
      -U "$DB_USER" \
      -d "$DB_NAME" \
      -f "$file"
done

echo "✅ Database migrations completed"
