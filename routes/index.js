const router = require('express').Router()
const swaggerUi = require('swagger-ui-express')
const swaggerDocument = require('../openapi.v2.json')

router.use('/api-docs', swaggerUi.serve)
router.get('/api-docs', swaggerUi.setup(swaggerDocument))

module.exports = router
