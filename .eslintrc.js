const devMode = process.env.NODE_ENV === 'development'

module.exports = {
  env: {
    node: true,
    mocha: true,
    es6: true,
  },
  parser: 'babel-eslint',
  plugins: ['chai-friendly', 'prettier', 'security'],
  parserOptions: {
    ecmaVersion: 2018,
  },
  rules: {
    'no-console': devMode ? 'off' : 'warn',
    'comma-dangle': 0,
    'consistent-return': 0,
    'function-paren-newline': ['error', 'consistent'],
    'implicit-arrow-linebreak': ['off'],
    'no-param-reassign': 0,
    'no-underscore-dangle': 0,
    'no-shadow': 0,
    'no-plusplus': 0,
    'no-unused-expressions': 0,
    'no-unused-vars': devMode ? 'off' : 'warn',
    'chai-friendly/no-unused-expressions': 2,
    'security/detect-object-injection': 'off',
    'prettier/prettier': [
      'error',
      {
        endOfLine: 'auto',
      },
    ],
  },
  extends: ['plugin:security/recommended', 'plugin:prettier/recommended'],
}
