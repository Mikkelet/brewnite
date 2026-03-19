import postgres from 'postgres'

const sql = process.env.DATABASE_URL
  ? postgres(process.env.DATABASE_URL)
  : postgres({ database: 'brewnite' })

export default sql
