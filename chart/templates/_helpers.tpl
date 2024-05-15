{{/* Return a name for this application */}}
{{- define "app.name" -}}
{{- .Release.Name | trunc 40 -}}
{{- end -}}

{{/* Generate a name for a manifest including the release name */}}
{{- define "app.generateName" -}}
{{- $fullName := printf "%s-%s" (include "app.name" .root) .suffix -}}
{{- $fullName | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* Return labels to be used on all objects */}}
{{- define "app.labels" -}}
helm.sh/chart: {{ printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | quote }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service | quote }}
{{- end -}}

{{/* Return labels to be used as selectors for apps  */}}
{{- define "app.selectorLabels" -}}
app.kubernetes.io/name: {{ .Chart.Name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{- define "app.helmAnnotations" -}}
{{- if not .root.Values.deployment.argocd -}}
{{- if .hook -}}
helm.sh/hook: {{ .hook | quote }}
{{ if .deletePolicy -}}
helm.sh/hook-delete-policy: {{ .deletePolicy | quote }}
{{ end -}}
{{ if .weight -}}
helm.sh/hook-weight: {{ .weight | quote }}
{{ end -}}
{{ end -}}
{{ end -}}
{{- end -}}

{{/* ArgoCD annotations */}}
{{- define "app.argocdAnnotations" -}}
{{- if .root.Values.deployment.argocd -}}
{{- if .wave -}}
argocd.argoproj.io/sync-wave: {{ .wave | quote }}
{{ end -}}
{{- if .hook -}}
argocd.argoproj.io/hook: {{ .hook | quote }}
{{ if .deletePolicy -}}
argocd.argoproj.io/hook-delete-policy: {{ .deletePolicy | quote }}
{{ end -}}
{{ end -}}
{{ end -}}
{{- end -}}

{{/* Return the full image name including tag */}}
{{- define "app.imageURL" -}}
{{ .Values.image.name }}:{{ .Values.image.tag | default .Chart.AppVersion | default "latest" }}
{{- end -}}

{{/* Return an EnvVar for a given environment variable from the values file */}}
{{- define "app.envVar" -}}
{{- if .spec -}}
- name: {{ .name }}
  {{- if eq (kindOf .spec) "map" }}
  {{- if .spec.value }}
  value: {{ .spec.value }}
  {{- else if .spec.valueFromSecret }}
  valueFrom:
    secretKeyRef:
      name: {{ .spec.valueFromSecret.name }}
      key: {{ .spec.valueFromSecret.key | default .name }}
      optional: {{ .spec.valueFromSecret.optional | default false }}
  {{- else if .spec.valueFromConfigMap }}
  valueFrom:
    configMapKeyRef:
      name: {{ .spec.valueFromConfigMap.name }}
      key: {{ .spec.valueFromConfigMap.key | default .name }}
  {{- else if .spec.generatedValue }}
  valueFrom:
    secretKeyRef:
      name: {{ include "app.generateName" (dict "root" .root "suffix" "generated-secrets") }}
      key: {{ .spec.generatedValue.key | default .name }}
  {{- else }}
  {{- fail (printf "Unsupported map type for environment variable %s" .name) }}
  {{- end -}}
  {{- else if eq (kindOf .spec) "slice" }}
  value: {{ join "," .spec | quote }}
  {{- else if or (eq (kindOf .spec) "string") (eq (kindOf .spec) "int") (eq (kindOf .spec) "float64") (eq (kindOf .spec) "bool") }}
  value: {{ .spec | toString | quote }}
  {{- else }}
  {{- fail (printf "Unsupported type for environment variable %s: %s" .name (kindOf .spec)) }}
  {{- end -}}
{{- end -}}
{{- end -}}

{{- define "app.affinityPreferSeperateNodes" -}}
affinity:
  podAntiAffinity:
    preferredDuringSchedulingIgnoredDuringExecution:
      - weight: 100
        podAffinityTerm:
          labelSelector:
            matchLabels:
              {{- include "app.selectorLabels" .root | nindent 14 }}
              krystal.io/component: {{ .component }}
          topologyKey: kubernetes.io/hostname
{{- end -}}


{{- define "app.wait_for" -}}
- name: WAIT_FOR_TARGETS
  {{- include "app.postgres.host" . | nindent 2 -}}:5432
{{- end -}}
