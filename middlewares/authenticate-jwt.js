const passport = require('passport')
const createError = require('http-errors')

module.exports = (req, res, next) => {
  req.assert(req.headers.authorization, 401, "Authorization header required. 'Authorization: Bearer <ACCESS TOKEN>'")
  passport.authenticate('jwt', { session: false }, (err, user) => {
    if (err) return next(err)
    if (!user) return next(createError(401, 'Unauthorized!'))
    next()
  })(req, res, next)
}
