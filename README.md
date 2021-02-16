# RESTful API with Node.js

## Installation

Install the dependencies:

```bash
npm install
```

Set the environment variables:

```bash
cp .env.development .env

# open .env and modify the environment variables (if needed)
```

## Features

- **Authentication and authorization**: using [passport](http://www.passportjs.org)
- **Validation**: request data validation using [Yup](https://github.com/jquense/yup)
- **Logging**: using [pino](https://github.com/pinojs/pino/blob/master/docs/web.md#pino-with-node-core-http) and [morgan](https://github.com/expressjs/morgan)
- **Testing**: unit and integration tests using [Jest](https://jestjs.io)
- **Error handling**: centralized error handling mechanism
- **API documentation**: with [swagger-ui-express](https://github.com/scottie1984/swagger-ui-express)
- **Environment variables**: using [dotenv](https://github.com/motdotla/dotenv) and [cross-env](https://github.com/kentcdodds/cross-env#readme)
- **Security**: set security HTTP headers using [helmet](https://helmetjs.github.io)
- **Santizing**: sanitize request data against xss and query injection
- **CORS**: Cross-Origin Resource-Sharing enabled using [cors](https://github.com/expressjs/cors)
- **Compression**: gzip compression with [compression](https://github.com/expressjs/compression)
- **Docker support**
- **Linting**: with [ESLint](https://eslint.org) and [Prettier](https://prettier.io)

## Commands

Running locally:

```bash
npm run dev
```

Running in production:

```bash
npm start
```
