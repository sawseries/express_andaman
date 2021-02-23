require('dotenv').config()

const devMode = process.env.NODE_ENV === 'development'
const express = require('express')
const path = require('path')
const cookieParser = require('cookie-parser')
const logger = require('morgan')
const helmet = require('helmet')
const compression = require('compression')
const cors = require('cors')
const corsMiddleware = require('./middlewares/cors')
const RateLimit = require('express-rate-limit')
const RedisStore = require('rate-limit-redis')
const redisClient = require('./core/config/redis')
const bodyParser = require('body-parser')
const passport = require('passport')
const customResponse = require('./middlewares/custom-response')
const responseTime = require('response-time')
const autoRoutes = require('./utils/auto-routes')
const { graphqlHTTP } = require('express-graphql')
const graphqlSchema = require('./graphql/schemas')
const graphqlResolver = require('./graphql/resolvers')
const error = require('./middlewares/error')


const app = express()
app.use(bodyParser.json());
app.use(cors());    
app.use(cookieParser());

// view engine setup
app.set('views', path.join(__dirname, 'views'))
app.set('view engine', 'ejs')

if (devMode) {
  app.use(logger('dev'))
}


// app.use(express.json())
// app.use(express.urlencoded({ extended: false }))
app.use(cookieParser())
app.use(express.static(path.join(__dirname, 'public')))
app.use('/uploads', express.static(path.join(__dirname, 'uploads')))

/**
 * gzip compression
 * http://expressjs.com/en/resources/middleware/morgan.html
 */
app.use(compression())
/**
 * secure apps by setting various HTTP headers
 */
app.use(
  helmet({
    contentSecurityPolicy: false,
  })
)
/**
 * enable CORS - Cross Origin Resource Sharing
 * http://expressjs.com/en/resources/middleware/cors.html
 */
app.use(cors())
app.use(corsMiddleware)

// Enable if you're behind a reverse proxy (Heroku, Bluemix, AWS ELB, Nginx, etc)
// see https://expressjs.com/en/guide/behind-proxies.html
// app.set('trust proxy', 1);

const limiter = new RateLimit({
  store: new RedisStore({
    client: redisClient,
  }),
  windowMs: 15 * 60 * 1000, // 15 minutes
  max: 100, // limit each IP to 100 requests per windowMs
  delayMs: 0, // disable delaying - full speed until the max limit is reached
})
//  apply to all requests
app.use(limiter)

/**
 * parse body params and attache them to req.body
 */
// app.use(express.json())
// app.use(express.urlencoded({ extended: false }))
app.use(bodyParser.urlencoded({ extended: false }))
app.use(bodyParser.json())

/**
 * API keys and Passport configuration.
 */
require('./core/auth/passport')
/**
 * Passport is authentication
 */
app.use(passport.initialize())
app.use(passport.session())

/**
 * Response time
 */
app.use(responseTime())

/**
 * custom response
 */
app.use(customResponse())

/**
 * App Routes
 */
app.get('/', (req, res) => res.success({ message: 'It works!' }))
// auto load routes
const appRoutes = autoRoutes(app, path.join(__dirname, 'routes'))
app.appRoutes = appRoutes

var trdRouter = require('./routes/api/v1/trd');
var settingRouter = require('./routes/api/v1/setting');
var companyRouter = require('./routes/api/v1/company');

app.use('/trd/', trdRouter);
app.use('/company/',companyRouter);
app.use('/setting/',settingRouter);

/**
 * GraphQL API
 */
app.use(
  '/graphql',
  graphqlHTTP({
    schema: graphqlSchema,
    rootValue: graphqlResolver,
    graphiql: true,
  })
)

// if error is not an instanceOf APIError, convert it.
app.use(error.converter)

// catch 404 and forward to error handler
app.use(error.notFound)

// error handler, send stacktrace only during development
app.use(error.handler)

module.exports = app
