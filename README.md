# Brewnite

Homebrew script generator. Browse 15,000+ formulae and casks, pick what you need, and get a ready-to-run install script.

## Features

- Search and browse the full Homebrew package registry (formulae + casks)
- Fuzzy search powered by PostgreSQL trigram matching
- Quick-start presets (Web Dev, iOS, Data Science, DevOps, etc.)
- Generate a bash install script from your selections
- Copy a one-liner: `curl ... | bash`
- Shareable links with selections encoded in the URL
- `/raw` endpoint serves the script as plain text

## Tech Stack

- **Nuxt 4** (Vue 3)
- **PostgreSQL** with `pg_trgm` for fuzzy search
- **Docker** for deployment

## Setup

### Prerequisites

- Node.js 22+
- PostgreSQL with the `pg_trgm` extension enabled

### Database

```bash
createdb brewnite
psql -d brewnite -c "CREATE EXTENSION IF NOT EXISTS pg_trgm;"
psql -d brewnite -f db/schema.sql
psql -d brewnite -f db/seed.sql
```

### Development

```bash
npm install
npm run dev
```

Runs on http://localhost:3000.

Set `DATABASE_URL` to override the default local connection:

```bash
DATABASE_URL="postgresql://user:pass@host:5432/brewnite" npm run dev
```

### Docker

```bash
docker build -t brewnite .
docker run -p 3000:3000 -e DATABASE_URL="postgresql://user:pass@host:5432/dbname" brewnite
```

To reach your host machine's PostgreSQL from Docker:

```bash
docker run -p 3000:3000 -e DATABASE_URL="postgresql://user@host.docker.internal:5432/brewnite" brewnite
```

## Deploy to Digital Ocean

1. Push to GitHub
2. Create an App on **DO App Platform**, connect the repo
3. Set source directory to `nuxt-app`
4. Set HTTP port to `3000`
5. Add `DATABASE_URL` as an encrypted env var pointing to your DO Managed PostgreSQL
6. Deploy

## Support

If you find this useful, consider buying me a coffee:

[![Buy Me A Coffee](https://img.shields.io/badge/Buy%20Me%20A%20Coffee-ffdd00?style=for-the-badge&logo=buy-me-a-coffee&logoColor=black)](https://buymeacoffee.com/mikkelthygesen)
