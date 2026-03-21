#!/bin/bash
set -e

echo "Importing packages from JSON files..."

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-'EOSQL'
    INSERT INTO categories (name, display_order)
    VALUES ('Other', 999)
    ON CONFLICT (name) DO NOTHING;

    -- Import casks
    INSERT INTO packages (name, description, is_cask, category_id, homepage, version)
    SELECT
        item->>'token',
        COALESCE(NULLIF(item->>'desc', ''), 'No description'),
        true,
        (SELECT id FROM categories WHERE name = 'Other'),
        NULLIF(item->>'homepage', ''),
        NULLIF(item->>'version', '')
    FROM jsonb_array_elements(
        pg_read_file('/data/casks.json')::jsonb
    ) AS item
    ON CONFLICT (name) DO NOTHING;

    -- Import formulae
    INSERT INTO packages (name, description, is_cask, category_id, homepage, version)
    SELECT
        item->>'name',
        COALESCE(NULLIF(item->>'desc', ''), 'No description'),
        false,
        (SELECT id FROM categories WHERE name = 'Other'),
        NULLIF(item->>'homepage', ''),
        item->'versions'->>'stable'
    FROM jsonb_array_elements(
        pg_read_file('/data/formulaes.json')::jsonb
    ) AS item
    ON CONFLICT (name) DO NOTHING;
EOSQL

echo "Import complete."
