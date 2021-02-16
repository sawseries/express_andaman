'use strict'

const yup = require('yup')

/**
 * Document https://github.com/jquense/yup
 */

module.exports = {
  test: {
    username: yup.string().required('invalid username'),
    password: yup.string().required('invalid password'),
  },
}
