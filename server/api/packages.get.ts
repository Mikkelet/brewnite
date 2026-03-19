import sql from '../utils/db'

export default defineEventHandler(async (event) => {
  const query = getQuery(event)
  const search = ((query.search as string) || '').trim()
  const type = (query.type as string) || 'all' // 'all', 'formulae', 'casks'
  const page = Math.max(1, parseInt(query.page as string) || 1)
  const limit = Math.min(100, Math.max(1, parseInt(query.limit as string) || 50))
  const offset = (page - 1) * limit

  const typeFilter = type === 'formulae' ? sql`AND NOT is_cask` : type === 'casks' ? sql`AND is_cask` : sql``

  if (!search) {
    const countResult = await sql`
      SELECT COUNT(*)::int AS total FROM all_packages WHERE true ${typeFilter}
    `
    const totalCount = countResult[0].total

    const rows = await sql`
      SELECT name, description, homepage, version, is_cask AS cask
      FROM all_packages
      WHERE true ${typeFilter}
      ORDER BY name
      LIMIT ${limit} OFFSET ${offset}
    `

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

  // Fuzzy search using pg_trgm similarity + ILIKE fallback
  const rows = await sql`
    SELECT name, description, homepage, version, is_cask AS cask,
      GREATEST(
        similarity(name, ${search}),
        similarity(COALESCE(description, ''), ${search})
      ) AS score
    FROM all_packages
    WHERE (
      name % ${search}
      OR COALESCE(description, '') % ${search}
      OR name ILIKE ${'%' + search + '%'}
      OR COALESCE(description, '') ILIKE ${'%' + search + '%'}
    ) ${typeFilter}
    ORDER BY score DESC, name
  `

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
