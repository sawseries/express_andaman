const passport = require('passport')
const passportJWT = require('passport-jwt')
const ExtractJwt = passportJWT.ExtractJwt
const JwtStrategy = passportJWT.Strategy
const { User } = require('../../models/mysql')

const jwtOptions = {
  jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
  secretOrKey: process.env.JWT_SECRET,
  issuer: process.env.JWT_ISSUER,
  jsonWebTokenOptions: {
    algorithm: process.env.JWT_ALGORITHM,
    notBefore: process.env.JWT_NOTBEFORE,
    expiresIn: process.env.JWT_EXPIRESIN,
    issuer: process.env.JWT_ISSUER,
  },
  passReqToCallback: true,
}

/**
 * Sign in with JWT.
 */
const jwtStrategyConfig = new JwtStrategy(jwtOptions, async (req, jwt_payload, done) => {
  try {
    const user = await User.findById(jwt_payload.jti)
    req.assert(user, 401, 'Unauthorized.')
    req.user = user
    return done(null, user)
  } catch (error) {
    return done(error, false)
  }
})
passport.use(jwtStrategyConfig)
