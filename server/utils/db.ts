import postgres from 'postgres'

const sql = postgres({
  database: 'brewnite',
})

export default sql
