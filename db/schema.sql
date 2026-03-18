-- Brewnite database schema

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
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_packages_category ON packages(category_id);
CREATE INDEX IF NOT EXISTS idx_packages_name ON packages(name);
