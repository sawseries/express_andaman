const knex = require('knex')
const KnexQueryBuilder = require('knex/lib/query/builder')
const devMode = process.env.NODE_ENV === 'development'
const dayjs = require('dayjs')
dayjs.locale(process.env.LOCALE)

/**
 * Connect to Mysql.
 */
const db = knex({
  client: 'mysql',
  connection: {
    host: process.env.MYSQL_HOST,
    user: process.env.MYSQL_USER,
    password: process.env.MYSQL_PASSWORD,
    port: process.env.MYSQL_PORT,
    database: process.env.MYSQL_DATABASE,
    typeCast: function (field, next) {
      if (field.type === 'DATE') {
        const value = field.string()
        return value ? dayjs(value).format('YYYY-MM-DD') : value
      } else if (field.type === 'DATETIME') {
        const value = field.string()
        return value ? dayjs(value).format('YYYY-MM-DD HH:mm:ss') : value
      } else {
        return next()
      }
    },
  },
  pool: { min: 0, max: 10 },
  asyncStackTraces: true,
  useNullAsDefault: true,
  debug: devMode,
})

KnexQueryBuilder.prototype.paginate = async function (perPage, currentPage) {
  const page = Math.max(currentPage || 1, 1)
  const offset = (page - 1) * perPage
  const clone = this.clone()
  const total = await clone.count('* as count').first()
  const rows = await this.offset(offset).limit(perPage)

  const { count } = total
  return {
    total: parseInt(count, 10),
    perPage: perPage,
    offset: offset,
    to: offset + rows.length,
    lastPage: Math.ceil(count / perPage),
    currentPage: page,
    from: offset,
    data: rows,
  }
}

db.queryBuilder = function () {
  return new KnexQueryBuilder(db.client)
}

module.exports = db
