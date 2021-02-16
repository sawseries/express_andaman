exports.seed = function (knex) {
  // Deletes ALL existing entries
  return knex('users')
    .del()
    .then(function () {
      // Inserts seed entries
      return knex('users').insert([
        { id: 1, first_name: 'rowValue1', last_name: 'lastname 1' },
        { id: 2, first_name: 'rowValue2', last_name: 'lastname 2' },
        { id: 3, first_name: 'rowValue3', last_name: 'lastname 3' },
      ])
    })
}
