const db = require('../../core/db').mysql

class Model {
  constructor() {
    this.db = db
  }
}

Model.db = db

module.exports = Model
