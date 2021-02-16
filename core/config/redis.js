'use strict'

const redis = require('redis')

let config = {
  host: process.env.REDIS_HOST,
  port: process.env.REDIS_PORT,
}

let redisClient = redis.createClient(config)

module.exports = redisClient
