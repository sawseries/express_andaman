const { TbTrd, TbRet, TbTrdConfirm } = require('../../../models/mysql')

/**
 * สร้างรายการ
 *
 * API Document http://{hostname}/api-docs/#/Trd/post-trd-create
 */
exports.postCreate = async (req, res) => {
  try {
    // validate
    let values = TbTrd.schemas().validateSync(req.body)
    // save
    const response = await new TbTrd(values).save()
    res.success({ message: 'Created.', response: response }, 201)
  } catch (err) {
    res.error(err)
  }
}

/**
 * อัพเดทรายการ
 *
 * API Document http://{hostname}/api-docs/#/Trd/post-trd-update
 *
 * @param {Number} id ไอดีผู้ขาย
 *
 */
exports.postUpdate = async (req, res) => {
  const id = req.params.id
  req.assert(id, 400, 'invalid id.')
  try {
    const trd = await TbTrd.findOneById(id)
    req.assert(trd, 404, `trd id '${id}' not found.`)
    // validate
    let values = TbTrd.schemas().validateSync(Object.assign(trd, req.body))
    // save
    const response = await new TbTrd(values).save()
    res.success({ message: 'Updated.', response: response })
  } catch (err) {
    res.error(err)
  }
}

/**
 * ลบรายการ
 *
 * API Document http://{hostname}/api-docs/#/Trd/delete-trd-del
 *
 * @param {Number} id ไอดีผู้ขาย
 *
 */
exports.delete = async (req, res) => {
  const id = req.params.id
  req.assert(id, 400, 'invalid id.')
  try {
    const trd = await TbTrd.findOneById(id)
    req.assert(trd, 404, `trd id '${id}' not found.`)
    // delete by id
    await TbTrd.deleteById(id)
    res.success({ message: 'Deleted.' })
  } catch (err) {
    res.error(err)
  }
}

/**
 * เพิ่มรายชื่อร้านค้าย่อย
 *
 * API Document http://{hostname}/api-docs/#/Trd/post-trd-add-retail
 */
exports.postAddRetail = async () => {
  try {
    res.success({ message: 'Successfully.' })
  } catch (err) {
    res.error(err)
  }
}

/**
 * ยืนยันร้านค้า
 *
 * API Document http://{hostname}/api-docs/#/Trd/post-trd-confirm
 *
 * @param {Number} trd_id ไอดีผู้ขาย
 * @param {Number} ret_id ไอดีร้านค้า
 */
exports.postConfirmRetail = async (req, res) => {
  try {
    let body = req.body
    const trd = await TbTrd.findOneById(body.trd_id)
    req.assert(trd, 404, `trd id '${body.trd_id}' not found.`)

    const retail = await TbRet.findOneById(body.ret_id)
    req.assert(retail, 404, `retail id '${body.ret_id}' not found.`)

    const trdCon = await TbTrdConfirm.findOne(body)

    body = Object.assign(body, { created_by: req.user.id, updated_by: req.user.id })
    let confirmStatus = 'Y' // default is confirm
    if (trdCon) {
      confirmStatus = trdCon.confirm_status === 'Y' ? 'N' : 'Y'
      body = Object.assign({ trd_confirm_id: trdCon.trd_confirm_id, confirm_status: confirmStatus }, body)
    } else {
      body = Object.assign(body, { confirm_status: confirmStatus })
    }
    // validate
    let values = TbTrdConfirm.schemas().validateSync(body)
    // save
    await new TbTrdConfirm(values).save()

    res.success({ message: 'Successfully.' })
  } catch (err) {
    res.error(err)
  }
}

/**
 * ลบรายการร้านค้า
 *
 * API Document http://{hostname}/api-docs/#/Trd/delete_trd_del_retail
 *
 * @param {Number} trd_id ไอดีผู้ขาย
 * @param {Number} ret_id ไอดีร้านค้า
 */
exports.deleteRetail = async (req, res) => {
  const query = req.query
  try {
    const trd = await TbTrd.findOneById(query.trd_id)
    req.assert(trd, 404, `trd id '${query.trd_id}' not found.`)

    const retail = await TbRet.findOneById(query.ret_id)
    req.assert(retail, 404, `retail id '${query.ret_id}' not found.`)

    await TbTrdConfirm.delete(query)
    res.success({ message: 'Deleted.' })
  } catch (err) {
    res.error(err)
  }
}

/**
 * ข้อมูลผู้ขาย
 *
 * API Document http://{hostname}/api-docs/#/Trd/get-trd-profile
 *
 * @param {Number} trd_id ไอดีผู้ขาย
 */
exports.getProfile = async (req, res) => {
  const trdId = req.params.trd_id
  const userId = req.user.id
  try {
    let profile = null
    if (trdId) {
      profile = await TbTrd.findOneById(trdId)
    } else {
      profile = await TbTrd.findOneByUserId(userId)
    }
    res.success(profile)
  } catch (err) {
    res.error(err)
  }
}
