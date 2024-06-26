{{- define "app.appConfigEnvVars" -}}
{{ include "app.envVar" (dict "name" "EXAMPLE_APP_WEB_HOSTNAME" "spec" (dig "exampleApp" "webHostname" (dig "exampleApp" "webHostname" "" .Values.appConfigDefaults) .Values.appConfig) "root" . ) }}
{{ include "app.envVar" (dict "name" "EXAMPLE_APP_WEB_PROTOCOL" "spec" (dig "exampleApp" "webProtocol" (dig "exampleApp" "webProtocol" "" .Values.appConfigDefaults) .Values.appConfig) "root" . ) }}
{{ include "app.envVar" (dict "name" "EXAMPLE_APP_TRUSTED_PROXIES" "spec" (dig "exampleApp" "trustedProxies" (dig "exampleApp" "trustedProxies" "" .Values.appConfigDefaults) .Values.appConfig) "root" . ) }}
{{ include "app.envVar" (dict "name" "POSTGRES_HOST" "spec" (dig "postgres" "host" (dig "postgres" "host" "" .Values.appConfigDefaults) .Values.appConfig) "root" . ) }}
{{ include "app.envVar" (dict "name" "POSTGRES_PORT" "spec" (dig "postgres" "port" (dig "postgres" "port" "" .Values.appConfigDefaults) .Values.appConfig) "root" . ) }}
{{ include "app.envVar" (dict "name" "POSTGRES_USERNAME" "spec" (dig "postgres" "username" (dig "postgres" "username" "" .Values.appConfigDefaults) .Values.appConfig) "root" . ) }}
{{ include "app.envVar" (dict "name" "POSTGRES_PASSWORD" "spec" (dig "postgres" "password" (dig "postgres" "password" "" .Values.appConfigDefaults) .Values.appConfig) "root" . ) }}
{{ include "app.envVar" (dict "name" "POSTGRES_DATABASE_NAME" "spec" (dig "postgres" "databaseName" (dig "postgres" "databaseName" "" .Values.appConfigDefaults) .Values.appConfig) "root" . ) }}
{{ include "app.envVar" (dict "name" "POSTGRES_TEST_DATABASE_NAME" "spec" (dig "postgres" "testDatabaseName" (dig "postgres" "testDatabaseName" "" .Values.appConfigDefaults) .Values.appConfig) "root" . ) }}
{{ include "app.envVar" (dict "name" "POSTGRES_ENCODING" "spec" (dig "postgres" "encoding" (dig "postgres" "encoding" "" .Values.appConfigDefaults) .Values.appConfig) "root" . ) }}
{{ include "app.envVar" (dict "name" "POSTGRES_POOL_SIZE" "spec" (dig "postgres" "poolSize" (dig "postgres" "poolSize" "" .Values.appConfigDefaults) .Values.appConfig) "root" . ) }}
{{ include "app.envVar" (dict "name" "REDIS_HOST" "spec" (dig "redis" "host" (dig "redis" "host" "" .Values.appConfigDefaults) .Values.appConfig) "root" . ) }}
{{ include "app.envVar" (dict "name" "REDIS_PORT" "spec" (dig "redis" "port" (dig "redis" "port" "" .Values.appConfigDefaults) .Values.appConfig) "root" . ) }}
{{ include "app.envVar" (dict "name" "REDIS_PASSWORD" "spec" (dig "redis" "password" (dig "redis" "password" "" .Values.appConfigDefaults) .Values.appConfig) "root" . ) }}
{{ include "app.envVar" (dict "name" "REDIS_DATABASE" "spec" (dig "redis" "database" (dig "redis" "database" "" .Values.appConfigDefaults) .Values.appConfig) "root" . ) }}
{{ include "app.envVar" (dict "name" "WORKER_DEFAULT_HEALTH_SERVER_PORT" "spec" (dig "worker" "defaultHealthServerPort" (dig "worker" "defaultHealthServerPort" "" .Values.appConfigDefaults) .Values.appConfig) "root" . ) }}
{{ include "app.envVar" (dict "name" "WORKER_DEFAULT_HEALTH_SERVER_BIND_ADDRESS" "spec" (dig "worker" "defaultHealthServerBindAddress" (dig "worker" "defaultHealthServerBindAddress" "" .Values.appConfigDefaults) .Values.appConfig) "root" . ) }}
{{ include "app.envVar" (dict "name" "WEB_SERVER_DEFAULT_PORT" "spec" (dig "webServer" "defaultPort" (dig "webServer" "defaultPort" "" .Values.appConfigDefaults) .Values.appConfig) "root" . ) }}
{{ include "app.envVar" (dict "name" "WEB_SERVER_DEFAULT_BIND_ADDRESS" "spec" (dig "webServer" "defaultBindAddress" (dig "webServer" "defaultBindAddress" "" .Values.appConfigDefaults) .Values.appConfig) "root" . ) }}
{{ include "app.envVar" (dict "name" "WEB_SERVER_MAX_THREADS" "spec" (dig "webServer" "maxThreads" (dig "webServer" "maxThreads" "" .Values.appConfigDefaults) .Values.appConfig) "root" . ) }}
{{ include "app.envVar" (dict "name" "WEB_SERVER_CONCURRENCY" "spec" (dig "webServer" "concurrency" (dig "webServer" "concurrency" "" .Values.appConfigDefaults) .Values.appConfig) "root" . ) }}
{{ include "app.envVar" (dict "name" "RAILS_ENV" "spec" (dig "rails" "env" (dig "rails" "env" "" .Values.appConfigDefaults) .Values.appConfig) "root" . ) }}
{{ include "app.envVar" (dict "name" "RAILS_SECRET_KEY_BASE" "spec" (dig "rails" "secretKeyBase" (dig "rails" "secretKeyBase" "" .Values.appConfigDefaults) .Values.appConfig) "root" . ) }}
{{ include "app.envVar" (dict "name" "ENCRYPTION_PRIMARY_KEY" "spec" (dig "encryption" "primaryKey" (dig "encryption" "primaryKey" "" .Values.appConfigDefaults) .Values.appConfig) "root" . ) }}
{{ include "app.envVar" (dict "name" "ENCRYPTION_DETERMINISTIC_KEY" "spec" (dig "encryption" "deterministicKey" (dig "encryption" "deterministicKey" "" .Values.appConfigDefaults) .Values.appConfig) "root" . ) }}
{{ include "app.envVar" (dict "name" "ENCRYPTION_KEY_DERIVATION_SALT" "spec" (dig "encryption" "keyDerivationSalt" (dig "encryption" "keyDerivationSalt" "" .Values.appConfigDefaults) .Values.appConfig) "root" . ) }}
{{ include "app.envVar" (dict "name" "LOG_RAILS" "spec" (dig "log" "rails" (dig "log" "rails" "" .Values.appConfigDefaults) .Values.appConfig) "root" . ) }}
{{ include "app.envVar" (dict "name" "LOG_ENABLED" "spec" (dig "log" "enabled" (dig "log" "enabled" "" .Values.appConfigDefaults) .Values.appConfig) "root" . ) }}
{{ include "app.envVar" (dict "name" "LOG_LEVEL" "spec" (dig "log" "level" (dig "log" "level" "" .Values.appConfigDefaults) .Values.appConfig) "root" . ) }}
{{ include "app.envVar" (dict "name" "LOG_HIGHLIGHTING_ENABLED" "spec" (dig "log" "highlightingEnabled" (dig "log" "highlightingEnabled" "" .Values.appConfigDefaults) .Values.appConfig) "root" . ) }}
{{ include "app.envVar" (dict "name" "SENTRY_DSN" "spec" (dig "sentry" "dsn" (dig "sentry" "dsn" "" .Values.appConfigDefaults) .Values.appConfig) "root" . ) }}
{{ include "app.envVar" (dict "name" "SENTRY_TRACES_SAMPLE_RATE" "spec" (dig "sentry" "tracesSampleRate" (dig "sentry" "tracesSampleRate" "" .Values.appConfigDefaults) .Values.appConfig) "root" . ) }}
{{ include "app.envVar" (dict "name" "WAIT_FOR_MIGRATIONS_ENABLED" "spec" (dig "waitForMigrations" "enabled" (dig "waitForMigrations" "enabled" "" .Values.appConfigDefaults) .Values.appConfig) "root" . ) }}
{{ include "app.envVar" (dict "name" "WAIT_FOR_MIGRATIONS_SLEEP_TIME" "spec" (dig "waitForMigrations" "sleepTime" (dig "waitForMigrations" "sleepTime" "" .Values.appConfigDefaults) .Values.appConfig) "root" . ) }}
{{ include "app.envVar" (dict "name" "WAIT_FOR_MIGRATIONS_ATTEMPTS" "spec" (dig "waitForMigrations" "attempts" (dig "waitForMigrations" "attempts" "" .Values.appConfigDefaults) .Values.appConfig) "root" . ) }}
{{- end -}}
