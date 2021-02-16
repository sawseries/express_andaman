const httpStatus = require('http-status')
const APIError = require('../utils/APIError')
const expressValidation = require('express-validation')
const yup = require('yup')
const queryql = require('@truepic/queryql').errors
const devMode = process.env.NODE_ENV === 'development'

/**
 * Error handler. Send stacktrace only during development
 * @public
 */
const handler = (err, req, res, next) => {
  const response = {
    success: false,
    statusCode: err.status,
    message: err.message || httpStatus[err.status],
    errors: err.errors,
    stack: err.stack,
  }

  if (!devMode) {
    delete response.stack
  } else {
    console.log('stack', err.stack)
  }

  res.status(err.status || 500)
  res.json(response)
}
exports.handler = handler

/**
 * If error is not an instanceOf APIError, convert it.
 * @public
 */
exports.converter = (err, req, res, next) => {
  let convertedError = err
  let status = err.status || 500

  if (err instanceof expressValidation.ValidationError) {
    convertedError = new APIError({
      message: 'Validation Error',
      errors: err.errors,
      status: status,
      stack: err.stack,
    })
  } else if (err instanceof yup.ValidationError) {
    convertedError = new APIError({
      errors: err.errors,
      message: err.message,
      status: 400,
      stack: err.stack,
    })
  } else if (err instanceof queryql.ValidationError) {
    convertedError = new APIError({
      errors: err.errors,
      message: err.message,
      status: 400,
      stack: err.stack,
    })
  } else if (!(err instanceof APIError)) {
    convertedError = new APIError({
      message: err.message,
      status: status,
      stack: err.stack,
    })
  }

  return handler(convertedError, req, res)
}

/**
 * Catch 404 and forward to error handler
 * @public
 */
exports.notFound = (req, res, next) => {
  const error = new APIError({
    message: 'Not found.',
    status: httpStatus.NOT_FOUND,
  })
  return handler(error, req, res)
}
