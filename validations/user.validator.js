'use strict'

const yup = require('yup')

module.exports = {
  // เข้าสู่ระบบ
  login: {
    username: yup.string().min(3).required(),
    password: yup.string().min(8).required(),
  },
}
