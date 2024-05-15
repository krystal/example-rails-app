{{/*
This method will return an array of environment variables that should be set for
to provide Postgres database configuration. This will depend on the postgres mode
that is currently used
*/}}
{{- define "app.postgresEnvVars" }}
- name: POSTGRES_HOST
  {{- include "app.postgres.host" . | nindent 2 }}
- name: POSTGRES_USERNAME
  {{- include "app.postgres.username" . | nindent 2 }}
- name: POSTGRES_PASSWORD
  {{- include "app.postgres.password" . | nindent 2 }}
- name: POSTGRES_DATABASE
  {{- include "app.postgres.database" . | nindent 2 }}
{{- end }}

{{/* Return the host to use for the postgres database */}}
{{- define "app.postgres.host" }}
{{- if eq "external" .Values.postgres.mode }}
valueFrom:
  secretKeyRef:
    name: {{ .Values.postgres.external.secret.name | required "postgres.external.secret.name is required" }}
    key: {{ .Values.postgres.external.secret.keys.host | default "host" }}
{{- else if eq "builtin" .Values.postgres.mode }}
value: {{ include "app.generateName" (dict "root" . "suffix" "postgres") }}.{{ .Release.Namespace }}.svc.cluster.local
{{- end }}
{{- end }}

{{/* Return the username to use for the postgres database */}}
{{- define "app.postgres.username" }}
{{- if eq "external" .Values.postgres.mode }}
valueFrom:
  secretKeyRef:
    name: {{ .Values.postgres.external.secret.name | required "postgres.external.secret.name is required" }}
    key: {{ .Values.postgres.external.secret.keys.username | default "username" }}
{{- else if eq "builtin" .Values.postgres.mode }}
value: {{ .Values.postgres.builtin.username -}}
{{- end }}
{{- end -}}

{{/* Return the password to use for the postgres database */}}
{{- define "app.postgres.password" }}
{{- if eq "external" .Values.postgres.mode }}
valueFrom:
  secretKeyRef:
    name: {{ .Values.postgres.external.secret.name | required "postgres.external.secret.name is required" }}
    key: {{ .Values.postgres.external.secret.keys.password | default "password" }}
{{- else if eq "builtin" .Values.postgres.mode }}
valueFrom:
  secretKeyRef:
    name: {{ include "app.generateName" (dict "root" . "suffix" "postgres") }}
    key: postgres-password
{{- end }}
{{- end }}

{{/* Return the database to use for the postgres database */}}
{{- define "app.postgres.database" }}
{{- if eq "external" .Values.postgres.mode }}
valueFrom:
  secretKeyRef:
    name: {{ .Values.postgres.external.secret.name | required "postgres.external.secret.name is required" }}
    key: {{ .Values.postgres.external.secret.keys.database | default "database" }}
{{- else if eq "builtin" .Values.postgres.mode }}
value: {{ .Values.postgres.builtin.databaseName }}
{{- end }}
{{- end }}
