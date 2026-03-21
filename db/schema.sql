-- Brewnite database schema

CREATE EXTENSION IF NOT EXISTS pg_trgm;

CREATE TABLE IF NOT EXISTS categories (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE,
  display_order INT NOT NULL DEFAULT 0
);

CREATE TABLE IF NOT EXISTS packages (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE,
  description TEXT NOT NULL,
  is_cask BOOLEAN NOT NULL DEFAULT false,
  category_id INT NOT NULL REFERENCES categories(id),
  homepage TEXT,
  version TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_packages_category ON packages(category_id);
CREATE INDEX IF NOT EXISTS idx_packages_name ON packages(name);
CREATE INDEX IF NOT EXISTS idx_packages_name_trgm ON packages USING gin (name gin_trgm_ops);
CREATE INDEX IF NOT EXISTS idx_packages_desc_trgm ON packages USING gin (description gin_trgm_ops);

CREATE OR REPLACE VIEW all_packages AS
SELECT id, name, description, is_cask, category_id, homepage, version, created_at
FROM packages;
