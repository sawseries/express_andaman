const router = require('express').Router()
const controller = require('../../../controllers/api/v1/user')
const validate = require('../../../middlewares/validation')
const validators = require('../../../validations/user.validator')

// เข้าสู่ระบบ
router.post('/login', validate(validators.login), controller.postLogin)

module.exports = router
