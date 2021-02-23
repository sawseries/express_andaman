const db = require('../../core/db/index.js').mysql
const yup = require('yup')
const _ = require('lodash')
const { TB_SETTING } = require('./tables')
const transformDatetime = require('../../utils/transform-datetime')
const dayjs = require('dayjs')
dayjs.locale(process.env.LOCALE)


/**
 * tb_trd
 */
class tb_setting{

  constructor(attributes) {
    this.attributes = attributes
    this.db = db
    this.tableName = TB_SETTING
  }

  static attributeLabels() {
    return {
        setting_id: 'ไอดี',
        ret_location_check_km: 'ระยะตรวจสอบการทำรายการร้านค้าย่อย',
        upload_location: 'เปิดการ upload location T/F',
        upload_location_min: 'ความถี่ในการส่ง Location data',
        shipment_confirm: 'เปิดการแจ้งเตือนยืนยันการจัดส่ง T/F',
        shipment_confirm_km: 'ระยะทางการยืนยันการจัดส่ง km.',
        bulk_location_check: 'ตรวจสอบ Locataion เศษเหล็กเหมากอง T/F',
        driver_blacklist_allow: 'อนุญาตพนักงานรถยนต์ Black list ลงทะเบียนใช้งานได้ T/F',
        car_blacklist_allow: 'อนุญาตรถยนต์ Black list สามารถใช้งานได้ T/F',
        truck_approve_req: 'Approve เอกสารรถยนต์ ก่อนใช้งานระบบ T/F',
        driver_approve_req: 'Approve เอกสารพนักงานขับรถยนต์ ก่อนใช้งานระบบ T/F',
        advance_day: 'จองคิวล่วงหน้า(วัน)',
        advance_time: 'เวลาปิดก่อนวันเดินทาง',
        map_api_key: 'Map API Key',
        map_api_key_update: 'Map API Key วันที่ปรับปรุง',
        created_at: 'วัน,เวลาที่บันทึก',
        updated_at: 'วัน,เวลาที่แก้ไข',
        created_by: 'ผู้บันทึก',
        updated_by: 'ผู้แก้ไข',
    }
  }

  static schemas() {
    return yup.object().shape({
        setting_id: yup.number().integer(),
        ret_location_check_km: yup.number().integer().notRequired(),
        upload_location:  yup.string().max(1).notRequired(),
        upload_location_min: yup.number().integer().notRequired(),
        shipment_confirm:  yup.string().max(1).notRequired(),
        shipment_confirm_km: yup.number().integer().notRequired(),
        bulk_location_check: yup.string().max(1).notRequired(),
        driver_blacklist_allow: yup.string().max(1).notRequired(),
        car_blacklist_allow: yup.string().max(1).notRequired(),
        truck_approve_req: yup.string().max(1).notRequired(),
        driver_approve_req: yup.string().max(1).notRequired(),
        advance_day: yup.number().integer().notRequired(),
        advance_time: yup.string().notRequired(),
        map_api_key: yup.string().max(255).notRequired(),
        map_api_key_update: yup.date().notRequired(),      
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
    return this.find().where('setting_id', id).first()
  }

  static findOneByUserId = (userId) => {
    return this.find().where('setting_id', userId).first()
  }

  static deleteById(id) {
    return this.delete({ setting_id: id })
  }

  static delete(params) {
    return this.db(this.tableName).where(params).del()
  }

  save() {
    if (!this.attributes) throw new Error('attributes not set.')
    
    let attributes = _.omit(this.attributes, ['setting_id'])
    
    if (_.get(this.attributes,'setting_id')) {
      // update
      return this.db(this.tableName)
        .where('setting_id', this.attributes.setting_id)
        .update(this.attributes)
    } else {
      // create
      return this.db(this.tableName).insert(this.attributes)
    }
  }
}

tb_setting.tableName = TB_SETTING
tb_setting.db = db

module.exports = tb_setting
