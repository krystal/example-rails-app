{{- define "app.redisEnvVars" }}
- name: REDIS_HOST
  {{- include "app.redis.host" . | nindent 2 }}
- name: REDIS_PASSWORD
  {{- include "app.redis.password" . | nindent 2 }}
- name: REDIS_DATABASE
  {{- include "app.redis.database" . | nindent 2 }}
{{- end }}

{{- define "app.redis.host" }}
{{- if eq "external" .Values.redis.mode }}
valueFrom:
  secretKeyRef:
    name: {{ .Values.redis.external.secret.name | required "redis.external.secret.name is required" }}
    key: {{ .Values.redis.external.secret.keys.host | default "host" }}
{{- else if eq "builtin" .Values.redis.mode }}
value: {{ include "app.generateName" (dict "root" . "suffix" "redis") }}.{{ .Release.Namespace }}.svc.cluster.local
{{- end }}
{{- end }}

{{- define "app.redis.password" }}
{{- if eq "external" .Values.redis.mode }}
valueFrom:
  secretKeyRef:
    name: {{ .Values.redis.external.secret.name | required "redis.external.secret.name is required" }}
    key: {{ .Values.redis.external.secret.keys.password | default "password" }}
{{- else if eq "builtin" .Values.redis.mode }}
valueFrom:
  secretKeyRef:
    name: {{ include "app.generateName" (dict "root" . "suffix" "redis") }}
    key: password
{{- end }}
{{- end }}

{{- define "app.redis.database" }}
{{- if eq "external" .Values.redis.mode }}
valueFrom:
  secretKeyRef:
    name: {{ .Values.redis.external.secret.name | required "redis.external.secret.name is required" }}
    key: {{ .Values.redis.external.secret.keys.database | default "database" }}
{{- else if eq "builtin" .Values.redis.mode }}
value: "0"
{{- end }}
{{- end }}
