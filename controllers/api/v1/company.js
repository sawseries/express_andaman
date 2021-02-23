const Company = require('../../../models/mysql/company');

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
        var comp = await Company.find()
        res.send(comp)
      }catch (err){
        res.error(err)
      }
  };

exports.postUpdate = async (req, res) => {
  const id = req.params.id
  req.assert(id, 400, 'invalid id.')
  
  try{
    const com_pany = await Company.findOneById(id)
    req.assert(com_pany, 404, `com_id '${id}' not found.`)

    let values = Company.schemas().validateSync(req.body)
    const response = await new Company(values).save()
    res.success({ message: 'Updated.', response: response })

  } catch (err) {
    res.error(err)
  }
};

