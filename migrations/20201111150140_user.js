exports.up = function (knex) {
  return knex.raw(`CREATE TABLE user  (
    id int(11) NOT NULL AUTO_INCREMENT,
    username varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    email varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    password_hash varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    auth_key varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    confirmed_at int(11) NULL DEFAULT NULL,
    unconfirmed_email varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    blocked_at int(11) NULL DEFAULT NULL,
    registration_ip varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    created_at int(11) NOT NULL,
    updated_at int(11) NOT NULL,
    flags int(11) NOT NULL DEFAULT 0,
    last_login_at int(11) NULL DEFAULT NULL,
    clients varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    token_expire int(11) NULL DEFAULT NULL,
    access_token text CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    PRIMARY KEY (id) USING BTREE,
    UNIQUE INDEX user_unique_username(username) USING BTREE,
    UNIQUE INDEX user_unique_email(email) USING BTREE
  ) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;`)
  /* return knex.schema.createTable('user', function (table) {
    table.increments('id')
    table.string('username', 255).notNullable().unique()
    table.string('email', 255).notNullable().unique()
    table.string('password_hash', 60).notNullable()
    table.string('auth_key', 32).notNullable()
    table.integer('confirmed_at')
    table.string('unconfirmed_email', 255)
    table.integer('blocked_at')
    table.string('registration_ip', 45)
    table.integer('created_at').notNullable()
    table.integer('updated_at').notNullable()
    table.integer('flags').notNullable()
    table.integer('last_login_at')
    table.integer('access_token_expired_at')
    table.text('access_token')
  }) */
}

exports.down = function (knex) {
  return knex.schema.dropTable('user')
}
