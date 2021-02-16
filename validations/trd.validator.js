'use strict'

const yup = require('yup')

module.exports = {
  addRetail: {
    trd_id: yup.number().integer().required('invalid trd_id.'),
    ret_id: yup.number().integer().required('invalid ret_id.'),
  },
  confirmRetail: {
    trd_id: yup.number().integer().required('invalid trd_id.'),
    ret_id: yup.number().integer().required('invalid ret_id.'),
  },
  deleteRetail: {
    trd_id: yup.number().integer().required('invalid trd_id.'),
    ret_id: yup.number().integer().required('invalid ret_id.'),
  },
}
