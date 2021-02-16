module.exports = require('knex')({
  client: 'pg',
  debug: process.env.NODE_ENV === 'development',
  connection: {
    host: process.env.PG_HOST,
    user: process.env.PG_USER,
    password: process.env.PG_PASSWORD,
    database: process.env.PG_DATABASE,
  },
  searchPath: ['knex', 'public'],
})
