{{- define "kfirs-app.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "kfirs-app.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := include "kfirs-app.name" . -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{- define "kfirs-app.labels" -}}
app.kubernetes.io/name: {{ include "kfirs-app.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" }}
{{- end -}}

{{- define "kfirs-app.selectorLabels" -}}
app.kubernetes.io/name: {{ include "kfirs-app.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{- define "kfirs-app.configName" -}}
{{- printf "%s-config" (include "kfirs-app.fullname" .) -}}
{{- end -}}

{{- define "kfirs-app.secretName" -}}
{{- .Values.secrets.name | default (printf "%s-secrets" (include "kfirs-app.fullname" .)) -}}
{{- end -}}

{{- define "kfirs-app.dbServiceName" -}}
{{- printf "%s-db" (include "kfirs-app.fullname" .) -}}
{{- end -}}

{{- define "kfirs-app.appServiceName" -}}
{{- printf "%s-app" (include "kfirs-app.fullname" .) -}}
{{- end -}}

