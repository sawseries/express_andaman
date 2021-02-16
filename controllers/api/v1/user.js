const { User } = require('../../../models/mysql')

/**
 * User login
 *
 * API Document http://localhost:3000/api-docs/#/User/post-user-login
 *
 * @method POST
 *
 * @param {String} username ชื่อผู้ใช้งานหรืออีเมล
 * @param {String} password รหัสผ่าน
 */
exports.postLogin = async (req, res) => {
  try {
    const response = await User.login(req.body)
    res.sendSuccess(response)
  } catch (err) {
    res.error(err)
  }
}
