
const Setting = require('../../../models/mysql/setting');


/**
 * อัพเดทรายการ
 *
 * API Document http://{hostname}/api-docs/#/Trd/post-trd-update
 *
 * @param {Number} id ไอดีผู้ขาย
 *
 */

exports.all = async (req, res) => {

    try {
        var setting = await Setting.find()
        res.send(setting)
      }catch (err){
        res.error(err)
      }
  };

exports.postUpdate = async (req, res) => {
  const id = req.params.id
  req.assert(id, 400, 'invalid id.')
  
  try{
    const setting = await Setting.findOneById(id)
    req.assert(setting, 404, `setting_id '${id}' not found.`)

    let values = Setting.schemas().validateSync(req.body)
    const response = await new Setting(values).save()
    res.success({ message: 'Updated.', response: response })

  } catch (err) {
    res.error(err)
  }
};

