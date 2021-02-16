const knex = require('knex')

module.exports = knex({
  client: 'mssql',
  connection: {
    host: process.env.DB_MSSQL_HOST,
    user: process.env.DB_MSSQL_USER,
    password: process.env.DB_MSSQL_PASSWORD,
    port: Number(process.env.DB_MSSQL_PORT),
    database: process.env.DB_MSSQL_DATABASE,
    options: {
      encrypt: false,
      enableArithAbort: false,
    },
  },
  asyncStackTraces: true,
  useNullAsDefault: true,
})
