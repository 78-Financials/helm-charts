{{/*
Expand the name of the chart.
*/}}
{{- define "payaza.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "payaza.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "payaza.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "payaza.labels" -}}
helm.sh/chart: {{ include "payaza.chart" . }}
{{ include "payaza.selectorLabels" . }}
app.kubernetes.io/version: {{ .Values.deployment.tag | toString | trunc 63 | trimSuffix "-" | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "payaza.selectorLabels" -}}
app.kubernetes.io/name: {{ include "payaza.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Name of the Secret the ExternalSecret writes (and the pod reads via envFrom).
Defaults to the deployment name.
*/}}
{{- define "payaza.externalSecretName" -}}
{{- default .Values.deployment.name .Values.env.external_secret.secretName }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "payaza.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default .Values.deployment.name .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
