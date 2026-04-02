#!/bin/sh
set -e

echo "Running database migrations..."
psql "$DATABASE_URL" -f ./db/schema.sql
psql "$DATABASE_URL" -f ./db/seed.sql
echo "Database migrations complete."

exec node .output/server/index.mjs
