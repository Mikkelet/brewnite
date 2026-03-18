import sql from '../utils/db'

export default defineEventHandler(async (event) => {
  const query = getQuery(event)
  const search = ((query.search as string) || '').trim()
  const type = (query.type as string) || 'all' // 'all', 'formulae', 'casks'
  const page = Math.max(1, parseInt(query.page as string) || 1)
  const limit = Math.min(100, Math.max(1, parseInt(query.limit as string) || 50))
  const offset = (page - 1) * limit

  if (!search) {
    // No search — paginate directly in SQL with UNION ALL
    const countResult = await sql`
      SELECT (
        ${type === 'casks' ? sql`0` : sql`(SELECT COUNT(*) FROM formulae)`}
        +
        ${type === 'formulae' ? sql`0` : sql`(SELECT COUNT(*) FROM casks)`}
      )::int AS total
    `
    const totalCount = countResult[0].total

    let rows
    if (type === 'formulae') {
      rows = await sql`
        SELECT name, description, homepage, version, false AS cask
        FROM formulae ORDER BY name LIMIT ${limit} OFFSET ${offset}
      `
    } else if (type === 'casks') {
      rows = await sql`
        SELECT token AS name, description, homepage, version, true AS cask
        FROM casks ORDER BY token LIMIT ${limit} OFFSET ${offset}
      `
    } else {
      rows = await sql`
        SELECT * FROM (
          SELECT name, description, homepage, version, false AS cask FROM formulae
          UNION ALL
          SELECT token AS name, description, homepage, version, true AS cask FROM casks
        ) combined
        ORDER BY name LIMIT ${limit} OFFSET ${offset}
      `
    }

    return {
      packages: rows.map((r: any) => ({
        name: r.name,
        description: r.description || '',
        cask: r.cask,
        homepage: r.homepage,
        version: r.version,
      })),
      total: totalCount,
      page,
      limit,
      totalPages: Math.ceil(totalCount / limit),
    }
  }

  // Fuzzy search using pg_trgm similarity + LIKE fallback
  // Combines trigram similarity score for ranking with LIKE for substring matches
  const threshold = 0.15

  let rows
  if (type === 'formulae') {
    rows = await sql`
      SELECT name, description, homepage, version, false AS cask,
        GREATEST(
          similarity(name, ${search}),
          similarity(COALESCE(description, ''), ${search})
        ) AS score
      FROM formulae
      WHERE name % ${search}
         OR COALESCE(description, '') % ${search}
         OR name ILIKE ${'%' + search + '%'}
         OR COALESCE(description, '') ILIKE ${'%' + search + '%'}
      ORDER BY score DESC, name
    `
  } else if (type === 'casks') {
    rows = await sql`
      SELECT token AS name, description, homepage, version, true AS cask,
        GREATEST(
          similarity(token, ${search}),
          similarity(COALESCE(name, ''), ${search}),
          similarity(COALESCE(description, ''), ${search})
        ) AS score
      FROM casks
      WHERE token % ${search}
         OR COALESCE(name, '') % ${search}
         OR COALESCE(description, '') % ${search}
         OR token ILIKE ${'%' + search + '%'}
         OR COALESCE(name, '') ILIKE ${'%' + search + '%'}
         OR COALESCE(description, '') ILIKE ${'%' + search + '%'}
      ORDER BY score DESC, token
    `
  } else {
    rows = await sql`
      SELECT * FROM (
        SELECT name, description, homepage, version, false AS cask,
          GREATEST(
            similarity(name, ${search}),
            similarity(COALESCE(description, ''), ${search})
          ) AS score
        FROM formulae
        WHERE name % ${search}
           OR COALESCE(description, '') % ${search}
           OR name ILIKE ${'%' + search + '%'}
           OR COALESCE(description, '') ILIKE ${'%' + search + '%'}
        UNION ALL
        SELECT token AS name, description, homepage, version, true AS cask,
          GREATEST(
            similarity(token, ${search}),
            similarity(COALESCE(name, ''), ${search}),
            similarity(COALESCE(description, ''), ${search})
          ) AS score
        FROM casks
        WHERE token % ${search}
           OR COALESCE(name, '') % ${search}
           OR COALESCE(description, '') % ${search}
           OR token ILIKE ${'%' + search + '%'}
           OR COALESCE(name, '') ILIKE ${'%' + search + '%'}
           OR COALESCE(description, '') ILIKE ${'%' + search + '%'}
      ) combined
      ORDER BY score DESC, name
    `
  }

  const totalCount = rows.length
  const paginated = rows.slice(offset, offset + limit)

  return {
    packages: paginated.map((r: any) => ({
      name: r.name,
      description: r.description || '',
      cask: r.cask,
      homepage: r.homepage,
      version: r.version,
    })),
    total: totalCount,
    page,
    limit,
    totalPages: Math.ceil(totalCount / limit),
  }
})
