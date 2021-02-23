'use strict'

const yup = require('yup')

module.exports = {
  postUpdate: {
    com_id: yup.number().integer().required('invalid com_id.'),
  },
 
}
