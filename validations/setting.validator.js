'use strict'

const yup = require('yup')

module.exports = {
  postUpdate: {
    setting_id: yup.number().integer().required('invalid setting_id.'),
  },
 
}
