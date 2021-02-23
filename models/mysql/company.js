const db = require('../../core/db/index.js').mysql
const yup = require('yup')
const _ = require('lodash')
const { TB_COMPANY } = require('./tables')
const transformDatetime = require('../../utils/transform-datetime')
const dayjs = require('dayjs')
dayjs.locale(process.env.LOCALE)


/**
 * tb_trd
 */
class tb_company{

  constructor(attributes) {
    this.attributes = attributes
    this.db = db
    this.tableName = TB_COMPANY
  }

  static attributeLabels() {
    return {

        com_id: 'ไอดี',
        com_name: 'ชื่อบริษัท',
        com_address: 'ที่อยู่',
        zip_code: 'รหัสไปรษณีย์',
        prov_id: 'จังหวัด',
        com_phone: 'เบอร์โทรศัพท์',
        com_email: 'อีเมล',
        sys1_name: 'ชื่อโรงงาน sys1',
        sys1_phone: 'เบอร์โทรศัพท์',
        sys1_callcentre	: 'เบอร์โทรศัพท์ รปภ.sys1',
        sys1_lon: 'longitude',
        sys1_lat: 'latitude',
        sys2_name: 'ชื่อโรงงาน sys2',
        sys2_phone: 'เบอร์โทรศัพท์ sys2',
        sys2_callcentre	: 'เบอร์โทรศัพท์ รปภ.sys2',
        sys2_lon	: 'longitude',
        sys2_lat	: 'latitude',
        sys1_on	: 'SYS 1 เปิดใช้งาน T/F',
        sys2_on	: 'SYS 2 เปิดใช้งาน T/F',
        created_at: 'วัน,เวลาที่บันทึก',
        updated_at: 'วัน,เวลาที่แก้ไข',
        created_by: 'ผู้บันทึก',
        updated_by: 'ผู้แก้ไข',
    }
  }

  static schemas() {
    return yup.object().shape({

        com_id: yup.number().integer().required(),
        com_name: yup.string().notRequired(),
        com_address: yup.string().notRequired(),
        zip_code: yup.string().max(10).notRequired(),
        prov_id: yup.number().integer().notRequired(),
        com_phone: yup.string().max(20).notRequired(),
        com_email: yup.string().max(50).notRequired(),
        sys1_name: yup.string().max(100).notRequired(),
        sys1_phone: yup.string().max(20).notRequired(),
        sys1_callcentre	: yup.string().max(20).notRequired(),
        sys1_lon: yup.string().max(50).notRequired(),
        sys1_lat: yup.string().max(50).notRequired(),
        sys2_name: yup.string().max(100).notRequired(),
        sys2_phone: yup.string().max(20).notRequired(),
        sys2_callcentre	: yup.string().max(20).notRequired(),
        sys2_lon	: yup.string().max(50).notRequired(),
        sys2_lat	: yup.string().max(50).notRequired(),
        sys1_on	: yup.string().max(1).notRequired(),
        sys2_on	: yup.string().max(1).notRequired(),
        created_at: yup.string()
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
    return this.find().where('com_id', id).first()
  }

  static findOneByUserId = (userId) => {
    return this.find().where('com_id', userId).first()
  }

  static deleteById(id) {
    return this.delete({ com_id: id })
  }

  static delete(params) {
    return this.db(this.tableName).where(params).del()
  }

  save() {
    if (!this.attributes) throw new Error('attributes not set.')
    
    let attributes = _.omit(this.attributes, ['com_id'])
    
    if (_.get(this.attributes,'com_id')) {
      // update
      return this.db(this.tableName)
        .where('com_id', this.attributes.com_id)
        .update(this.attributes)
    } else {
      // create
      return this.db(this.tableName).insert(this.attributes)
    }
  }
}

tb_company.tableName = TB_COMPANY
tb_company.db = db

module.exports = tb_company
