exports.up = function (knex) {
  return knex.raw(`CREATE TABLE profile  (
    user_id int(11) NOT NULL,
    name varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    public_email varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    gravatar_email varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    gravatar_id varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    location varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    website varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    bio text CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    timezone varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    PRIMARY KEY (user_id) USING BTREE,
    CONSTRAINT fk_user_profile FOREIGN KEY (user_id) REFERENCES user (id) ON DELETE CASCADE ON UPDATE RESTRICT
  ) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;`)
  /* return knex.schema.createTable('profile', function (table) {
    table.integer('user_id').notNullable().references('user.id')
    table.string('name', 255)
    table.string('public_email', 255)
    table.string('gravatar_email', 60)
    table.string('gravatar_id', 32)
    table.string('location', 255)
    table.string('website', 255)
    table.text('bio')
    table.string('timezone', 40)
  }) */
}

exports.down = function (knex) {
  return knex.schema.dropTable('profile')
}
