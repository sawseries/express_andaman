const baseModel = require('./base')
const createError = require('http-errors')
const bcrypt = require('bcrypt')
const _ = require('lodash')
const utils = require('../../utils')

/**
 * User model
 */
class Model extends baseModel {
  constructor(attributes = {}) {
    super()
    this.attributes = attributes
    this.tableName = 'user'
  }

  save() {
    if (!this.attributes) throw new Error('user not set.')

    const time = Math.floor(Date.now() / 1000)
    this.attributes = Object.assign(this.attributes, { updated_at: time })

    if (_.get(this.attributes, 'id')) {
      return this.db(this.tableName)
        .where('id', this.attributes.id)
        .update(_.omit(this.attributes, ['id']))
    } else {
      // new record
      this.attributes = Object.assign(this.attributes, { created_at: time })
      return this.db(this.tableName).insert(_.omit(this.attributes, ['id']))
    }
  }

  static find() {
    return this.db.select('user.*', 'profile.*').from(this.tableName).innerJoin('profile', 'profile.user_id', 'user.id')
  }

  static findById(userId) {
    return this.find().where('id', userId).first()
  }

  static findByUsername(username) {
    return this.find().where('username', username).first()
  }

  static findByEmail(email) {
    return this.find().where('email', email).first()
  }

  static findByUsernameOrEmail(usernameOrEmail) {
    const isEmail = new RegExp('^(.+)@(.+).(.+)$', 'i').test(usernameOrEmail)
    if (isEmail) {
      return this.findByEmail(usernameOrEmail)
    }
    return this.findByUsername(usernameOrEmail)
  }

  static async login(params) {
    try {
      // check user
      const user = await this.findByUsernameOrEmail(params.username)
      if (!user) throw createError(400, 'incorrect username or password.')

      // check password
      const isPwdMatch = bcrypt.compareSync(params.password, user.password_hash)
      if (!isPwdMatch) throw createError(400, 'incorrect username or password.')

      // timestamp
      const timestamp = Math.floor(Date.now() / 1000)
      let payload = {
        user: _.pick(user, ['id', 'username', 'name']),
        name: user.name,
        jti: user.id,
      }
      // is token not expire
      if (user.token_expire && user.access_token && user.token_expire > timestamp) {
        const model = new Model({ id: user.id, last_login_at: timestamp })
        await model.save()
        return { access_token: user.access_token, expires_in: user.token_expire, token_type: process.env.TOKEN_TYPE }
      }
      // create new token
      const token = utils.generateAccessToken(payload)
      const decoded = utils.verifyToken(token)
      const model = new Model({ id: user.id, last_login_at: timestamp, access_token: token, token_expire: decoded.exp })
      await model.save()
      return { access_token: token, expires_in: decoded.exp, token_type: process.env.TOKEN_TYPE }
    } catch (err) {
      throw err
    }
  }
}

Model.tableName = 'user'

module.exports = Model
