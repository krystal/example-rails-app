{{- define "app.envVars" -}}
{{ (include "app.postgresEnvVars" .) }}
{{ (include "app.redisEnvVars" .) }}
{{ (include "app.appConfigEnvVars" .) }}
{{- end -}}
