
const express = require('express')
const router = express.Router()
const controller = require('../../../controllers/api/v1/company')
const authenticateJwt = require('../../../middlewares/authenticate-jwt')
const validate = require('../../../middlewares/validation')
const validators = require('../../../validations/setting.validator')

//รายการทั้งหมด
router.get('/',authenticateJwt,controller.all)
//แก้ไขรายการ
router.post('/update/:id',authenticateJwt,controller.postUpdate)


module.exports = router




