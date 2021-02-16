const express = require('express')
const router = express.Router()
const controller = require('../../../controllers/api/v1/trd')
const authenticateJwt = require('../../../middlewares/authenticate-jwt')
const validate = require('../../../middlewares/validation')
const validators = require('../../../validations/trd.validator')

// สร้างรายการ
router.post('/create', authenticateJwt, controller.postCreate)
// อัพเดทรายการ
router.post('/update/:id', authenticateJwt, controller.postUpdate)
// ลบรายการ
router.delete('/del/:id', authenticateJwt, controller.delete)
// เพิ่มร้านค้า
router.post('/add-retail', authenticateJwt, validate(validators.addRetail), controller.postAddRetail)
// ยืนยันร้านค้า
router.post('/confirm-retail', authenticateJwt, validate(validators.confirmRetail), controller.postConfirmRetail)
// ลบรายการร้านค้า
router.delete('/del-retail', authenticateJwt, validate(validators.deleteRetail), controller.deleteRetail)
// ข้อมูลผู้ขาย
router.get('/profile', authenticateJwt, controller.getProfile)
router.get('/profile/:trd_id', authenticateJwt, controller.getProfile)

module.exports = router
