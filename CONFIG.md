# Environment Variables

This document contains all the environment variables which are available for this application.

| Name | Type | Description | Default |
| ---- | ---- | ----------- | ------- |
| `EXAMPLE_APP_WEB_HOSTNAME` | String | The hostname the ExampleApp web service listens on | example.localhost |
| `EXAMPLE_APP_WEB_PROTOCOL` | String | The protocol the ExampleApp web service listens on | https |
| `EXAMPLE_APP_TRUSTED_PROXIES` | Array of strings | A list of IP addresses of hosts which are permitted to proxy traffic to the application | ["127.0.0.1", "::1"] |
| `POSTGRES_HOST` | String | The hostname of the Postgres server | 127.0.0.1 |
| `POSTGRES_PORT` | Integer | The port the Postgres server listens on | 5432 |
| `POSTGRES_USERNAME` | String | The username to connect to the Postgres server | postgres |
| `POSTGRES_PASSWORD` | String | The password to connect to the Postgres server |  |
| `POSTGRES_DATABASE_NAME` | String | The database to connect to | example |
| `POSTGRES_TEST_DATABASE_NAME` | String | The database to use when running in the test environment | example_test |
| `POSTGRES_ENCODING` | String | The encoding to use when connecting to the Postgres server | unicode |
| `POSTGRES_POOL_SIZE` | Integer | The maximum size of the Postgres connection pool | 10 |
| `REDIS_HOST` | String | The host that the Redis server is running on | 127.0.0.1 |
| `REDIS_PORT` | Integer | The port that the Redis server is running on | 6379 |
| `REDIS_PASSWORD` | String | The password to use when connecting to the Redis server |  |
| `REDIS_DATABASE` | Integer | The database to use | 0 |
| `WORKER_DEFAULT_HEALTH_SERVER_PORT` | Integer | The default port the worker health server will listen on | 3001 |
| `WORKER_DEFAULT_HEALTH_SERVER_BIND_ADDRESS` | String | The default bind address the worker health server will listen on | 0.0.0.0 |
| `WEB_SERVER_DEFAULT_PORT` | Integer | The default port the web server will listen on | 3000 |
| `WEB_SERVER_DEFAULT_BIND_ADDRESS` | String | The default bind address the web server will listen on | 127.0.0.1 |
| `WEB_SERVER_MAX_THREADS` | Integer | The maximum number of threads the web server will use | 5 |
| `WEB_SERVER_CONCURRENCY` | Boolean | Should concurrency be enabled for the web server? | false |
| `RAILS_ENV` | String | The environment Rails is running in | development |
| `RAILS_SECRET_KEY_BASE` | String | The secret key base for the Rails application |  |
| `ENCRYPTION_PRIMARY_KEY` | String | The primary key to use for encryption | insecure |
| `ENCRYPTION_DETERMINISTIC_KEY` | String | The deterministic key to use for encryption | insecure |
| `ENCRYPTION_KEY_DERIVATION_SALT` | String | The salt to use for key derivation | insecure |
| `LOG_RAILS` | Boolean | Enable the default Rails logger | false |
| `LOG_ENABLED` | Boolean | Enable the ExampleApp logger to log to STDOUT | true |
| `LOG_LEVEL` | String | The log level to use | info |
| `LOG_HIGHLIGHTING_ENABLED` | Boolean | Enable highlighting of log lines | false |
| `SENTRY_DSN` | String | A DSN which should be used to report exceptions to Sentry |  |
| `SENTRY_TRACES_SAMPLE_RATE` | Float | The rate at which traces should be sampled | 1.0 |
| `WAIT_FOR_MIGRATIONS_ENABLED` | Boolean | If enabled, application will wait for all migrations to be applied before starting | false |
| `WAIT_FOR_MIGRATIONS_SLEEP_TIME` | Integer | How many seconds should sleep between checking for migrations | 1 |
| `WAIT_FOR_MIGRATIONS_ATTEMPTS` | Integer | How many attempts should be made to check for migrations | 60 |
