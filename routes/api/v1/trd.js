
const express = require('express')
const router = express.Router()
const controller = require('../../../controllers/api/v1/trd')
const validate = require('../../../middlewares/validation')
const validators = require('../../../validations/trd.validator')


// รายการทั้งหมด
router.get('/all', controller.all)
// สร้างรายการ
router.post('/create', controller.postCreate)
// อัพเดทรายการ
router.post('/update/:id',controller.postUpdate)
// ลบรายการ
router.delete('/del/:id', controller.delete)
// เพิ่มร้านค้า
router.post('/add-retail', validate(validators.addRetail), controller.postAddRetail)
// ยืนยันร้านค้า
router.post('/confirm-retail', validate(validators.confirmRetail), controller.postConfirmRetail)
// ลบรายการร้านค้า
router.delete('/del-retail', validate(validators.deleteRetail), controller.deleteRetail)
// ข้อมูลผู้ขาย
router.get('/profile', controller.getProfile)
router.get('/profile/:trd_id', controller.getProfile)

module.exports = router




