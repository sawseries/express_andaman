// Update with your config settings.
require('dotenv').config()

module.exports = {
  development: {
    client: process.env.MYSQL_CLIENT,
    connection: {
      database: process.env.MYSQL_DATABASE,
      user: process.env.MYSQL_USER,
      password: process.env.MYSQL_PASSWORD,
      port: process.env.MYSQL_PORT,
      // filename: './dev.mysql',
    },
  },

  production: {
    client: process.env.MYSQL_CLIENT,
    connection: {
      database: process.env.MYSQL_DATABASE,
      user: process.env.MYSQL_USER,
      password: process.env.MYSQL_PASSWORD,
      port: process.env.MYSQL_PORT,
    },
    pool: {
      min: 2,
      max: 10,
    },
    migrations: {
      tableName: 'knex_migrations',
    },
    debug: true,
  },
}
