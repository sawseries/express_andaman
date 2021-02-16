const db = require('../../core/db').mysql
const yup = require('yup')
const _ = require('lodash')
const { TB_RET } = require('./tables')
const transformDatetime = require('../../utils/transform-datetime')
const dayjs = require('dayjs')
dayjs.locale(process.env.LOCALE)

/**
 * tb_ret
 */
class Model {
  constructor(attributes) {
    this.attributes = attributes
    this.db = db
    this.tableName = TB_RET
  }

  static attributeLabels() {
    return {
      ret_id: 'ไอดี',
      ret_code: 'รหัสร้านค้าย่อย',
      ret_title: 'ชื่อต้น',
      ret_name: 'ชื่อร้านค้าย่อย',
      ret_adr1: 'ที่อยู่1',
      ret_adr2: 'ที่อยู่2',
      zip_code: 'รหัสไปรษณีย์',
      prov_id: 'รหัสจังหวัด',
      con_p: 'ชื่อผู้ติดต่อ',
      con_tel: 'เบอร์โทรศัพท์',
      fax1: 'Fax',
      ret_email: 'อีเมล',
      ret_lon: 'longitude',
      ret_lat: 'latitude',
      ret_profile: '',
      ret_status_id: 'สถานะ',
      ret_confirm: 'ยืนยัน',
      user_id: 'รหัสผู้ใช้งาน',
      created_at: 'วัน,เวลาที่บันทึก',
      updated_at: 'วัน,เวลาที่แก้ไข',
      created_by: 'ผู้บันทึก',
      updated_by: 'ผู้แก้ไข',
    }
  }

  static schemas() {
    return yup.object().shape({
      ret_id: yup.number().integer(),
      ret_code: yup.string().required('invalid ret_code.'),
      ret_title: yup.string().required('invalid ret_title.'),
      ret_name: yup.string().required('invalid ret_name.'),
      ret_adr1: yup.string().notRequired(),
      ret_adr2: yup.string().notRequired(),
      zip_code: yup.string().notRequired(),
      prov_id: yup.number().integer().notRequired(),
      con_p: yup.string().notRequired(),
      con_tel: yup.string().notRequired(),
      fax1: yup.string().notRequired(),
      ret_email: yup.string().email().notRequired(),
      ret_lon: yup.string().notRequired(),
      ret_lat: yup.string().notRequired(),
      ret_profile: yup.string().notRequired(),
      ret_status_id: yup.number().integer().oneOf([1, 2]).notRequired(),
      ret_confirm: yup.number().oneOf(['T', 'F']).notRequired(),
      created_at: yup
        .string()
        .notRequired()
        .transform(transformDatetime)
        .default(() => dayjs().format('YYYY-MM-DD HH:mm:ss')),
      updated_at: yup
        .string()
        .notRequired()
        .transform(transformDatetime)
        .default(() => dayjs().format('YYYY-MM-DD HH:mm:ss')),
      created_by: yup.number().integer(),
      updated_by: yup.number().integer(),
    })
  }

  static find(columns = '*') {
    return this.db.select(columns).from(this.tableName)
  }

  static findOneById = (id) => {
    return this.find().where('ret_id', id).first()
  }

  static findOneByUserId = (userId) => {
    return this.find().where('user_id', userId).first()
  }

  static deleteById(id) {
    return this.delete({ ret_id: id })
  }

  static delete(params) {
    return this.db(this.tableName).where(params).del()
  }

  save() {
    if (!this.attributes) throw new Error('attributes not set.')
    let attributes = _.omit(this.attributes, ['ret_id'])

    if (_.get(this.attributes, 'ret_id')) {
      // update
      return this.db(this.tableName)
        .where('ret_id', this.attributes.ret_id)
        .update(_.omit(attributes, ['created_at']))
    } else {
      // create
      return this.db(this.tableName).insert(attributes)
    }
  }

  /**
   * รายชื่อร้านค้า
   */
  static getStoreList() {
    return this.db
      .select([
        'tb_ret.ret_id',
        'tb_ret.ret_code',
        'tb_ret.ret_title',
        'tb_ret.ret_name',
        db.raw(`concat(tb_ret.ret_title, ' ', tb_ret.ret_name) as retail_name`),
        'tb_ret.con_p',
        'tb_ret.con_tel',
        'tb_ret.ret_confirm',
        'tb_ret.ret_status_id',
        db.raw(`CASE
        tb_ret.ret_status_id 
        WHEN 1 THEN
        'Active' 
        WHEN 2 THEN
        'DeActive' ELSE '' 
        END AS ret_status_des`),
        'tb_trd.trd_id',
        'tb_ret.user_id',
        'tb_trd.trd_code',
        'tb_trd_confirm.confirm_status',
      ])
      .from(this.tableName)
      .leftJoin('tb_trd_confirm', 'tb_ret.ret_id', 'tb_trd_confirm.ret_id')
      .leftJoin('tb_trd', 'tb_trd_confirm.trd_id', 'tb_trd.trd_id')
  }
}

Model.tableName = TB_RET
Model.db = db

module.exports = Model
