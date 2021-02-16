'use strict'

const yup = require('yup')

module.exports = (validation = {}) => {
  return async (req, res, next) => {
    try {
      // validate data
      let schema = yup.object().shape(validation)
      await schema.validate(Object.assign({}, req.body, req.query, req.params))
      next()
    } catch (error) {
      next(error)
    }
  }
}
